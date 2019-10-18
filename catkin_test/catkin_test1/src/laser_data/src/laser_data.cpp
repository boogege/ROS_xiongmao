#include "ros/ros.h"
#include "std_msgs/String.h"
#include "sensor_msgs/LaserScan.h"
#include "math.h"

float laser_range[1000];      //laser init
float max_angle_laser=0;
float min_angle_laser=0;
float resolution_laser=0;
int num_laser_ranges=0;
float laser_range_max=0;
float laser_range_min=0;

float kinect_range[1000];    //kinect init
float max_angle_kinect=0;
float min_angle_kinect=0;
float resolution_kinect=0;
int num_kinect_ranges=0;
float kinect_angle=0;

double l_range=0;
double l_angle=0;

double d=0.21;
double laser_frequency=40;

void kinectCallback(const sensor_msgs::LaserScan::ConstPtr& msg)
{
//  ROS_INFO("%lf\n",(msg->angle_max-msg->angle_min)/msg->angle_increment);
max_angle_kinect=msg->angle_max;
min_angle_kinect=msg->angle_min;
resolution_kinect=msg->angle_increment;
num_kinect_ranges=int((msg->angle_max-msg->angle_min)/msg->angle_increment);    //kinect have 639 datas

int i;
for(i=0;i<num_kinect_ranges;i++)
{
kinect_range[i]=msg->ranges[i];
//ROS_INFO("kinect,%d %lf ",i,msg->ranges[i]);
//ROS_INFO("num_kinect_ranges:%d",num_kinect_ranges); 
}
}


void laserCallback(const sensor_msgs::LaserScan::ConstPtr& msg)
{
 // ROS_INFO("%lf\n",(msg->angle_max-msg->angle_min)/msg->angle_increment);
laser_range_max=msg->range_max;
laser_range_min=msg->range_min;
max_angle_laser=msg->angle_max;
min_angle_laser=msg->angle_min;
resolution_laser=msg->angle_increment;
num_laser_ranges=int((msg->angle_max-msg->angle_min)/msg->angle_increment);    //laser have 719 datas

int i=0,j=0;

for(i=0;i<num_laser_ranges;i++)
{
laser_range[i]=msg->ranges[i];                                                
//ROS_INFO("laser,%d %lf \n",i,msg->ranges[i]);
//ROS_INFO("num_laser_ranges:%d  num_laser_base_kinect:%d \n",num_laser_ranges,num_laser_base_kinect); 
}
 

//fusion,compare the laser and kinect data
   ros::NodeHandle n;
   ros::Publisher pub_fusion=n.advertise<sensor_msgs::LaserScan>("scan", 1000);

   sensor_msgs::LaserScan msg1;
//display some paras  
   msg1.header.stamp=ros::Time::now();
   msg1.header.frame_id="base_laser_link";
   msg1.angle_min=min_angle_laser;
   msg1.angle_max=max_angle_laser;
   msg1.angle_increment=resolution_laser;
   msg1.time_increment=(1/laser_frequency)/num_laser_ranges;
   msg1.range_max=laser_range_max;
   msg1.range_min=laser_range_min;

   msg1.ranges.resize(num_laser_ranges);

for(i=0;i<num_kinect_ranges;i++)
{
   double kinect_angle=min_angle_kinect+i*resolution_kinect;
  if(kinect_angle<=0)
   {
      l_range=sqrt(d*d+kinect_range[i]*kinect_range[i]-2*d*kinect_range[i]*cos(-kinect_angle));
      l_angle=-acos((kinect_range[i]*cos(-kinect_angle)-d)/l_range);
      j=int((l_angle-min_angle_laser)/resolution_laser);
   //     ROS_INFO("l_angle, %lf   j:%d \n",l_angle,j);  
      if((j>=0)&&(j<num_laser_ranges)&&(laser_range[j]>l_range))
      {
         laser_range[j]=l_range;
      //  ROS_INFO("l_range, %lf   j:%d \n",l_range,j);  
      }
   }
   else
   {
      l_range=sqrt(d*d+kinect_range[i]*kinect_range[i]-2*d*kinect_range[i]*cos(kinect_angle));
      l_angle=acos((kinect_range[i]*cos(kinect_angle)-d)/l_range);
      j=int((l_angle-min_angle_laser)/resolution_laser);
      if((j>=0)&&(j<num_laser_ranges)&&(laser_range[j]>l_range))
      {
         laser_range[j]=l_range;   
      } 
   }
}

for(i=0;i<num_laser_ranges;i++)
{
   msg1.ranges[i]=laser_range[i];
 //  ROS_INFO("msg1.ranges, %lf   i:%d \n",msg1.ranges[i],i);  
}

   pub_fusion.publish(msg1);
 //  ROS_INFO("ok \n");  
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "listener");

  ros::NodeHandle n;

  ros::Subscriber sub_kinect = n.subscribe("kinect_scan", 1000, kinectCallback);
  ros::Subscriber sub_laser = n.subscribe("laser_scan", 1000, laserCallback);
  ros::Publisher pub_fusion=n.advertise<sensor_msgs::LaserScan>("scan", 1000);

  ros::spin();
  return 0;
}
