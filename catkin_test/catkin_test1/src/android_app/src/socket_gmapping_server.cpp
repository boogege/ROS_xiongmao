#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdlib.h>
#include <iostream>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include <fstream>
#include<time.h>
using namespace std;
#include "opencv2/opencv.hpp"
using namespace cv;

#include "ros/ros.h"
#include "std_msgs/String.h"
#include <sstream>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <geometry_msgs/PoseWithCovariance.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Pose.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Quaternion.h>
#include  <std_srvs/Empty.h>
#include "sensor_msgs/LaserScan.h"
#include "actionlib_msgs/GoalID.h"
#include "actionlib_msgs/GoalStatusArray.h"
#include "actionlib_msgs/GoalStatus.h"
#include <nav_msgs/Odometry.h>


//#include <geometry_msgs/Point.h>

//#include <move_base_msgs/MoveBaseAction.h>
//#include <actionlib/client/simple_action_client.h>
//typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

#define HOSTPORT			9401
#define MAX_CONNECTION	10
#define MAX_BUFFER 1400

#define GO			    1
#define BACK			    2
#define LEFT			    3
#define RIGHT			    4

#define omin_navigation            'q'
#define omin_follow                'w'
#define omin_android_tele          'e'
#define omin_sketon                'r'

#define close_omin_navigation      'a'
#define close_omin_follow          's'
#define close_omin_android_tele    'd'
#define close_omin_sketon          'f'

#define make_map                   'm'

using namespace std;

int cmd1,lastcmd1;
char command[30];
int num=10000;
ros::Publisher vel_pub;
ros::Subscriber sub_odom;

int current_status=0;
int last_current_status=0;
int goal_n=0;
bool nav_closed=true;
bool pgm_map_done=true;

long last_pgm_map_size;
long last_jpg_map_size=0;

int a ,b ,c ,d ,e ,f ,g ,h;

int pgm_map_saved_flag=0;
static bool jpg_send_over = true;

char fg; //切换创建地图和导航的标志位
int server_socket_fd;
int client_socket_fd;
socklen_t len;
struct sockaddr_in server_addr;
struct sockaddr_in client_addr;


struct Packet //数据包
{
char    map_head;
short   totalpackage;
short   currentpackage;
char    sendmessage[1400]; //内容信息
}packet;


void timetxt()
{
   time_t t;
   FILE *pFile;

   pFile = fopen("/home/tmb/catkin_tset/map/time.txt", "w+");

   time(&t);
   fprintf(pFile,"%s", ctime(&t));

   fclose(pFile);

}

void send_pictures_circulation_callback(long jpg_map_size_changed_flag)
{
   bool init_send = false;
   long curr_jpg_map_size=0;
   char snd_buf[1400];
   packet.currentpackage=1;

   if((short)(jpg_map_size_changed_flag%1400)==0)
    {
      packet.totalpackage=(short)(jpg_map_size_changed_flag/1400);
    }
    else
    {
      packet.totalpackage=((short)((jpg_map_size_changed_flag/1400)))+1;
    }
    
printf("555555555555555555555map_datas.head.totalpackage!%d\n", packet.totalpackage);
printf("666666666666666666666curr_jpg_map_size last_jpg_map_size!%ld,%ld\n", curr_jpg_map_size, last_jpg_map_size);
   curr_jpg_map_size = jpg_map_size_changed_flag;
  if (curr_jpg_map_size != last_jpg_map_size)
 {

    printf("7777777777777777777777777curr_jpg_map_size last_jpg_map_size!%ld,%ld\n", curr_jpg_map_size, last_jpg_map_size);
    FILE *fp = fopen("/home/ubuntu/mapsaved/map.jpg", "r");  
    if(NULL == fp)
    {
      printf("888888888888888888 File:Not Found\n");
    }
    else
    {
      int length = 0;
      memset(snd_buf,0,1400);//清空发送部分缓存
      // 每读取一段数据，便将其发送给客户端，循环直到文件读完为止
      while((length = fread(snd_buf, sizeof(char), sizeof(snd_buf), fp)) > 0)
      { 
          ros::Rate loop_rate(8);
          loop_rate.sleep();
          std::cout<<"aaaaaaaaaaaaaaaaaaaaaa图片读入"<<snd_buf<<std::endl;
          std::cout<<"aaaaaaaaaaaaaaaaaaaaaalength"<<length<<std::endl;
        if(send(client_socket_fd,snd_buf,length,0) < 0)
        {
          printf("ccccccccccccccccccccccccccccSend File: Failed./n");
          break;
        }       
 
          
            if (packet.currentpackage==packet.totalpackage)
             { 
               jpg_send_over=true;
               sleep(1);
               
             }
             else
             {
               jpg_send_over=false;
             }
         
        //bzero((const char*)&map_datas, MAX_BUFFER);
          packet.currentpackage++ ;
          memset(snd_buf,0,1400);//清空发送部分缓存
      }
        sleep(0.2);
        char end_buf[5]={'e','n','d'};
        send(client_socket_fd,end_buf,sizeof(end_buf),0);
        std::cout<<"aaaaaaaaaaaaaaaaaaaaaa图片发完"<<end_buf<<std::endl;
      // 关闭文件
        fclose(fp);
        printf("File:Transfer Successful!\n");
        last_jpg_map_size= curr_jpg_map_size;
        printf("tttttttttttttttttttttttl!%ld\n",last_jpg_map_size);
    }
  
  }
    else{}

}

void read_the_jpg_size_callback() 
{
  FILE * pFile;
  pFile = fopen("/home/ubuntu/mapsaved/map.jpg", "r");
  if(jpg_send_over)
   {   
      if (pFile==NULL)
            perror ("Error opening file");
      else
      {
            fseek (pFile, 0, SEEK_END);   ///将文件指针移动文件结尾
            long jpg_sizes=ftell (pFile); ///求出当前文件指针距离文件开始的字节数
            send_pictures_circulation_callback(jpg_sizes);
            fclose (pFile);
            printf ("curr_map_size of map.jpg: %ld bytes.\n",jpg_sizes);
      }
    
    }

  else{}   
}

Mat getJpg(char *path)
{
	fstream file(path);
	string str;
	getline(file,str);
	cout<<str<<endl;
	getline(file,str);
	cout<<str<<endl;
	int row,col;
	file>>col;
	file>>row;
	cout<<row<<"*"<<col<<endl;
	getline(file,str);
	cout<<str<<endl;
	getline(file,str);
	cout<<str<<endl;
	unsigned char ch;
	Mat img;
	img.create(row,col,CV_8UC1);
	for(int i=0;i<row;i++)
	{
		for(int j=0;j<col;j++)
		{
			file>>ch;
			img.at<uchar>(i,j)=ch;
		}
	}
	return img;
}
void *format_conversion_cycle_callback( void *arg )
{
   bool init_changed = false;
   long curr_pgm_map_size=0;
   char *path="/home/ubuntu/mapsaved/map.pgm";
   std::cout<<"22222222222222222222curr_pgm_map_size:"<<curr_pgm_map_size<<' '<<"last_pgm_map_size2222222222:"<<' '<<last_pgm_map_size<<std::endl;
 while(1)
 {
if(pgm_map_done)
{
     if(jpg_send_over)
     {
         //ros::Rate loop_rate(1);//在发布消息的时候循环以满足1次/秒
         //loop_rate.sleep();
         last_pgm_map_size=curr_pgm_map_size;
         Mat img=getJpg(path);
         imwrite("/home/ubuntu/mapsaved/map.jpg", img);
         sleep(1);
         read_the_jpg_size_callback();
           std::cout<<" 3333333333333333333curr_pgm_map_size  :"<<curr_pgm_map_size<<' '<<"last_pgm_map_size333333333333:"<<' '<<last_pgm_map_size<<std::endl;
     }
   
}    
        //std::cout<<" 4444444444444444444curr_pgm_map_size  :"<<curr_pgm_map_size<<' '<<"last_pgm_map_size3444444444444444:"<<' '<<last_pgm_map_size<<std::endl;
  }

}


void *mode_change_callback( void *arg )
{    

    bool j=true;//让建图启动一次的标志       
    while(1)
  {
     
     if(j)
       {
           ros::Rate loop_rate(0.3);
           loop_rate.sleep();
           //std::cout<<"num:"<<num<<std::endl;
           if (num > 0)
             {
                //std::cout<<"num:"<<num<<std::endl;
                //std::cout<<"command[0]"<<command[0]<<std::endl;
	        if (command[0]=='m'&&command[1]=='c')
	          {
	             char fg=command[2];
                     switch( fg )
 	                {
	                    case make_map:
			      {
                                     //std::cout<<"start gmapping11111111111111111111111111111111111111111111111111111111111111111"<<std::endl;
                                     std::cout<<"start map_save2222222222222"<<std::endl;
                                     system("gnome-terminal -x /home/ubuntu/autor_gmapping.sh");
                                     sleep(12);
                                     system("gnome-terminal -x /home/ubuntu/map_save.sh");
                                     sleep(8);
                                     //std::cout<<"pgm_map_saved_flag:"<<pgm_map_saved_flag<<std::endl;
                                     //format_conversion_cycle_callback();
                                     //pgm_map_done=true;
				     timetxt();	
                                     j=false;
                                     break;
                               }
                            default:break;
                         }
	
                   }

              } 
 
           else if (num==0)
             {	
		//close( client_socket_fd );
                std::cout<<"num11111111111111"<<std::endl;	        	
             }


       }

   
   } 
 

}

void *rec_data( void *arg ){

        //ros::Rate loop_rate(50);
	while(ros::ok()){
        num = recv( client_socket_fd , &command , sizeof( command ), 0);
	//std::cout<<"num:"<<num<<std::endl;
	if (num > 0)
	{
		//std::cout<<"socket receive..."<<std::endl;
		//std::cout<<"num:"<<num<<std::endl;
		if(command[0]=='h'&&command[1]=='e'&&command[2]=='a'&&command[3]=='d'&&command[num-1]=='d'&&command[num-2]=='n'
                   &&command[num-3]=='e') 
		{
			char flag=command[6];
		        switch( flag ) 
			{			  	
				case 'k':
				{
			  	 	cmd1=command[7]-'0';
					float x; float y ; float z ; 
        				geometry_msgs::Twist msg;
					//cout<<"cmd1"<<cmd1<<endl;
		        		switch(cmd1)
					{
					case GO :
						{
							x=0.25;y=0;z=0;
				                        msg.linear.x=x;
				                        msg.linear.y=y;
				                        msg.angular.z=z;  
							break;
						}
					case BACK :
						{
							x=-0.25;y=0;z=0;
				                        msg.linear.x=x;
				                        msg.linear.y=y;
				                        msg.angular.z=z;  
							break;
						}						
					case LEFT :
						{
							x=0;y=0;z=0.6;
				                        msg.linear.x=x;
				                        msg.linear.y=y;
				                        msg.angular.z=z;  
							break;
						}						
					case RIGHT :
						{
							x=0;y=0;z=-0.6;
				                        msg.linear.x=x;
				                        msg.linear.y=y;
				                        msg.angular.z=z;  
							break;
						}
					default:	break;
					}  
				vel_pub.publish(msg);
				break;
		    		//cout<<"x:"<<x<<"y:"<<y<<"z:"<<z<<endl;
			  	}
			  	case 'o':
				{
					switch( command[7] )
					{
                				std::cout<<"command[7]"<<command[7]<<std::endl;
					   	
				    		case omin_android_tele:
						{
							ROS_INFO("omin_android_tele\n");
                                                        ros::param::set("/tracker_base_controller/skelon_enable",false);
							ros::param::set("/turtlebot_follower/enabled",false);
							break;
						}
				   		case close_omin_android_tele:
						{					
							ROS_INFO("close_omin_android_tele\n");
                                                        ros::param::set("/tracker_base_controller/skelon_enable",false);
							ros::param::set("/turtlebot_follower/enabled",false);
							break;
						}
				   							
						default:break;
					}
				break;
				}
			    
			default:break;
			} 
		}
		
	} 
	else if (num==0)
	{	
		close( client_socket_fd );
		pthread_exit(NULL);	        	
	} 
              				
    }
}

void *check_accept_thread_callback( void *arg )
{           

		if ((listen( server_socket_fd, MAX_CONNECTION ))== -1) 
		{
			perror("listen error");
			exit(1);
		}
		cout<<"waiting connection...\n"<<endl;

	while(1)
	{
 		pthread_t thread;
                //client_sockfd = (int *)malloc(sizeof(int)); 

		len = sizeof(struct sockaddr_in);
		client_socket_fd = accept(server_socket_fd, (struct sockaddr *)&client_addr, &len);
		if( client_socket_fd == -1 )
		{
			perror( "create the client_socket_fd fail" );
			continue;
		}
                
                else
                cout<<" connectionsucesssssssss...\n"<<endl;

		char connection_statusbuff[]={'s','u','c','c','e','s','s'};
		send(client_socket_fd , connection_statusbuff , strlen(connection_statusbuff), 0);

             
              if(pthread_create(&thread, NULL, rec_data,  NULL)!=0)
              	{  
                     perror("pthread_create error!");  
                     break;  
              	}  
       }  
       shutdown(client_socket_fd,2);  
       shutdown(server_socket_fd,2);  


	
	
}

void create_all_thread(void)
{
        pthread_t mode_change_thread ;
	pthread_t receive_data_thread;
	pthread_t check_accept_thread;
        pthread_t format_conversion_cycle;

	if( (pthread_create( &mode_change_thread , NULL , mode_change_callback , NULL )) != 0 )
	{
		perror("Create the mode_change_thread fail");
		exit( 1 );
	}

	if( (pthread_create( &format_conversion_cycle , NULL , format_conversion_cycle_callback , NULL )) != 0 )
	{
		perror("Create the mode_change_thread fail");
		exit( 1 );
	}

	if( (pthread_create( &check_accept_thread , NULL , check_accept_thread_callback , NULL )) != 0 )
	{
		perror("Create the receive_data_thread fail");
		exit( 1 );
	}

}


void odom_Callback(const nav_msgs::Odometry::ConstPtr& msg)
{
        double odom_x=0;
        double odom_y=0;
        char odom_buff[31];
        char odom_data_x[15];
        char odom_data_y[15];
        int sig=8;

	odom_x=msg->pose.pose.position.x;
	odom_y=msg->pose.pose.position.y;

        gcvt(odom_x, sig, odom_data_x);
        gcvt(odom_y, sig, odom_data_y);
        odom_buff[0]='l';
        int i;int j;
        for(i=1;i<strlen(odom_data_x)+1;i++)
          {
             
             odom_buff[i]=odom_data_x[i-1];

          }
        odom_buff[strlen(odom_data_x)+1]=',';
        int g=strlen(odom_data_x)+2;
        for(j=0;j<strlen(odom_data_y);j++)
          {
             int f=g+j;
             odom_buff[f]=odom_data_y[j];
          }
             odom_buff[strlen(odom_data_x)+strlen(odom_data_y)+2]='\0';
                  
        //printf("string = %s\n", odom_data_x);   
        //printf("string = %s\n", odom_data_y);    
        //printf("string = %s\n", odom_buff);
        
      
        send(client_socket_fd , odom_buff , strlen(odom_buff), 0); 
        sleep(1);
	//ROS_INFO("odom_x:%f odom_y:%f ",odom_x,odom_y);
}

int main(int argc,char** argv)
{

	ros::init(argc, argv, "socketTest2");
        ros::NodeHandle n;
        ros::Rate loop_rate(0.5);          
        vel_pub = n.advertise<geometry_msgs::Twist>("teleop_velocity_smoother/raw_cmd_vel", 10);
        sub_odom = n.subscribe("odom",100,odom_Callback);

        cmd1=0;
        lastcmd1=0;
	server_socket_fd = socket(AF_INET, SOCK_STREAM, 0);      
	if ( server_socket_fd == -1 )  
	{
        perror("get host_socket_fd error");
		exit(1);
	}

        int ret=0;
        int reuse = 1;

        ret = setsockopt( server_socket_fd , SOL_SOCKET , SO_REUSEADDR , &reuse , sizeof(reuse));
	if( ret != 0 )
	{
		perror("setsockopt error");
		exit(1);
	}
        bzero( &server_addr , sizeof( server_addr ) );
	server_addr.sin_family = AF_INET;               
	server_addr.sin_port = htons( HOSTPORT );           
	//server_addr.sin_addr.s_addr = inet_addr("192.168.1.2");
	server_addr.sin_addr.s_addr = htonl( INADDR_ANY ); 
	//bzero( &(server_addr.sin_zero), 8 );              
	ret = bind( server_socket_fd , (struct sockaddr*)&server_addr , sizeof(struct sockaddr) );
	if (ret == -1) 
	{
        perror("bind error");
		exit(1);
	}

	create_all_thread( );
	sleep(1);
        ros::spin();
        return 0;
	
}

