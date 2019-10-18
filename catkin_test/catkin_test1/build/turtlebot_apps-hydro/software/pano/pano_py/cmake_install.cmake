# Install script for directory: /home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_py

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_py/catkin_generated/installspace/pano_py.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pano_py/cmake" TYPE FILE FILES
    "/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_py/catkin_generated/installspace/pano_pyConfig.cmake"
    "/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_py/catkin_generated/installspace/pano_pyConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pano_py" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_py/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/catkin/profile.d" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_py/catkin_generated/installspace/15.ld_lib_path.bash")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/catkin/profile.d" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_py/catkin_generated/installspace/15.ld_lib_path.tcsh")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/etc/catkin/profile.d" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_py/catkin_generated/installspace/15.ld_lib_path.zsh")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pano_py" TYPE DIRECTORY FILES "/home/tmb/catkin_test/catkin_test1/src/turtlebot_apps-hydro/software/pano/pano_py/include/pano_py/")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_py/src/pano_cv/cmake_install.cmake")
  include("/home/tmb/catkin_test/catkin_test1/build/turtlebot_apps-hydro/software/pano/pano_py/src/pano_py/cmake_install.cmake")

endif()

