/** ******************************************************
	* @file		cas2ndagv_io_ctl.hpp
	* @author	Tsai,Li-chun
	******************************************************
**/

/* Define to prevent recursive inclusi ----------------------*/
#ifndef __cas2ndagv_io_ctl_HPP__
#define __cas2ndagv_io_ctl_HPP__


/* System Includes ------------------------------------------*/
/* System Includes Begin */
#include <ros/ros.h>
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
#include "ADAM_HandShake.hpp"
#include "delta_amr_message/cas2ndagv_input_pin.h"
#include "delta_amr_message/cas2ndagv_output_pin.h"
/* User Includes End */


/* Define ---------------------------------------------------*/
/* Define Begin */
/* Define End */


/* Extern Typedef -------------------------------------------*/
/* Extern Typedef Begin */

#define cas2ndagv_input_pin_topic "cas2ndagv_input_pin"
#define cas2ndagv_output_pin_topic "cas2ndagv_output_pin"
#define cas2ndagv_pin_queue_size 100
#define running_cycle 0.1

/* Extern Typedef End */


/* Extern Class -------------------------------------------*/
/* Extern Class Begin */

/* define cas 2nd agv io control object */
class cas2ndagv_io_ctl
{
/* private member */
private:
	/* define return code */
	int rc;
	/* create ADAM control object */
	ADAM_HandShake ADAM_HS;
	/* create ros node handle */
	ros::NodeHandle nh;
	/* create ADAM input publisher object */
	ros::Publisher pub_adam_input;
	/* create ADAM output subscriber object */
	ros::Subscriber sub_adam_output;
	/* create ros timer interrupt object */
	ros::Timer time_interrupter;

	delta_amr_message::cas2ndagv_input_pin cas2ndagv_in_pin;
	delta_amr_message::cas2ndagv_output_pin cas2ndagv_out_pin;

	void cas2ndagv_in_program(void);
	void read_in_lidar_F_OSS(void);
	void read_in_lidar_B_OSS(void);
	void read_in_EMS(void);
	void read_in_manual(void);
	void read_in_lidar_SlowSto(void);

	void cas2ndagv_out_program(void);
	void write_out_green_light_L(AGV_PIN_status_light);
	void write_out_green_light_R(AGV_PIN_status_light);
	void write_out_red_light(AGV_PIN_status_light);
	void write_out_lidar_mapSW(AGV_PIN_status_lidar_mapSW);

	void Pub_TOPIC_adam_input(void);
	void Sub_TOPIC_adam_output_callback(const delta_amr_message::cas2ndagv_output_pin& in);
	void time_interrupter_callback(const ros::TimerEvent& time);

/* public member */
public:
	cas2ndagv_io_ctl();		/* constructor */
	~cas2ndagv_io_ctl();	/* destructor */

	void run(void);	/* cas 2nd agv io control object main runing */
};

/* Extern Class End */


/* Extern Variables -----------------------------------------*/
/* Extern Variables Begin */
/* Extern Variables End */


/* Function -------------------------------------------------*/
/* Function Begin */
/* Function End */


#endif /*__cas2ndagv_io_ctl_HPP__ */

/* ***** END OF cas2ndagv_io_ctl.HPP ***** */