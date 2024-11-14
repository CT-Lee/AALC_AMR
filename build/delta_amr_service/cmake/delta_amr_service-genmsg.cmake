# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "delta_amr_service: 0 messages, 4 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(delta_amr_service_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/mechmind_srv.srv" NAME_WE)
add_custom_target(_delta_amr_service_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "delta_amr_service" "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/mechmind_srv.srv" ""
)

get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/realsense_srv.srv" NAME_WE)
add_custom_target(_delta_amr_service_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "delta_amr_service" "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/realsense_srv.srv" ""
)

get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/robot_control_srv.srv" NAME_WE)
add_custom_target(_delta_amr_service_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "delta_amr_service" "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/robot_control_srv.srv" ""
)

get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/upload_srv.srv" NAME_WE)
add_custom_target(_delta_amr_service_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "delta_amr_service" "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/upload_srv.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/mechmind_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_amr_service
)
_generate_srv_cpp(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/realsense_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_amr_service
)
_generate_srv_cpp(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/robot_control_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_amr_service
)
_generate_srv_cpp(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/upload_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_amr_service
)

### Generating Module File
_generate_module_cpp(delta_amr_service
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_amr_service
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(delta_amr_service_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(delta_amr_service_generate_messages delta_amr_service_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/mechmind_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_cpp _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/realsense_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_cpp _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/robot_control_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_cpp _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/upload_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_cpp _delta_amr_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delta_amr_service_gencpp)
add_dependencies(delta_amr_service_gencpp delta_amr_service_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delta_amr_service_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/mechmind_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_amr_service
)
_generate_srv_eus(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/realsense_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_amr_service
)
_generate_srv_eus(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/robot_control_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_amr_service
)
_generate_srv_eus(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/upload_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_amr_service
)

### Generating Module File
_generate_module_eus(delta_amr_service
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_amr_service
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(delta_amr_service_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(delta_amr_service_generate_messages delta_amr_service_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/mechmind_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_eus _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/realsense_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_eus _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/robot_control_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_eus _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/upload_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_eus _delta_amr_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delta_amr_service_geneus)
add_dependencies(delta_amr_service_geneus delta_amr_service_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delta_amr_service_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/mechmind_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_amr_service
)
_generate_srv_lisp(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/realsense_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_amr_service
)
_generate_srv_lisp(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/robot_control_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_amr_service
)
_generate_srv_lisp(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/upload_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_amr_service
)

### Generating Module File
_generate_module_lisp(delta_amr_service
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_amr_service
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(delta_amr_service_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(delta_amr_service_generate_messages delta_amr_service_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/mechmind_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_lisp _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/realsense_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_lisp _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/robot_control_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_lisp _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/upload_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_lisp _delta_amr_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delta_amr_service_genlisp)
add_dependencies(delta_amr_service_genlisp delta_amr_service_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delta_amr_service_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/mechmind_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_amr_service
)
_generate_srv_nodejs(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/realsense_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_amr_service
)
_generate_srv_nodejs(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/robot_control_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_amr_service
)
_generate_srv_nodejs(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/upload_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_amr_service
)

### Generating Module File
_generate_module_nodejs(delta_amr_service
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_amr_service
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(delta_amr_service_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(delta_amr_service_generate_messages delta_amr_service_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/mechmind_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_nodejs _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/realsense_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_nodejs _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/robot_control_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_nodejs _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/upload_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_nodejs _delta_amr_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delta_amr_service_gennodejs)
add_dependencies(delta_amr_service_gennodejs delta_amr_service_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delta_amr_service_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/mechmind_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_amr_service
)
_generate_srv_py(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/realsense_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_amr_service
)
_generate_srv_py(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/robot_control_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_amr_service
)
_generate_srv_py(delta_amr_service
  "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/upload_srv.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_amr_service
)

### Generating Module File
_generate_module_py(delta_amr_service
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_amr_service
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(delta_amr_service_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(delta_amr_service_generate_messages delta_amr_service_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/mechmind_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_py _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/realsense_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_py _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/robot_control_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_py _delta_amr_service_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cas-standIPC/AALC_AMR/src/delta_amr_service/srv/upload_srv.srv" NAME_WE)
add_dependencies(delta_amr_service_generate_messages_py _delta_amr_service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(delta_amr_service_genpy)
add_dependencies(delta_amr_service_genpy delta_amr_service_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS delta_amr_service_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_amr_service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/delta_amr_service
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(delta_amr_service_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_amr_service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/delta_amr_service
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(delta_amr_service_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_amr_service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/delta_amr_service
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(delta_amr_service_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_amr_service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/delta_amr_service
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(delta_amr_service_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_amr_service)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_amr_service\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/delta_amr_service
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(delta_amr_service_generate_messages_py std_msgs_generate_messages_py)
endif()
