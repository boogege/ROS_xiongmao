#include <sys/types.h>
#include <sys/time.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>
#include <stdlib.h>
#include <math.h>
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
#define FALSE  -1
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
#include<time.h>
#include "serial/serial.h"
#define LEFT_GO 1
#define LEFT_BACK 2
#define RIGHT_GO 3
#define RIGHT_BACK 4

#define UP 1
#define DOWN 2
#define CATCH_1 3
#define PUT_1 4
#define CATCH_2 5
#define PUT_2 6
bool crash_1=false,crash_2=false,crash_3=false,crash_4=false; //碰撞变量  
bool first=true;
bool back = false;
int mcu_cmd=0;  // 控制爪子 CATCH_1 CATCH_2 PUT_1 PUT_2 UP DOWN
int vel_select=0;  //选择LEFT_GO LEFT_BACK RIGHT_GO RIGHT_BACK速度中的一个
int current_point=0;  //当前导航点
int goal_n=0;	
int current_status=0;  
int last_current_status=0;
std::string rec_buffer; //串口接收缓存

//发布订阅节点
ros::Publisher pub_goal;  //发布目标点
ros::Publisher pub_vel;	//向cmd_vel话题发送数据
ros::Subscriber sub_status;  //订阅当前导航状态

double nav_point[10][4]={0.954,-2.268,-0.154,0.988,
3.262,-3.878,0.657,0.754,
3.987,-0.69,0.469,0.883,
4.461,-0.198,0.559,0.829,
4.627,1.616,0.529,0.848,
3.437,0.791,0.656,0.754};

void set_goal(int i)
{
	ros::Rate loop_rate(5);
	geometry_msgs::PoseStamped msg;
	msg.header.frame_id = "map";
	msg.header.stamp = ros::Time::now();
	msg.pose.position.x=nav_point[i][0];
	msg.pose.position.y=nav_point[i][1];
	msg.pose.orientation.z=nav_point[i][2];
	msg.pose.orientation.w=nav_point[i][3];
	pub_goal.publish(msg);
	cout<<"set goal"<<endl;	
	loop_rate.sleep();
	goal_n++;
}

//最多7个点
void pub_switch()
{
	if(current_point>=0&&current_point<=6)	
	{
		set_goal(current_point);
	}
	else
	{
		fprintf(stderr,"Unsupported stop bits\n");
	}
	
}

void *pub_na(void *arg)
{
	string port("/dev/ttyUSB1");
        unsigned long baud = 115200;
        serial::Serial my_serial(port, baud, serial::Timeout::simpleTimeout(1000));
	while(ros::ok())
	{
	rec_buffer =my_serial.readline(1000,"\n");
	char c = rec_buffer[0];
	switch(c)
	{
		case '1': crash_1=true;		crash_2=false;crash_3=false;crash_4=false;break;
		case '2': crash_2=true;		crash_1=false;crash_3=false;crash_4=false;break;
		case '3': crash_3=true;		crash_1=false;crash_2=false;crash_4=false;break;
		case '4': crash_4=true;		crash_1=false;crash_2=false;crash_3=false;break;
		case '5': crash_1=true;crash_2=true;		crash_3=false;crash_4=false;break;
		case '6': crash_3=true;crash_4=true;		crash_1=false;crash_2=false;break;
		default:crash_1=false;crash_2=false;crash_3=false;crash_4=false;
	}
	printf("crash:%c\n",c);
	usleep(10000);
	if(first)
	pub_switch();
	first=false;
	}
}

void create_all_thread(void)
{

	pthread_t pub_thread ;
		
	if( (pthread_create( &pub_thread , NULL , pub_na , NULL )) != 0 )
	{
		perror("Create the thread fail");
		exit( 1 );
	}
}

void send_vel()
{
    time_t begin,end,dura; 
    begin=time(NULL);
    geometry_msgs::Twist msg;
    switch(vel_select)
    {
	case LEFT_GO:msg.linear.x = -0.1;msg.linear.y = 0.1732;break;
	case LEFT_BACK:msg.linear.x =0.1;msg.linear.y = -0.1732;break;
	case RIGHT_GO:msg.linear.x = -0.1;msg.linear.y = -0.1732;break;
	case RIGHT_BACK:msg.linear.x =0.1;msg.linear.y = 0.1732;break;
    }
    ros::Rate loop_rate(10);
    while(ros::ok())
    {   
	end=time(NULL);   
	dura = end-begin;
	printf("延时%ld\n",dura);
    	if(current_point==0)
	{	if(!back)
		{
			msg.linear.x = -0.1;
			msg.linear.y = -0.1732;
			if(crash_3||crash_4)
			return;
		}
		else 
		{
			msg.linear.x = 0.1;
			msg.linear.y = 0.1732;
		}
		
		if(dura>2)
		{
			if(back)
			{
				current_point++;	
				pub_switch();
			}
			return ;
		}
		
	}
	else if(current_point==1)
	{	if(!back)
		{
			msg.linear.x = -0.1;
			msg.linear.y = 0.1732;
			if(crash_1||crash_2)
			return;
		}
		else 
		{
			msg.linear.x = 0.1;
			msg.linear.y = -0.1732;
		}
		
		if(dura>2)
		{
			if(back)
			{
				current_point++;	
				pub_switch();
			}
			return ;
		}
		
	}
	else if(current_point==2)
	{	
		if(!back)  //向前
		{	
			if(crash_1&&crash_2)
			 return;
			if(crash_1)
			{
				//右边碰到，顺时针旋转
				msg.linear.x=0;
				msg.linear.y=0;
				msg.angular.z=-0.2;
			}
			if(crash_2)
			{
				//左边碰到，逆时针旋转
				msg.linear.x=0;
				msg.linear.y=0;
				msg.angular.z=0.2;
			}
			//if(dura>5)
			//return ;
		}
		else  //向后
		{

			 if(dura>1)
			{
			current_point++;
			pub_switch();
			return ;	
			}
		}
		
	}
	else if(current_point==3)
	{	
		if(!back)  //向前
		{	
			if(crash_3&&crash_4)
			 return;
			if(crash_3)
			{
				//右边碰到，顺时针旋转
				msg.linear.x=0;
				msg.linear.y=0;
				msg.angular.z=-0.2;
			}
			if(crash_4)
			{
				//左边碰到，逆时针旋转
				msg.linear.x=0;
				msg.linear.y=0;
				msg.angular.z=0.2;
			}
			//if(dura>5)
			//return ;
		}
		else  //向后
		{

			 if(dura>2)
			{
			current_point++;
			pub_switch();
			return ;	
			}
		}
	}
	else if(current_point==4)
	{	
		if(!back)  //向前
		{	
			if(crash_1&&crash_2)
			 return;
			if(crash_1)
			{
				//右边碰到，顺时针旋转
				msg.linear.x=0;
				msg.linear.y=0;
				msg.angular.z=-0.2;
			}
			if(crash_2)
			{
				//左边碰到，逆时针旋转
				msg.linear.x=0;
				msg.linear.y=0;
				msg.angular.z=0.2;
			}
			//if(dura>5)
			//return ;
		}
		else  //向后
		{

			 if(dura>2)
			{
			current_point++;
			pub_switch();
			return ;	
			}
		}
	}
	else if(current_point==5)
	{	
		if(!back)  //向前
		{	
			if(crash_3&&crash_4)
			 return;
			if(crash_3)
			{
				//右边碰到，顺时针旋转
				msg.linear.x=0;
				msg.linear.y=0;
				msg.angular.z=-0.2;
			}
			if(crash_4)
			{
				//左边碰到，逆时针旋转
				msg.linear.x=0;
				msg.linear.y=0;
				msg.angular.z=0.2;
			}
			//if(dura>5)
			//return ;
		}
		else  //向后
		{

			 if(dura>2)
			{
			current_point++;
			pub_switch();
			return ;	
			}
		}
	}
	pub_vel.publish(msg);	  
	double vel_x = msg.linear.x;
	double vel_y = msg.linear.y;
	printf("x速度：%f    y速度：%f",vel_x,vel_y);
      	loop_rate.sleep();
	       
    }
}



/*左侧碰触
		if(!back)  //向前
		{	
			if(crash_1&&crash_2)
			 return;
			if(crash_1)
			{
				//右边碰到，顺时针旋转
				msg.linear.x=0;
				msg.linear.y=0;
				msg.angular.z=-0.4;
			}
			if(crash_2)
			{
				//左边碰到，逆时针旋转
				msg.linear.x=0;
				msg.linear.y=0;
				msg.angular.z=0.4;
			}
			if(dura>5)
			return ;
		}

*/

/*右侧碰触
		if(!back)  //向前
		{	
			if(crash_3&&crash_4)
			 return;
			if(crash_3)
			{
				//右边碰到，顺时针旋转
				msg.linear.x=0;
				msg.linear.y=0;
				msg.angular.z=-0.4;
			}
			if(crash_4)
			{
				//左边碰到，逆时针旋转
				msg.linear.x=0;
				msg.linear.y=0;
				msg.angular.z=0.4;
			}
			if(dura>5)
			return ;
		}

*/

void sendMcu()
{
	string port("/dev/ttyUSB1");
        unsigned long baud = 115200;
	serial::Serial my_serial(port, baud, serial::Timeout::simpleTimeout(1000));
	std::string msg;
	switch(mcu_cmd)
	{
		case CATCH_1: msg="c";break;
		case CATCH_2: msg="e";;break;
		case PUT_1: msg="d";break;
		case PUT_2: msg="f";;break;
		case UP: msg="a";;break;
		case DOWN: msg="b";;break;
	}
	cout<<"crash"<<msg<<std::endl;
	my_serial.write(msg);
	return;
}

void statusCallback(const actionlib_msgs::GoalStatusArray::ConstPtr& msg)
{
	if (goal_n>0)
	{	
		last_current_status=current_status;
		current_status=msg->status_list[0].status;
		if ((current_status==3)&&(last_current_status!=current_status))
		{
			sleep(1);	
			printf("navigation reach \n");
			switch(current_point)
			{
				case 0: vel_select=RIGHT_GO;send_vel();mcu_cmd=CATCH_2;sendMcu();sleep(1);mcu_cmd=UP;sendMcu();vel_select=RIGHT_BACK;back=true;send_vel();mcu_cmd=DOWN;sendMcu();back=false;break;
				case 1: vel_select=LEFT_GO;send_vel();mcu_cmd=CATCH_1;sendMcu();sleep(1);mcu_cmd=UP;sendMcu();vel_select=LEFT_BACK;back=true;send_vel();back=false;break;
				case 2: vel_select=LEFT_GO;send_vel();mcu_cmd=PUT_1;sendMcu();mcu_cmd=CATCH_1;sendMcu();sleep(1);vel_select=LEFT_BACK;back=true;send_vel();back=false;break;
				case 3: vel_select=RIGHT_GO;send_vel();mcu_cmd=PUT_2;sendMcu();mcu_cmd=CATCH_2;sendMcu();sleep(3);vel_select=RIGHT_BACK;back=true;send_vel();back=false;break;
				case 4: vel_select=LEFT_GO;send_vel();mcu_cmd=PUT_1;sendMcu();mcu_cmd=CATCH_1;sendMcu();sleep(1);vel_select=LEFT_BACK;back=true;send_vel();back=false;break;break;
				case 5: vel_select=RIGHT_GO;send_vel();mcu_cmd=PUT_2;sendMcu();mcu_cmd=CATCH_2;sendMcu();sleep(1);vel_select=RIGHT_BACK;back=true;send_vel();back=false;break;
				//左边前进 抓 升 后退  vel_select=LEFT_GO;send_vel();mcu_cmd=CATCH_1;sendMcu();sleep(1);mcu_cmd=UP;sendMcu();vel_select=LEFT_BACK;back=true;send_vel();back=false;break;
				//右边前进 抓 升 后退  vel_select=RIGHT_GO;send_vel();mcu_cmd=CATCH_2;sendMcu();sleep(1);mcu_cmd=UP;sendMcu();vel_select=RIGHT_BACK;back=true;send_vel();back=false;break;
				//左边前进 抓 升 后退 降  vel_select=LEFT_GO;send_vel();mcu_cmd=CATCH_1;sendMcu();sleep(1);mcu_cmd=UP;sendMcu();vel_select=LEFT_BACK;back=true;send_vel();mcu_cmd=DOWN;sendMcu();back=false;break;
				//右边前进 抓 升 后退 降  vel_select=RIGHT_GO;send_vel();mcu_cmd=CATCH_2;sendMcu();sleep(1);mcu_cmd=UP;sendMcu();vel_select=RIGHT_BACK;back=true;send_vel();mcu_cmd=DOWN;sendMcu();back=false;break;
				//左边前进 放 抓 后退  vel_select=LEFT_GO;send_vel();mcu_cmd=PUT_1;sendMcu();sleep(3);mcu_cmd=CATCH_1;sendMcu();vel_select=LEFT_BACK;back=true;send_vel();back=false;break;
				//右边前进 放 抓 后退vel_select=RIGHT_GO;send_vel();mcu_cmd=PUT_2;sendMcu();sleep(3);mcu_cmd=CATCH_2;sendMcu();vel_select=RIGHT_BACK;back=true;send_vel();back=false;break;
			
			}

		}
		else if((current_status==4)&&(last_current_status!=current_status))
		{
			current_point++;	
			pub_switch();
		}		
	}
}



int main(int argc,char** argv)
{
	ros::init(argc, argv, "navigation_goal");
        ros::NodeHandle n;	

	pub_goal = n.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal",10);	//发布导航点
	pub_vel = n.advertise<geometry_msgs::Twist>("/mobile_base/commands/velocity", 1000);	//向底盘发送速度
	sub_status = n.subscribe("move_base/status",100,statusCallback);	//订阅是否到达目标点

	create_all_thread();
	ros::spin();	
        return 0;
}
