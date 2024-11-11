
(cl:in-package :asdf)

(defsystem "delta_amr_service-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "mechmind_srv" :depends-on ("_package_mechmind_srv"))
    (:file "_package_mechmind_srv" :depends-on ("_package"))
    (:file "realsense_srv" :depends-on ("_package_realsense_srv"))
    (:file "_package_realsense_srv" :depends-on ("_package"))
    (:file "robot_control_srv" :depends-on ("_package_robot_control_srv"))
    (:file "_package_robot_control_srv" :depends-on ("_package"))
    (:file "upload_srv" :depends-on ("_package_upload_srv"))
    (:file "_package_upload_srv" :depends-on ("_package"))
  ))