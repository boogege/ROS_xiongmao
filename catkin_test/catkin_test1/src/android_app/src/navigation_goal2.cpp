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
int goal_n=0;
int j=0;
double goal_point[7][4]={3.0803,0.089,-0.149,0.9888,4.5716,-0.9403,-0.679,0.73409,5.644,-1.924, 0.451,0.892,6.593,-0.501,-0.876,0.481,6.554,-0.512,0.978,0.2054};


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
	//break;
	//cout<<"goal_xx:"<<goal_xx<<"goal_yy:"<<goal_yy<<endl;
	goal_n++;
    }

void pub_goal(int i)
{

	setgoal(goal_point[i][0],goal_point[i][1],goal_point[i][2],goal_point[i][3]);
}


void pub_switch()      //choose goal pose
{
	
	switch (psoe_in)
	{
	case 0:
	pub_goal(0);

	//if()
	//cout<<"aaaaaaaa"<<endl;
	//psoe_in=5;
	break;
	case 1:
	pub_goal(1);
	break;
	case 2:
	pub_goal(2);
	break;
	case 3:
	pub_goal(3);
	break;
	case 4:
	pub_goal(4);
	break;
	case 5:
	pub_goal(5);
	break;
	default:
	fprintf(stderr,"Unsupported stop bits\n");
	//return (FALSE);
	}
}

void *pub_na(void *arg)
{
while(ros::ok())
	{
	sleep(3);
	pub_switch();
	//break;
	
	}
}


void create_all_thread(void)
{

	  pthread_t pub_thread ;
		
	if( (pthread_create( &pub_thread , NULL , pub_na , NULL )) != 0 )
	{
		perror("Create the mode_change_thread fail");
		exit( 1 );
	}
}


void StatusCallback(const actionlib_msgs::GoalStatusArray::ConstPtr& msg)
{
	if (goal_n>0)
	{	
		last_current_status=current_status;
		current_status=msg->status_list[0].status;
		cout<<"aaaaaaaa1111qq"<<endl;
		if ((current_status==3)&&(last_current_status!=current_status))
		{
                             psoe_in++;
			char statusbuff[]={'r','e','a','c','h','e','d'};
			//send(client_socket_fd , statusbuff , strlen(statusbuff), 0);
		}	
		

	}

}


int main(int argc,char** argv)
{

	ros::init(argc, argv, "navigation_goal");
        ros::NodeHandle n;	
	goal_pub = n.advertise<geometry_msgs::PoseStamped>("/move_base_simple/goal",10);
	sub_status = n.subscribe("move_base/status",100,StatusCallback);
	create_all_thread();
	//sleep(1);
	ros::spin();	
        return 0;
}











