# Install script for directory: /home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/tmb/catkin_test/catkin_test1/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  include("/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_ros/catkin_generated/safe_execute_install.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pano_ros/action" TYPE FILE FILES
    "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/action/PanoCapture.action"
    "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/action/Stitch.action"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pano_ros/msg" TYPE FILE FILES
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureAction.msg"
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionGoal.msg"
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionResult.msg"
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureActionFeedback.msg"
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureGoal.msg"
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureResult.msg"
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/PanoCaptureFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pano_ros/msg" TYPE FILE FILES
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchAction.msg"
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionGoal.msg"
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionResult.msg"
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchActionFeedback.msg"
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchGoal.msg"
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchResult.msg"
    "/home/tmb/catkin_test/catkin_test1/devel/share/pano_ros/msg/StitchFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pano_ros/msg" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/msg/Pano.msg")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pano_ros/cmake" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_ros/catkin_generated/installspace/pano_ros-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/tmb/catkin_test/catkin_test1/devel/include/pano_ros")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/tmb/catkin_test/catkin_test1/devel/share/roseus/ros/pano_ros")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/tmb/catkin_test/catkin_test1/devel/share/common-lisp/ros/pano_ros")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/tmb/catkin_test/catkin_test1/devel/share/gennodejs/ros/pano_ros")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/tmb/catkin_test/catkin_test1/devel/lib/python2.7/dist-packages/pano_ros")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/tmb/catkin_test/catkin_test1/devel/lib/python2.7/dist-packages/pano_ros" REGEX "/\\_\\_init\\_\\_\\.py$" EXCLUDE REGEX "/\\_\\_init\\_\\_\\.pyc$" EXCLUDE)
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/tmb/catkin_test/catkin_test1/devel/lib/python2.7/dist-packages/pano_ros" FILES_MATCHING REGEX "/home/tmb/catkin_test/catkin_test1/devel/lib/python2.7/dist-packages/pano_ros/.+/__init__.pyc?$")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_ros/catkin_generated/installspace/pano_ros.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pano_ros/cmake" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_ros/catkin_generated/installspace/pano_ros-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pano_ros/cmake" TYPE FILE FILES
    "/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_ros/catkin_generated/installspace/pano_rosConfig.cmake"
    "/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_ros/catkin_generated/installspace/pano_rosConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pano_ros" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pano_ros" TYPE PROGRAM FILES
    "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/nodes/capture_client.py"
    "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_ros/nodes/capture_server.py"
    )
endif()

