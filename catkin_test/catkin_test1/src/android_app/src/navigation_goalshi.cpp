#include <sys/types.h>
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
#include <actionlib_msgs/GoalID.h>

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
bool crash_1=false,crash_2=false,crash_3=false,crash_4=false;  //碰撞变量  
bool reach=false;	//是否到达目标店
actionlib_msgs::GoalID first_goal;
int mcu_cmd=0;
int vel_select=0;  //选择LEFT_GO LEFT_BACK RIGHT_GO RIGHT_BACK速度中的一个
int current_point=0;  //当前导航点
int goal_n=0;	
int current_status=0;  
int last_current_status=0;
int first = 0;
bool d0=false;
//发布订阅节点
ros::Publisher pub_cancle;
ros::Publisher pub_goal;  //发布目标点
ros::Publisher pub_send_mcu;  //向下位机发送指令
ros::Publisher pub_vel;	//向cmd_vel话题发送数据
ros::Subscriber sub_status;  //订阅当前导航状态
ros::Subscriber sub_pose;  //订阅amcl位姿
ros::Subscriber sub_mcu_msg;  //读取下位机消息


double nav_point[5][4]={0.437,2.069,-0.107,0.99424,3.48982,-1.16947,-0.0957425,0.995406,4.4735066,2.2740663, 0.03483452,0.9993930};
double goal_point[10][2]={0.38,2.37};
void set_goal(int i)
{
	ros::Rate loop_rate(5);
	geometry_msgs::PoseStamped msg;
	msg.header.frame_id = "map";
	msg.header.stamp = ros::Time::now();
	msg.pose.position.x=nav_point[i][0];
	msg.pose.position.y=nav_point[i][1];
	msg.pose.orientation.w=nav_point[i][2];
	msg.pose.orientation.z=nav_point[i][3];
	pub_goal.publish(msg);
	//cout<<"aaaaaaaa"<<endl;	
	loop_rate.sleep();
	goal_n++;
}


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
	while(ros::ok())
	{
	sleep(3);
	if(first==0)
	pub_switch();
	first=1;
	}
}


void *send_vel(void *arg)
{	
 while(ros::ok())

{ ros::Rate loop_rate(10);
   // printf("2222222222222222222");
    geometry_msgs::Twist msg;
	
	switch(vel_select)
	{	
		case LEFT_GO:msg.linear.x = -0.1;msg.linear.y = 0.1732;break;
		case LEFT_BACK:msg.linear.x = 0.1;msg.linear.y = -0.1732;break;
		case RIGHT_GO:msg.linear.x = -0.1;msg.linear.y = -0.1732;
			// cout<<"5555"<<d0<<std::endl;//printf("111111111111111111111");
			break;
		case RIGHT_BACK:msg.linear.x = 0.1;msg.linear.y = 0.1732;break;
		
	}
   
	if(d0==true&&reach==false)
{     // cout<<"7777"<<std::endl;
	//while(1)
//{
	pub_vel.publish(msg);	
      	loop_rate.sleep();
//}
}
	if(reach==true)
	{   d0=false;
		msg.linear.x=0;
		msg.linear.y=0;
	pub_vel.publish(msg);
	reach==false;
		//return;
	}	
}

}
/*
    while(ros::ok())
    {      
	
	//fprintf(stderr,"send vel \n");
	 
	if(reach==true)
	{
		msg.linear.x=0;
		msg.linear.y=0;
	pub_vel.publish(msg);
		return;
	}	
	pub_vel.publish(msg);	
      	loop_rate.sleep();
	       
    }
*/
void create_all_thread(void)
{

	pthread_t pub_thread ,pub_thread1;
		
	if( (pthread_create( &pub_thread , NULL , pub_na , NULL )) != 0 )
	{
		perror("Create the mode_change_thread fail");
		exit( 1 );
	}
if( (pthread_create( &pub_thread1, NULL , send_vel, NULL )) != 0 )
	{
		perror("Create the mode_change_thread fail");
		exit( 1 );
	}
}

void sendMcu()
{
	char c =187;
	std_msgs::String msg;
        msg.data[0] = c;
	msg.data[1]='c';
        
	switch(mcu_cmd)
	{
		case CATCH_1: msg.data[1]='c';;break;
		case CATCH_2: msg.data[1]='e';;break;
		case PUT_1: msg.data[1]='d';;break;
		case PUT_2: msg.data[1]='f';;break;
		case UP: msg.data[1]='a';;break;
		case DOWN: msg.data[1]='b';;break;
	}
	pub_send_mcu.publish(msg);
	sleep(2);
	return;
}
void statusCallback(const actionlib_msgs::GoalStatusArray::ConstPtr& msg)
{		//pub_switch();
	if (goal_n>0)
	{	
		last_current_status=current_status;
		current_status=msg->status_list[0].status;
		//cout<<"aaaaaaaa1111qq"<<endl;
		if ((current_status==3)&&(last_current_status!=current_status))
		{	  d0=true;
			current_status==0;
			
      			//pub_cancle.publish(first_goal);
			printf("navigation reach\n");
			switch(current_point)
			{        d0=true;
				case 0: vel_select=RIGHT_GO;//send_vel();
				cout<<"ddddd"<<vel_select<<std::endl;
//mcu_cmd=CATCH_1;sleep(1);sendMcu();vel_select=RIGHT_BACK;send_vel();
break;
				case 1: vel_select=RIGHT_GO;//send_vel();mcu_cmd=CATCH_2;sendMcu();mcu_cmd=UP;				sendMcu();vel_select=RIGHT_BACK;send_vel();
break;
				case 2: vel_select=LEFT_GO;//send_vel();mcu_cmd=PUT_1;sendMcu();mcu_cmd=CATCH_1;sendMcu();vel_select=LEFT_BACK;send_vel();
break;
				case 3: vel_select=RIGHT_GO;//send_vel();mcu_cmd=PUT_2;sendMcu();mcu_cmd=CATCH_2;sendMcu();vel_select=RIGHT_BACK;send_vel();
break;
				case 4: vel_select=LEFT_GO;//send_vel();mcu_cmd=PUT_1;sendMcu();vel_select=LEFT_BACK;send_vel();
break;
			}

			current_point=10;	//到达目标点且执行完抓取动作以后才导航到下一个点
			//pub_switch();
		}		
	}
}

//订阅里程计回调函数
void poseCallback(const nav_msgs::Odometry::ConstPtr& odom_pose)
{	//const geometry_msgs::PoseWithCovarianceStamped::ConstPtr& odom
	double x = odom_pose->pose.pose.position.x;
	double y = odom_pose->pose.pose.position.y;
	
	if(fabs(y-goal_point[0][1])<0.2)
	{	geometry_msgs::Twist msg;
		reach = true;	
		//printf("x:==%f   y:==%f\n",x,y);
		fprintf(stderr,"reach \n");	
	}
	else
	{
		reach = false;
		//fprintf(stderr,"not reach \n");
	}
}

//单片机上传数据回调函数
void mcuCallback(const std_msgs::String::ConstPtr& msg) 
{
	char c = msg->data[0];
	int n = c;
	switch(n)
	{
		case 0: crash_1=false;crash_2=false;crash_3=false;crash_4=false;break;
		case 1: crash_1=true; break;
		case 2: crash_2=true; break;
		case 3: crash_3=true; break;
		case 4: crash_4=true; break;
		case 12: crash_1=true;crash_2=true; break;
		case 34: crash_3=true;crash_4=true; break;
	}
}

int main(int argc,char** argv)
{
	ros::init(argc, argv, "navigation_goal");
        ros::NodeHandle n;	
	create_all_thread();
	pub_cancle =  n.advertise<actionlib_msgs::GoalID>("move_base/cancel",1);///mobile_base/commands/velocity
	//pub_send_mcu = n.advertise<std_msgs::String>("write_serial",1000);	//向单片机发送指令
	pub_goal = n.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal",10);	//发布导航点
	 pub_vel = n.advertise<geometry_msgs::Twist>("/cmd_vel_mux/input/teleop", 1000);	//向底盘发送速度/cmd_vel_mux/input/teleop
	sub_pose = n.subscribe("/odom", 20, poseCallback); 	//订阅位姿
	sub_status = n.subscribe("move_base/status",100,statusCallback);	//订阅是否到达目标点
	//sub_mcu_msg = n.subscribe("read_serial",100,mcuCallback);	//单片机数据
	ros::spin();	
        return 0;
}


