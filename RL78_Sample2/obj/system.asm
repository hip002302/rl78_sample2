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
#@   src\system.c
#@  compiled at Wed Apr 17 13:20:52 2024

	.PUBLIC _Clock_Init

	.SECTION .textf,TEXTF
	.TYPE _Clock_Init,function,.LFE1-_Clock_Init
_Clock_Init:
	.STACK _Clock_Init = 4
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
	;***       26 : * File Name    : system.c
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
	;***       63 : * Function Name: Clock_Init
	;***       64 : * Description  : This function initializes the clock generator.
	;***       65 : * Arguments    : none
	;***       66 : * Return Value : none
	;***       67 : ********************************************************************************/
	;***       68 : void Clock_Init( void )
	;***       69 : {
	;***       70 : 	UCHAR	ucsysclocksrc;
	;***       71 : 	UCHAR	ucsysclockfreq;
	;***       72 : 	UCHAR	uccmcinitval;
	;***       73 : 
	;***       74 : 	ucsysclocksrc = SYS_CLOCK_SRC;
	;***       75 : 	if( (ucsysclocksrc == CLOCK_SRC_X1) || (ucsysclocksrc == CLOCK_SRC_EXTERNAL) ) {
	ret
.LFE1:
	;***       76 : 		uccmcinitval = 0x00;
	;***       77 : 		if(ucsysclocksrc == CLOCK_SRC_X1) {
	;***       78 : 			uccmcinitval = CMC_MODE_X1;
	;***       79 : 			ucsysclockfreq = SYS_CLOCK_FREQ;
	;***       80 : 			if(ucsysclockfreq > 10) {
	;***       81 : 				uccmcinitval |= CMC_SYS_CLOCK_OVER_10MHZ;
	;***       82 : 			}
	;***       83 : 			else {
	;***       84 : 				uccmcinitval |= CMC_SYS_CLOCK_UNDER_10MHZ;
	;***       85 : 			}
	;***       86 : 		}
	;***       87 : 		else {
	;***       88 : 			uccmcinitval = CMC_MODE_EXTCLOCK;
	;***       89 : 		}
	;***       90 : 		CMC = uccmcinitval;
	;***       91 : 
	;***       92 : 		/* CSC register setting */
	;***       93 : 		CSC = CSC_INVALID_VAL;
	;***       94 : 
	;***       95 : 		if(ucsysclocksrc == CLOCK_SRC_X1) {
	;***       96 : 			while(OSTC != 0xFF);
	;***       97 : 		}
	;***       98 : 
	;***       99 : 		MCM0 = 1;
	;***      100 : 		while (MCS != 1)		/* Wait Main Clock to be set. */
	;***      101 : 		{
	;***      102 : 			NOP();
	;***      103 : 		}
	;***      104 : 		HIOSTOP  = 1;			/* HOCO operation stop */
	;***      105 : 	}
	;***      106 : 	else if( ucsysclocksrc == CLOCK_SRC_MIDDLESPEED ) {
	;***      107 : 		
	;***      108 : 		switch (SYS_CLOCK_FREQ)
	;***      109 : 		{
	;***      110 : 			case 4:
	;***      111 : 				/* clock is set to 4MHz. */
	;***      112 : 				MOCODIV = 0x00;
	;***      113 : 				
	;***      114 : 				break;
	;***      115 : 				
	;***      116 : 			case 2:
	;***      117 : 				/* clock is set to 2MHz. */
	;***      118 : 				MOCODIV = 0x01;
	;***      119 : 				
	;***      120 : 				break;
	;***      121 : 				
	;***      122 : 			case 1:
	;***      123 : 				/* clock is set to 1MHz. */
	;***      124 : 				MOCODIV = 0x02;
	;***      125 : 				
	;***      126 : 				break;
	;***      127 : 				
	;***      128 : 			default:
	;***      129 : 				break;
	;***      130 : 		}
	;***      131 : 		
	;***      132 : 		/* Clock changing: change to MOCO. */
	;***      133 : 		MIOEN = 1;					/* MOCO operation start */
	;***      134 : 		MCM1 = 1;					/* Set fOCO to MOCO. */
	;***      135 : 		while (MCS1 != 1)			/* Wait fOCO to be set to MOCO. */
	;***      136 : 		{
	;***      137 : 			NOP();
	;***      138 : 		}
	;***      139 : 		HIOSTOP  = 1;				/* HOCO operation stop */
	;***      140 : 	}
	;***      141 : }
