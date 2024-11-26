/** ******************************************************
	* @file		cas2ndagv_io2status.hpp
	* @author	Tsai,Li-chun
	******************************************************
**/

/* Define to prevent recursive inclusi ----------------------*/
#ifndef __cas2ndagv_io2status_HPP__
#define __cas2ndagv_io2status_HPP__


/* System Includes ------------------------------------------*/
/* System Includes Begin */
#include <ros/ros.h>
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
#include "adam_for_cas2ndagv_IO_def.h"
#include "adam_for_cas2ndagv_PIN_def.h"
#include "delta_amr_message/cas2ndagv_io2state_in.h"
#include "delta_amr_message/cas2ndagv_io2state_out.h"
#include "delta_amr_message/cas2ndagv_input_pin.h"
#include "delta_amr_message/cas2ndagv_output_pin.h"
/* User Includes End */


/* Define ---------------------------------------------------*/
/* Define Begin */

#define cas2ndagv_io2state_in_topic "TOPIC_cas2ndagv_io2state_in"
#define cas2ndagv_io2state_out_topic "TOPIC_cas2ndagv_io2state_out"
#define cas2ndagv_input_pin_topic "TOPIC_cas2ndagv_input_pin"
#define cas2ndagv_output_pin_topic "TOPIC_cas2ndagv_output_pin"
#define cas2ndagv_io2state_queue_size 100
#define running_cycle 0.1
#define light_high_flash 2
#define light_mid_flash 3
#define light_low_flash 5

/* Define End */


/* Extern Typedef -------------------------------------------*/
/* Extern Typedef Begin */
/* Extern Typedef End */


/* Extern Class -------------------------------------------*/
/* Extern Class Begin */


/* define cas 2nd agv io-status transform object */
class cas2ndagv_io2status
{
/* private member */
private:
	const CAS2ndAGV_IO_status_struct CAS2ndAGV_IO_status;

	int flash_count;
	/* define return code */
	int rc;
	/* create ros node handle */
	ros::NodeHandle nh;
	/* create ros loop rate */
	ros::Rate loop_rate;
	/* create cas2ndagv io2state in publisher object */
	ros::Publisher pub_io2status_in;
	/* create ADAM output publisher object */
	ros::Publisher pub_adam_output;
	/* create cas2ndagv io2state out subscriber object */
	ros::Subscriber sub_io2status_out;
	/* create ADAM input subscriber object */
	ros::Subscriber sub_adam_input;
	/* create ros timer interrupt object */
	ros::Timer time_interrupter;

	delta_amr_message::cas2ndagv_io2state_in cas2ndagv_io2status_in_msg;
	delta_amr_message::cas2ndagv_io2state_out cas2ndagv_io2status_out_msg;
	delta_amr_message::cas2ndagv_input_pin cas2ndagv_in_pin_msg;
	delta_amr_message::cas2ndagv_output_pin cas2ndagv_out_pin_msg;

	void Pub_TOPIC_adam_output(void);
	void Pub_TOPIC_cas2ndagv_io2status_in(void);
	void Sub_TOPIC_adam_input_callback(const delta_amr_message::cas2ndagv_input_pin& in);
	void Sub_TOPIC_cas2ndagv_io2state_out_callback(const delta_amr_message::cas2ndagv_io2state_out& io2s_out);
	void time_interrupter_callback(const ros::TimerEvent& time);

	void carlight_ctl_standby(const int& count);
	void carlight_ctl_straight(const int& count);
	void carlight_ctl_reverse(const int& count);
	void carlight_ctl_left(const int& count);
	void carlight_ctl_right(const int& count);
	void carlight_ctl_charging(const int& count);
	void carlight_ctl_workstat(const int& count);
	void carlight_ctl_handshake(const int& count);
	void carlight_ctl_error(const int& count);

/* public member */
public:
	cas2ndagv_io2status();	/* constructor */
	~cas2ndagv_io2status();	/* destructor */

	void run(void);	/* cas 2nd agv io control object main runing */
};

/* Extern Class End */


/* Extern Variables -----------------------------------------*/
/* Extern Variables Begin */
/* Extern Variables End */


/* Function -------------------------------------------------*/
/* Function Begin */
/* Function End */


#endif /*__cas2ndagv_io2status_HPP__ */

/* ***** END OF cas2ndagv_io2status.HPP ***** */