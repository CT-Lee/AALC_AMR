/** ******************************************************
	* @file		cas2ndagv_io2status.cpp
	* @author	Tsai,Li-chun
	******************************************************
**/


/* System Includes ------------------------------------------*/
/* System Includes Begin */
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
#include "cas2ndagv_io2status.hpp"
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

/** * @brief cas2ndagv_io2status object constructor
	* @param None
 	* @return none
**/
cas2ndagv_io2status::cas2ndagv_io2status():
	nh(),
	loop_rate(1)
{
	/* init io2state info publisher objec */
	pub_io2status_in = nh.advertise<delta_amr_message::cas2ndagv_io2state_in>(cas2ndagv_io2state_in_topic, cas2ndagv_io2state_queue_size, this);
	/* init ADAM output publisher object */
	pub_adam_output = nh.advertise<delta_amr_message::cas2ndagv_output_pin>(cas2ndagv_output_pin_topic, cas2ndagv_io2state_queue_size, this);
	/* init io2state info subscriber objec */
	sub_io2status_out = nh.subscribe(cas2ndagv_io2state_out_topic, cas2ndagv_io2state_queue_size, &cas2ndagv_io2status::Sub_TOPIC_cas2ndagv_io2state_out_callback, this);
	/* init ADAM input subscriber object */
	sub_adam_input = nh.subscribe(cas2ndagv_input_pin_topic, cas2ndagv_io2state_queue_size, &cas2ndagv_io2status::Sub_TOPIC_adam_input_callback, this);
	/* init timer interrupt object */
	time_interrupter = nh.createTimer(ros::Duration(running_cycle), &cas2ndagv_io2status::time_interrupter_callback, this);

	cas2ndagv_io2status_out_msg.lidarMAP == CAS2ndAGV_IO_status.lidarMAP.normal_walking;
	cas2ndagv_io2status_out_msg.light == CAS2ndAGV_IO_status.light.standby;

	/* display program running */
	ROS_INFO("[cas2ndagv_io2status_ROS] node startup completed. cas2ndagv_io2status_ROS running...");
}

/** * @brief cas2ndagv_io2status object destructor
	* @param None
 	* @return none
**/
cas2ndagv_io2status::~cas2ndagv_io2status()
{
}


/** * @brief cas2ndagv_io2status object adam output publishe function
	* @param None
 	* @return none
**/
void cas2ndagv_io2status::Pub_TOPIC_adam_output(void)
{
	pub_adam_output.publish(cas2ndagv_out_pin_msg);
}

/** * @brief cas2ndagv_io2status object io-status transform publishe function
	* @param None
 	* @return none
**/
void cas2ndagv_io2status::Pub_TOPIC_cas2ndagv_io2status_in(void)
{
	pub_io2status_in.publish(cas2ndagv_io2status_in_msg);
}

/** * @brief cas2ndagv_io2status object adam input subscriber function
	* @param delta_amr_message::cas2ndagv_input_pin_msg cas2ndagv_input_pin_msg structure
 	* @return none
**/
void cas2ndagv_io2status::Sub_TOPIC_adam_input_callback(const delta_amr_message::cas2ndagv_input_pin& in)
{
	/* if message content has changed */
	if( cas2ndagv_in_pin_msg != in )
	{
		/* update message */
		cas2ndagv_in_pin_msg = in;

		/* determine EMS status */
		if( cas2ndagv_in_pin_msg.in_EMS == static_cast<uint8_t>(AGV_PIN_status_EMS::press) )
		{
			if( cas2ndagv_in_pin_msg.in_manual == static_cast<uint8_t>(AGV_PIN_status_manual::press) )
				cas2ndagv_io2status_in_msg.EMS = CAS2ndAGV_IO_status.EMS.bypass;
			else if( cas2ndagv_in_pin_msg.in_manual == static_cast<uint8_t>(AGV_PIN_status_manual::untie) )
				cas2ndagv_io2status_in_msg.EMS = CAS2ndAGV_IO_status.EMS.emergency_stop;
		}
		else if( cas2ndagv_in_pin_msg.in_EMS == static_cast<uint8_t>(AGV_PIN_status_EMS::untie) )
		{
			cas2ndagv_io2status_in_msg.EMS = CAS2ndAGV_IO_status.EMS.normal;
		}
		else
		{
			cas2ndagv_io2status_in_msg.EMS = CAS2ndAGV_IO_status.EMS.unknown;
		}

		/* determine Lidar OSSD status */
		if( (cas2ndagv_in_pin_msg.in_lidar_F_OSSD == static_cast<uint8_t>(AGV_PIN_status_lidar_OSSD::error)) ||
			(cas2ndagv_in_pin_msg.in_lidar_B_OSSD == static_cast<uint8_t>(AGV_PIN_status_lidar_OSSD::error)) )
		{
			cas2ndagv_io2status_in_msg.lidarOSSD = CAS2ndAGV_IO_status.lidarOSSD.emergency_stop;
		}
		else if( cas2ndagv_in_pin_msg.in_lidar_SlowStop == static_cast<uint8_t>(AGV_PIN_status_lidar_SlowStop::error) )
		{
			cas2ndagv_io2status_in_msg.lidarOSSD = CAS2ndAGV_IO_status.lidarOSSD.slow_stop;
		}
		else if( (cas2ndagv_in_pin_msg.in_lidar_SlowStop == static_cast<uint8_t>(AGV_PIN_status_lidar_SlowStop::pass)) ||
				 (cas2ndagv_in_pin_msg.in_lidar_F_OSSD == static_cast<uint8_t>(AGV_PIN_status_lidar_OSSD::error)) ||
				 (cas2ndagv_in_pin_msg.in_lidar_B_OSSD == static_cast<uint8_t>(AGV_PIN_status_lidar_OSSD::error)) 		)
		{
			cas2ndagv_io2status_in_msg.lidarOSSD = CAS2ndAGV_IO_status.lidarOSSD.normal;
		}
		else
		{
			cas2ndagv_io2status_in_msg.lidarOSSD = CAS2ndAGV_IO_status.lidarOSSD.unknown;
		}
	}
}

/** * @brief cas2ndagv_io2status object io-status transform subscriber function
	* @param delta_amr_message::cas2ndagv_input_pin_msg cas2ndagv_input_pin_msg structure
 	* @return none
**/
void cas2ndagv_io2status::Sub_TOPIC_cas2ndagv_io2state_out_callback(const delta_amr_message::cas2ndagv_io2state_out& io2s_out)
{
	/*  */
	if(cas2ndagv_io2status_out_msg.light != io2s_out.light)
	{
		flash_count = 0;
		cas2ndagv_io2status_out_msg.light = io2s_out.light;
	}
	cas2ndagv_io2status_out_msg.lidarMAP = io2s_out.lidarMAP;
}

/** * @brief cas2ndagv_io2status object timer interrupt callback function
	* @param ros::TimerEvent TimerEvent structure
 	* @return none
**/
void cas2ndagv_io2status::time_interrupter_callback(const ros::TimerEvent& time)
{
	Pub_TOPIC_adam_output();
	Pub_TOPIC_cas2ndagv_io2status_in();
	
	/* determine Lidar map input status */
	if( cas2ndagv_io2status_out_msg.lidarMAP == CAS2ndAGV_IO_status.lidarMAP.normal_walking )
		cas2ndagv_out_pin_msg.out_lidar_mapSW = static_cast<uint8_t>(AGV_PIN_status_lidar_mapSW::normal);
	else if( cas2ndagv_io2status_out_msg.lidarMAP == CAS2ndAGV_IO_status.lidarMAP.workstation1 )
		cas2ndagv_out_pin_msg.out_lidar_mapSW = static_cast<uint8_t>(AGV_PIN_status_lidar_mapSW::workstation);

	/* determine car lights status */
	if( cas2ndagv_io2status_out_msg.light == CAS2ndAGV_IO_status.light.standby )
	{	/* green light stays on */
		carlight_ctl_standby(0);
	}
	else if( cas2ndagv_io2status_out_msg.light == CAS2ndAGV_IO_status.light.straight )
	{	/* green light flashes slowly */
		if( flash_count >= (light_low_flash*2) ) flash_count = 0;
		carlight_ctl_straight(light_low_flash);
	}
	else if( cas2ndagv_io2status_out_msg.light == CAS2ndAGV_IO_status.light.reverse )
	{	/* green light flashes quickly */
		if( flash_count >= (light_high_flash*2) ) flash_count = 0;
		carlight_ctl_reverse(light_high_flash);
	}
	else if( cas2ndagv_io2status_out_msg.light == CAS2ndAGV_IO_status.light.left )
	{	/* green light on left flashes slowly */
		if( flash_count >= (light_low_flash*2) ) flash_count = 0;
		carlight_ctl_left(light_low_flash);
	}
	else if( cas2ndagv_io2status_out_msg.light == CAS2ndAGV_IO_status.light.right )
	{	/* green light on right flashes slowly */
		if( flash_count >= (light_low_flash*2) ) flash_count = 0;
		carlight_ctl_right(light_low_flash);
	}
	else if( cas2ndagv_io2status_out_msg.light == CAS2ndAGV_IO_status.light.charging )
	{	/* yellow light stays on */
		carlight_ctl_charging(0);
	}
	else if( cas2ndagv_io2status_out_msg.light == CAS2ndAGV_IO_status.light.workstation )
	{	/* yellow light flashes slowly */
		if( flash_count >= (light_low_flash*2) ) flash_count = 0;
		carlight_ctl_workstat(light_low_flash);
	}
	else if( cas2ndagv_io2status_out_msg.light == CAS2ndAGV_IO_status.light.handshake )
	{	/* red light flashes quickly */
		if( flash_count >= (light_high_flash*2) ) flash_count = 0;
		carlight_ctl_handshake(light_high_flash);
	}
	else if( cas2ndagv_io2status_out_msg.light == CAS2ndAGV_IO_status.light.error )
	{	/* red light stays on */
		carlight_ctl_error(0);
	}

	flash_count++;
}


/** * @brief cas 2nd agv io-status transform object main runing
	* @param None
 	* @return none
**/
void cas2ndagv_io2status::run(void)
{
	ROS_INFO("cas 2nd agv io-status transform object main runing...");
	loop_rate.sleep();
}


void cas2ndagv_io2status::carlight_ctl_standby(const int& count)
{	/* green light stays on */
	cas2ndagv_out_pin_msg.out_green_light_L = static_cast<uint8_t>(AGV_PIN_status_light::light);
	cas2ndagv_out_pin_msg.out_green_light_R = static_cast<uint8_t>(AGV_PIN_status_light::light);
	cas2ndagv_out_pin_msg.out_red_light = static_cast<uint8_t>(AGV_PIN_status_light::dim);
}
void cas2ndagv_io2status::carlight_ctl_straight(const int& count)
{	/* green light flashes slowly */
	cas2ndagv_out_pin_msg.out_red_light = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	if( flash_count < count )
	{
		cas2ndagv_out_pin_msg.out_green_light_L = static_cast<uint8_t>(AGV_PIN_status_light::light);
		cas2ndagv_out_pin_msg.out_green_light_R = static_cast<uint8_t>(AGV_PIN_status_light::light);
	}
	else if( flash_count < (count*2) )
	{
		cas2ndagv_out_pin_msg.out_green_light_L = static_cast<uint8_t>(AGV_PIN_status_light::dim);
		cas2ndagv_out_pin_msg.out_green_light_R = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	}
}
void cas2ndagv_io2status::carlight_ctl_reverse(const int& count)
{	/* green light flashes quickly */
	cas2ndagv_out_pin_msg.out_red_light = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	if( flash_count < count )
	{
		cas2ndagv_out_pin_msg.out_green_light_L = static_cast<uint8_t>(AGV_PIN_status_light::light);
		cas2ndagv_out_pin_msg.out_green_light_R = static_cast<uint8_t>(AGV_PIN_status_light::light);
	}
	else if( flash_count < (count*2) )
	{
		cas2ndagv_out_pin_msg.out_green_light_L = static_cast<uint8_t>(AGV_PIN_status_light::dim);
		cas2ndagv_out_pin_msg.out_green_light_R = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	}
}
void cas2ndagv_io2status::carlight_ctl_left(const int& count)
{	/* green light on right flashes slowly */
	cas2ndagv_out_pin_msg.out_red_light = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	cas2ndagv_out_pin_msg.out_green_light_R = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	if( flash_count < count )
	{
		cas2ndagv_out_pin_msg.out_green_light_L = static_cast<uint8_t>(AGV_PIN_status_light::light);
	}
	else if( flash_count < (count*2) )
	{
		cas2ndagv_out_pin_msg.out_green_light_L = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	}
}
void cas2ndagv_io2status::carlight_ctl_right(const int& count)
{
	cas2ndagv_out_pin_msg.out_red_light = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	cas2ndagv_out_pin_msg.out_green_light_L = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	if( flash_count < count )
	{
		cas2ndagv_out_pin_msg.out_green_light_R = static_cast<uint8_t>(AGV_PIN_status_light::light);
	}
	else if( flash_count < (count*2) )
	{
		cas2ndagv_out_pin_msg.out_green_light_R = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	}
}
void cas2ndagv_io2status::carlight_ctl_charging(const int& count)
{	/* yellow light stays on */
	cas2ndagv_out_pin_msg.out_green_light_L = static_cast<uint8_t>(AGV_PIN_status_light::light);
	cas2ndagv_out_pin_msg.out_green_light_R = static_cast<uint8_t>(AGV_PIN_status_light::light);
	cas2ndagv_out_pin_msg.out_red_light = static_cast<uint8_t>(AGV_PIN_status_light::light);
}
void cas2ndagv_io2status::carlight_ctl_workstat(const int& count)
{	/* yellow light flashes slowly */
	if( flash_count < count )
	{
		cas2ndagv_out_pin_msg.out_green_light_L = static_cast<uint8_t>(AGV_PIN_status_light::light);
		cas2ndagv_out_pin_msg.out_green_light_R = static_cast<uint8_t>(AGV_PIN_status_light::light);
		cas2ndagv_out_pin_msg.out_red_light = static_cast<uint8_t>(AGV_PIN_status_light::light);
	}
	else if( flash_count < (count*2) )
	{
		cas2ndagv_out_pin_msg.out_green_light_L = static_cast<uint8_t>(AGV_PIN_status_light::dim);
		cas2ndagv_out_pin_msg.out_green_light_R = static_cast<uint8_t>(AGV_PIN_status_light::dim);
		cas2ndagv_out_pin_msg.out_red_light = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	}
}
void cas2ndagv_io2status::carlight_ctl_handshake(const int& count)
{	/* red light flashes quickly */
	cas2ndagv_out_pin_msg.out_green_light_L = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	cas2ndagv_out_pin_msg.out_green_light_R = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	if( flash_count < count )
	{
		cas2ndagv_out_pin_msg.out_red_light = static_cast<uint8_t>(AGV_PIN_status_light::light);
	}
	else if( flash_count < (count*2) )
	{
		cas2ndagv_out_pin_msg.out_red_light = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	}
}
void cas2ndagv_io2status::carlight_ctl_error(const int& count)
{	/* red light stays on */
	cas2ndagv_out_pin_msg.out_green_light_L = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	cas2ndagv_out_pin_msg.out_green_light_R = static_cast<uint8_t>(AGV_PIN_status_light::dim);
	cas2ndagv_out_pin_msg.out_red_light = static_cast<uint8_t>(AGV_PIN_status_light::light);
}

/* Program End */
/* ---------------------------------------------------------*/
/* ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ Program ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ ---------------------------*/
/* ---------------------------------------------------------*/


/* ***** END OF cas2ndagv_io2status.cpp ***** */