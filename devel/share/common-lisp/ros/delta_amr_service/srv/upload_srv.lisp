; Auto-generated. Do not edit!


(cl:in-package delta_amr_service-srv)


;//! \htmlinclude upload_srv-request.msg.html

(cl:defclass <upload_srv-request> (roslisp-msg-protocol:ros-message)
  ((upload_cmd
    :reader upload_cmd
    :initarg :upload_cmd
    :type cl:string
    :initform ""))
)

(cl:defclass upload_srv-request (<upload_srv-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <upload_srv-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'upload_srv-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delta_amr_service-srv:<upload_srv-request> is deprecated: use delta_amr_service-srv:upload_srv-request instead.")))

(cl:ensure-generic-function 'upload_cmd-val :lambda-list '(m))
(cl:defmethod upload_cmd-val ((m <upload_srv-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:upload_cmd-val is deprecated.  Use delta_amr_service-srv:upload_cmd instead.")
  (upload_cmd m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <upload_srv-request>) ostream)
  "Serializes a message object of type '<upload_srv-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'upload_cmd))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'upload_cmd))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <upload_srv-request>) istream)
  "Deserializes a message object of type '<upload_srv-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'upload_cmd) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'upload_cmd) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<upload_srv-request>)))
  "Returns string type for a service object of type '<upload_srv-request>"
  "delta_amr_service/upload_srvRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'upload_srv-request)))
  "Returns string type for a service object of type 'upload_srv-request"
  "delta_amr_service/upload_srvRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<upload_srv-request>)))
  "Returns md5sum for a message object of type '<upload_srv-request>"
  "9509961624cae8e89290906327b798e8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'upload_srv-request)))
  "Returns md5sum for a message object of type 'upload_srv-request"
  "9509961624cae8e89290906327b798e8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<upload_srv-request>)))
  "Returns full string definition for message of type '<upload_srv-request>"
  (cl:format cl:nil "# Delta_AMR_Service.srv~%# Request~%~%string upload_cmd~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'upload_srv-request)))
  "Returns full string definition for message of type 'upload_srv-request"
  (cl:format cl:nil "# Delta_AMR_Service.srv~%# Request~%~%string upload_cmd~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <upload_srv-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'upload_cmd))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <upload_srv-request>))
  "Converts a ROS message object to a list"
  (cl:list 'upload_srv-request
    (cl:cons ':upload_cmd (upload_cmd msg))
))
;//! \htmlinclude upload_srv-response.msg.html

(cl:defclass <upload_srv-response> (roslisp-msg-protocol:ros-message)
  ((upload_status
    :reader upload_status
    :initarg :upload_status
    :type cl:string
    :initform ""))
)

(cl:defclass upload_srv-response (<upload_srv-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <upload_srv-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'upload_srv-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name delta_amr_service-srv:<upload_srv-response> is deprecated: use delta_amr_service-srv:upload_srv-response instead.")))

(cl:ensure-generic-function 'upload_status-val :lambda-list '(m))
(cl:defmethod upload_status-val ((m <upload_srv-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader delta_amr_service-srv:upload_status-val is deprecated.  Use delta_amr_service-srv:upload_status instead.")
  (upload_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <upload_srv-response>) ostream)
  "Serializes a message object of type '<upload_srv-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'upload_status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'upload_status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <upload_srv-response>) istream)
  "Deserializes a message object of type '<upload_srv-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'upload_status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'upload_status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<upload_srv-response>)))
  "Returns string type for a service object of type '<upload_srv-response>"
  "delta_amr_service/upload_srvResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'upload_srv-response)))
  "Returns string type for a service object of type 'upload_srv-response"
  "delta_amr_service/upload_srvResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<upload_srv-response>)))
  "Returns md5sum for a message object of type '<upload_srv-response>"
  "9509961624cae8e89290906327b798e8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'upload_srv-response)))
  "Returns md5sum for a message object of type 'upload_srv-response"
  "9509961624cae8e89290906327b798e8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<upload_srv-response>)))
  "Returns full string definition for message of type '<upload_srv-response>"
  (cl:format cl:nil "~%# Response~%~%string upload_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'upload_srv-response)))
  "Returns full string definition for message of type 'upload_srv-response"
  (cl:format cl:nil "~%# Response~%~%string upload_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <upload_srv-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'upload_status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <upload_srv-response>))
  "Converts a ROS message object to a list"
  (cl:list 'upload_srv-response
    (cl:cons ':upload_status (upload_status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'upload_srv)))
  'upload_srv-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'upload_srv)))
  'upload_srv-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'upload_srv)))
  "Returns string type for a service object of type '<upload_srv>"
  "delta_amr_service/upload_srv")