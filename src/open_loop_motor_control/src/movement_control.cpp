/** ******************************************************
	* @file		movement_control.cpp
	* @author	Tsai,Li-chun
	******************************************************
**/


/* System Includes ------------------------------------------*/
/* System Includes Begin */
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
#include "movement_control.hpp"
/* User Includes End */

/* namespace ------------------------------------------------*/
/* namespace Begin */
/* namespace End */


/* Define ---------------------------------------------------*/
/* Define Begin */
/* Define End */


/* Typedef --------------------------------------------------*/
/* Typedef Begin */
/* Typedef End */


/* Class --------------------------------------------------*/
/* Class Begin */
/* Class End */


/* Variables ------------------------------------------------*/
/* Variables Begin */
/* Variables End */


/* Function -------------------------------------------------*/
/* Function Begin */
/* Function End */



/* ---------------------------------------------------------*/
/* ⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩ Program ⇩⇩⇩⇩⇩⇩⇩⇩⇩⇩ ---------------------------*/
/* ---------------------------------------------------------*/
/* Program Begin */

/** * @brief movement_control object constructor
	* @param None
 	* @return none
**/
movement_control::movement_control():
	wait_running_cycle(false),
	nh(),
	loop_rate(1)
{
	/* initialization pub_cmd_vel */
	pub_cmd_vel = nh.advertise<geometry_msgs::Twist>(TOPIC_cmd_vel, queue_size, this);
	/* initialization pub_io2status_out */
	pub_io2status_out = nh.advertise<delta_amr_message::cas2ndagv_io2state_out>(cas2ndagv_io2state_out_topic, queue_size, this);
	/* initialization sub_encoder */
	sub_encoder = nh.subscribe(TOPIC_encoder, queue_size, &movement_control::Sub_TOPIC_encoder_callback, this);
	/* initialization sub_odometry */
	sub_odometry = nh.subscribe(TOPIC_odom, queue_size, &movement_control::Sub_TOPIC_odometry_callback, this);
	/* initialization sub_io2status_in */
	sub_io2status_in = nh.subscribe(cas2ndagv_io2state_in_topic, queue_size, &movement_control::Sub_TOPIC_cas2ndagv_io2state_in_callback, this);
	/* initialization sub_io2status_out */
	sub_io2status_out = nh.subscribe(cas2ndagv_io2state_out_topic, queue_size, &movement_control::Sub_TOPIC_cas2ndagv_io2state_out_callback, this);
	/* initialization straight_profile */
	ser_amr_movement_control_straight = nh.advertiseService(SERVICE_amr_movement_control_straight, &movement_control::ser_straight_profile_callbac, this);
	/* init timer interrupt object */
	time_interrupter = nh.createTimer(ros::Duration(running_cycle), &movement_control::time_interrupter_callback, this);

	twist_msg.linear.y = 0;
	twist_msg.linear.z = 0;
	twist_msg.angular.x = 0;
	twist_msg.angular.y = 0;
	twist_msg.angular.z = 0;

	ROS_INFO("[movement_control_Node] node startup completed. movement_control_Node running...");
}

/** * @brief movement_control object destructor
	* @param None
 	* @return none
**/
movement_control::~movement_control()
{
}

/** * @brief walk a straight line based on input parameters
	* @param int(targetSpeed) max speeed
	* @param int(endSpeed) end speeed
	* @param int(endSpeed) walk distance
	* @param int(acc) acceleration
	* @param int(dec) deceleration
 	* @return none
**/
bool movement_control::ser_straight_profile_callbac(delta_amr_service::amr_movement_control::Request &amr_movement_control_req,
													delta_amr_service::amr_movement_control::Response &amr_movement_control_res)

{
	straight_profile(amr_movement_control_req.targetSpeed*running_cycle,
					 amr_movement_control_req.endVx*running_cycle,
					 amr_movement_control_req.distance,
					 amr_movement_control_req.acc_dec*(running_cycle*running_cycle),
					 amr_movement_control_req.point_type	);
	return true;
}
void movement_control::straight_profile(double targetSpeed, double endVx, double distance, double acc_dec, int8_t point_type)
{
	double decelerationRequired;
	double curVx = twist_msg.linear.x*running_cycle;
	double targetSpeed_true = targetSpeed;
	bool restartSW = false;
	wait_running_cycle=true;
	cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.normal_walking;
	if(targetSpeed>=0) cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.straight;
	else  cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.reverse;
	pub_io2status_out.publish(cas2ndagv_io2status_out_msg);
	while( distance>0 )
	{
		/* wait running cycle */
		while(wait_running_cycle){ros::spinOnce();}	wait_running_cycle=true;
		/* calculate deceleration */
		decelerationRequired = ( (curVx*curVx)-(endVx*endVx) )/(2*distance);
		if( decelerationRequired >= acc_dec ) targetSpeed_true = endVx;
		/* update curVx command */
		if( cas2ndagv_io2status_in_msg.lidarOSSD != CAS2ndAGV_IO_status.lidarOSSD.emergency_stop )
		{
			// if( fabs(curVx)==0 )
			// {
			// 	distance=0;
			// 	curVx=0;
			// }
			if(distance<fabs(curVx))
			{
				distance=0;
				curVx=0;
				ROS_INFO("distance<fabs(curVx)");
			}
			if(targetSpeed_true==0 && fabs(curVx)<acc_dec)
			{
				distance=0;
				curVx=0;
				ROS_INFO("targetSpeed_true==0 && fabs(curVx)<acc_dec");
			}
			/* update curVx */
			if(curVx < targetSpeed_true) curVx += acc_dec;
			if(curVx > targetSpeed_true) curVx -= acc_dec;
			/* update distance */
			if(restartSW) distance = distance - fabs(curVx);
			if( point_type==1 )
			{
				cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.normal_walking;
				// if( distance<0.5 ) 
				// 	cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.workstation1;
				// else	
				// 	cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.normal_walking;
			}
			twist_msg.linear.x = curVx/running_cycle;
			restartSW = true;
			cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.straight;
		}
		else
		{
			// if(restartSW) distance += 0.03;
			curVx = 0;
			restartSW = false;
			twist_msg.linear.x = 0;
			cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.error;
		}

		ROS_INFO("%lf,%lf,%lf,%lf,%lf",distance, targetSpeed_true, curVx, encoder_msg.AvelocityL_M, encoder_msg.AvelocityR_M);
		pub_cmd_vel.publish(twist_msg);
	}
	ROS_INFO("straight_profile complate!");
	if(point_type==1)
	{
		cas2ndagv_io2status_out_msg.lidarMAP = CAS2ndAGV_IO_status.lidarMAP.workstation1;
		cas2ndagv_io2status_out_msg.light = CAS2ndAGV_IO_status.light.standby;
		pub_io2status_out.publish(cas2ndagv_io2status_out_msg);
	}
	twist_msg.linear.x = endVx;
	pub_cmd_vel.publish(twist_msg);
}

/** * @brief movement_control object encoder subscriber callback function
	* @param motor_feedback_msgs::motor_feedback& encoder data structure
 	* @return none
**/
void movement_control::Sub_TOPIC_encoder_callback(const motor_feedback_msgs::motor_feedback& enc)
{
	encoder_msg = enc;
}
/** * @brief movement_control object odometry subscriber callback function
	* @param nav_msgs::Odometry& odometry data structure
 	* @return none
**/
void movement_control::Sub_TOPIC_odometry_callback(const nav_msgs::Odometry& odom)
{
	odom_msg = odom;
}

/** * @brief movement_control object timer interrupt callback function
	* @param ros::TimerEvent TimerEvent structure
 	* @return none
**/
void movement_control::time_interrupter_callback(const ros::TimerEvent& time)
{
	// ROS_INFO("%lf",twist_msg.linear.x);
	wait_running_cycle = false;
}

/** * @brief movement_control io2state_in subscriber callback function
	* @param delta_amr_message::cas2ndagv_io2state_in&
 	* @return none
**/
void movement_control::Sub_TOPIC_cas2ndagv_io2state_in_callback(const delta_amr_message::cas2ndagv_io2state_in& io2s_in)
{
	cas2ndagv_io2status_in_msg = io2s_in;
}
/** * @brief movement_control io2state_out subscriber callback function
	* @param delta_amr_message::cas2ndagv_io2state_in&
 	* @return none
**/
void movement_control::Sub_TOPIC_cas2ndagv_io2state_out_callback(const delta_amr_message::cas2ndagv_io2state_out& io2s_out)
{
	cas2ndagv_io2status_out_msg = io2s_out;
}

/** * @brief cas 2nd agv movement control object main runing
	* @param None
 	* @return none
**/
void movement_control::run(void)
{
	ROS_INFO("cas 2nd agv movement control object main runing...");
	loop_rate.sleep();
}

/* Program End */
/* ---------------------------------------------------------*/
/* ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ Program ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ ---------------------------*/
/* ---------------------------------------------------------*/


/* ***** END OF movement_control.cpp ***** */