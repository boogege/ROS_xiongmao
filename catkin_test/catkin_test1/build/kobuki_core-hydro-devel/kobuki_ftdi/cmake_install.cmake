# Install script for directory: /home/tmb/catkin_test/catkin_test1/src/kobuki_core-hydro-devel/kobuki_ftdi

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/build/kobuki_core-hydro-devel/kobuki_ftdi/catkin_generated/installspace/kobuki_ftdi.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_ftdi/cmake" TYPE FILE FILES
    "/home/tmb/catkin_test/catkin_test1/build/kobuki_core-hydro-devel/kobuki_ftdi/catkin_generated/installspace/kobuki_ftdiConfig.cmake"
    "/home/tmb/catkin_test/catkin_test1/build/kobuki_core-hydro-devel/kobuki_ftdi/catkin_generated/installspace/kobuki_ftdiConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_ftdi" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/src/kobuki_core-hydro-devel/kobuki_ftdi/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_ftdi" TYPE DIRECTORY FILES "/home/tmb/catkin_test/catkin_test1/src/kobuki_core-hydro-devel/kobuki_ftdi/bluetooth")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_ftdi" TYPE DIRECTORY FILES "/home/tmb/catkin_test/catkin_test1/src/kobuki_core-hydro-devel/kobuki_ftdi/eeproms")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/kobuki_ftdi" TYPE PROGRAM FILES
    "/home/tmb/catkin_test/catkin_test1/src/kobuki_core-hydro-devel/kobuki_ftdi/scripts/turtlebot_config"
    "/home/tmb/catkin_test/catkin_test1/src/kobuki_core-hydro-devel/kobuki_ftdi/scripts/create_udev_rules"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/kobuki_ftdi" TYPE FILE FILES "/home/tmb/catkin_test/catkin_test1/src/kobuki_core-hydro-devel/kobuki_ftdi/57-kobuki.rules")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/tmb/catkin_test/catkin_test1/build/kobuki_core-hydro-devel/kobuki_ftdi/src/cmake_install.cmake")

endif()

