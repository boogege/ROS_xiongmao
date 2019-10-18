
#include "ros/ros.h"  //ros需要的头文件
#include "std_msgs/String.h"
#include <geometry_msgs/Twist.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
//以下为串口通讯需要的头文件
#include <string>        
#include <cstring>
#include <iostream>
#include <cstdio>
#include <unistd.h>
#include <math.h>
#include "serial/serial.h"
/****************************************************************************/
using std::string;
using std::exception;
using std::cout;
using std::cerr;
using std::endl;
using std::vector;

unsigned char write_data[10]={0};   //要发给串口的数据
string rec_buffer;  //串口数据接收变量

/************************************************************/
void callback(const std_msgs::String::ConstPtr& msg)//订阅/cmd_vel主题回调函数
{
    string port("/dev/ttyUSB1");    //小车串口号
    unsigned long baud = 115200;    //小车串口波特率
    serial::Serial my_serial(port, baud, serial::Timeout::simpleTimeout(1000)); //配置串口
    //const char *write_data = msg->data.c_str();
    //strcpy(write_data,msg->data.c_str());
  
    //写入数据到串口
	
	//my_serial.write(c);
    my_serial.write(msg->data);
    //my_serial.write(write_data,10);
}

int main(int argc, char **argv)
{
    string port("/dev/ttyUSB1");//小车串口号
    unsigned long baud = 115200;//小车串口波特率
    serial::Serial my_serial(port, baud, serial::Timeout::simpleTimeout(1000));//配置串口

    ros::init(argc, argv, "rdwr_serial");//初始化串口节点
    ros::NodeHandle n;  //定义节点进程句柄

    ros::Subscriber write_sub = n.subscribe("write_serial", 20, callback); //订阅/write_serial主题
    ros::Publisher read_pub = n.advertise<std_msgs::String>("read_serial", 1); //发布/read_serial主题
    //ros::Publisher read_pub = n.advertise<std_msgs::String>("read_serial", 1000); //发布/read_serial主题

    ros::Rate loop_rate(100);//设置周期休眠时间
    while(ros::ok())
    {
	std_msgs::String msg;
	msg.data =my_serial.readline(4,"\n");
        //rec_buffer =my_serial.readline(15,"\n");    //获取串口发送来的数据
        //const char *receive_data=rec_buffer.data(); //保存串口发送来的数据
        //if(rec_buffer.length()==10) //串口接收的数据长度正确就处理并发布里程计数据消息
        //{
           
         //   std_msgs::String msg;
    	 //   msg.data = rec_buffer.data();
            //发布读取的数据
         read_pub.publish(msg);

            ros::spinOnce();//周期执行
      	    loop_rate.sleep();//周期休眠
        //}
        //程序周期性调用
        //ros::spinOnce();  //callback函数必须处理所有问题时，才可以用到
    }
    return 0;
}
