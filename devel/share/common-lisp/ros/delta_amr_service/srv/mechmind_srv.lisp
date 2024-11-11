; Auto-generated. Do not edit!


(cl:in-package delta_amr_service-srv)


;//! \htmlinclude mechmind_srv-request.msg.html

(cl:defclass <mechmind_srv-request> (roslisp-msg-protocol:ros-message)
  ((img_process_type_mechmind
    :reader img_process_type_mechmind
    :initarg :img_process_type_mechmind
    :type cl:string
    :initform ""))
)

(cl:defclass mechmind_srv-request (<mechmind_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mechmind_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mechmind_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delta_amr_service-srv:<mechmind_srv-request> is deprecated: use delta_amr_service-srv:mechmind_srv-request instead.")))

(cl:ensure-generic-function 'img_process_type_mechmind-val :lambda-list '(m))
(cl:defmethod img_process_type_mechmind-val ((m <mechmind_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:img_process_type_mechmind-val is deprecated.  Use delta_amr_service-srv:img_process_type_mechmind instead.")
  (img_process_type_mechmind m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mechmind_srv-request>) ostream)
  "Serializes a message object of type '<mechmind_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'img_process_type_mechmind))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'img_process_type_mechmind))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mechmind_srv-request>) istream)
  "Deserializes a message object of type '<mechmind_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'img_process_type_mechmind) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'img_process_type_mechmind) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mechmind_srv-request>)))
  "Returns string type for a service object of type '<mechmind_srv-request>"
  "delta_amr_service/mechmind_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mechmind_srv-request)))
  "Returns string type for a service object of type 'mechmind_srv-request"
  "delta_amr_service/mechmind_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mechmind_srv-request>)))
  "Returns md5sum for a message object of type '<mechmind_srv-request>"
  "7e7b687eeeaf11191ef09103f57fbbe7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mechmind_srv-request)))
  "Returns md5sum for a message object of type 'mechmind_srv-request"
  "7e7b687eeeaf11191ef09103f57fbbe7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mechmind_srv-request>)))
  "Returns full string definition for message of type '<mechmind_srv-request>"
  (cl:format cl:nil "# Delta_AMR_Service.srv~%# Request~%~%string img_process_type_mechmind ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mechmind_srv-request)))
  "Returns full string definition for message of type 'mechmind_srv-request"
  (cl:format cl:nil "# Delta_AMR_Service.srv~%# Request~%~%string img_process_type_mechmind ~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mechmind_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'img_process_type_mechmind))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mechmind_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'mechmind_srv-request
    (cl:cons ':img_process_type_mechmind (img_process_type_mechmind msg))
))
;//! \htmlinclude mechmind_srv-response.msg.html

(cl:defclass <mechmind_srv-response> (roslisp-msg-protocol:ros-message)
  ((camera_status
    :reader camera_status
    :initarg :camera_status
    :type cl:integer
    :initform 0))
)

(cl:defclass mechmind_srv-response (<mechmind_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <mechmind_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'mechmind_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delta_amr_service-srv:<mechmind_srv-response> is deprecated: use delta_amr_service-srv:mechmind_srv-response instead.")))

(cl:ensure-generic-function 'camera_status-val :lambda-list '(m))
(cl:defmethod camera_status-val ((m <mechmind_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:camera_status-val is deprecated.  Use delta_amr_service-srv:camera_status instead.")
  (camera_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <mechmind_srv-response>) ostream)
  "Serializes a message object of type '<mechmind_srv-response>"
  (cl:let* ((signed (cl:slot-value msg 'camera_status)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <mechmind_srv-response>) istream)
  "Deserializes a message object of type '<mechmind_srv-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'camera_status) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<mechmind_srv-response>)))
  "Returns string type for a service object of type '<mechmind_srv-response>"
  "delta_amr_service/mechmind_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mechmind_srv-response)))
  "Returns string type for a service object of type 'mechmind_srv-response"
  "delta_amr_service/mechmind_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<mechmind_srv-response>)))
  "Returns md5sum for a message object of type '<mechmind_srv-response>"
  "7e7b687eeeaf11191ef09103f57fbbe7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'mechmind_srv-response)))
  "Returns md5sum for a message object of type 'mechmind_srv-response"
  "7e7b687eeeaf11191ef09103f57fbbe7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<mechmind_srv-response>)))
  "Returns full string definition for message of type '<mechmind_srv-response>"
  (cl:format cl:nil "~%# Response~%~%int32 camera_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'mechmind_srv-response)))
  "Returns full string definition for message of type 'mechmind_srv-response"
  (cl:format cl:nil "~%# Response~%~%int32 camera_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <mechmind_srv-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <mechmind_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'mechmind_srv-response
    (cl:cons ':camera_status (camera_status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'mechmind_srv)))
  'mechmind_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'mechmind_srv)))
  'mechmind_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'mechmind_srv)))
  "Returns string type for a service object of type '<mechmind_srv>"
  "delta_amr_service/mechmind_srv")