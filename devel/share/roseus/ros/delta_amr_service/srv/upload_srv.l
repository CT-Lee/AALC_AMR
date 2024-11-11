;; Auto-generated. Do not edit!


(when (boundp 'delta_amr_service::upload_srv)
  (if (not (find-package "DELTA_AMR_SERVICE"))
    (make-package "DELTA_AMR_SERVICE"))
  (shadow 'upload_srv (find-package "DELTA_AMR_SERVICE")))
(unless (find-package "DELTA_AMR_SERVICE::UPLOAD_SRV")
  (make-package "DELTA_AMR_SERVICE::UPLOAD_SRV"))
(unless (find-package "DELTA_AMR_SERVICE::UPLOAD_SRVREQUEST")
  (make-package "DELTA_AMR_SERVICE::UPLOAD_SRVREQUEST"))
(unless (find-package "DELTA_AMR_SERVICE::UPLOAD_SRVRESPONSE")
  (make-package "DELTA_AMR_SERVICE::UPLOAD_SRVRESPONSE"))

(in-package "ROS")





(defclass delta_amr_service::upload_srvRequest
  :super ros::object
  :slots (_upload_cmd ))

(defmethod delta_amr_service::upload_srvRequest
  (:init
   (&key
    ((:upload_cmd __upload_cmd) "")
    )
   (send-super :init)
   (setq _upload_cmd (string __upload_cmd))
   self)
  (:upload_cmd
   (&optional __upload_cmd)
   (if __upload_cmd (setq _upload_cmd __upload_cmd)) _upload_cmd)
  (:serialization-length
   ()
   (+
    ;; string _upload_cmd
    4 (length _upload_cmd)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _upload_cmd
       (write-long (length _upload_cmd) s) (princ _upload_cmd s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _upload_cmd
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _upload_cmd (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass delta_amr_service::upload_srvResponse
  :super ros::object
  :slots (_upload_status ))

(defmethod delta_amr_service::upload_srvResponse
  (:init
   (&key
    ((:upload_status __upload_status) "")
    )
   (send-super :init)
   (setq _upload_status (string __upload_status))
   self)
  (:upload_status
   (&optional __upload_status)
   (if __upload_status (setq _upload_status __upload_status)) _upload_status)
  (:serialization-length
   ()
   (+
    ;; string _upload_status
    4 (length _upload_status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _upload_status
       (write-long (length _upload_status) s) (princ _upload_status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _upload_status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _upload_status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass delta_amr_service::upload_srv
  :super ros::object
  :slots ())

(setf (get delta_amr_service::upload_srv :md5sum-) "9509961624cae8e89290906327b798e8")
(setf (get delta_amr_service::upload_srv :datatype-) "delta_amr_service/upload_srv")
(setf (get delta_amr_service::upload_srv :request) delta_amr_service::upload_srvRequest)
(setf (get delta_amr_service::upload_srv :response) delta_amr_service::upload_srvResponse)

(defmethod delta_amr_service::upload_srvRequest
  (:response () (instance delta_amr_service::upload_srvResponse :init)))

(setf (get delta_amr_service::upload_srvRequest :md5sum-) "9509961624cae8e89290906327b798e8")
(setf (get delta_amr_service::upload_srvRequest :datatype-) "delta_amr_service/upload_srvRequest")
(setf (get delta_amr_service::upload_srvRequest :definition-)
      "# Delta_AMR_Service.srv
# Request

string upload_cmd

---

# Response

string upload_status

")

(setf (get delta_amr_service::upload_srvResponse :md5sum-) "9509961624cae8e89290906327b798e8")
(setf (get delta_amr_service::upload_srvResponse :datatype-) "delta_amr_service/upload_srvResponse")
(setf (get delta_amr_service::upload_srvResponse :definition-)
      "# Delta_AMR_Service.srv
# Request

string upload_cmd

---

# Response

string upload_status

")



(provide :delta_amr_service/upload_srv "9509961624cae8e89290906327b798e8")


