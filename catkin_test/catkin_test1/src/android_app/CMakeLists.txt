cmake_minimum_required(VERSION 2.8.3)
project(android_app)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages

#set(OpenCV_DIR /usr/share/OpenCV/)

set(OpenCV_DIR /usr/local/share/OpenCV/) 

find_package(catkin REQUIRED COMPONENTS
  actionlib
  geometry_msgs
  move_base_msgs
  OpenCV
  cv_bridge
  roscpp
  std_msgs
  serial
  actionlib_msgs
)
find_package(OpenCV REQUIRED)  


## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)


## Uncomment this if the package has a setup.py. This macro ensures
## modules and global scripts declared therein get installed
## See http://ros.org/doc/api/catkin/html/user_guide/setup_dot_py.html
# catkin_python_setup()

################################################
## Declare ROS messages, services and actions ##
################################################

## To declare and build messages, services or actions from within this
## package, follow these steps:
## * Let MSG_DEP_SET be the set of packages whose message types you use in
##   your messages/services/actions (e.g. std_msgs, actionlib_msgs, ...).
## * In the file package.xml:
##   * add a build_depend tag for "message_generation"
##   * add a build_depend and a run_depend tag for each package in MSG_DEP_SET
##   * If MSG_DEP_SET isn't empty the following dependency has been pulled in
##     but can be declared for certainty nonetheless:
##     * add a run_depend tag for "message_runtime"
## * In this file (CMakeLists.txt):
##   * add "message_generation" and every package in MSG_DEP_SET to
##     find_package(catkin REQUIRED COMPONENTS ...)
##   * add "message_runtime" and every package in MSG_DEP_SET to
##     catkin_package(CATKIN_DEPENDS ...)
##   * uncomment the add_*_files sections below as needed
##     and list every .msg/.srv/.action file to be processed
##   * uncomment the generate_messages entry below
##   * add every package in MSG_DEP_SET to generate_messages(DEPENDENCIES ...)

## Generate messages in the 'msg' folder
# add_message_files(
#   FILES
#   Message1.msg
#   Message2.msg
# )

## Generate services in the 'srv' folder
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )

## Generate actions in the 'action' folder
# add_action_files(
#   FILES
#   Action1.action
#   Action2.action
# )

## Generate added messages and services with any dependencies listed here
# generate_messages(
#   DEPENDENCIES
#   geometry_msgs#   move_base_msgs#   std_msgs
# )

################################################
## Declare ROS dynamic reconfigure parameters ##
################################################

## To declare and build dynamic reconfigure parameters within this
## package, follow these steps:
## * In the file package.xml:
##   * add a build_depend and a run_depend tag for "dynamic_reconfigure"
## * In this file (CMakeLists.txt):
##   * add "dynamic_reconfigure" to
##     find_package(catkin REQUIRED COMPONENTS ...)
##   * uncomment the "generate_dynamic_reconfigure_options" section below
##     and list every .cfg file to be processed

## Generate dynamic reconfigure parameters in the 'cfg' folder
# generate_dynamic_reconfigure_options(
#   cfg/DynReconf1.cfg
#   cfg/DynReconf2.cfg
# )

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if you package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES android_app
 CATKIN_DEPENDS actionlib geometry_msgs move_base_msgs roscpp std_msgs serial
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
# include_directories(include)
include_directories(
  ${catkin_INCLUDE_DIRS}
)

include_directories(
  ${OpenCV_INCLUDE_DIRS}
)

## Declare a C++ library
# add_library(android_app
#   src/${PROJECT_NAME}/android_app.cpp
# )

## Add cmake target dependencies of the library
## as an example, code may need to be generated before libraries
## either from message generation or dynamic reconfigure
# add_dependencies(android_app ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Declare a C++ executable
# add_executable(android_app_node src/android_app_node.cpp)

## Add cmake target dependencies of the executable
## same as for the library above
# add_dependencies(android_app_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Specify libraries to link a library or executable target against
# target_link_libraries(android_app_node
#   ${catkin_LIBRARIES}
# )

#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/api/catkin/html/adv_user_guide/variables.html

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
# install(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark executables and/or libraries for installation
# install(TARGETS android_app android_app_node
#   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark cpp header files for installation
# install(DIRECTORY include/${PROJECT_NAME}/
#   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#   FILES_MATCHING PATTERN "*.h"
#   PATTERN ".svn" EXCLUDE
# )

## Mark other files for installation (e.g. launch and bag files, etc.)
# install(FILES
#   # myfile1
#   # myfile2
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
# )

#############
## Testing ##
#############

## Add gtest based cpp test target and link libraries
# catkin_add_gtest(${PROJECT_NAME}-test test/test_android_app.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)

#add_executable(socketTest src/socketTest.cpp)
 #target_link_libraries(socketTest
   #${catkin_LIBRARIES}
 #)
#may 9
#add_executable(socketTest_may_9_zhengjie src/socketTest_may_9_zhengjie.cpp)
 #target_link_libraries(socketTest_may_9_zhengjie
   #${catkin_LIBRARIES}
 #)




#add_executable(socketTest_may_10_zhengjie src/socketTest_may_10_zhengjie.cpp)
 #target_link_libraries(socketTest_may_10_zhengjie
   #${catkin_LIBRARIES}
 #)
#may 10
#add_executable(socketTest_may_10 src/socketTest_may_10.cpp)
 #target_link_libraries(socketTest_may_10
   #${catkin_LIBRARIES}
 #)

#may 11   15:30
#
#add_executable(serverSocket src/ServerSocket.cpp)
 #target_link_libraries(serverSocket
   #${catkin_LIBRARIES}
 #)

#may 11  21:04
#add_executable(socketTest_may_12 src/socketTest_may_12.cpp)
# target_link_libraries(socketTest_may_12
   #${catkin_LIBRARIES}
# )

add_executable(socket_gmapping_server src/socket_gmapping_server.cpp)
 target_link_libraries(socket_gmapping_server
   ${catkin_LIBRARIES} 
   ${OpenCV_LIBRARIES}
 )

#socket_navigation_server.cpp
add_executable(socket_navigation_server src/socket_navigation_server.cpp)
 target_link_libraries(socket_navigation_server
   ${catkin_LIBRARIES}
 )

add_executable(navigation_red src/navigation_red.cpp)
 target_link_libraries(navigation_red
   ${catkin_LIBRARIES}
 )

add_executable(navigation_blue src/navigation_blue.cpp)
 target_link_libraries(navigation_blue
   ${catkin_LIBRARIES}
 )












