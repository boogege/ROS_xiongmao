# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "linux_hardware: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ilinux_hardware:/home/tmb/catkin_test/catkin_test1/src/turtlebot-hydro-devel/linux_hardware/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(linux_hardware_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/src/turtlebot-hydro-devel/linux_hardware/msg/LaptopChargeStatus.msg" NAME_WE)
add_custom_target(_linux_hardware_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "linux_hardware" "/home/tmb/catkin_test/catkin_test1/src/turtlebot-hydro-devel/linux_hardware/msg/LaptopChargeStatus.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(linux_hardware
  "/home/tmb/catkin_test/catkin_test1/src/turtlebot-hydro-devel/linux_hardware/msg/LaptopChargeStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/linux_hardware
)

### Generating Services

### Generating Module File
_generate_module_cpp(linux_hardware
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/linux_hardware
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(linux_hardware_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(linux_hardware_generate_messages linux_hardware_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/src/turtlebot-hydro-devel/linux_hardware/msg/LaptopChargeStatus.msg" NAME_WE)
add_dependencies(linux_hardware_generate_messages_cpp _linux_hardware_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(linux_hardware_gencpp)
add_dependencies(linux_hardware_gencpp linux_hardware_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS linux_hardware_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(linux_hardware
  "/home/tmb/catkin_test/catkin_test1/src/turtlebot-hydro-devel/linux_hardware/msg/LaptopChargeStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/linux_hardware
)

### Generating Services

### Generating Module File
_generate_module_eus(linux_hardware
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/linux_hardware
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(linux_hardware_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(linux_hardware_generate_messages linux_hardware_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/src/turtlebot-hydro-devel/linux_hardware/msg/LaptopChargeStatus.msg" NAME_WE)
add_dependencies(linux_hardware_generate_messages_eus _linux_hardware_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(linux_hardware_geneus)
add_dependencies(linux_hardware_geneus linux_hardware_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS linux_hardware_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(linux_hardware
  "/home/tmb/catkin_test/catkin_test1/src/turtlebot-hydro-devel/linux_hardware/msg/LaptopChargeStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/linux_hardware
)

### Generating Services

### Generating Module File
_generate_module_lisp(linux_hardware
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/linux_hardware
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(linux_hardware_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(linux_hardware_generate_messages linux_hardware_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/src/turtlebot-hydro-devel/linux_hardware/msg/LaptopChargeStatus.msg" NAME_WE)
add_dependencies(linux_hardware_generate_messages_lisp _linux_hardware_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(linux_hardware_genlisp)
add_dependencies(linux_hardware_genlisp linux_hardware_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS linux_hardware_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(linux_hardware
  "/home/tmb/catkin_test/catkin_test1/src/turtlebot-hydro-devel/linux_hardware/msg/LaptopChargeStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/linux_hardware
)

### Generating Services

### Generating Module File
_generate_module_nodejs(linux_hardware
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/linux_hardware
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(linux_hardware_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(linux_hardware_generate_messages linux_hardware_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/src/turtlebot-hydro-devel/linux_hardware/msg/LaptopChargeStatus.msg" NAME_WE)
add_dependencies(linux_hardware_generate_messages_nodejs _linux_hardware_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(linux_hardware_gennodejs)
add_dependencies(linux_hardware_gennodejs linux_hardware_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS linux_hardware_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(linux_hardware
  "/home/tmb/catkin_test/catkin_test1/src/turtlebot-hydro-devel/linux_hardware/msg/LaptopChargeStatus.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/linux_hardware
)

### Generating Services

### Generating Module File
_generate_module_py(linux_hardware
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/linux_hardware
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(linux_hardware_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(linux_hardware_generate_messages linux_hardware_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/tmb/catkin_test/catkin_test1/src/turtlebot-hydro-devel/linux_hardware/msg/LaptopChargeStatus.msg" NAME_WE)
add_dependencies(linux_hardware_generate_messages_py _linux_hardware_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(linux_hardware_genpy)
add_dependencies(linux_hardware_genpy linux_hardware_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS linux_hardware_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/linux_hardware)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/linux_hardware
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(linux_hardware_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/linux_hardware)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/linux_hardware
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(linux_hardware_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/linux_hardware)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/linux_hardware
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(linux_hardware_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/linux_hardware)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/linux_hardware
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(linux_hardware_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/linux_hardware)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/linux_hardware\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/linux_hardware
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(linux_hardware_generate_messages_py std_msgs_generate_messages_py)
endif()
