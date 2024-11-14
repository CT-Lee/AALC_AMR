;; Auto-generated. Do not edit!


(when (boundp 'delta_amr_service::robot_control_srv)
  (if (not (find-package "DELTA_AMR_SERVICE"))
    (make-package "DELTA_AMR_SERVICE"))
  (shadow 'robot_control_srv (find-package "DELTA_AMR_SERVICE")))
(unless (find-package "DELTA_AMR_SERVICE::ROBOT_CONTROL_SRV")
  (make-package "DELTA_AMR_SERVICE::ROBOT_CONTROL_SRV"))
(unless (find-package "DELTA_AMR_SERVICE::ROBOT_CONTROL_SRVREQUEST")
  (make-package "DELTA_AMR_SERVICE::ROBOT_CONTROL_SRVREQUEST"))
(unless (find-package "DELTA_AMR_SERVICE::ROBOT_CONTROL_SRVRESPONSE")
  (make-package "DELTA_AMR_SERVICE::ROBOT_CONTROL_SRVRESPONSE"))

(in-package "ROS")





(defclass delta_amr_service::robot_control_srvRequest
  :super ros::object
  :slots (_robot_mov_type _robot_mov_point _robot_mov_speed ))

(defmethod delta_amr_service::robot_control_srvRequest
  (:init
   (&key
    ((:robot_mov_type __robot_mov_type) "")
    ((:robot_mov_point __robot_mov_point) "")
    ((:robot_mov_speed __robot_mov_speed) 0.0)
    )
   (send-super :init)
   (setq _robot_mov_type (string __robot_mov_type))
   (setq _robot_mov_point (string __robot_mov_point))
   (setq _robot_mov_speed (float __robot_mov_speed))
   self)
  (:robot_mov_type
   (&optional __robot_mov_type)
   (if __robot_mov_type (setq _robot_mov_type __robot_mov_type)) _robot_mov_type)
  (:robot_mov_point
   (&optional __robot_mov_point)
   (if __robot_mov_point (setq _robot_mov_point __robot_mov_point)) _robot_mov_point)
  (:robot_mov_speed
   (&optional __robot_mov_speed)
   (if __robot_mov_speed (setq _robot_mov_speed __robot_mov_speed)) _robot_mov_speed)
  (:serialization-length
   ()
   (+
    ;; string _robot_mov_type
    4 (length _robot_mov_type)
    ;; string _robot_mov_point
    4 (length _robot_mov_point)
    ;; float32 _robot_mov_speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _robot_mov_type
       (write-long (length _robot_mov_type) s) (princ _robot_mov_type s)
     ;; string _robot_mov_point
       (write-long (length _robot_mov_point) s) (princ _robot_mov_point s)
     ;; float32 _robot_mov_speed
       (sys::poke _robot_mov_speed (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _robot_mov_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_mov_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _robot_mov_point
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_mov_point (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _robot_mov_speed
     (setq _robot_mov_speed (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass delta_amr_service::robot_control_srvResponse
  :super ros::object
  :slots (_robot_running_status ))

(defmethod delta_amr_service::robot_control_srvResponse
  (:init
   (&key
    ((:robot_running_status __robot_running_status) "")
    )
   (send-super :init)
   (setq _robot_running_status (string __robot_running_status))
   self)
  (:robot_running_status
   (&optional __robot_running_status)
   (if __robot_running_status (setq _robot_running_status __robot_running_status)) _robot_running_status)
  (:serialization-length
   ()
   (+
    ;; string _robot_running_status
    4 (length _robot_running_status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _robot_running_status
       (write-long (length _robot_running_status) s) (princ _robot_running_status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _robot_running_status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_running_status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass delta_amr_service::robot_control_srv
  :super ros::object
  :slots ())

(setf (get delta_amr_service::robot_control_srv :md5sum-) "0dd95aee29323b73c925a0c69e911119")
(setf (get delta_amr_service::robot_control_srv :datatype-) "delta_amr_service/robot_control_srv")
(setf (get delta_amr_service::robot_control_srv :request) delta_amr_service::robot_control_srvRequest)
(setf (get delta_amr_service::robot_control_srv :response) delta_amr_service::robot_control_srvResponse)

(defmethod delta_amr_service::robot_control_srvRequest
  (:response () (instance delta_amr_service::robot_control_srvResponse :init)))

(setf (get delta_amr_service::robot_control_srvRequest :md5sum-) "0dd95aee29323b73c925a0c69e911119")
(setf (get delta_amr_service::robot_control_srvRequest :datatype-) "delta_amr_service/robot_control_srvRequest")
(setf (get delta_amr_service::robot_control_srvRequest :definition-)
      "# Delta_AMR_Service.srv
# Request

string robot_mov_type 
string robot_mov_point
float32 robot_mov_speed

---

# Response

string robot_running_status

")

(setf (get delta_amr_service::robot_control_srvResponse :md5sum-) "0dd95aee29323b73c925a0c69e911119")
(setf (get delta_amr_service::robot_control_srvResponse :datatype-) "delta_amr_service/robot_control_srvResponse")
(setf (get delta_amr_service::robot_control_srvResponse :definition-)
      "# Delta_AMR_Service.srv
# Request

string robot_mov_type 
string robot_mov_point
float32 robot_mov_speed

---

# Response

string robot_running_status

")



(provide :delta_amr_service/robot_control_srv "0dd95aee29323b73c925a0c69e911119")


