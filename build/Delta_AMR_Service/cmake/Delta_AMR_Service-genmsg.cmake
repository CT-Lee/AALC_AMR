# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "Delta_AMR_Service: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(Delta_AMR_Service_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ctlee/catkin_ws/src/Delta_AMR_Service/srv/Delta_AMR_Service.srv" NAME_WE)
add_custom_target(_Delta_AMR_Service_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "Delta_AMR_Service" "/home/ctlee/catkin_ws/src/Delta_AMR_Service/srv/Delta_AMR_Service.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(Delta_AMR_Service
  "/home/ctlee/catkin_ws/src/Delta_AMR_Service/srv/Delta_AMR_Service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/Delta_AMR_Service
)

### Generating Module File
_generate_module_cpp(Delta_AMR_Service
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/Delta_AMR_Service
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(Delta_AMR_Service_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(Delta_AMR_Service_generate_messages Delta_AMR_Service_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ctlee/catkin_ws/src/Delta_AMR_Service/srv/Delta_AMR_Service.srv" NAME_WE)
add_dependencies(Delta_AMR_Service_generate_messages_cpp _Delta_AMR_Service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(Delta_AMR_Service_gencpp)
add_dependencies(Delta_AMR_Service_gencpp Delta_AMR_Service_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS Delta_AMR_Service_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(Delta_AMR_Service
  "/home/ctlee/catkin_ws/src/Delta_AMR_Service/srv/Delta_AMR_Service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/Delta_AMR_Service
)

### Generating Module File
_generate_module_eus(Delta_AMR_Service
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/Delta_AMR_Service
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(Delta_AMR_Service_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(Delta_AMR_Service_generate_messages Delta_AMR_Service_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ctlee/catkin_ws/src/Delta_AMR_Service/srv/Delta_AMR_Service.srv" NAME_WE)
add_dependencies(Delta_AMR_Service_generate_messages_eus _Delta_AMR_Service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(Delta_AMR_Service_geneus)
add_dependencies(Delta_AMR_Service_geneus Delta_AMR_Service_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS Delta_AMR_Service_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(Delta_AMR_Service
  "/home/ctlee/catkin_ws/src/Delta_AMR_Service/srv/Delta_AMR_Service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/Delta_AMR_Service
)

### Generating Module File
_generate_module_lisp(Delta_AMR_Service
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/Delta_AMR_Service
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(Delta_AMR_Service_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(Delta_AMR_Service_generate_messages Delta_AMR_Service_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ctlee/catkin_ws/src/Delta_AMR_Service/srv/Delta_AMR_Service.srv" NAME_WE)
add_dependencies(Delta_AMR_Service_generate_messages_lisp _Delta_AMR_Service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(Delta_AMR_Service_genlisp)
add_dependencies(Delta_AMR_Service_genlisp Delta_AMR_Service_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS Delta_AMR_Service_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(Delta_AMR_Service
  "/home/ctlee/catkin_ws/src/Delta_AMR_Service/srv/Delta_AMR_Service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/Delta_AMR_Service
)

### Generating Module File
_generate_module_nodejs(Delta_AMR_Service
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/Delta_AMR_Service
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(Delta_AMR_Service_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(Delta_AMR_Service_generate_messages Delta_AMR_Service_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ctlee/catkin_ws/src/Delta_AMR_Service/srv/Delta_AMR_Service.srv" NAME_WE)
add_dependencies(Delta_AMR_Service_generate_messages_nodejs _Delta_AMR_Service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(Delta_AMR_Service_gennodejs)
add_dependencies(Delta_AMR_Service_gennodejs Delta_AMR_Service_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS Delta_AMR_Service_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(Delta_AMR_Service
  "/home/ctlee/catkin_ws/src/Delta_AMR_Service/srv/Delta_AMR_Service.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/Delta_AMR_Service
)

### Generating Module File
_generate_module_py(Delta_AMR_Service
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/Delta_AMR_Service
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(Delta_AMR_Service_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(Delta_AMR_Service_generate_messages Delta_AMR_Service_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ctlee/catkin_ws/src/Delta_AMR_Service/srv/Delta_AMR_Service.srv" NAME_WE)
add_dependencies(Delta_AMR_Service_generate_messages_py _Delta_AMR_Service_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(Delta_AMR_Service_genpy)
add_dependencies(Delta_AMR_Service_genpy Delta_AMR_Service_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS Delta_AMR_Service_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/Delta_AMR_Service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/Delta_AMR_Service
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(Delta_AMR_Service_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/Delta_AMR_Service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/Delta_AMR_Service
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(Delta_AMR_Service_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/Delta_AMR_Service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/Delta_AMR_Service
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(Delta_AMR_Service_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/Delta_AMR_Service)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/Delta_AMR_Service
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(Delta_AMR_Service_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/Delta_AMR_Service)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/Delta_AMR_Service\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/Delta_AMR_Service
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(Delta_AMR_Service_generate_messages_py std_msgs_generate_messages_py)
endif()
