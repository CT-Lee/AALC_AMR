#!/usr/bin/env python3
import rospy
import smach
import smach_ros
from std_msgs.msg import String
from std_srvs.srv import Empty, EmptyResponse
from delta_amr_service.srv import realsense_srv, realsense_srvResponse
from delta_amr_service.srv import robot_control_srv, robot_control_srvResponse

# Need to add function: Realsense detect human distance
def human_detect(img_process_type_realsense):
    try:
        rospy.wait_for_service('realsense_srv', timeout = 2)
        image_process = rospy.ServiceProxy('realsense_srv', realsense_srv)
        response = image_process(img_process_type_realsense)
        return response.human_dist, response.camera_status_realsense
    except rospy.ROSException as e:
        rospy.logerr(f"Service call failed: {e}")
        return None, None
        
class Watch_OP(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['watching', 'Start_Mov'])
        self.counter = 0
        
    def execute(self, userdata):
        img_process_type_realsense = 'human_detect'
        human_dist, camera_status_realsense = human_detect(img_process_type_realsense)
        
        if human_dist is not None:
            rospy.loginfo(f"Human detected at distance: {human_dist}")
        else:
            rospy.loginfo("No human detected or service unavailable.")
            
        rospy.loginfo('Executing state Watch_OP')
        rospy.sleep(0.5)
        if self.counter > 1000:
            self.counter = 0
            return 'Start_Mov'
        else:
            self.counter += 1
            return 'watching'
        

# Need to add function: Slow down and stop when human come close
class AMR_Mov(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['Moving', 'Start_Pic'])
        self.counter = 0
        
    def execute(self, userdata):
        rospy.loginfo('Executing state AMR_Mov')
        rospy.sleep(1.0) 
        if self.counter > 5:
            self.counter = 0
            return 'Start_Pic'
        else:
            self.counter += 1
            return 'Moving'


def robot_move(robot_mov_type, robot_mov_point, robot_mov_speed):
    try:
        rospy.wait_for_service('robot_control_srv', timeout = 2)
        robot_process = rospy.ServiceProxy('robot_control_srv', robot_control_srv)
        response = robot_process(robot_mov_type, robot_mov_point, robot_mov_speed)
        return response.robot_running_status
    except rospy.ROSException as e:
        rospy.logerr(f"Service call failed: {e}")
        return None
        
# Need to add function: Integrate LiDAR slow down and stop
class Robot_Pic(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['Picturing','Start_Back'])
        self.counter = 0
        
    def execute(self, userdata):
        rospy.loginfo('Executing state Robot_Pic')
        rospy.sleep(1.0) 
        
        robot_mov_type = 'MovL'
        robot_mov_point = 'P1'
        robot_mov_speed = 0.25
        robot_running_status = robot_move(robot_mov_type, robot_mov_point,robot_mov_speed)
        
        if robot_running_status is not None:
            rospy.loginfo("Robot movement done")
        else:
            rospy.loginfo("No robot move or service unavailable.")
        
        img_process_type_realsense = 'take_pic'
        human_dist, camera_status_realsense = human_detect(img_process_type_realsense)
        
        if human_dist is not None:
            rospy.loginfo(f"Human detected at distance: {human_dist}")
        else:
            rospy.loginfo("No human detected or service unavailable.")
            
        return 'Start_Back'
          
        #if self.counter > 5:
        #    self.counter = 0
        #    return 'Start_Back'
        #else:
        #    self.counter += 1
        #    return 'Picturing'
        
        
# Need to add function: Slow down and stop when human come close
class AMR_Back(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['Moving','Start_Upload'])
        self.counter = 0
        
    def execute(self, userdata):
        rospy.loginfo('Executing state AMR_Back')
        rospy.sleep(1.0)
        if self.counter > 5:
            self.counter = 0
            return 'Start_Upload'
        else:
            self.counter += 1
            return 'Moving'
         
        
class IPC_Upload(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['Uploading','Start_Watch_OP'])
        self.counter = 0
        
    def execute(self, userdata):
        rospy.loginfo('Executing state IPC_Upload')
        rospy.sleep(1.0)
        if self.counter > 5:
            self.counter = 0
            return 'Start_Watch_OP'
        else:
            self.counter += 1
            return 'Uploading'
         
# main
def main():
    rospy.init_node('smach_example_state_machine')

    # Create a SMACH state machine
    sm = smach.StateMachine(outcomes=['outcome4', 'outcome5'])

    # Open the container
    with sm:
        # Add states to the container
        smach.StateMachine.add('Watch_OP', Watch_OP(), 
                               transitions={'watching':'Watch_OP',
                                            'Start_Mov':'AMR_Mov'})
        smach.StateMachine.add('AMR_Mov', AMR_Mov(), 
                               transitions={'Moving':'AMR_Mov',
                                            'Start_Pic':'Robot_Pic'})
        smach.StateMachine.add('Robot_Pic', Robot_Pic(), 
                               transitions={'Picturing':'Robot_Pic',
                                            'Start_Back':'AMR_Back'})
        smach.StateMachine.add('AMR_Back', AMR_Back(), 
                               transitions={'Moving':'AMR_Back',
                                            'Start_Upload':'IPC_Upload'})
        smach.StateMachine.add('IPC_Upload', IPC_Upload(), 
                               transitions={'Uploading':'IPC_Upload',
                                            'Start_Watch_OP':'Watch_OP'})

    # Create and start the introspection server
    sis = smach_ros.IntrospectionServer('my_smach_introspection_server', sm, '/SM_ROOT')
    sis.start()

    # Execute SMACH plan
    outcome = sm.execute()

    # Check the outcome and perform specific actions
    if outcome == 'outcome4':
        rospy.loginfo("State machine terminated with outcome4. Executing specific actions for outcome4.")
        # Add outcome4 termination behavior，e.g. msg or other data storage
    elif outcome == 'outcome5':
        rospy.loginfo("State machine terminated with outcome5. Executing specific actions for outcome5.")
        # Add outcome5 termination behavior，e.g. msg or other data storage

    # Wait for ctrl-c to stop the application
    rospy.spin()
    sis.stop()


if __name__ == '__main__':
    main()
'''
def talker():
    pub = rospy.Publisher('/realsense_camera/command', String, queue_size=10)
    rospy.init_node("State_machine", anonymous = True)
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
    	command = "capture_image"  # 發送的指令內容
    	pub.publish(command)
    	rate.sleep()
    	
if __name__ == '__main__':
    try:
    	talker()
    except rospy.ROSInterruptException:
        pass
'''
