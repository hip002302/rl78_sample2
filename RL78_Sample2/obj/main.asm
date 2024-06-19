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
#@   src\main.c
#@  compiled at Wed Apr 17 13:20:50 2024

	.PUBLIC _main
	.PUBLIC _main_loop
	.EXTERN _hdwinit
	.EXTERN _panel_init0
	.EXTERN _panel
	.EXTERN _WDT_Reset
	.EXTERN _TM_10ms

	.SECTION .textf,TEXTF
	.TYPE _main,function,.LFE1-_main
_main:
	.STACK _main = 4
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
	;***       26 : * File Name    : main.c
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
	;***       41 : #include "port.h"
	;***       42 : #include "timer.h"
	;***       43 : #include "watchdogtimer.h"
	;***       44 : #include "panel.h"
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
	;***       61 : void main( void );
	;***       62 : 
	;***       63 : /*******************************************************************************
	;***       64 : Private variables and functions
	;***       65 : *******************************************************************************/
	;***       66 : void main_loop( void );
	;***       67 : 
	;***       68 : /*******************************************************************************
	;***       69 : * Function Name: main
	;***       70 : * Description  : main funtion
	;***       71 : * Arguments    : none
	;***       72 : * Return Value : none
	;***       73 : ********************************************************************************/
	;***       74 : void main( void )
	;***       75 : {
	;***       76 : 	/* Hardware Initiate */
	;***       77 : 	hdwinit();
	call !!_hdwinit
	;***       78 : 
	;***       79 : 	/* Panel Initiate */
	;***       80 : 	panel_init0();
	call !!_panel_init0
.LFE1:
	.TYPE _main_loop,function,.LFE2-_main_loop
_main_loop:
	.STACK _main_loop = 4
.BB@LABEL@2_1:	; bb4
	;***       81 : 
	;***       82 : 	/* Main Loop */
	;***       83 : 	main_loop();
	;***       84 : }
	;***       85 : 
	;***       86 : /*******************************************************************************
	;***       87 : * Function Name: main_loop
	;***       88 : * Description  : This function is Macro Driver main.
	;***       89 : * Arguments    : none
	;***       90 : * Return Value : none
	;***       91 : ********************************************************************************/
	;***       92 : void main_loop( void )
	;***       93 : {
	;***       94 : 	while(1) {
	;***       95 : 
	;***       96 : 		/* Panel proccessing */
	;***       97 : 		panel();
	call !!_panel
	;***       98 : 
	;***       99 : 		/* Watchdog timer reset start */
	;***      100 : 		WDT_Reset();
	call !!_WDT_Reset
	;***      101 : 
	;***      102 : #if !defined PWM_USED
	;***      103 : 		/* Processing at 10ms cycle */
	;***      104 : 		if(TM_10ms()){
	call !!_TM_10ms
	br $.BB@LABEL@2_1
.LFE2:
	;***      105 : 			
	;***      106 : 		}
	;***      107 : #endif /* end of defined PWM_USED */
	;***      108 : 	}
	;***      109 : 
	;***      110 : }
