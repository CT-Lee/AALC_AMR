;; Auto-generated. Do not edit!


(when (boundp 'delta_amr_service::realsense_srv)
  (if (not (find-package "DELTA_AMR_SERVICE"))
    (make-package "DELTA_AMR_SERVICE"))
  (shadow 'realsense_srv (find-package "DELTA_AMR_SERVICE")))
(unless (find-package "DELTA_AMR_SERVICE::REALSENSE_SRV")
  (make-package "DELTA_AMR_SERVICE::REALSENSE_SRV"))
(unless (find-package "DELTA_AMR_SERVICE::REALSENSE_SRVREQUEST")
  (make-package "DELTA_AMR_SERVICE::REALSENSE_SRVREQUEST"))
(unless (find-package "DELTA_AMR_SERVICE::REALSENSE_SRVRESPONSE")
  (make-package "DELTA_AMR_SERVICE::REALSENSE_SRVRESPONSE"))

(in-package "ROS")





(defclass delta_amr_service::realsense_srvRequest
  :super ros::object
  :slots (_img_process_type_realsense ))

(defmethod delta_amr_service::realsense_srvRequest
  (:init
   (&key
    ((:img_process_type_realsense __img_process_type_realsense) "")
    )
   (send-super :init)
   (setq _img_process_type_realsense (string __img_process_type_realsense))
   self)
  (:img_process_type_realsense
   (&optional __img_process_type_realsense)
   (if __img_process_type_realsense (setq _img_process_type_realsense __img_process_type_realsense)) _img_process_type_realsense)
  (:serialization-length
   ()
   (+
    ;; string _img_process_type_realsense
    4 (length _img_process_type_realsense)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _img_process_type_realsense
       (write-long (length _img_process_type_realsense) s) (princ _img_process_type_realsense s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _img_process_type_realsense
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _img_process_type_realsense (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass delta_amr_service::realsense_srvResponse
  :super ros::object
  :slots (_human_dist _camera_status_realsense ))

(defmethod delta_amr_service::realsense_srvResponse
  (:init
   (&key
    ((:human_dist __human_dist) 0.0)
    ((:camera_status_realsense __camera_status_realsense) 0)
    )
   (send-super :init)
   (setq _human_dist (float __human_dist))
   (setq _camera_status_realsense (round __camera_status_realsense))
   self)
  (:human_dist
   (&optional __human_dist)
   (if __human_dist (setq _human_dist __human_dist)) _human_dist)
  (:camera_status_realsense
   (&optional __camera_status_realsense)
   (if __camera_status_realsense (setq _camera_status_realsense __camera_status_realsense)) _camera_status_realsense)
  (:serialization-length
   ()
   (+
    ;; float32 _human_dist
    4
    ;; int32 _camera_status_realsense
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _human_dist
       (sys::poke _human_dist (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _camera_status_realsense
       (write-long _camera_status_realsense s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _human_dist
     (setq _human_dist (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _camera_status_realsense
     (setq _camera_status_realsense (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass delta_amr_service::realsense_srv
  :super ros::object
  :slots ())

(setf (get delta_amr_service::realsense_srv :md5sum-) "6c4e0ab4251a9095d0cdc3a5578f78f5")
(setf (get delta_amr_service::realsense_srv :datatype-) "delta_amr_service/realsense_srv")
(setf (get delta_amr_service::realsense_srv :request) delta_amr_service::realsense_srvRequest)
(setf (get delta_amr_service::realsense_srv :response) delta_amr_service::realsense_srvResponse)

(defmethod delta_amr_service::realsense_srvRequest
  (:response () (instance delta_amr_service::realsense_srvResponse :init)))

(setf (get delta_amr_service::realsense_srvRequest :md5sum-) "6c4e0ab4251a9095d0cdc3a5578f78f5")
(setf (get delta_amr_service::realsense_srvRequest :datatype-) "delta_amr_service/realsense_srvRequest")
(setf (get delta_amr_service::realsense_srvRequest :definition-)
      "# Delta_AMR_Service.srv
# Request

string img_process_type_realsense 

---

# Response

float32 human_dist

int32 camera_status_realsense

")

(setf (get delta_amr_service::realsense_srvResponse :md5sum-) "6c4e0ab4251a9095d0cdc3a5578f78f5")
(setf (get delta_amr_service::realsense_srvResponse :datatype-) "delta_amr_service/realsense_srvResponse")
(setf (get delta_amr_service::realsense_srvResponse :definition-)
      "# Delta_AMR_Service.srv
# Request

string img_process_type_realsense 

---

# Response

float32 human_dist

int32 camera_status_realsense

")



(provide :delta_amr_service/realsense_srv "6c4e0ab4251a9095d0cdc3a5578f78f5")


