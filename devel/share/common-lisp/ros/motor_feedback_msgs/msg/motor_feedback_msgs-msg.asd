
(cl:in-package :asdf)

(defsystem "motor_feedback_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "motor_feedback" :depends-on ("_package_motor_feedback"))
    (:file "_package_motor_feedback" :depends-on ("_package"))
  ))