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
#@   src\watchdogtimer.c
#@  compiled at Wed Apr 17 13:20:52 2024

	.PUBLIC _WDT_Init
	.PUBLIC _WDT_Reset

	.SECTION .textf,TEXTF
	.TYPE _WDT_Init,function,.LFE1-_WDT_Init
_WDT_Init:
	.STACK _WDT_Init = 4
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
	;***       26 : * File Name    : watchdogtimer.c
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
	;***       40 : #include "watchdogtimer.h"
	;***       41 : 
	;***       42 : /*******************************************************************************
	;***       43 : Macro definitions
	;***       44 : *******************************************************************************/
	;***       45 : 
	;***       46 : /*******************************************************************************
	;***       47 : Typedef definitions
	;***       48 : *******************************************************************************/
	;***       49 : 
	;***       50 : /*******************************************************************************
	;***       51 : Imported global variables and functions (from other files)
	;***       52 : *******************************************************************************/
	;***       53 : 
	;***       54 : /*******************************************************************************
	;***       55 : Exported global variables and functions (to be accessed by other files)
	;***       56 : *******************************************************************************/
	;***       57 : 
	;***       58 : /*******************************************************************************
	;***       59 : Private variables and functions
	;***       60 : *******************************************************************************/
	;***       61 : 
	;***       62 : /*******************************************************************************
	;***       63 : * Function Name: WDT_Init
	;***       64 : * Description  : This function initializes watchdogtimer module.
	;***       65 : * Arguments    : none
	;***       66 : * Return Value : none
	;***       67 : ********************************************************************************/
	;***       68 : void WDT_Init( void )
	ret
.LFE1:
	.TYPE _WDT_Reset,function,.LFE2-_WDT_Reset
_WDT_Reset:
	.STACK _WDT_Reset = 4
	;***       69 : {
	;***       70 :     /*                                            */
	;***       71 : 	/* WDT is set by the option byte in RL78/G11. */
	;***       72 :     /*                                            */
	;***       73 : }
	;***       74 : 
	;***       75 : /*******************************************************************************
	;***       76 : * Function Name: WDT_Reset
	;***       77 : * Description  : This function watchdogtimer reset start.
	;***       78 : * Arguments    : none
	;***       79 : * Return Value : none
	;***       80 : ********************************************************************************/
	;***       81 : void WDT_Reset( void )
	;***       82 : {
	;***       83 : 	WDTE = 0x0AC;		/* Watchdog timer reset start */
	mov 0xFFFAB, #0xAC
	ret
.LFE2:
	;***       84 : }
