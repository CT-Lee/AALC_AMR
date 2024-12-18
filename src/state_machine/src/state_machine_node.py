#!/usr/bin/env python3
import rospy
import smach
import smach_ros
from std_msgs.msg import String
from delta_amr_message.msg import cas2ndagv_io2state_out
from delta_amr_message.msg import cas2ndagv_io2state_in
from std_srvs.srv import Empty, EmptyResponse
from delta_amr_service.srv import amr_srv, amr_srvResponse
from delta_amr_service.srv import realsense_srv, realsense_srvResponse
from delta_amr_service.srv import robot_control_srv, robot_control_srvResponse
from delta_amr_service.srv import upload_srv, upload_srvResponse

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
        if cas2ndag_in.lidarOSSD == 'emergency_stop':
            rospy.loginfo('lidarOSSD = emergency_stop')
            cas2ndag_out.lidarMAP = 'normal_walking'
            cas2ndag_out.light = 'reverse'
            pub_cas2ndagv_io2status_out.publish(cas2ndag_out)
        elif cas2ndag_in.lidarOSSD == 'slow_stop':
            rospy.loginfo('lidarOSSD = slow_stop')
            cas2ndag_out.lidarMAP = 'normal_walking'
            cas2ndag_out.light = 'handshake'
            pub_cas2ndagv_io2status_out.publish(cas2ndag_out)
        elif cas2ndag_in.lidarOSSD == 'normal':
            rospy.loginfo('lidarOSSD = normal')
            cas2ndag_out.lidarMAP = 'normal_walking'
            cas2ndag_out.light = 'standby'
            pub_cas2ndagv_io2status_out.publish(cas2ndag_out)
        rospy.loginfo('Executing state Watch_OP')
        rospy.sleep(1)
        if human_dist == 0:
            rospy.loginfo('OP has leaved')
            return 'Start_Mov'
        else:
            rospy.loginfo('OP is working')
            return 'watching'
        

# Need to add function: Slow down and stop when human come close
class AMR_Mov(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['Moving', 'Start_Pic'])
        self.counter = 0
        
    def execute(self, userdata):
        rospy.loginfo('Executing state AMR_Mov')
        try:
            rospy.wait_for_service('amr_srv', timeout = None)
            amr_move = rospy.ServiceProxy('amr_srv', amr_srv)
            response = amr_move('forward')
            if response.amr_status == 'stop':
                return 'Start_Pic'
        except rospy.ROSException as e:
            rospy.logerr(f"Service call failed: {e}")
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
        
        normal_speed_bool = True
        slow_speed_bool = False
        num_pic = 3
        for i in range(num_pic):
            robot_mov_type = 'MovL'
            robot_mov_point = 'P' + str(i + 2)
            robot_mov_speed = 0.25
            robot_mov_speed_low = 0.01
            _ = robot_move(robot_mov_type, robot_mov_point,robot_mov_speed)
            robot_cnt = 0
            while True:
                robot_cnt += 1
                print("cas2ndag_in.lidarOSSD: ", cas2ndag_in.lidarOSSD)
                if cas2ndag_in.lidarOSSD  == 'emergency_stop':
                    print("Change to Emergency stop")
                    _ = robot_move('stop', robot_mov_point,robot_mov_speed)
                    normal_speed_bool = False
                    slow_speed_bool = False
                
                elif cas2ndag_in.lidarOSSD  == 'slow_stop' and slow_speed_bool == False:
                    print("Change to Slow stop")
                    _ = robot_move('stop', robot_mov_point,robot_mov_speed)
                   # _ = robot_move('MovL', robot_mov_point,robot_mov_speed_low)
                    slow_speed_bool = True
                    normal_speed_bool = False
                
                elif cas2ndag_in.lidarOSSD  == 'normal' and normal_speed_bool == False:
                    print("Change to normal")
                    _ = robot_move('stop', robot_mov_point,robot_mov_speed)
                    _ = robot_move('MovL', robot_mov_point,robot_mov_speed)
                    slow_speed_bool = False
                    normal_speed_bool = True

                # print(robot_move('is_reached', robot_mov_point,robot_mov_speed))
                if robot_cnt % 50:
                    if robot_move('is_reached', robot_mov_point,robot_mov_speed) == 'reached':
                        break
                rospy.sleep(0.01)
            
            # Take pic
#            img_process_type_realsense = 'take_pic'
            img_process_type_realsense = 'take_pic'
            human_dist, camera_status_realsense = human_detect(img_process_type_realsense)
            
        _ = robot_move('MovL', 'P1',robot_mov_speed)
        return 'Start_Back'
        
        
# Need to add function: Slow down and stop when human come close
class AMR_Back(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['Moving','Start_Upload'])
        self.counter = 0
        
    def execute(self, userdata):
        rospy.loginfo('Executing state AMR_Back')
        rospy.sleep(1.0)
        try:
            rospy.wait_for_service('amr_srv', timeout = None)
            amr_move = rospy.ServiceProxy('amr_srv', amr_srv)
            response = amr_move('backward')
            if response.amr_status == 'stop':
                return 'Start_Upload'
        except rospy.ROSException as e:
            rospy.logerr(f"Service call failed: {e}")
            return 'Moving'
         
def upload_img():
    try:
        rospy.wait_for_service('upload_srv', timeout = 2)
        upload = rospy.ServiceProxy('upload_srv', upload_srv)
        response = upload("start")
        return response.upload_status
    except rospy.ROSException as e:
        rospy.logerr(f"Service call failed: {e}")
        return None

class IPC_Upload(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['Uploading','Start_Watch_OP'])
        self.counter = 0
        
    def execute(self, userdata):
        rospy.loginfo('Executing state IPC_Upload')
        upload_result = upload_img()
        rospy.sleep(1.0)
        if upload_result == 'done':
            rospy.loginfo("data upload completed!!!")
            return 'Start_Watch_OP'
        elif self.counter > 5:
            rospy.loginfo("Too many fails")
            return 'Start_Watch_OP'
        else:
            rospy.logerr(f"upload failed")
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

def sub_cas2ndagv_io2status_in_callback(data):
    cas2ndag_in.lidarOSSD = data.lidarOSSD
    cas2ndag_in.EMS = data.lidarOSSD
    # rospy.loginfo('lidarOSSD = %s', data.lidarOSSD)
    # rospy.loginfo('lidarMAP = %s', data.EMS)

cas2ndag_out = cas2ndagv_io2state_out()
cas2ndag_in = cas2ndagv_io2state_in()
pub_cas2ndagv_io2status_out = rospy.Publisher('TOPIC_cas2ndagv_io2state_out', cas2ndagv_io2state_out, queue_size=100)
sub_cas2ndagv_io2status_in = rospy.Subscriber('TOPIC_cas2ndagv_io2state_in', cas2ndagv_io2state_in, sub_cas2ndagv_io2status_in_callback)
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
