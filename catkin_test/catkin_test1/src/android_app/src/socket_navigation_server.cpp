#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdlib.h>
#include<math.h>
#include <iostream>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include <fstream>
#include <sys/stat.h>   /**/
#include <fcntl.h>      /*文件控制定义*/
#include <termios.h>    /*PPSIX终端控制定义*/
#include <errno.h>      /*错误号定义*/
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

#define HOSTPORT			9400
#define MAX_CONNECTION	20
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
#define navigation                 'n'

#define FALSE  -1
#define TRUE   0
#define p      3.1415926
#define FALSE  -1

using namespace std;

int cmd1,lastcmd1;
char command[100];//100
int num=10000;
ros::Publisher vel_pub;
ros::Publisher cancle_pub;
ros::Publisher goal_pub;
ros::Subscriber sub;
ros::Subscriber sub_status;
ros::Subscriber sub_odom;
ros::ServiceClient client;
double currect_x=0;
double currect_y=0;
double current_orientation_z=0;
double current_orientation_omiga=0;

int current_status=0;
int last_current_status=0;
int goal_n=0;
bool nav_closed=true;
bool pgm_map_done=false;
bool voice_ctr=true;


long last_pgm_map_size;
long last_jpg_map_size;

double goal_x=0.0;
double goal_y=0.0;
double goal_z=0.0;
double goal_w=0.0;
double last_goal_x=0.0;
double last_goal_y=0.0;

int a ,b ,c ,d ,e ,f ,g ,h;

int pgm_map_saved_flag=0;
static bool jpg_send_over = true;

char fg; //切换创建地图和导航的标志位
int server_socket_fd;
int client_socket_fd;
socklen_t len;
struct sockaddr_in server_addr;
struct sockaddr_in client_addr;


/***@brief  设置串口通信速率
*@param  fd     类型 int  打开串口的文件句柄
*@param  speed  类型 int  串口速度
*@return  void*/

int speed_arr[] = { B38400, B19200, B9600, B4800, B2400, B1200, B300,
	    B38400, B19200, B9600, B4800, B2400, B1200, B300, };
int name_arr[] = {38400,  19200,  9600,  4800,  2400,  1200,  300,
	    38400,  19200,  9600, 4800, 2400, 1200,  300, };
void set_speed(int fd5, int speed)   //Linux 下串口USB等设备通信编程入门2中有终端属性的获取设置函数
{
  int   i;
  int   status;
  struct termios   Opt;
  tcgetattr(fd5, &Opt);
  for ( i= 0;  i < sizeof(speed_arr) / sizeof(int);  i++)
   {
   	if  (speed == name_arr[i])
   	{
   	    tcflush(fd5, TCIOFLUSH);//Update the options and do it NOW
    	cfsetispeed(&Opt, speed_arr[i]);
    	cfsetospeed(&Opt, speed_arr[i]);
    	status = tcsetattr(fd5, TCSANOW, &Opt);
    	if  (status != 0)
            perror("tcsetattr fd5");
     	return;
     	}
   tcflush(fd5,TCIOFLUSH);
   }
}
/**       
*@brief   设置串口数据位，停止位和效验位
*@param  fd     类型  int  打开的串口文件句柄*
*@param  databits 类型  int 数据位   取值 为 7 或者8   数据位为7位或8位
*@param  stopbits 类型  int 停止位   取值为 1 或者2*    停止位为1或2位
*@param  parity  类型  int  效验类型 取值为N,E,O,,S     N->无奇偶校验，O->奇校验 E->为偶校验，
*/
int set_Parity(int fd4,int databits,int stopbits,int parity)
{
	struct termios options;
 if  ( tcgetattr( fd4,&options)  !=  0)
  {
  	perror("SetupSerial 1");
  	return(FALSE);
  }
  options.c_cflag &= ~CSIZE;
  switch (databits) /*设置数据位数*/
  {
  	case 7:
  		options.c_cflag |= CS7;
  		break;
  	case 8:
		options.c_cflag |= CS8;
		break;
	default:
		fprintf(stderr,"Unsupported data size\n");
		return (FALSE);
	}
  switch (parity)
  	{
  	case 'n':
	case 'N':
		options.c_cflag &= ~PARENB;   /* Clear parity enable */
		options.c_iflag &= ~INPCK;     /* Enable parity checking */
		break;
	case 'o':
	case 'O':
		options.c_cflag |= (PARODD | PARENB);  /* 设置为奇效验*/ 
		options.c_iflag |= INPCK;             /* Disnable parity checking */
		break;
	case 'e':
	case 'E':
		options.c_cflag |= PARENB;     /* Enable parity */
		options.c_cflag &= ~PARODD;   /* 转换为偶效验*/  
		options.c_iflag |= INPCK;       /* Disnable parity checking */
		break;
	case 'S':
	case 's':  /*as no parity*/
		options.c_cflag &= ~PARENB;
		options.c_cflag &= ~CSTOPB;
		break;
	default:
		fprintf(stderr,"Unsupported parity\n");
		return (FALSE);
		}
  /* 设置停止位*/   
  switch (stopbits)
  	{
  	case 1:
  		options.c_cflag &= ~CSTOPB;
		break;
	case 2:
		options.c_cflag |= CSTOPB;
		break;
	default:
		fprintf(stderr,"Unsupported stop bits\n");
		return (FALSE);
	}
  /* Set input parity option */
  if (parity != 'n')
  		options.c_iflag |= INPCK;
    options.c_cc[VTIME] = 150; // 15 seconds
    options.c_cc[VMIN] = 0;

  tcflush(fd4,TCIFLUSH); /* Update the options and do it NOW */
  if (tcsetattr(fd4,TCSANOW,&options) != 0)
  	{
  		perror("SetupSerial 3");
		return (FALSE);
	}
  return (TRUE);
 }


//声音串口配置
int set_opt(int fd3,int nSpeed, int nBits, char nEvent, int nStop)   
    {   
         struct termios newtio,oldtio;   
    /*保存测试现有串口参数设置，在这里如果串口号等出错，会有相关的出错信息*/   
         if  ( tcgetattr( fd3,&oldtio)  !=  0) {    
          perror("SetupSerial 1");  
        printf("tcgetattr( fd3,&oldtio) -> %d\n",tcgetattr( fd3,&oldtio));   
          return -1;   
         }   
         bzero( &newtio, sizeof( newtio ) );   
    /*步骤一，设置字符大小*/   
         newtio.c_cflag  |=  CLOCAL | CREAD;    
         newtio.c_cflag &= ~CSIZE;    
    /*设置停止位*/   
         switch( nBits )   
         {   
         case 7:   
          newtio.c_cflag |= CS7;   
          break;   
         case 8:   
          newtio.c_cflag |= CS8;   
          break;   
         }   
    /*设置奇偶校验位*/   
         switch( nEvent )   
         {   
         case 'o':  
         case 'O': //奇数   
          newtio.c_cflag |= PARENB;   
          newtio.c_cflag |= PARODD;   
          newtio.c_iflag |= (INPCK | ISTRIP);   
          break;   
         case 'e':  
         case 'E': //偶数   
          newtio.c_iflag |= (INPCK | ISTRIP);   
          newtio.c_cflag |= PARENB;   
          newtio.c_cflag &= ~PARODD;   
          break;  
         case 'n':  
         case 'N':  //无奇偶校验位   
          newtio.c_cflag &= ~PARENB;   
          break;  
         default:  
          break;  
         }   
         /*设置波特率*/   
    switch( nSpeed )   
         {   
         case 2400:   
          cfsetispeed(&newtio, B2400);   
          cfsetospeed(&newtio, B2400);   
          break;   
         case 4800:   
          cfsetispeed(&newtio, B4800);   
          cfsetospeed(&newtio, B4800);   
          break;   
         case 9600:   
          cfsetispeed(&newtio, B9600);   
          cfsetospeed(&newtio, B9600);   
          break;   
         case 115200:   
          cfsetispeed(&newtio, B115200);   
          cfsetospeed(&newtio, B115200);   
          break;   
         case 460800:   
          cfsetispeed(&newtio, B460800);   
          cfsetospeed(&newtio, B460800);   
          break;   
         default:   
          cfsetispeed(&newtio, B9600);   
          cfsetospeed(&newtio, B9600);   
         break;   
         }   
    /*设置停止位*/   
         if( nStop == 1 )   
          newtio.c_cflag &=  ~CSTOPB;   
         else if ( nStop == 2 )   
          newtio.c_cflag |=  CSTOPB;   
    /*设置等待时间和最小接收字符*/   
         newtio.c_cc[VTIME]  = 0;   
         newtio.c_cc[VMIN] = 0;   
    /*处理未接收字符*/   
         tcflush(fd3,TCIFLUSH);   
    /*激活新配置*/   
    if((tcsetattr(fd3,TCSANOW,&newtio))!=0)   
         {   
          perror("com set error");   
          return -1;   
         }   
         printf("set done!\n");   
         return 0;   
    }   


/**
*@breif 打开串口
*/
int OpenDev(char *Dev)
{
int	fd2 = open( Dev, O_RDWR );         //| O_NOCTTY | O_NDELAY
	if (-1 == fd2)
		{ /*设置数据位数*/
			perror("Open Serial Port Fail");
			return -1;
		}
	else
		printf("Open Serial Port Success\n");
	return fd2;

}
/**
*@breif 	main()
*/

void setgoal(double goal_xx, double goal_yy , double goal_zz , double goal_ww)
{
	geometry_msgs::PoseStamped msg;
	msg.header.frame_id = "map";
	msg.header.stamp = ros::Time::now();
	msg.pose.position.x=goal_xx;
	msg.pose.position.y=goal_yy;
	msg.pose.orientation.w=goal_ww;
	msg.pose.orientation.z=goal_zz;
	goal_pub.publish(msg);
	//cout<<"goal_xx:"<<goal_xx<<"goal_yy:"<<goal_yy<<endl;
	goal_n++;
}

void Sound_localization(int localization_dgree)
{
    	
     int ticks=0,i=0;
     geometry_msgs::Twist msg;
     ros::Rate loop_rate(21);
     loop_rate.sleep();
        if(localization_dgree<180)
        {

	     ticks=int(21*p*localization_dgree/180/0.6);
	     //std::cout<< "00000000ticks"<< ticks<<endl;
	     for(i=0;i<ticks;i++)
             {

		if(ticks > 0)
		{

			msg.angular.x=0;
                  	msg.angular.y=0;
                  	msg.angular.z=-0.6;

		}  
	        if(voice_ctr)
      	        {

	              vel_pub.publish(msg);
                      loop_rate.sleep();


                }
	       
	        //std::cout<< "msg.angular.z"<< msg.angular.z<<endl;

	     }          
    
        }
        else
        {

             localization_dgree=360-localization_dgree;
	     ticks=int(21*p*localization_dgree/180/0.6);
	     //std::cout<< "00000000ticks"<< ticks<<endl;
	     for(i=0;i<ticks;i++)
             {
		if(ticks > 0)
		{

			msg.angular.x=0;
                  	msg.angular.y=0;
                  	msg.angular.z=0.6;

		}      
	        if(voice_ctr)
      	        {

	              vel_pub.publish(msg);
                      loop_rate.sleep();

                }
	       
	        //std::cout<< "msg.angular.z"<< msg.angular.z<<endl;

	     }  
           

        }          



}



void *mode_change_callback( void *arg )
{           
  bool j=true;//让导航启动一次的标志       
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
                //std::cout<<"command[0]"<<command<<std::endl;
	        if (command[0]=='m'&&command[1]=='c')
	          {
	             char fg=command[2];
                     switch( fg )
 	                {
	                   
	                    case navigation:
			       {
			               system("gnome-terminal -x /home/ubuntu/autor_navigation.sh");
                                       std::cout<<"navigationnavigationnavigationnavigation"<<std::endl; 
                                       j=false;
                                        break;
                               }
                            default:break;
                         }
	
                   }

              } 
 
           else if (num==0)
             {	
		close( client_socket_fd );	        	
             }


       }

   
   } 
 
 
}

void *rec_data( void *arg ){

	while(ros::ok()){
	ros::Rate loop_rate(10);
        num = recv( client_socket_fd , &command , sizeof( command ), 0);
        std::cout<<"command"<<command<<std::endl;
	//std::cout<<"num:"<<num<<std::endl;
	if (num > 0)
	{
		pgm_map_done=true;
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
		        		switch(cmd1)
					{
					case GO :
						{
							x=0.3;y=0;z=0;
				                        msg.linear.x=x;
				                        msg.linear.y=y;
				                        msg.angular.z=z;  
							break;
						}
					case BACK :
						{
							x=-0.3;y=0;z=0;
				                        msg.linear.x=x;
				                        msg.linear.y=y;
				                        msg.angular.z=z;  
							break;
						}						
					case LEFT :
						{
							x=0;y=0;z=0.8;
				                        msg.linear.x=x;
				                        msg.linear.y=y;
				                        msg.angular.z=z;  
							break;
						}						
					case RIGHT :
						{
							x=0;y=0;z=-0.8;
				                        msg.linear.x=x;
				                        msg.linear.y=y;
				                        msg.angular.z=z;  
							break;
						}
					default:	break;
					}  
				vel_pub.publish(msg);
				loop_rate.sleep();
				
				break;
		    		//cout<<"x:"<<x<<"y:"<<y<<"z:"<<z<<endl;
			  	}
			  	case 'o':
				{
					switch( command[7] )
					{
                				std::cout<<"command[7]"<<command[7]<<std::endl;
					   	case omin_navigation:
						{
							
							nav_closed=false;
							voice_ctr=false;
							//actionlib_msgs::GoalID first_goal;
							//cancle_pub.publish(first_goal);
							std::cout<<"omin_navigation"<<std::endl;
							std_srvs::Empty clear_costmap;
							if (client.call(clear_costmap))
							{
								ROS_INFO("clear costmap success");
							}
							else		
							{
								ROS_ERROR("Failed to clear costmap");
							}
							ros::param::set("/turtlebot_follower/enabled",false);
                                                        ros::param::set("/tracker_base_controller/skelon_enable",false);
							break;
				    		}
				  		case close_omin_navigation:
						{	
							nav_closed=true;
							voice_ctr=true;				
							actionlib_msgs::GoalID first_goal;
							cancle_pub.publish(first_goal);
							std::cout<<"close_omin_navigation"<<std::endl;
							break;
				    		}
				    		case omin_follow:
						{	
							voice_ctr=false;				
							ros::param::set("/turtlebot_follower/enabled",true);
                                                        ros::param::set("/tracker_base_controller/skelon_enable",false);
                                                        ROS_INFO("omin_follow\n");
							break;
				    		}
				    		case close_omin_follow:
						{
							voice_ctr=true;					
							ros::param::set("/turtlebot_follower/enabled",false);
                                                        ros::param::set("/tracker_base_controller/skelon_enable",false);
                                                        ros::param::set("/tracker_base_controller/skelon_enable",false);
							ROS_INFO("close_omin_follow\n");
							break;
				    		}
				    		case omin_android_tele:
						{
							voice_ctr=false;
							ROS_INFO("omin_android_tele\n");
                                                        ros::param::set("/tracker_base_controller/skelon_enable",false);
							ros::param::set("/turtlebot_follower/enabled",false);
							break;
						}
				   		case close_omin_android_tele:
						{
							voice_ctr=true;					
							ROS_INFO("close_omin_android_tele\n");
                                                        ros::param::set("/tracker_base_controller/skelon_enable",false);
							ros::param::set("/turtlebot_follower/enabled",false);
							break;
						}
				   		case omin_sketon:
						{
							voice_ctr=false;					
							ROS_INFO("omin_sketon\n");
                                                        ros::param::set("/tracker_base_controller/skelon_enable",true);
							ros::param::set("/turtlebot_follower/enabled",false);
							break;
						}
				   		case close_omin_sketon:
						{	
							voice_ctr=true;				
							ROS_INFO("close_omin_sketon\n");
                                                        ros::param::set("/tracker_base_controller/skelon_enable",false);
							ros::param::set("/turtlebot_follower/enabled",false);
							break;
						}						
						default:break;
					}
				break;
				}
			case 'm':
			{
/* 

				char x[15],y[15];
	                        int i,separate;
	                        for(i=0;i<strlen(command);i++)
				{
		                        if(command[i]==',')
	                            		separate=i;
	                        }
				memcpy(x,command+7,separate-7);
	                        memcpy(y,command+separate+1,num-4);

				last_goal_x=goal_x;
				last_goal_y=goal_y;          
				goal_x=atof(x);
				goal_y=atof(y);
				setgoal(goal_x,goal_y);
                                printf("setgoal = %f\n", goal_x);
                                printf("setgoal = %f\n", goal_y);
*/

                                                                
                                char x[15],y[15],z[15],w[15];
                                int i,j,n=0,separate1=0,separate2=0,separate3=0;
                                double goal_x;double goal_y;double goal_z;double goal_w;
                                for(i=0;i<strlen(command);i++)
				{
		                        if(command[i]==',')
                                           {
                                                n++;
                                                 if(n==1)
                                                    {

                                                     separate1=i;

                                                    }

                                                 if(n==2)
                                                    {

                                                     separate2=i;

                                                    }

                                                 if(n==3)
                                                    {

                                                     separate3=i;

                                                    }

                                                   
                                           }
	                        }
				memcpy(x,command+7,separate1-7);
                                memcpy(y,command+separate1+1,separate2-separate1-1);
	                        memcpy(z,command+separate2+1,separate3-separate2-1);
                                memcpy(w,command+separate3+1,num-separate3-4);

                                x[separate1-7]='\0';
                                y[separate2-separate1-1]='\0';
                                z[separate3-separate2-1]='\0';
                                w[num-separate3-4]='\0';

				goal_x=atof(x);
				goal_y=atof(y);
				goal_z=atof(z);
				goal_w=atof(w);

                                setgoal(goal_x,goal_y,goal_z,goal_w);

                                //printf("setgoal = %f\n", goal_x);
                                //printf("setgoal = %f\n", goal_y);
                                //printf("setgoal = %f\n", goal_z);
                                //printf("setgoal = %f\n", goal_w); 
     
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

void *map_send_callback( void *arg )
{    
   char map_snd_buf[1400];
   char temp[100];
   char ydb[100];int tm_l=0;          
    while(1)
  {
           //ros::Rate loop_rate(1);
           //loop_rate.sleep();
	if(pgm_map_done)
	{
           if (num > 0)
             {
	        if (command[0]=='m'&&command[1]=='a'&&command[2]=='p'&&command[3]=='_'&&command[4]=='r')
	          {

			FILE *tfp;
 			if((tfp=fopen("/home/ubuntu/mapsaved/time.txt","r"))==NULL)     //文件不存在
 			{
  				printf("文件不存在\n");
  				exit(0); 
 			}
 			else                                   //文件存在
 			{
   				if(fgets(temp,1024,tfp)==NULL)  
   				{
      				printf("读取失败");
  		 		}
   				printf("文件内容是：%s",temp);
				//send(client_socket_fd,temp,1024,0);           
 			}

			ydb[0]='t';ydb[1]='i';ydb[2]='m';ydb[3]='e';
			for(tm_l=0;tm_l<strlen(temp);tm_l++)
			{

				ydb[tm_l+4]=temp[tm_l];

			}
			ydb[strlen(temp)+4]='\0';
			printf("原点是：%s\n",ydb);
			send(client_socket_fd,ydb,1024,0);
 			fclose(tfp);
			pgm_map_done=false;

                  }
		else if(command[0]=='m'&&command[1]=='a'&&command[2]=='p'&&command[3]=='_'&&command[4]=='f')
		  {

			FILE *fp = fopen("/home/ubuntu/mapsaved/map.jpg", "r");  
    			if(NULL == fp)
    			{
      				printf("888888888888888888 File:Not Found\n");
    			}
    			else
    			{
      				int length = 0;
      				memset(map_snd_buf,0,1400);//清空发送部分缓存
      				// 每读取一段数据，便将其发送给客户端，循环直到文件读完为止
      				while((length = fread(map_snd_buf, sizeof(char), sizeof(map_snd_buf), fp)) > 0)
      				{ 
          				ros::Rate loop_rate(8);
          				loop_rate.sleep();
          				std::cout<<"aaaaaaaaaaaaaaaaaaaaaa图片读入"<<map_snd_buf<<std::endl;
          				std::cout<<"aaaaaaaaaaaaaaaaaaaaaalength"<<length<<std::endl;
        				if(send(client_socket_fd,map_snd_buf,length,0) < 0)
       					{
          					printf("ccccccccccccccccccccccccccccSend File: Failed./n");
          					break;
        				}       
          				memset(map_snd_buf,0,1400);//清空发送部分缓存
      				}
        			sleep(0.2);
        			char end_buf[5]={'e','n','d'};
        			send(client_socket_fd,end_buf,sizeof(end_buf),0);
        			std::cout<<"aaaaaaaaaaaaaaaaaaaaaa图片发完"<<end_buf<<std::endl;
      				// 关闭文件
        			fclose(fp);
        			printf("File:Transfer Successful!\n");

			 }
				sleep(1);

  				char yda[100],yuand[100],ydc[100];
  				int yd_i=3,yd_k=0,yd_n=0,yd_j=0,yd_l=0,yd_separate2=0;    
  				FILE *yuand_fp = fopen("/home/ubuntu/mapsaved/map.yaml","r");
  				while(fgets(ydc,100,yuand_fp)){    //读入每行数据
    				yd_i--;
    				if(yd_i==0) strcpy(yda,ydc);    

  				}
  				//printf("第%d行数据：%s\n",yd_i,yda);
				for(yd_j=0;yd_j<40;yd_j++)
				{
					if(yda[yd_j]=='[')
					{
			
						yd_k=yd_j+1;

					}
					if(yda[yd_j]==',')
					{

						yd_n++;
						if(yd_n=2)
						{

							yd_separate2=yd_j;
							//printf("yd_separate2是：%d\n",yd_j);		

						}

					}


				}

						memcpy(yuand,yda+yd_k,yd_separate2);
						yuand[yd_separate2-yd_k]='\0';
						//printf("原点是：%s\n",yuand);
						//printf("yd_separate2-yd_k是：%d\n",yd_separate2-yd_k);
						char ydb[100];
						ydb[0]='y';ydb[1]='u';ydb[2]='a';ydb[3]='n';ydb[4]='d';
						for(yd_l=0;yd_l<yd_separate2-yd_k;yd_l++)
						{

							ydb[yd_l+5]=yuand[yd_l];

						}
							ydb[yd_separate2-yd_k+5]='\0';
							printf("原点是：%s\n",ydb);
							send(client_socket_fd,ydb,sizeof(ydb),0);
  							fclose(yuand_fp);
							pgm_map_done=false;
							
							





		  }//end?map_f?





              }//end?if num>0? 
 
           //else if (num==0)
             //{	
		//close( client_socket_fd );	        	
             //}


	}//end?if(pgm_map_done)?
 
   } 
 
 
}




void *face_control_callback( void *arg )
{    

        int fd0;
        int nwrite;
        char statusbuff[]={0xa8};
	char *dev ="/dev/face";
	unsigned char face_buff[9]={0x2b,0xb1, 0x00, 0x02, 0x17, 0, 0x00, 0x5a, 0xee};
        fd0 = OpenDev(dev);
        set_speed(fd0,38400);
        set_Parity(fd0,8,1,'N');
           
    while(1)
  {
           ros::Rate loop_rate(0.3);
           loop_rate.sleep();
           if (num > 0)
             {
	        if (command[0]=='f'&&command[1]=='a'&&command[2]=='c'&&command[3]=='e')
	          {
	                unsigned char face_fg=(unsigned char)command[4];
                        //std::cout<<"face_fg:"<<face_fg<<std::endl;
                        face_buff[5]=face_fg-'0';                   
                        //printf("face_buff[5]%d",face_buff[5]);
   		        write(fd0,face_buff,9);

	
                  }

              } 
 
           else if (num==0)
             {	
		close( client_socket_fd );	        	
             }
 
   } 
 
 
}

void *voice_control_callback( void *arg )
{  

        int fd1;
        int nread=0;
	int counter=0;
        int dgree=0;
        int ge=0,shi=0,bai=0;
        int current_dgree=0;
        int last_dgree=0;
        int diff_dgree=0;

        unsigned char temp_buff[10];
	unsigned char voice_buff[250];
	char *str = "";
        char dgree_buff[]={0x34};
	char *dev ="/dev/voice";
        bzero(( unsigned char*)&temp_buff,10);
	bzero(( unsigned char*)&voice_buff,250);

        fd1 = OpenDev(dev);
        //set_speed(fd1,115200);
        //set_Parity(fd1,8,1,'N');
	set_opt(fd1, 115200, 8, 'N', 1);
  	int g1=0,g2=0,g3=0;
	bool g_bool = false;
	bool s_bool = false;
	bool b_bool = false;
  

 while(ros::ok())
  {	
	while (voice_ctr)
	{
		if ((nread = read(fd1,temp_buff,1)) > 0)
		{
			//cout << temp_buff[0];

			//voice_buff[counter] = temp_buff[0];
			counter++;
			switch (counter)
			{
				case 21 : g1 = 0;g_bool = false;
					  if (temp_buff[0] <= '9' && temp_buff[0] >= '0')
					  {
						g_bool = true;
						g1 = temp_buff[0] - '0';
						//cout << "g1:" << g1 <<endl;
					  } break;
				case 22 : g2 = 0;s_bool = false;
					  if (temp_buff[0] <= '9' && temp_buff[0] >= '0')
					  {
						s_bool = true;
						g2 = temp_buff[0] - '0';
						//cout << "g2:" << g2 <<endl;
					  } break;
				case 23 : g3 = 0;b_bool = false;
					  if (temp_buff[0] <= '9' && temp_buff[0] >= '0')
					  {
						b_bool = true;
						g3 = temp_buff[0] - '0';
						//cout << "g3:" << g3 <<endl;
					  } break;
				default : break;
			}
			if (counter >=21 && counter <=23 && b_bool == false)
			{
				if (s_bool == false)
				{
					dgree = g1;
					//cout << dgree << endl;
				}		
				else
				{
					dgree = g1*10 + g2;	
					//cout << dgree << endl;				
				}			
			}
			else
			{	
				if (counter >=21 && counter <=23 && b_bool == true)
				{
					dgree = g1*100 + g2*10 + g3;
						
				}

			}
	
		}

		if (b_bool == false)
		{
			if (s_bool == false && counter ==228)
			{
				cout << dgree << endl;
				Sound_localization(dgree);
				counter = 0;
			}
			else 
			{	
				if (s_bool == true && counter ==229)
				{
					counter = 0;
					cout << dgree << endl;
					Sound_localization(dgree);
				}
			}
		
		}
		else
		{
			if (b_bool == true && counter == 230)
			{
				counter = 0;
				cout << dgree << endl;
				Sound_localization(dgree);
			}
		}

		//cout << "counter:" << counter << endl;	
	}

      
   }


}


void create_all_thread(void)
{
        pthread_t mode_change_thread ;
	pthread_t check_accept_thread;
        pthread_t face_control;
        pthread_t voice_control;
        pthread_t map_send;

	if( (pthread_create( &mode_change_thread , NULL , mode_change_callback , NULL )) != 0 )
	{
		perror("Create the mode_change_thread fail");
		exit( 1 );
	}

	if( (pthread_create( &check_accept_thread , NULL , check_accept_thread_callback , NULL )) != 0 )
	{
		perror("Create the receive_data_thread fail");
		exit( 1 );
	}

	if( (pthread_create( &face_control , NULL , face_control_callback , NULL )) != 0 )
	{
		perror("Create the receive_data_thread fail");
		exit( 1 );
	}

	if( (pthread_create( &voice_control , NULL , voice_control_callback , NULL )) != 0 )
	{
		perror("Create the receive_data_thread fail");
		exit( 1 );
	}

	if( (pthread_create( &map_send , NULL , map_send_callback , NULL )) != 0 )
	{
		perror("Create the receive_data_thread fail");
		exit( 1 );
	}

}


void amclPoseCallback(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr& msg)
{


        double currect_x=0;
        double currect_y=0;
        double current_orientation_z=0;
        double current_orientation_omiga=0;
        char pose_buff[100];
        char pose_data_x[15];
        char pose_data_y[15];
        char pose_data_z[15];
        char pose_data_omiga[15];
        int sig=7;
	currect_x=msg->pose.pose.position.x;
	currect_y=msg->pose.pose.position.y;
	current_orientation_z=msg->pose.pose.orientation.z;
	current_orientation_omiga=msg->pose.pose.orientation.w;

        gcvt(currect_x, sig, pose_data_x);
        gcvt(currect_y, sig, pose_data_y);
        gcvt(current_orientation_z, sig, pose_data_z);
        gcvt(current_orientation_omiga, sig, pose_data_omiga);

        pose_buff[0]='n';
        int i;int j;int n;int b;
        for(i=1;i<strlen(pose_data_x)+1;i++)
          {
             
             pose_buff[i]=pose_data_x[i-1];

          }

        pose_buff[strlen(pose_data_x)+1]=',';
        int g=strlen(pose_data_x)+2;
        for(j=0;j<strlen(pose_data_y);j++)
          {
             int f=g+j;
             pose_buff[f]=pose_data_y[j];
          }

        pose_buff[strlen(pose_data_x)+strlen(pose_data_y)+2]=',';
        int k=strlen(pose_data_x)+strlen(pose_data_y)+3;
        for(n=0;n<strlen(pose_data_z);n++)
          {
             
             int v=k+n;
             pose_buff[v]=pose_data_z[n];
          }

        pose_buff[strlen(pose_data_x)+strlen(pose_data_y)+strlen(pose_data_z)+3]=',';
        int x=strlen(pose_data_x)+strlen(pose_data_y)+strlen(pose_data_z)+4;
        for(b=0;b<strlen(pose_data_omiga);b++)
          {
             int s=x+b;
             pose_buff[s]=pose_data_omiga[b];
          }

          pose_buff[x+b]='\0';

          send(client_socket_fd , pose_buff , strlen(pose_buff), 0);
          sleep(0.5);            
        //printf("string = %s\n", pose_data_x);   
        //printf("string = %s\n", pose_data_y);    
        //printf("string = %s\n", pose_data_z);
        //printf("string11111111111111 = %s\n", pose_buff);
        //ROS_INFO("call back current_x:%f   current_y:%f   current_z:%f current_w:%f",currect_x,currect_y,current_orientation_z,current_orientation_omiga);
        
        
}


void StatusCallback(const actionlib_msgs::GoalStatusArray::ConstPtr& msg)
{
	if (goal_n>0)
	{	
		last_current_status=current_status;
		current_status=msg->status_list[0].status;
		if ((current_status==3)&&(last_current_status!=current_status))
		{

			char statusbuff[]={'r','e','a','c','h','e','d'};
			send(client_socket_fd , statusbuff , strlen(statusbuff), 0);
		}	
		

	}

	if (nav_closed)
		goal_n=0;

}

int main(int argc,char** argv)
{
        
	ros::init(argc, argv, "socketTest");
        ros::NodeHandle n;

        ros::Rate loop_rate(0.5);
	sub=n.subscribe("amcl_pose",100,amclPoseCallback);
        cancle_pub = n.advertise<actionlib_msgs::GoalID>("move_base/cancel",10);
        vel_pub = n.advertise<geometry_msgs::Twist>("teleop_velocity_smoother/raw_cmd_vel", 10);
        goal_pub = n.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal",10);
        client = n.serviceClient<std_srvs::Empty>("/move_base/clear_costmaps");
	sub_status = n.subscribe("move_base/status",100,StatusCallback);

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

