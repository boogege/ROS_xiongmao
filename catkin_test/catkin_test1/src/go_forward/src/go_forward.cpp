//ros需要的头文件
#include "ros/ros.h"  
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>      
#include <iostream>
#include <cstdio>
#include <unistd.h>
#include <math.h>



float vel_x=0.2;
float vel_y=0.2;
/************************************************************/
void callback(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr& amcl_pose)
{
	if(fabs(amcl_pose->pose.pose.position.x-1.0)<0.1)
	{
		vel_x =0;	
		vel_y=0;	
	}
}


   
int main(int argc, char **argv)
{
	
    ros::init(argc, argv, "go_forward");
    ros::NodeHandle n;  

    ros::Subscriber sub_odom = n.subscribe("/amcl_pose", 20, callback); 
    ros::Publisher pub_vel = n.advertise<geometry_msgs::Twist>("/mobile_base/commands/velocity", 1000); 
 
    ros::Rate loop_rate(10);
    while(ros::ok())
    {       
	geometry_msgs::Twist msg;
	msg.linear.x =vel_x;
	msg.linear.y =vel_y;
	pub_vel.publish(msg);
        ros::spinOnce();
      	loop_rate.sleep();       
    }
    return 0;
}
