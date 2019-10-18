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
//#include <geometry_msgs/Point.h>

//#include <move_base_msgs/MoveBaseAction.h>
//#include <actionlib/client/simple_action_client.h>
//typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

#define HOSTPORT			9400
#define MAX_CONNECTION	10
#define MAX_BUFFER 1024

#define GO			    1
#define BACK			2
#define LEFT			3
#define RIGHT			4

#define omin_navigation            'q'
#define omin_follow                'w'
#define omin_android_tele          'e'

#define close_omin_navigation      'a'
#define close_omin_follow          's'
#define close_omin_android_tele    'd'

using namespace std;

int cmd1,lastcmd1;
char command[30];
int num=10000;
ros::Publisher vel_pub;
ros::Publisher cancle_pub;
ros::Publisher goal_pub;
ros::Subscriber sub;
ros::Subscriber sub_status;
ros::ServiceClient client;
double currect_x=0;
double currect_y=0;
double current_orientation_z=0;
double current_orientation_omiga=0;
int current_status=0;
int last_current_status=0;
int goal_n=0;
bool nav_closed=true;

float goal_x=0.0;
float goal_y=0.0;
float last_goal_x=0.0;
float last_goal_y=0.0;
int a ,b ,c ,d ,e ,f ,g ,h;

char fg;
int server_socket_fd;
int client_socket_fd;
socklen_t len;
struct sockaddr_in server_addr;
struct sockaddr_in client_addr;

void setgoal(float goal_x, float goal_y)
{
	geometry_msgs::PoseStamped msg;
	msg.header.frame_id = "map";
	msg.header.stamp = ros::Time::now();
	msg.pose.position.x=goal_x;
	msg.pose.position.y=goal_y;
	msg.pose.orientation.w=1;
	msg.pose.orientation.z=0;
	goal_pub.publish(msg);
	cout<<"goal_x:"<<goal_x<<"goal_y:"<<goal_y<<endl;
	goal_n++;
}

void *thread_control( void *arg )
{
	ros::Rate loop_rate(50);
	float x; float y ; float z ;
	//cout<<"key control \n"<<endl;

	while(1)
	{ 
        	geometry_msgs::Twist msg;
			if (lastcmd1!=cmd1)
			{
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
							x=0;y=0;z=0.5;
				                        msg.linear.x=x;
				                        msg.linear.y=y;
				                        msg.angular.z=z;  
							break;
						}						
					case RIGHT :
						{
							x=0;y=0;z=-0.5;
				                        msg.linear.x=x;
				                        msg.linear.y=y;
				                        msg.angular.z=z;  
							break;
						}
					default:	break;
				}  
				vel_pub.publish(msg);
		    		//cout<<"x:"<<x<<"y:"<<y<<"z:"<<z<<endl;
			}
		loop_rate.sleep();
       }
	
}

void *receive_data_callback( void *arg ){

        ros::Rate loop_rate(0.2);
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
			  	 	cmd1=command[7]-'0';break;
			  	}
			  	case 'o':
				{
					switch( command[7] )
					{
                				std::cout<<"command[7]"<<command[7]<<std::endl;
					   	case omin_navigation:
						{
							nav_closed=false;
							actionlib_msgs::GoalID first_goal;
							cancle_pub.publish(first_goal);
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
							break;
				    		}
				  		case close_omin_navigation:
						{	
							nav_closed=true;				
							actionlib_msgs::GoalID first_goal;
							cancle_pub.publish(first_goal);
							std::cout<<"close_omin_navigation"<<std::endl;
							break;
				    		}
				    		case omin_follow:
						{					
							ros::param::set("/turtlebot_follower/enabled",true);
							ROS_INFO("omin_follow\n");
							break;
				    		}
				    		case close_omin_follow:
						{					
							ros::param::set("/turtlebot_follower/enabled",false);
							ROS_INFO("close_omin_follow\n");
							break;
				    		}
				    		case omin_android_tele:
						{
							ROS_INFO("omin_android_tele\n");
							ros::param::set("/turtlebot_follower/enabled",false);
							break;
						}
				   		case close_omin_android_tele:
						{					
							ROS_INFO("close_omin_android_tele\n");
							ros::param::set("/turtlebot_follower/enabled",false);
							break;
						}						
						default:break;
					}
				break;
				}
			case 'm':
			{ 
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

void *check_accept_thread_callback( void *arg )
{           
	while(1)
	{
		if ((listen( server_socket_fd, MAX_CONNECTION ))== -1) 
		{
			perror("listen error");
			exit(1);
		}
		cout<<"waiting connection...\n"<<endl;
		len = sizeof(struct sockaddr_in);
		client_socket_fd = accept(server_socket_fd, (struct sockaddr *)&client_addr, &len);
		if( client_socket_fd == -1 )
		{
			perror( "create the client_socket_fd fail" );
			exit( 1 );
		}
		//std::cout<<"connection established!\n";  
		cout<<"new connection client_socket_fd is %d\n"<<client_socket_fd<<endl;
		//std::cout<<"waiting message...\n";
		char statusbuff[]={'s','u','c','c','e','s','s'};
		send(client_socket_fd , statusbuff , strlen(statusbuff), 0);	
	}
}

void create_all_thread(void)
{
	pthread_t control_thread ;
	pthread_t receive_data_thread;
	pthread_t check_accept_thread;

	if( (pthread_create( &control_thread , NULL , thread_control , NULL )) != 0 )
	{
		perror("Create the thread_control fail");
		exit( 1 );
	}
	if( (pthread_create( &receive_data_thread , NULL , receive_data_callback , NULL )) != 0 )
	{
		perror("Create the receive_data_thread fail");
		exit( 1 );
	}
	if( (pthread_create( &check_accept_thread , NULL , check_accept_thread_callback , NULL )) != 0 )
	{
		perror("Create the receive_data_thread fail");
		exit( 1 );
	}
}

void amclPoseCallback(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr& msg)
{
	currect_x=msg->pose.pose.position.x;
	currect_y=msg->pose.pose.position.y;
	current_orientation_z=msg->pose.pose.orientation.z;
	current_orientation_omiga=msg->pose.pose.orientation.w;
	//ROS_INFO("call back current_x:%f   current_y:%f   current_z:%f current_w:%f",currect_x,currect_y,current_orientation_z,current_orientation_omiga);
}

void StatusCallback(const actionlib_msgs::GoalStatusArray::ConstPtr& msg)
{
	if (goal_n>0)
	{	//		ROS_INFO("last_goal_x:%f   currect_x:%f",last_goal_x,currect_x);
		//if (fabs(last_goal_x-currect_x)>1.2)
		//{
			//sleep(3);
			last_current_status=current_status;
			current_status=msg->status_list[0].status;
			//ROS_INFO("1111111111111111111111");
			//ROS_INFO("current_status:%d   last_current_status:%d",current_status,last_current_status);
			if ((current_status==3)&&(last_current_status!=current_status))
			{
				//navigation status feedback
			//	goal_n=0;
				char statusbuff[]={'r','e','a','c','h','e','d'};
				send(client_socket_fd , statusbuff , strlen(statusbuff), 0);
			}	
		//}

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
	//ret = setsockopt( server_socket_fd , SOL_SOCKET , SO_REUSEADDR , &server_addr , sizeof( server_addr ) );
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
/*
	ret = listen( server_socket_fd, MAX_CONNECTION );              
	if (ret == -1) 
	{
		perror("listen error");
		exit(1);
	}

	cout<<"waiting connection...\n"<<endl;
	len = sizeof(struct sockaddr_in);
	client_socket_fd = accept(server_socket_fd, (struct sockaddr *)&client_addr, &len);
	if( client_socket_fd == -1 )
	{
		perror( "create the client_socket_fd fail" );
		exit( 1 );
	}
        std::cout<<"connection established!\n";  
	cout<<"new connection client_socket_fd is %d\n"<<client_socket_fd<<endl;
        std::cout<<"waiting message...\n";
*/		
						//system("gnome-terminal -x /home/jie/clear_costmap.sh");
	create_all_thread( );
	sleep(1);
        ros::spin();
        return 0;
	
}

