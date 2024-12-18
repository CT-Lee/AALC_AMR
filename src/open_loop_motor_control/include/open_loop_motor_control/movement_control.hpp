/** ******************************************************
	* @file		movement_control.hpp
	* @author	Tsai,Li-chun
	******************************************************
**/

/* Define to prevent recursive inclusi ----------------------*/
#ifndef __movement_control_HPP__
#define __movement_control_HPP__


/* System Includes ------------------------------------------*/
/* System Includes Begin */
#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <geometry_msgs/Twist.h>
#include <delta_amr_service/amr_movement_control.h>
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
#include "adam_for_cas2ndagv_IO_def.h"
#include "motor_feedback_msgs/motor_feedback.h"
#include "delta_amr_message/cas2ndagv_io2state_in.h"
#include "delta_amr_message/cas2ndagv_io2state_out.h"
/* User Includes End */


/* Define ---------------------------------------------------*/
/* Define Begin */

#define SERVICE_amr_movement_control_straight "ser_amr_movement_control_straight"
#define TOPIC_cmd_vel "cmd_vel"
#define TOPIC_odom "odom"
#define TOPIC_encoder "encoder"
#define queue_size 100
#define running_cycle (double)0.1
#define slow_stop_speed (double)0.1

/* Define End */


/* Extern Typedef -------------------------------------------*/
/* Extern Typedef Begin */
/* Extern Typedef End */


/* Extern Class -------------------------------------------*/
/* Extern Class Begin */

/* define cas 2nd agv io-status transform object */
class movement_control
{
/* private member */
private:
	/* wait for running_cycle to finish flag */
	bool wait_running_cycle;
	/* define return code */
	int rc;
	/* create ros node handle */
	ros::NodeHandle nh;
	/* create ros loop rate */
	ros::Rate loop_rate;
	/* create cmd_vel publisher object */
	ros::Publisher pub_cmd_vel;
	/* create cas2ndagv io2state out publisher object */
	ros::Publisher pub_io2status_out;
	/* create odometry subscriber object */
	ros::Subscriber sub_odometry;
	/* create encoder subscriber object */
	ros::Subscriber sub_encoder;
	/* create sub_io2status_in subscriber object */
	ros::Subscriber sub_io2status_in;
	/* create sub_io2status_out subscriber object */
	ros::Subscriber sub_io2status_out;
	/* create straight_profile serviceServer object */
	ros::ServiceServer ser_amr_movement_control_straight;
	/* create ros timer interrupt object */
	ros::Timer time_interrupter;
	/*  */
	CAS2ndAGV_IO_status_struct CAS2ndAGV_IO_status;

	/* create Odometry message data structure */
	motor_feedback_msgs::motor_feedback encoder_msg;
	/* create Odometry message data structure */
	nav_msgs::Odometry odom_msg;
	/* create cmd_vel(twist) message data structure */
	geometry_msgs::Twist twist_msg;
	/* create cas2ndagv_io2state_in message data structure */
	delta_amr_message::cas2ndagv_io2state_in cas2ndagv_io2status_in_msg;
	/* create cas2ndagv_io2state_out message data structure */
	delta_amr_message::cas2ndagv_io2state_out cas2ndagv_io2status_out_msg;

	/*  */
	bool ser_straight_profile_callbac(delta_amr_service::amr_movement_control::Request &amr_movement_control_req,
									  delta_amr_service::amr_movement_control::Response &amr_movement_control_res);
	void straight_profile(double targetSpeed, double endSpeed, double distance, double acc_dec, int8_t point_type);

	void Sub_TOPIC_encoder_callback(const motor_feedback_msgs::motor_feedback& enc);
	void Sub_TOPIC_odometry_callback(const nav_msgs::Odometry& odom);
	void time_interrupter_callback(const ros::TimerEvent& time);
	void Sub_TOPIC_cas2ndagv_io2state_in_callback(const delta_amr_message::cas2ndagv_io2state_in& io2s_in);
	void Sub_TOPIC_cas2ndagv_io2state_out_callback(const delta_amr_message::cas2ndagv_io2state_out& io2s_out);

/* public member */
public:
	movement_control();	/* constructor */
	~movement_control();	/* destructor */
	
	void run(void);	/* cas 2nd agv movement control object main runing */

};

/* Extern Class End */


/* Extern Variables -----------------------------------------*/
/* Extern Variables Begin */
/* Extern Variables End */


/* Function -------------------------------------------------*/
/* Function Begin */
/* Function End */


#endif /*__movement_control_HPP__ */

/* ***** END OF movement_control.HPP ***** */