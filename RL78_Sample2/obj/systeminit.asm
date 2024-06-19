#CC-RL Compiler RL78 Assembler Source
#@  CC-RL Version : V1.13.00  [30 Nov 2023]
#@  Commmand :
#@   -cpu=S3
#@   -obj_path=.\obj\
#@   -asm_path=.\obj\
#@   -dev=C:\Program Files (x86)\Renesas Electronics\Applilet EZ PL for RL78 V2.20\Tools\BIN\..\..\Tools\DEV\DR5F1058A.DVF
#@   -c
#@   -I C:\Program Files (x86)\Renesas Electronics\CS+\CC\CC-RL\V1.13.00\inc,.\include
#@   -Osize
#@   -pass_source
#@   src\systeminit.c
#@  compiled at Wed Apr 17 13:20:52 2024

	.PUBLIC _SystemInit
	.EXTERN _Clock_Init
	.EXTERN _PORT_Init
	.EXTERN _WDT_Init
	.EXTERN _INT_Init
	.EXTERN _TM00_Init
	.PUBLIC _hdwinit

	.SECTION .textf,TEXTF
	.TYPE _SystemInit,function,.LFE1-_SystemInit
_SystemInit:
	.STACK _SystemInit = 4
	;***        1 : /*******************************************************************************
	;***        2 : * DISCLAIMER
	;***        3 : * This software is supplied by Renesas Electronics Corporation and is only
	;***        4 : * intended for use with Renesas products. No other uses are authorized. This
	;***        5 : * software is owned by Renesas Electronics Corporation and is protected under
	;***        6 : * all applicable laws, including copyright laws.
	;***        7 : * THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS MAKES NO WARRANTIES REGARDING
	;***        8 : * THIS SOFTWARE, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING BUT NOT
	;***        9 : * LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
	;***       10 : * AND NON-INFRINGEMENT. ALL SUCH WARRANTIES ARE EXPRESSLY DISCLAIMED.
	;***       11 : * TO THE MAXIMUM EXTENT PERMITTED NOT PROHIBITED BY LAW, NEITHER RENESAS
	;***       12 : * ELECTRONICS CORPORATION NOR ANY OF ITS AFFILIATED COMPANIES SHALL BE LIABLE
	;***       13 : * FOR ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES FOR
	;***       14 : * ANY REASON RELATED TO THIS SOFTWARE, EVEN IF RENESAS OR ITS AFFILIATES HAVE
	;***       15 : * BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
	;***       16 : * Renesas reserves the right, without notice, to make changes to this software
	;***       17 : * and to discontinue the availability of this software. By using this software,
	;***       18 : * you agree to the additional terms and conditions found by accessing the
	;***       19 : * following link:
	;***       20 : * http://www.renesas.com/disclaimer
	;***       21 : *
	;***       22 : * Copyright (C) 2016 Renesas Electronics Corporation. All rights reserved.
	;***       23 : *******************************************************************************/
	;***       24 : 
	;***       25 : /*******************************************************************************
	;***       26 : * File Name    : systeminit.c
	;***       27 : * Version      : Applilet EZ PL for RL78
	;***       28 : * Device(s)    : R5F1056A,R5F1057A,R5F1058A
	;***       29 : * Tool-Chain   : CC-RL
	;***       30 : * Description  : This file implements main function.
	;***       31 : * Creation Date: 2016/09/14
	;***       32 : *******************************************************************************/
	;***       33 : 
	;***       34 : /*******************************************************************************
	;***       35 : Includes <System Includes> , "Project Includes"
	;***       36 : *******************************************************************************/
	;***       37 : #include "sfr.h"
	;***       38 : #include "common.h"
	;***       39 : #include "config.h"
	;***       40 : #include "system.h"
	;***       41 : #include "int.h"
	;***       42 : #include "port.h"
	;***       43 : #include "timer.h"
	;***       44 : #include "watchdogtimer.h"
	;***       45 : 
	;***       46 : /*******************************************************************************
	;***       47 : Macro definitions
	;***       48 : *******************************************************************************/
	;***       49 : 
	;***       50 : /*******************************************************************************
	;***       51 : Typedef definitions
	;***       52 : *******************************************************************************/
	;***       53 : 
	;***       54 : /*******************************************************************************
	;***       55 : Imported global variables and functions (from other files)
	;***       56 : *******************************************************************************/
	;***       57 : 
	;***       58 : /*******************************************************************************
	;***       59 : Exported global variables and functions (to be accessed by other files)
	;***       60 : *******************************************************************************/
	;***       61 : 
	;***       62 : /*******************************************************************************
	;***       63 : Private variables and functions
	;***       64 : *******************************************************************************/
	;***       65 : 
	;***       66 : /*******************************************************************************
	;***       67 : * Function Name: SystemInit
	;***       68 : * Description  : This function initializes every Macro.
	;***       69 : * Arguments    : none
	;***       70 : * Return Value : none
	;***       71 : ********************************************************************************/
	;***       72 : void SystemInit( void )
	movw de, #0x0075
	;***       73 : {
	;***       74 : 	/* Initialize the peripheral I/O Redirection registers */
	;***       75 : 	PIOR0 = 0x00;
	mov [de+0x02], #0x00
	;***       76 : 	PIOR1 = 0x00;
	mov [de+0x04], #0x00
	;***       77 : 	PIOR2 = 0x00;
	mov [de+0x00], #0x00
	;***       78 : 	PIOR3 = 0x00;
	mov [de+0x07], #0x00
	;***       79 : 	/* Peripheral Enable Register initiate */
	;***       80 : 	PER0 = 0x00;
	mov [de+0x7B], #0x00
	;***       81 : 	PER1 = 0x00;
	mov [de+0x85], #0x00
	;***       82 : 	PER2 = 0x00;
	mov [de+0x87], #0x00
	;***       83 : 	/* Clock generator initiate */
	;***       84 : 	Clock_Init();
	call !!_Clock_Init
	;***       85 : 	
	;***       86 : 	/* Port initiate */
	;***       87 : 	PORT_Init();
	call !!_PORT_Init
	;***       88 : 	
	;***       89 : 	/* WDT initiate */
	;***       90 : 	WDT_Init();
	call !!_WDT_Init
	;***       91 : 	
	;***       92 : 	/* INT initiate */
	;***       93 : 	INT_Init();
	call !!_INT_Init
	;***       94 : 	
	;***       95 : #if !defined PWM_USED
	;***       96 : 	/* TM00 initiate */
	;***       97 : 	TM00_Init();
	br !!_TM00_Init
.LFE1:
	.TYPE _hdwinit,function,.LFE2-_hdwinit
_hdwinit:
	.STACK _hdwinit = 4
	;***       98 : #endif /* end of defined PWM_USED */
	;***       99 : }
	;***      100 : 
	;***      101 : /*******************************************************************************
	;***      102 : * Function Name: hdwinit
	;***      103 : * Description  : This function initializes hardware settings.
	;***      104 : * Arguments    : none
	;***      105 : * Return Value : none
	;***      106 : ********************************************************************************/
	;***      107 : void hdwinit( void )
	;***      108 : {
	;***      109 : 	__DI( );
	di
	;***      110 : 	SystemInit( );
	call $!_SystemInit
	;***      111 : 	__EI( );
	ei
	ret
.LFE2:
	;***      112 : }
