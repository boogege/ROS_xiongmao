cmake_minimum_required(VERSION 2.8.3)
project(go_forward)

find_package(catkin REQUIRED COMPONENTS
  geometry_msgs
  nav_msgs
  roscpp
  std_msgs
)


catkin_package(

  CATKIN_DEPENDS geometry_msgs nav_msgs roscpp std_msgs
)


include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)

add_executable(go_forward src/go_forward.cpp)

 target_link_libraries(go_forward 
   ${catkin_LIBRARIES}
 )

