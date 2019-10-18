# Install script for directory: /home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_py/src/pano_py

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
  if(EXISTS "$ENV{DESTDIR}/home/tmb/catkin_test/catkin_test1/install/lib/python2.7/dist-packages/pano_py.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/tmb/catkin_test/catkin_test1/install/lib/python2.7/dist-packages/pano_py.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/tmb/catkin_test/catkin_test1/install/lib/python2.7/dist-packages/pano_py.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/tmb/catkin_test/catkin_test1/install/lib/python2.7/dist-packages/pano_py.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/tmb/catkin_test/catkin_test1/install/lib/python2.7/dist-packages" TYPE SHARED_LIBRARY FILES "/home/tmb/catkin_test/catkin_test1/devel/lib/python2.7/dist-packages/pano_py.so")
  if(EXISTS "$ENV{DESTDIR}/home/tmb/catkin_test/catkin_test1/install/lib/python2.7/dist-packages/pano_py.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/tmb/catkin_test/catkin_test1/install/lib/python2.7/dist-packages/pano_py.so")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/home/tmb/catkin_test/catkin_test1/install/lib/python2.7/dist-packages/pano_py.so"
         OLD_RPATH "/home/tmb/catkin_test/catkin_test1/devel/lib/python2.7/dist-packages:/home/tmb/catkin_test/catkin_test1/devel/lib:/opt/ros/kinetic/lib:/opt/ros/kinetic/lib/x86_64-linux-gnu:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/tmb/catkin_test/catkin_test1/install/lib/python2.7/dist-packages/pano_py.so")
    endif()
  endif()
endif()

