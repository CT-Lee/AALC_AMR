;; Auto-generated. Do not edit!


(when (boundp 'delta_amr_service::mechmind_srv)
  (if (not (find-package "DELTA_AMR_SERVICE"))
    (make-package "DELTA_AMR_SERVICE"))
  (shadow 'mechmind_srv (find-package "DELTA_AMR_SERVICE")))
(unless (find-package "DELTA_AMR_SERVICE::MECHMIND_SRV")
  (make-package "DELTA_AMR_SERVICE::MECHMIND_SRV"))
(unless (find-package "DELTA_AMR_SERVICE::MECHMIND_SRVREQUEST")
  (make-package "DELTA_AMR_SERVICE::MECHMIND_SRVREQUEST"))
(unless (find-package "DELTA_AMR_SERVICE::MECHMIND_SRVRESPONSE")
  (make-package "DELTA_AMR_SERVICE::MECHMIND_SRVRESPONSE"))

(in-package "ROS")





(defclass delta_amr_service::mechmind_srvRequest
  :super ros::object
  :slots (_img_process_type_mechmind ))

(defmethod delta_amr_service::mechmind_srvRequest
  (:init
   (&key
    ((:img_process_type_mechmind __img_process_type_mechmind) "")
    )
   (send-super :init)
   (setq _img_process_type_mechmind (string __img_process_type_mechmind))
   self)
  (:img_process_type_mechmind
   (&optional __img_process_type_mechmind)
   (if __img_process_type_mechmind (setq _img_process_type_mechmind __img_process_type_mechmind)) _img_process_type_mechmind)
  (:serialization-length
   ()
   (+
    ;; string _img_process_type_mechmind
    4 (length _img_process_type_mechmind)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _img_process_type_mechmind
       (write-long (length _img_process_type_mechmind) s) (princ _img_process_type_mechmind s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _img_process_type_mechmind
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _img_process_type_mechmind (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass delta_amr_service::mechmind_srvResponse
  :super ros::object
  :slots (_camera_status ))

(defmethod delta_amr_service::mechmind_srvResponse
  (:init
   (&key
    ((:camera_status __camera_status) 0)
    )
   (send-super :init)
   (setq _camera_status (round __camera_status))
   self)
  (:camera_status
   (&optional __camera_status)
   (if __camera_status (setq _camera_status __camera_status)) _camera_status)
  (:serialization-length
   ()
   (+
    ;; int32 _camera_status
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _camera_status
       (write-long _camera_status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _camera_status
     (setq _camera_status (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass delta_amr_service::mechmind_srv
  :super ros::object
  :slots ())

(setf (get delta_amr_service::mechmind_srv :md5sum-) "7e7b687eeeaf11191ef09103f57fbbe7")
(setf (get delta_amr_service::mechmind_srv :datatype-) "delta_amr_service/mechmind_srv")
(setf (get delta_amr_service::mechmind_srv :request) delta_amr_service::mechmind_srvRequest)
(setf (get delta_amr_service::mechmind_srv :response) delta_amr_service::mechmind_srvResponse)

(defmethod delta_amr_service::mechmind_srvRequest
  (:response () (instance delta_amr_service::mechmind_srvResponse :init)))

(setf (get delta_amr_service::mechmind_srvRequest :md5sum-) "7e7b687eeeaf11191ef09103f57fbbe7")
(setf (get delta_amr_service::mechmind_srvRequest :datatype-) "delta_amr_service/mechmind_srvRequest")
(setf (get delta_amr_service::mechmind_srvRequest :definition-)
      "# Delta_AMR_Service.srv
# Request

string img_process_type_mechmind 

---

# Response

int32 camera_status

")

(setf (get delta_amr_service::mechmind_srvResponse :md5sum-) "7e7b687eeeaf11191ef09103f57fbbe7")
(setf (get delta_amr_service::mechmind_srvResponse :datatype-) "delta_amr_service/mechmind_srvResponse")
(setf (get delta_amr_service::mechmind_srvResponse :definition-)
      "# Delta_AMR_Service.srv
# Request

string img_process_type_mechmind 

---

# Response

int32 camera_status

")



(provide :delta_amr_service/mechmind_srv "7e7b687eeeaf11191ef09103f57fbbe7")


