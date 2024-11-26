/** ******************************************************
	* @file		ADAM_HandShake.hpp
	* @author	Tsai,Li-chun
	******************************************************
**	**/

/* Define to prevent recursive inclusi ----------------------*/
#ifndef __ADAM_HandShake_HPP__
#define __ADAM_HandShake_HPP__


/* System Includes ------------------------------------------*/
/* System Includes Begin */
// #include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string>
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
#include "modbus.h"
// #include "adam_for_cas2ndagv_IO_def.h"
#include "adam_for_cas2ndagv_PIN_def.h"
/* User Includes End */


/* Define ---------------------------------------------------*/
/* Define Begin */

/* define terminal color */
#define TC_RESET "\033[0m"			// Normal 
#define TC_ERROR "\033[31m[ERROR] " // Red
#define TC_CLOSE "\x1B[2J\x1B[H "	// close

#define ADAM_HS_structure_ERROR 1
#define ADAM_HS_set_slave_ERROR 2
#define ADAM_HS_connect_ERROR 3

/* Define End */


/* Extern Typedef -------------------------------------------*/
/* Extern Typedef Begin */
/* Extern Typedef End */


/* Extern Class -------------------------------------------*/
/* Extern Class Begin */

/* define ADAM communication control object */
class ADAM_HandShake
{
/* private member */
private:
	/* define return code */
	int rc;
	/* 宣告libmodbus-API的ReturnCode變數 */
	modbus_t *adam;
	/* store error message from try&catch block */
	std::string throw_msg;

/* public member */
public:
	ADAM_HandShake(const char *ip 	= adam_modbus_IP,
				   const int  port 	= adam_modbus_port,
				   const int  slave = adam_modbus_slave	);	/* constructor */
	~ADAM_HandShake();	/* destructor */
	

	int adam_readDI(CAS2ndAGV_input_pin pin, uint8_t *io_status);/* read single digital input */
	int adam_setDO(CAS2ndAGV_output_pin pin, uint8_t status); /* set single digital output */
	int adam_readDO(CAS2ndAGV_output_pin pin, uint8_t *io_status);	/* read single digital output */
};

/* Extern Class End */


/* Extern Variables -----------------------------------------*/
/* Extern Variables Begin */
/* Extern Variables End */


/* Function -------------------------------------------------*/
/* Function Begin */
/* Function End */


#endif /*__ADAM_HandShake_HPP__ */

/* ***** END OF ADAM_HandShake.HPP ***** */
