; Auto-generated. Do not edit!


(cl:in-package delta_amr_service-srv)


;//! \htmlinclude robot_control_srv-request.msg.html

(cl:defclass <robot_control_srv-request> (roslisp-msg-protocol:ros-message)
  ((robot_mov_type
    :reader robot_mov_type
    :initarg :robot_mov_type
    :type cl:string
    :initform "")
   (robot_mov_point
    :reader robot_mov_point
    :initarg :robot_mov_point
    :type cl:string
    :initform "")
   (robot_mov_speed
    :reader robot_mov_speed
    :initarg :robot_mov_speed
    :type cl:float
    :initform 0.0))
)

(cl:defclass robot_control_srv-request (<robot_control_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_control_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_control_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delta_amr_service-srv:<robot_control_srv-request> is deprecated: use delta_amr_service-srv:robot_control_srv-request instead.")))

(cl:ensure-generic-function 'robot_mov_type-val :lambda-list '(m))
(cl:defmethod robot_mov_type-val ((m <robot_control_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:robot_mov_type-val is deprecated.  Use delta_amr_service-srv:robot_mov_type instead.")
  (robot_mov_type m))

(cl:ensure-generic-function 'robot_mov_point-val :lambda-list '(m))
(cl:defmethod robot_mov_point-val ((m <robot_control_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:robot_mov_point-val is deprecated.  Use delta_amr_service-srv:robot_mov_point instead.")
  (robot_mov_point m))

(cl:ensure-generic-function 'robot_mov_speed-val :lambda-list '(m))
(cl:defmethod robot_mov_speed-val ((m <robot_control_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:robot_mov_speed-val is deprecated.  Use delta_amr_service-srv:robot_mov_speed instead.")
  (robot_mov_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_control_srv-request>) ostream)
  "Serializes a message object of type '<robot_control_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot_mov_type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot_mov_type))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot_mov_point))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot_mov_point))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'robot_mov_speed))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_control_srv-request>) istream)
  "Deserializes a message object of type '<robot_control_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_mov_type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot_mov_type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_mov_point) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot_mov_point) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'robot_mov_speed) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_control_srv-request>)))
  "Returns string type for a service object of type '<robot_control_srv-request>"
  "delta_amr_service/robot_control_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_control_srv-request)))
  "Returns string type for a service object of type 'robot_control_srv-request"
  "delta_amr_service/robot_control_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_control_srv-request>)))
  "Returns md5sum for a message object of type '<robot_control_srv-request>"
  "d80efec2e3530caab86fefe684a2fdc0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_control_srv-request)))
  "Returns md5sum for a message object of type 'robot_control_srv-request"
  "d80efec2e3530caab86fefe684a2fdc0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_control_srv-request>)))
  "Returns full string definition for message of type '<robot_control_srv-request>"
  (cl:format cl:nil "# Delta_AMR_Service.srv~%# Request~%~%string robot_mov_type ~%string robot_mov_point~%float32 robot_mov_speed~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_control_srv-request)))
  "Returns full string definition for message of type 'robot_control_srv-request"
  (cl:format cl:nil "# Delta_AMR_Service.srv~%# Request~%~%string robot_mov_type ~%string robot_mov_point~%float32 robot_mov_speed~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_control_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'robot_mov_type))
     4 (cl:length (cl:slot-value msg 'robot_mov_point))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_control_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_control_srv-request
    (cl:cons ':robot_mov_type (robot_mov_type msg))
    (cl:cons ':robot_mov_point (robot_mov_point msg))
    (cl:cons ':robot_mov_speed (robot_mov_speed msg))
))
;//! \htmlinclude robot_control_srv-response.msg.html

(cl:defclass <robot_control_srv-response> (roslisp-msg-protocol:ros-message)
  ((robot_running_status
    :reader robot_running_status
    :initarg :robot_running_status
    :type cl:integer
    :initform 0))
)

(cl:defclass robot_control_srv-response (<robot_control_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <robot_control_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'robot_control_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delta_amr_service-srv:<robot_control_srv-response> is deprecated: use delta_amr_service-srv:robot_control_srv-response instead.")))

(cl:ensure-generic-function 'robot_running_status-val :lambda-list '(m))
(cl:defmethod robot_running_status-val ((m <robot_control_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:robot_running_status-val is deprecated.  Use delta_amr_service-srv:robot_running_status instead.")
  (robot_running_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <robot_control_srv-response>) ostream)
  "Serializes a message object of type '<robot_control_srv-response>"
  (cl:let* ((signed (cl:slot-value msg 'robot_running_status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <robot_control_srv-response>) istream)
  "Deserializes a message object of type '<robot_control_srv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_running_status) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<robot_control_srv-response>)))
  "Returns string type for a service object of type '<robot_control_srv-response>"
  "delta_amr_service/robot_control_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_control_srv-response)))
  "Returns string type for a service object of type 'robot_control_srv-response"
  "delta_amr_service/robot_control_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<robot_control_srv-response>)))
  "Returns md5sum for a message object of type '<robot_control_srv-response>"
  "d80efec2e3530caab86fefe684a2fdc0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'robot_control_srv-response)))
  "Returns md5sum for a message object of type 'robot_control_srv-response"
  "d80efec2e3530caab86fefe684a2fdc0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<robot_control_srv-response>)))
  "Returns full string definition for message of type '<robot_control_srv-response>"
  (cl:format cl:nil "~%# Response~%~%int32 robot_running_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'robot_control_srv-response)))
  "Returns full string definition for message of type 'robot_control_srv-response"
  (cl:format cl:nil "~%# Response~%~%int32 robot_running_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <robot_control_srv-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <robot_control_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'robot_control_srv-response
    (cl:cons ':robot_running_status (robot_running_status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'robot_control_srv)))
  'robot_control_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'robot_control_srv)))
  'robot_control_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'robot_control_srv)))
  "Returns string type for a service object of type '<robot_control_srv>"
  "delta_amr_service/robot_control_srv")