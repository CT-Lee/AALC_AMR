;; Auto-generated. Do not edit!


(when (boundp 'motor_feedback_msgs::motor_feedback)
  (if (not (find-package "MOTOR_FEEDBACK_MSGS"))
    (make-package "MOTOR_FEEDBACK_MSGS"))
  (shadow 'motor_feedback (find-package "MOTOR_FEEDBACK_MSGS")))
(unless (find-package "MOTOR_FEEDBACK_MSGS::MOTOR_FEEDBACK")
  (make-package "MOTOR_FEEDBACK_MSGS::MOTOR_FEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude motor_feedback.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass motor_feedback_msgs::motor_feedback
  :super ros::object
  :slots (_header _positionL _positionR _AvelocityL _AvelocityR _DvelocityL _DvelocityR _AvelocityL_lpf _AvelocityL_M _AvelocityR_lpf _AvelocityR_M _vx _vy _vth _delta_x _delta_y _delta_th _x _y _th ))

(defmethod motor_feedback_msgs::motor_feedback
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:positionL __positionL) 0)
    ((:positionR __positionR) 0)
    ((:AvelocityL __AvelocityL) 0)
    ((:AvelocityR __AvelocityR) 0)
    ((:DvelocityL __DvelocityL) 0)
    ((:DvelocityR __DvelocityR) 0)
    ((:AvelocityL_lpf __AvelocityL_lpf) 0.0)
    ((:AvelocityL_M __AvelocityL_M) 0.0)
    ((:AvelocityR_lpf __AvelocityR_lpf) 0.0)
    ((:AvelocityR_M __AvelocityR_M) 0.0)
    ((:vx __vx) 0.0)
    ((:vy __vy) 0.0)
    ((:vth __vth) 0.0)
    ((:delta_x __delta_x) 0.0)
    ((:delta_y __delta_y) 0.0)
    ((:delta_th __delta_th) 0.0)
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:th __th) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _positionL (round __positionL))
   (setq _positionR (round __positionR))
   (setq _AvelocityL (round __AvelocityL))
   (setq _AvelocityR (round __AvelocityR))
   (setq _DvelocityL (round __DvelocityL))
   (setq _DvelocityR (round __DvelocityR))
   (setq _AvelocityL_lpf (float __AvelocityL_lpf))
   (setq _AvelocityL_M (float __AvelocityL_M))
   (setq _AvelocityR_lpf (float __AvelocityR_lpf))
   (setq _AvelocityR_M (float __AvelocityR_M))
   (setq _vx (float __vx))
   (setq _vy (float __vy))
   (setq _vth (float __vth))
   (setq _delta_x (float __delta_x))
   (setq _delta_y (float __delta_y))
   (setq _delta_th (float __delta_th))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _th (float __th))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:positionL
   (&optional __positionL)
   (if __positionL (setq _positionL __positionL)) _positionL)
  (:positionR
   (&optional __positionR)
   (if __positionR (setq _positionR __positionR)) _positionR)
  (:AvelocityL
   (&optional __AvelocityL)
   (if __AvelocityL (setq _AvelocityL __AvelocityL)) _AvelocityL)
  (:AvelocityR
   (&optional __AvelocityR)
   (if __AvelocityR (setq _AvelocityR __AvelocityR)) _AvelocityR)
  (:DvelocityL
   (&optional __DvelocityL)
   (if __DvelocityL (setq _DvelocityL __DvelocityL)) _DvelocityL)
  (:DvelocityR
   (&optional __DvelocityR)
   (if __DvelocityR (setq _DvelocityR __DvelocityR)) _DvelocityR)
  (:AvelocityL_lpf
   (&optional __AvelocityL_lpf)
   (if __AvelocityL_lpf (setq _AvelocityL_lpf __AvelocityL_lpf)) _AvelocityL_lpf)
  (:AvelocityL_M
   (&optional __AvelocityL_M)
   (if __AvelocityL_M (setq _AvelocityL_M __AvelocityL_M)) _AvelocityL_M)
  (:AvelocityR_lpf
   (&optional __AvelocityR_lpf)
   (if __AvelocityR_lpf (setq _AvelocityR_lpf __AvelocityR_lpf)) _AvelocityR_lpf)
  (:AvelocityR_M
   (&optional __AvelocityR_M)
   (if __AvelocityR_M (setq _AvelocityR_M __AvelocityR_M)) _AvelocityR_M)
  (:vx
   (&optional __vx)
   (if __vx (setq _vx __vx)) _vx)
  (:vy
   (&optional __vy)
   (if __vy (setq _vy __vy)) _vy)
  (:vth
   (&optional __vth)
   (if __vth (setq _vth __vth)) _vth)
  (:delta_x
   (&optional __delta_x)
   (if __delta_x (setq _delta_x __delta_x)) _delta_x)
  (:delta_y
   (&optional __delta_y)
   (if __delta_y (setq _delta_y __delta_y)) _delta_y)
  (:delta_th
   (&optional __delta_th)
   (if __delta_th (setq _delta_th __delta_th)) _delta_th)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:th
   (&optional __th)
   (if __th (setq _th __th)) _th)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _positionL
    4
    ;; int32 _positionR
    4
    ;; int32 _AvelocityL
    4
    ;; int32 _AvelocityR
    4
    ;; int32 _DvelocityL
    4
    ;; int32 _DvelocityR
    4
    ;; float64 _AvelocityL_lpf
    8
    ;; float64 _AvelocityL_M
    8
    ;; float64 _AvelocityR_lpf
    8
    ;; float64 _AvelocityR_M
    8
    ;; float64 _vx
    8
    ;; float64 _vy
    8
    ;; float64 _vth
    8
    ;; float64 _delta_x
    8
    ;; float64 _delta_y
    8
    ;; float64 _delta_th
    8
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _th
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _positionL
       (write-long _positionL s)
     ;; int32 _positionR
       (write-long _positionR s)
     ;; int32 _AvelocityL
       (write-long _AvelocityL s)
     ;; int32 _AvelocityR
       (write-long _AvelocityR s)
     ;; int32 _DvelocityL
       (write-long _DvelocityL s)
     ;; int32 _DvelocityR
       (write-long _DvelocityR s)
     ;; float64 _AvelocityL_lpf
       (sys::poke _AvelocityL_lpf (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _AvelocityL_M
       (sys::poke _AvelocityL_M (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _AvelocityR_lpf
       (sys::poke _AvelocityR_lpf (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _AvelocityR_M
       (sys::poke _AvelocityR_M (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vx
       (sys::poke _vx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vy
       (sys::poke _vy (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vth
       (sys::poke _vth (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delta_x
       (sys::poke _delta_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delta_y
       (sys::poke _delta_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _delta_th
       (sys::poke _delta_th (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _th
       (sys::poke _th (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _positionL
     (setq _positionL (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _positionR
     (setq _positionR (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _AvelocityL
     (setq _AvelocityL (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _AvelocityR
     (setq _AvelocityR (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _DvelocityL
     (setq _DvelocityL (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _DvelocityR
     (setq _DvelocityR (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _AvelocityL_lpf
     (setq _AvelocityL_lpf (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _AvelocityL_M
     (setq _AvelocityL_M (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _AvelocityR_lpf
     (setq _AvelocityR_lpf (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _AvelocityR_M
     (setq _AvelocityR_M (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vx
     (setq _vx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vy
     (setq _vy (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vth
     (setq _vth (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delta_x
     (setq _delta_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delta_y
     (setq _delta_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _delta_th
     (setq _delta_th (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _th
     (setq _th (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get motor_feedback_msgs::motor_feedback :md5sum-) "539722cb0cad3c3a79793c39ccbe611c")
(setf (get motor_feedback_msgs::motor_feedback :datatype-) "motor_feedback_msgs/motor_feedback")
(setf (get motor_feedback_msgs::motor_feedback :definition-)
      "std_msgs/Header header
int32 positionL
int32 positionR
int32 AvelocityL
int32 AvelocityR
int32 DvelocityL
int32 DvelocityR
float64 AvelocityL_lpf
float64 AvelocityL_M
float64 AvelocityR_lpf
float64 AvelocityR_M
float64 vx
float64 vy
float64 vth
float64 delta_x
float64 delta_y
float64 delta_th
float64 x
float64 y
float64 th
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :motor_feedback_msgs/motor_feedback "539722cb0cad3c3a79793c39ccbe611c")


