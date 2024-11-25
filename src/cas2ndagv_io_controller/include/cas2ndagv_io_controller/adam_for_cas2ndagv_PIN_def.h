/** ******************************************************
	* @file		adam_for_cas2ndagv_PIN_def.hpp
	* @author	Tsai,Li-chun
	******************************************************
**	**/

/* Define to prevent recursive inclusi ----------------------*/
#ifndef __adam_for_cas2ndagv_PIN_def_H__
#define __adam_for_cas2ndagv_PIN_def_H__


/* System Includes ------------------------------------------*/
/* System Includes Begin */
#include <stdint.h>
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
/* User Includes End */


/* Define ---------------------------------------------------*/
/* Define Begin */

/* define adam modbus net information */
#define adam_modbus_IP "192.168.1.122"
#define adam_modbus_port 502
#define adam_modbus_slave 1

/* Define End */


/* Extern Class -------------------------------------------*/
/* Extern Class Begin */

/* define adam slot2&3 DI module modbus address */
enum class CAS2ndAGV_input_pin: uint16_t
{
	in_lidar_F_OSSD1 = 16,	/* slot2-DI0 */
	in_lidar_F_OSSD2 = 17,	/* slot2-DI1 */
	in_lidar_B_OSSD1 = 18,	/* slot2-DI2 */
	in_lidar_B_OSSD2 = 19,	/* slot2-DI3 */
	in_EMS 		  	 = 21,	/* slot2-DI5 */
	in_manual 		 = 22,	/* slot2-DI6 */
	in_lidar_SlowStop= 23	/* slot2-DI7 */
};
enum class CAS2ndAGV_output_pin: uint16_t
{
	out_green_light_L = 32,	/* slot3-DI0 */
	out_green_light_R = 33,	/* slot3-DI0 */
	out_red_light 	  = 34,	/* slot3-DI2 */
	out_lidar_mapSW   = 35	/* slot3-DI3 */
};
/* define CAS 2nd AGV LiDAR OSSD pin status. */
enum class AGV_PIN_status_lidar_OSSD: uint8_t
{
	error = 0,
	pass = 1
};
/* define CAS 2nd AGV LiDAR OSSD pin status. */
enum class AGV_PIN_status_lidar_SlowStop: uint8_t
{
	pass = 0,
	error = 1
};
/* define CAS 2nd AGV EMS pin status. */
enum class AGV_PIN_status_EMS: uint8_t
{
	press = 0,
	untie = 1
};
/* define CAS 2nd AGV manual pin status. */
enum class AGV_PIN_status_manual: uint8_t
{
	untie = 0,
	press = 1
};
/* define CAS 2nd AGV light pin status. */
enum class AGV_PIN_status_light: uint8_t
{
	dim = 0,
	light = 1
};
/* define CAS 2nd AGV lidar_mapSW pin status. */
enum class AGV_PIN_status_lidar_mapSW: uint8_t
{
	normal = 0,
	workstation = 1
};

/* Extern Class End */


/* Extern Typedef -------------------------------------------*/
/* Extern Typedef Begin */
/* Extern Typedef End */

/* Extern Variables -----------------------------------------*/
/* Extern Variables Begin */
/* Extern Variables End */


/* Function -------------------------------------------------*/
/* Function Begin */
/* Function End */


#endif /*__adam_for_cas2ndagv_PIN_def_H__ */

/* ***** END OF adam_for_cas2ndagv_PIN_def.HPP ***** */