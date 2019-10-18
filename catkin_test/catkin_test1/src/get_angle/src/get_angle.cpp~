#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include "ros/ros.h"
#include <math.h>
ros::Subscriber sub_odom;
void angleCallback(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr& msg)
{
	double x = msg->pose.pose.orientation.x;    
    	double y = msg->pose.pose.orientation.y;
	double z = msg->pose.pose.orientation.z; 
	double w = msg->pose.pose.orientation.w;
	double roll=atan2(2*(w*x+y*z),1-2*(x*x+y*y));
	double yaw=asin(2*(w*y-x*z));
	double pitch=atan2(2*(w*z+x*y),1-2*(y*y+z*z));
	printf("roll:  %f\n",roll);
	printf("yaw:  %f\n",yaw);
	printf("pitch:  %f\n",pitch);
	
}

int main(int argc,char** argv)
{
	ros::init(argc, argv, "get_angle");
        ros::NodeHandle n;	

	sub_odom = n.subscribe("/amcl_pose",100,angleCallback);	//订阅是否到达目标点

	ros::spin();	
        return 0;
}
