/** ******************************************************
	* @file		ADAM_HandShake.cpp
	* @author	Tsai,Li-chun
	******************************************************
**	**/


/* System Includes ------------------------------------------*/
/* System Includes Begin */
#include <iostream>
#include <string.h>
#include <stdio.h>
/* System Includes End */
/* User Includes --------------------------------------------*/
/* User Includes Begin */
#include "ADAM_HandShake.hpp"
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

/** * @brief Constructor - TCP Mode
 	* @param ip(char*) Modbus Device IP Address
 	* @param port(int) communication port, default 502
 	* @param slave(int) Modbus Device ID, default 1
 	* @return None
**	**/
ADAM_HandShake::ADAM_HandShake(const char* ip,const int port,const int slave)
{
	throw_msg = "[ADAM_HandShake]";
	/* 初始化modbus通訊設定 */
	adam = modbus_new_tcp(ip,port);
	/* 初始化是否成功判斷 */
	if( adam == 0 )
	{	
#ifdef raw_message
        /* 若初始化失敗,打印訊息,退出程序 */
		std::cout << TC_ERROR << modbus_strerror(errno) << TC_RESET << std::endl;
#endif
		// exit(ADAM_HS_structure_ERROR);
		throw_msg += " create modbus_t structure fail";
		throw std::runtime_error(throw_msg.c_str());
	}
#ifdef raw_message
	else	/* 若初始化成功,打印訊息 */
		std::cout << "Initialize modbus_t Structure Success" << std::endl;
#endif

	/* 設定欲通訊的modbus-slaveID */
	rc = modbus_set_slave(adam,slave);
	if( rc != 0 )
	{	
#ifdef raw_message
        /* 若設定失敗,打印訊息,退出建構函數 */
		std::cout << TC_ERROR << "set modbus slave Failure!" << TC_RESET << std::endl;
#endif
		// exit(ADAM_HS_set_slave_ERROR);
		throw_msg += " set modbus slave fail";
		throw std::runtime_error(throw_msg.c_str());
	}
#ifdef raw_message
	else	/* 若slaveID設定成功,打印訊息 */
		std::cout << "set modbus slave [" << slave << "] Success!" << std::endl;
#endif

	/* 建立連結 */
	rc = modbus_connect(adam);
	if( rc != 0 )
	{
#ifdef raw_message
        /* 若設定失敗,打印訊息,退出建構函數 */
		std::cout << TC_ERROR << "connect modbus Failure!" << std::endl;
		std::cout << "    ==> " << modbus_strerror(errno) << TC_RESET << std::endl;
#endif
		// exit(ADAM_HS_connect_ERROR);
		throw_msg += " connect modbus fail";
		throw std::runtime_error(throw_msg.c_str());
	}
#ifdef raw_message
	else	/* 若連結成功,打印訊息 */
		std::cout << "[Create ADAM_HandShake] connect modbus slave [" << slave << "] Success!" << std::endl;
#endif
}


/** * @brief destructor
 	* @param None
 	* @return None
**	**/
ADAM_HandShake::~ADAM_HandShake()
{
	/* close connect */
	modbus_close(adam);
	/* release the address of the modbus_communication_structure */
	modbus_free(adam);
#ifdef raw_message
	/* 打印關閉訊息 */
	std::cout << "modbus connect close" << std::endl;
#endif
}

/** * @brief read single digital input
 	* @param CAS2ndAGV_input_pin specify the channel to read
 	* @param uint8_t* return the pin status
 	* @return int, result execution
**	**/
int ADAM_HandShake::adam_readDI(CAS2ndAGV_input_pin pin, uint8_t *io_status)
{
	rc = modbus_read_input_bits(adam, static_cast<int>(pin), 1, io_status);
	return rc;
}

/** * @brief set single digital output
 	* @param CAS2ndAGV_output_pin specify the channel to set
 	* @param bool on or off
 	* @return int, result execution
**	**/
int ADAM_HandShake::adam_setDO(CAS2ndAGV_output_pin pin, bool status)
{
	rc = modbus_write_bit(adam, static_cast<int>(pin), status);
	return rc;
}
/** * @brief read single digital output
 	* @param CAS2ndAGV_output_pin specify the channel to read
 	* @param uint8_t* return the pin status
 	* @return int, result execution
**	**/
int ADAM_HandShake::adam_readDO(CAS2ndAGV_output_pin pin, uint8_t *io_status)
{
	rc = modbus_read_bits(adam, static_cast<int>(pin), 1, io_status);
	return rc;
}

/* Program End */
/* ---------------------------------------------------------*/
/* ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ Program ⇧⇧⇧⇧⇧⇧⇧⇧⇧⇧ ---------------------------*/
/* ---------------------------------------------------------*/


/* ***** END OF ADAM_HandShake.cpp ***** */
