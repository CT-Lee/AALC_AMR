; Auto-generated. Do not edit!


(cl:in-package delta_amr_service-srv)


;//! \htmlinclude delta_amr_service-request.msg.html

(cl:defclass <delta_amr_service-request> (roslisp-msg-protocol:ros-message)
  ((img_process_type_realsense
    :reader img_process_type_realsense
    :initarg :img_process_type_realsense
    :type cl:string
    :initform "")
   (img_process_type_mechmind
    :reader img_process_type_mechmind
    :initarg :img_process_type_mechmind
    :type cl:string
    :initform "")
   (robot_mov_type
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
    :type cl:integer
    :initform 0))
)

(cl:defclass delta_amr_service-request (<delta_amr_service-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <delta_amr_service-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'delta_amr_service-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delta_amr_service-srv:<delta_amr_service-request> is deprecated: use delta_amr_service-srv:delta_amr_service-request instead.")))

(cl:ensure-generic-function 'img_process_type_realsense-val :lambda-list '(m))
(cl:defmethod img_process_type_realsense-val ((m <delta_amr_service-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:img_process_type_realsense-val is deprecated.  Use delta_amr_service-srv:img_process_type_realsense instead.")
  (img_process_type_realsense m))

(cl:ensure-generic-function 'img_process_type_mechmind-val :lambda-list '(m))
(cl:defmethod img_process_type_mechmind-val ((m <delta_amr_service-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:img_process_type_mechmind-val is deprecated.  Use delta_amr_service-srv:img_process_type_mechmind instead.")
  (img_process_type_mechmind m))

(cl:ensure-generic-function 'robot_mov_type-val :lambda-list '(m))
(cl:defmethod robot_mov_type-val ((m <delta_amr_service-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:robot_mov_type-val is deprecated.  Use delta_amr_service-srv:robot_mov_type instead.")
  (robot_mov_type m))

(cl:ensure-generic-function 'robot_mov_point-val :lambda-list '(m))
(cl:defmethod robot_mov_point-val ((m <delta_amr_service-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:robot_mov_point-val is deprecated.  Use delta_amr_service-srv:robot_mov_point instead.")
  (robot_mov_point m))

(cl:ensure-generic-function 'robot_mov_speed-val :lambda-list '(m))
(cl:defmethod robot_mov_speed-val ((m <delta_amr_service-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:robot_mov_speed-val is deprecated.  Use delta_amr_service-srv:robot_mov_speed instead.")
  (robot_mov_speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <delta_amr_service-request>) ostream)
  "Serializes a message object of type '<delta_amr_service-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'img_process_type_realsense))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'img_process_type_realsense))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'img_process_type_mechmind))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'img_process_type_mechmind))
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
  (cl:let* ((signed (cl:slot-value msg 'robot_mov_speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <delta_amr_service-request>) istream)
  "Deserializes a message object of type '<delta_amr_service-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'img_process_type_realsense) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'img_process_type_realsense) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'img_process_type_mechmind) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'img_process_type_mechmind) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_mov_speed) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<delta_amr_service-request>)))
  "Returns string type for a service object of type '<delta_amr_service-request>"
  "delta_amr_service/delta_amr_serviceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'delta_amr_service-request)))
  "Returns string type for a service object of type 'delta_amr_service-request"
  "delta_amr_service/delta_amr_serviceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<delta_amr_service-request>)))
  "Returns md5sum for a message object of type '<delta_amr_service-request>"
  "5f036b9efe5e6058b93abe4b32fb58c0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'delta_amr_service-request)))
  "Returns md5sum for a message object of type 'delta_amr_service-request"
  "5f036b9efe5e6058b93abe4b32fb58c0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<delta_amr_service-request>)))
  "Returns full string definition for message of type '<delta_amr_service-request>"
  (cl:format cl:nil "# Delta_AMR_Service.srv~%# Request~%~%string img_process_type_realsense ~%string img_process_type_mechmind ~%~%string robot_mov_type ~%string robot_mov_point~%int32 robot_mov_speed~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'delta_amr_service-request)))
  "Returns full string definition for message of type 'delta_amr_service-request"
  (cl:format cl:nil "# Delta_AMR_Service.srv~%# Request~%~%string img_process_type_realsense ~%string img_process_type_mechmind ~%~%string robot_mov_type ~%string robot_mov_point~%int32 robot_mov_speed~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <delta_amr_service-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'img_process_type_realsense))
     4 (cl:length (cl:slot-value msg 'img_process_type_mechmind))
     4 (cl:length (cl:slot-value msg 'robot_mov_type))
     4 (cl:length (cl:slot-value msg 'robot_mov_point))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <delta_amr_service-request>))
  "Converts a ROS message object to a list"
  (cl:list 'delta_amr_service-request
    (cl:cons ':img_process_type_realsense (img_process_type_realsense msg))
    (cl:cons ':img_process_type_mechmind (img_process_type_mechmind msg))
    (cl:cons ':robot_mov_type (robot_mov_type msg))
    (cl:cons ':robot_mov_point (robot_mov_point msg))
    (cl:cons ':robot_mov_speed (robot_mov_speed msg))
))
;//! \htmlinclude delta_amr_service-response.msg.html

(cl:defclass <delta_amr_service-response> (roslisp-msg-protocol:ros-message)
  ((human_dist
    :reader human_dist
    :initarg :human_dist
    :type cl:integer
    :initform 0)
   (robot_running_status
    :reader robot_running_status
    :initarg :robot_running_status
    :type cl:integer
    :initform 0))
)

(cl:defclass delta_amr_service-response (<delta_amr_service-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <delta_amr_service-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'delta_amr_service-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delta_amr_service-srv:<delta_amr_service-response> is deprecated: use delta_amr_service-srv:delta_amr_service-response instead.")))

(cl:ensure-generic-function 'human_dist-val :lambda-list '(m))
(cl:defmethod human_dist-val ((m <delta_amr_service-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:human_dist-val is deprecated.  Use delta_amr_service-srv:human_dist instead.")
  (human_dist m))

(cl:ensure-generic-function 'robot_running_status-val :lambda-list '(m))
(cl:defmethod robot_running_status-val ((m <delta_amr_service-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:robot_running_status-val is deprecated.  Use delta_amr_service-srv:robot_running_status instead.")
  (robot_running_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <delta_amr_service-response>) ostream)
  "Serializes a message object of type '<delta_amr_service-response>"
  (cl:let* ((signed (cl:slot-value msg 'human_dist)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'robot_running_status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <delta_amr_service-response>) istream)
  "Deserializes a message object of type '<delta_amr_service-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'human_dist) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_running_status) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<delta_amr_service-response>)))
  "Returns string type for a service object of type '<delta_amr_service-response>"
  "delta_amr_service/delta_amr_serviceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'delta_amr_service-response)))
  "Returns string type for a service object of type 'delta_amr_service-response"
  "delta_amr_service/delta_amr_serviceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<delta_amr_service-response>)))
  "Returns md5sum for a message object of type '<delta_amr_service-response>"
  "5f036b9efe5e6058b93abe4b32fb58c0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'delta_amr_service-response)))
  "Returns md5sum for a message object of type 'delta_amr_service-response"
  "5f036b9efe5e6058b93abe4b32fb58c0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<delta_amr_service-response>)))
  "Returns full string definition for message of type '<delta_amr_service-response>"
  (cl:format cl:nil "~%# Response~%~%int32 human_dist~%~%int32 robot_running_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'delta_amr_service-response)))
  "Returns full string definition for message of type 'delta_amr_service-response"
  (cl:format cl:nil "~%# Response~%~%int32 human_dist~%~%int32 robot_running_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <delta_amr_service-response>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <delta_amr_service-response>))
  "Converts a ROS message object to a list"
  (cl:list 'delta_amr_service-response
    (cl:cons ':human_dist (human_dist msg))
    (cl:cons ':robot_running_status (robot_running_status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'delta_amr_service)))
  'delta_amr_service-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'delta_amr_service)))
  'delta_amr_service-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'delta_amr_service)))
  "Returns string type for a service object of type '<delta_amr_service>"
  "delta_amr_service/delta_amr_service")