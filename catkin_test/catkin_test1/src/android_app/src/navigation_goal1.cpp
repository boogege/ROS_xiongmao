
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
int psoe_in=0;
int current_status=0;
int last_current_status=0;
ros::Publisher goal_pub;
ros::Subscriber sub_status;

int j=0;
double goal_point[5][4]={3.546957,-1.178607,-0.217439,0.99976,2.54623,-0.6733428,-0.05589,0.99844};
void setgoal(double goal_xx, double goal_yy , double goal_zz , double goal_ww)
    {
	ros::Rate loop_rate(5);
	geometry_msgs::PoseStamped msg;
	msg.header.frame_id = "map";
	msg.header.stamp = ros::Time::now();
	msg.pose.position.x=goal_xx;
	msg.pose.position.y=goal_yy;
	msg.pose.orientation.w=goal_ww;
	msg.pose.orientation.z=goal_zz;
	goal_pub.publish(msg);
	cout<<"aaaaaaaa"<<endl;	
	loop_rate.sleep();
	//cout<<"goal_xx:"<<goal_xx<<"goal_yy:"<<goal_yy<<endl;
	//goal_n++;
    }

void pub_goal(int i)
{
	//if(psoe_in=0)
	//switch (psoe_in)
	//{
	//case 0:
	setgoal(goal_point[i][0],goal_point[i][1],goal_point[i][2],goal_point[i][3]);

	//if()
	//cout<<"aaaaaaaa"<<endl;
	//psoe_in=5;
	//break;
	//case 1:
/*
	setgoal(goal_point[1][0],goal_point[1][1],goal_point[1][2],goal_point[3][3]);
	break;
	case 2:
	setgoal(goal_point[2][0],goal_point[2][1],goal_point[2][2],goal_point[2][3]);
	break;
	case 3:
	setgoal(goal_point[3][0],goal_point[3][1],goal_point[3][2],goal_point[3][3]);
	break;*/
	//default:
	//fprintf(stderr,"Unsupported stop bits\n");
	//return (FALSE);
	//}

}


void pub_msg()
{
	while(ros::ok())
	{
        if(psoe_in==0)
{	 
	pub_goal(j);
	//psoe_in=1;
		
}
		
	}
}


void StatusCallback(const actionlib_msgs::GoalStatusArray::ConstPtr& msg)
{
	
		last_current_status=current_status;
		current_status=msg->status_list[0].status;
		if ((current_status==3)&&(last_current_status!=current_status))
		{

			char statusbuff[]={'r','e','a','c','h','e','d'};
			 psoe_in++;
			//pose_true=~pose_true
		}
	

}



int main(int argc,char** argv)
{

	ros::init(argc, argv, "navigation_goal");
        ros::NodeHandle n;	
	
	goal_pub = n.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal",10);
	sub_status = n.subscribe("move_base/status",100,StatusCallback);
	pub_msg();
	ros::spin();
	
        return 0;
}


















