execute_process(COMMAND "/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_ros/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_ros/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
