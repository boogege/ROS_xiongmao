cmake_minimum_required(VERSION 2.8.3)
project(rdwr_serial)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  nav_msgs
  roscpp
  rospy
   serial
  std_msgs
)


catkin_package(

  CATKIN_DEPENDS message_generation nav_msgs roscpp rospy serial std_msgs

)


include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

 add_executable(rdwr_serial src/rdwr_serial.cpp)


 target_link_libraries(rdwr_serial ${catkin_LIBRARIES})




