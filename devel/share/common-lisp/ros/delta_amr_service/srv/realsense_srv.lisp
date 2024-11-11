; Auto-generated. Do not edit!


(cl:in-package delta_amr_service-srv)


;//! \htmlinclude realsense_srv-request.msg.html

(cl:defclass <realsense_srv-request> (roslisp-msg-protocol:ros-message)
  ((img_process_type_realsense
    :reader img_process_type_realsense
    :initarg :img_process_type_realsense
    :type cl:string
    :initform ""))
)

(cl:defclass realsense_srv-request (<realsense_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <realsense_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'realsense_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delta_amr_service-srv:<realsense_srv-request> is deprecated: use delta_amr_service-srv:realsense_srv-request instead.")))

(cl:ensure-generic-function 'img_process_type_realsense-val :lambda-list '(m))
(cl:defmethod img_process_type_realsense-val ((m <realsense_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:img_process_type_realsense-val is deprecated.  Use delta_amr_service-srv:img_process_type_realsense instead.")
  (img_process_type_realsense m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <realsense_srv-request>) ostream)
  "Serializes a message object of type '<realsense_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'img_process_type_realsense))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'img_process_type_realsense))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <realsense_srv-request>) istream)
  "Deserializes a message object of type '<realsense_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'img_process_type_realsense) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'img_process_type_realsense) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<realsense_srv-request>)))
  "Returns string type for a service object of type '<realsense_srv-request>"
  "delta_amr_service/realsense_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'realsense_srv-request)))
  "Returns string type for a service object of type 'realsense_srv-request"
  "delta_amr_service/realsense_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<realsense_srv-request>)))
  "Returns md5sum for a message object of type '<realsense_srv-request>"
  "6c4e0ab4251a9095d0cdc3a5578f78f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'realsense_srv-request)))
  "Returns md5sum for a message object of type 'realsense_srv-request"
  "6c4e0ab4251a9095d0cdc3a5578f78f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<realsense_srv-request>)))
  "Returns full string definition for message of type '<realsense_srv-request>"
  (cl:format cl:nil "# Delta_AMR_Service.srv~%# Request~%~%string img_process_type_realsense ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'realsense_srv-request)))
  "Returns full string definition for message of type 'realsense_srv-request"
  (cl:format cl:nil "# Delta_AMR_Service.srv~%# Request~%~%string img_process_type_realsense ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <realsense_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'img_process_type_realsense))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <realsense_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'realsense_srv-request
    (cl:cons ':img_process_type_realsense (img_process_type_realsense msg))
))
;//! \htmlinclude realsense_srv-response.msg.html

(cl:defclass <realsense_srv-response> (roslisp-msg-protocol:ros-message)
  ((human_dist
    :reader human_dist
    :initarg :human_dist
    :type cl:float
    :initform 0.0)
   (camera_status_realsense
    :reader camera_status_realsense
    :initarg :camera_status_realsense
    :type cl:integer
    :initform 0))
)

(cl:defclass realsense_srv-response (<realsense_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <realsense_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'realsense_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delta_amr_service-srv:<realsense_srv-response> is deprecated: use delta_amr_service-srv:realsense_srv-response instead.")))

(cl:ensure-generic-function 'human_dist-val :lambda-list '(m))
(cl:defmethod human_dist-val ((m <realsense_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:human_dist-val is deprecated.  Use delta_amr_service-srv:human_dist instead.")
  (human_dist m))

(cl:ensure-generic-function 'camera_status_realsense-val :lambda-list '(m))
(cl:defmethod camera_status_realsense-val ((m <realsense_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:camera_status_realsense-val is deprecated.  Use delta_amr_service-srv:camera_status_realsense instead.")
  (camera_status_realsense m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <realsense_srv-response>) ostream)
  "Serializes a message object of type '<realsense_srv-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'human_dist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let* ((signed (cl:slot-value msg 'camera_status_realsense)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <realsense_srv-response>) istream)
  "Deserializes a message object of type '<realsense_srv-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'human_dist) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'camera_status_realsense) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<realsense_srv-response>)))
  "Returns string type for a service object of type '<realsense_srv-response>"
  "delta_amr_service/realsense_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'realsense_srv-response)))
  "Returns string type for a service object of type 'realsense_srv-response"
  "delta_amr_service/realsense_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<realsense_srv-response>)))
  "Returns md5sum for a message object of type '<realsense_srv-response>"
  "6c4e0ab4251a9095d0cdc3a5578f78f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'realsense_srv-response)))
  "Returns md5sum for a message object of type 'realsense_srv-response"
  "6c4e0ab4251a9095d0cdc3a5578f78f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<realsense_srv-response>)))
  "Returns full string definition for message of type '<realsense_srv-response>"
  (cl:format cl:nil "~%# Response~%~%float32 human_dist~%~%int32 camera_status_realsense~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'realsense_srv-response)))
  "Returns full string definition for message of type 'realsense_srv-response"
  (cl:format cl:nil "~%# Response~%~%float32 human_dist~%~%int32 camera_status_realsense~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <realsense_srv-response>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <realsense_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'realsense_srv-response
    (cl:cons ':human_dist (human_dist msg))
    (cl:cons ':camera_status_realsense (camera_status_realsense msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'realsense_srv)))
  'realsense_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'realsense_srv)))
  'realsense_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'realsense_srv)))
  "Returns string type for a service object of type '<realsense_srv>"
  "delta_amr_service/realsense_srv")