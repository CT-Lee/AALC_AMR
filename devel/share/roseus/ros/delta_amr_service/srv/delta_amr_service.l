;; Auto-generated. Do not edit!


(when (boundp 'delta_amr_service::delta_amr_service)
  (if (not (find-package "DELTA_AMR_SERVICE"))
    (make-package "DELTA_AMR_SERVICE"))
  (shadow 'delta_amr_service (find-package "DELTA_AMR_SERVICE")))
(unless (find-package "DELTA_AMR_SERVICE::DELTA_AMR_SERVICE")
  (make-package "DELTA_AMR_SERVICE::DELTA_AMR_SERVICE"))
(unless (find-package "DELTA_AMR_SERVICE::DELTA_AMR_SERVICEREQUEST")
  (make-package "DELTA_AMR_SERVICE::DELTA_AMR_SERVICEREQUEST"))
(unless (find-package "DELTA_AMR_SERVICE::DELTA_AMR_SERVICERESPONSE")
  (make-package "DELTA_AMR_SERVICE::DELTA_AMR_SERVICERESPONSE"))

(in-package "ROS")





(defclass delta_amr_service::delta_amr_serviceRequest
  :super ros::object
  :slots (_img_process_type_realsense _img_process_type_mechmind _robot_mov_type _robot_mov_point _robot_mov_speed ))

(defmethod delta_amr_service::delta_amr_serviceRequest
  (:init
   (&key
    ((:img_process_type_realsense __img_process_type_realsense) "")
    ((:img_process_type_mechmind __img_process_type_mechmind) "")
    ((:robot_mov_type __robot_mov_type) "")
    ((:robot_mov_point __robot_mov_point) "")
    ((:robot_mov_speed __robot_mov_speed) 0)
    )
   (send-super :init)
   (setq _img_process_type_realsense (string __img_process_type_realsense))
   (setq _img_process_type_mechmind (string __img_process_type_mechmind))
   (setq _robot_mov_type (string __robot_mov_type))
   (setq _robot_mov_point (string __robot_mov_point))
   (setq _robot_mov_speed (round __robot_mov_speed))
   self)
  (:img_process_type_realsense
   (&optional __img_process_type_realsense)
   (if __img_process_type_realsense (setq _img_process_type_realsense __img_process_type_realsense)) _img_process_type_realsense)
  (:img_process_type_mechmind
   (&optional __img_process_type_mechmind)
   (if __img_process_type_mechmind (setq _img_process_type_mechmind __img_process_type_mechmind)) _img_process_type_mechmind)
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
    ;; string _img_process_type_realsense
    4 (length _img_process_type_realsense)
    ;; string _img_process_type_mechmind
    4 (length _img_process_type_mechmind)
    ;; string _robot_mov_type
    4 (length _robot_mov_type)
    ;; string _robot_mov_point
    4 (length _robot_mov_point)
    ;; int32 _robot_mov_speed
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _img_process_type_realsense
       (write-long (length _img_process_type_realsense) s) (princ _img_process_type_realsense s)
     ;; string _img_process_type_mechmind
       (write-long (length _img_process_type_mechmind) s) (princ _img_process_type_mechmind s)
     ;; string _robot_mov_type
       (write-long (length _robot_mov_type) s) (princ _robot_mov_type s)
     ;; string _robot_mov_point
       (write-long (length _robot_mov_point) s) (princ _robot_mov_point s)
     ;; int32 _robot_mov_speed
       (write-long _robot_mov_speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _img_process_type_realsense
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _img_process_type_realsense (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _img_process_type_mechmind
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _img_process_type_mechmind (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _robot_mov_type
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_mov_type (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _robot_mov_point
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_mov_point (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _robot_mov_speed
     (setq _robot_mov_speed (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass delta_amr_service::delta_amr_serviceResponse
  :super ros::object
  :slots (_human_dist _robot_running_status ))

(defmethod delta_amr_service::delta_amr_serviceResponse
  (:init
   (&key
    ((:human_dist __human_dist) 0)
    ((:robot_running_status __robot_running_status) 0)
    )
   (send-super :init)
   (setq _human_dist (round __human_dist))
   (setq _robot_running_status (round __robot_running_status))
   self)
  (:human_dist
   (&optional __human_dist)
   (if __human_dist (setq _human_dist __human_dist)) _human_dist)
  (:robot_running_status
   (&optional __robot_running_status)
   (if __robot_running_status (setq _robot_running_status __robot_running_status)) _robot_running_status)
  (:serialization-length
   ()
   (+
    ;; int32 _human_dist
    4
    ;; int32 _robot_running_status
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _human_dist
       (write-long _human_dist s)
     ;; int32 _robot_running_status
       (write-long _robot_running_status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _human_dist
     (setq _human_dist (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _robot_running_status
     (setq _robot_running_status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass delta_amr_service::delta_amr_service
  :super ros::object
  :slots ())

(setf (get delta_amr_service::delta_amr_service :md5sum-) "5f036b9efe5e6058b93abe4b32fb58c0")
(setf (get delta_amr_service::delta_amr_service :datatype-) "delta_amr_service/delta_amr_service")
(setf (get delta_amr_service::delta_amr_service :request) delta_amr_service::delta_amr_serviceRequest)
(setf (get delta_amr_service::delta_amr_service :response) delta_amr_service::delta_amr_serviceResponse)

(defmethod delta_amr_service::delta_amr_serviceRequest
  (:response () (instance delta_amr_service::delta_amr_serviceResponse :init)))

(setf (get delta_amr_service::delta_amr_serviceRequest :md5sum-) "5f036b9efe5e6058b93abe4b32fb58c0")
(setf (get delta_amr_service::delta_amr_serviceRequest :datatype-) "delta_amr_service/delta_amr_serviceRequest")
(setf (get delta_amr_service::delta_amr_serviceRequest :definition-)
      "# Delta_AMR_Service.srv
# Request

string img_process_type_realsense 
string img_process_type_mechmind 

string robot_mov_type 
string robot_mov_point
int32 robot_mov_speed

---

# Response

int32 human_dist

int32 robot_running_status

")

(setf (get delta_amr_service::delta_amr_serviceResponse :md5sum-) "5f036b9efe5e6058b93abe4b32fb58c0")
(setf (get delta_amr_service::delta_amr_serviceResponse :datatype-) "delta_amr_service/delta_amr_serviceResponse")
(setf (get delta_amr_service::delta_amr_serviceResponse :definition-)
      "# Delta_AMR_Service.srv
# Request

string img_process_type_realsense 
string img_process_type_mechmind 

string robot_mov_type 
string robot_mov_point
int32 robot_mov_speed

---

# Response

int32 human_dist

int32 robot_running_status

")



(provide :delta_amr_service/delta_amr_service "5f036b9efe5e6058b93abe4b32fb58c0")


