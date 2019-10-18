#include "ros/ros.h"
#include "std_msgs/String.h"
#include "sensor_msgs/LaserScan.h"

float laser_range[360];      
float resolution = 0.0f;
float angle_min = -1.3561925f;
float angle_max = 1.3561925f;

ros::Subscriber sub_laser;
ros::Publisher pub_laser;

void laserCallback(const sensor_msgs::LaserScan::ConstPtr& msg)
{
  float r_range_max = 0.0f;
  float r_range_min = 0.0f;
  float r_angle_min = 0.0f;
  float r_angle_max = 0.0f;
  int ranges_index_min = 0;  
  int ranges_index_max = 0;  
  int num_ranges = 0;

  r_range_max = msg->range_max;
  r_range_min = msg->range_min;
  r_angle_max = msg->angle_max;
  r_angle_min = msg->angle_min;
  resolution = msg->angle_increment;
  num_ranges = (r_angle_max - r_angle_min)/resolution +1;

   sensor_msgs::LaserScan msg1;
   msg1.header.stamp = ros::Time::now();
   msg1.header.frame_id = "laser_link";
   msg1.angle_min = angle_min;
   msg1.angle_max = angle_max;
   msg1.angle_increment = resolution;
   msg1.time_increment = msg->time_increment;
   msg1.range_max = r_range_max;
   msg1.range_min = r_range_min;

  int number_ranges_new_scan = (msg1.angle_max-msg1.angle_min)/resolution +1;
  msg1.ranges.resize(number_ranges_new_scan);
  for(int i = 0; i < number_ranges_new_scan; i++)
  {
     float angle=i*resolution+angle_min;
     int index_old_scan=(int)((angle-r_angle_min)/resolution);
     msg1.ranges[i] = msg->ranges[index_old_scan];
     //ROS_INFO("msg1.ranges: %lf   i:%d \n",msg1.ranges[i],i); 
  }
  pub_laser.publish(msg1);
  //ROS_INFO("ok \n");  
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "laser_filter");

  ros::NodeHandle nh;
  sub_laser = nh.subscribe("rplidar_scan", 360, laserCallback);
  pub_laser = nh.advertise<sensor_msgs::LaserScan>("scan", 360);

  ros::spin();
  return 0;
}
