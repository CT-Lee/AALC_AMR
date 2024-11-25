/** ******************************************************
	* @file		cas2ndagv_io_ctl.cpp
	* @author	Tsai,Li-chun
	******************************************************
**/


/* System Includes ------------------------------------------*/
/* System Includes Begin */
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
#include "cas2ndagv_io_ctl.hpp"
#include "delta_amr_message/cas2ndagv_input_pin.h"
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

/** * @brief cas2ndagv_io_ctl object constructor
	* @param None
 	* @return none
**/
cas2ndagv_io_ctl::cas2ndagv_io_ctl():
	nh(),
	loop_rate(1)
{
	/* init ADAM input publisher object */
	pub_adam_input = nh.advertise<delta_amr_message::cas2ndagv_input_pin>(cas2ndagv_input_pin_topic, cas2ndagv_pin_queue_size, this);
	/* init ADAM output subscriber object */
	sub_adam_output = nh.subscribe(cas2ndagv_output_pin_topic, cas2ndagv_pin_queue_size, &cas2ndagv_io_ctl::Sub_TOPIC_adam_output_callback, this);
	/* init timer interrupt object */
	time_interrupter = nh.createTimer(ros::Duration(running_cycle), &cas2ndagv_io_ctl::time_interrupter_callback, this);
}

/** * @brief cas2ndagv_io_ctl object destructor
	* @param None
 	* @return none
**/
cas2ndagv_io_ctl::~cas2ndagv_io_ctl()
{
}

/** * @brief cas2ndagv_io_ctl object handle the ADAM input program
	* @param None
 	* @return none
**/
void cas2ndagv_io_ctl::cas2ndagv_in_program(void)
{
	read_in_lidar_F_OSS();
	read_in_lidar_B_OSS();
	read_in_EMS();
	read_in_manual();
	read_in_lidar_SlowSto();
	Pub_TOPIC_adam_input();
}
void cas2ndagv_io_ctl::read_in_lidar_F_OSS(void)
{
	ADAM_HS.adam_readDI(CAS2ndAGV_input_pin::in_lidar_F_OSSD1, &cas2ndagv_in_pin.in_lidar_F_OSSD);
}
void cas2ndagv_io_ctl::read_in_lidar_B_OSS(void)
{
	ADAM_HS.adam_readDI(CAS2ndAGV_input_pin::in_lidar_B_OSSD1, &cas2ndagv_in_pin.in_lidar_B_OSSD);
}
void cas2ndagv_io_ctl::read_in_EMS(void)
{
	ADAM_HS.adam_readDI(CAS2ndAGV_input_pin::in_EMS, &cas2ndagv_in_pin.in_EMS);
}
void cas2ndagv_io_ctl::read_in_manual(void)
{
	ADAM_HS.adam_readDI(CAS2ndAGV_input_pin::in_manual, &cas2ndagv_in_pin.in_manual);
}
void cas2ndagv_io_ctl::read_in_lidar_SlowSto(void)
{
	ADAM_HS.adam_readDI(CAS2ndAGV_input_pin::in_lidar_SlowStop, &cas2ndagv_in_pin.in_lidar_SlowStop);
}

/** * @brief cas2ndagv_io_ctl object handle the ADAM output program
	* @param None
 	* @return none
**/
void cas2ndagv_io_ctl::cas2ndagv_out_program(void)
{
	write_out_green_light_L(static_cast<AGV_PIN_status_light>(cas2ndagv_out_pin.out_green_light_L));
	write_out_green_light_R(static_cast<AGV_PIN_status_light>(cas2ndagv_out_pin.out_green_light_R));
	write_out_red_light(static_cast<AGV_PIN_status_light>(cas2ndagv_out_pin.out_red_light));
	write_out_lidar_mapSW(static_cast<AGV_PIN_status_lidar_mapSW>(cas2ndagv_out_pin.out_lidar_mapSW));
}
void cas2ndagv_io_ctl::write_out_green_light_L(AGV_PIN_status_light light_status)
{
	ADAM_HS.adam_setDO(CAS2ndAGV_output_pin::out_green_light_L, static_cast<uint8_t>(light_status));
}
void cas2ndagv_io_ctl::write_out_green_light_R(AGV_PIN_status_light light_status)
{
	ADAM_HS.adam_setDO(CAS2ndAGV_output_pin::out_green_light_L, static_cast<uint8_t>(light_status));
}
void cas2ndagv_io_ctl::write_out_red_light(AGV_PIN_status_light light_status)
{
	ADAM_HS.adam_setDO(CAS2ndAGV_output_pin::out_green_light_L, static_cast<uint8_t>(light_status));
}
void cas2ndagv_io_ctl::write_out_lidar_mapSW(AGV_PIN_status_lidar_mapSW mapSW_status)
{
	ADAM_HS.adam_setDO(CAS2ndAGV_output_pin::out_green_light_L, static_cast<uint8_t>(mapSW_status));
}

/** * @brief cas2ndagv_io_ctl object publishe function
	* @param None
 	* @return none
**/
void cas2ndagv_io_ctl::Pub_TOPIC_adam_input(void)
{
	pub_adam_input.publish(cas2ndagv_in_pin);
}

/** * @brief cas2ndagv_io_ctl object subscribe callback function
	* @param delta_amr_message::cas2ndagv_output_pin cas2ndagv_output_pin structure
 	* @return none
**/
void cas2ndagv_io_ctl::Sub_TOPIC_adam_output_callback(const delta_amr_message::cas2ndagv_output_pin& out)
{
	cas2ndagv_out_pin = out;
}

/** * @brief cas2ndagv_io_ctl object timer interrupt callback function
	* @param ros::TimerEvent TimerEvent structure
 	* @return none
**/
void cas2ndagv_io_ctl::time_interrupter_callback(const ros::TimerEvent& time)
{
	cas2ndagv_in_program();
	cas2ndagv_out_program();
}


/** * @brief cas 2nd agv io control object main runing
	* @param None
 	* @return none
**/
void cas2ndagv_io_ctl::run(void)
{
	ROS_INFO("cas 2nd agv io control object main runing...");
	loop_rate.sleep();
}


/* Program End */
/* ---------------------------------------------------------*/
/* ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ Program ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ ---------------------------*/
/* ---------------------------------------------------------*/


/* ***** END OF cas2ndagv_io_ctl.cpp ***** */