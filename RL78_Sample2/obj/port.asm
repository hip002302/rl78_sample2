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
#@   src\port.c
#@  compiled at Wed Apr 17 13:20:51 2024

	.PUBLIC _PORT_Init

	.SECTION .textf,TEXTF
	.TYPE _PORT_Init,function,.LFE1-_PORT_Init
_PORT_Init:
	.STACK _PORT_Init = 4
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
	;***       26 : * File Name    : port.c
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
	;***       40 : #include "port.h"
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
	;***       63 : * Function Name: PORT_Init
	;***       64 : * Description  : This function initializes the I/O port module.
	;***       65 : * Arguments    : none
	;***       66 : * Return Value : none
	;***       67 : ********************************************************************************/
	;***       68 : void PORT_Init( void )
	movw de, #0x0030
	;***       69 : {
	;***       70 : 	/* Initialize the port output mode register 0 */
	;***       71 : 	POM0 = 0x00;
	mov [de+0x20], #0x00
	;***       72 : 	POM2 = 0x00;
	mov [de+0x22], #0x00
	;***       73 : 	POM3 = 0x00;
	mov [de+0x23], #0x00
	;***       74 : 	POM4 = 0x00;
	mov [de+0x24], #0x00
	;***       75 : 	POM5 = 0x00;
	mov [de+0x25], #0x00
	;***       76 : 	/* Initialize the port registers */
	;***       77 : 	P0 = INIT_P0;
	clrb 0xFFF00
	;***       78 : 	P2 = INIT_P2;
	clrb 0xFFF02
	;***       79 : 	P3 = INIT_P3;
	clrb 0xFFF03
	;***       80 : 	P4 = INIT_P4;
	clrb 0xFFF04
	;***       81 : 	P5 = INIT_P5;
	clrb 0xFFF05
	;***       82 : 
	;***       83 : 	/* Initialize the pull-up resistor option registers */
	;***       84 : 	PU0 = INIT_PU0;
	mov [de+0x00], #0x00
	;***       85 : 	PU3 = INIT_PU3;
	mov [de+0x03], #0x00
	;***       86 : 	PU4 = INIT_PU4;
	mov [de+0x04], #0x00
	;***       87 : 	PU5 = INIT_PU5;
	mov [de+0x05], #0x00
	;***       88 : 	PU12 = INIT_PU12;
	mov [de+0x0C], #0x00
	;***       89 : 
	;***       90 : 	/* Initialize the mode registers */
	;***       91 : 	PM0 = INIT_PM0;
	mov 0xFFF20, #0xFF
	;***       92 : 	PM2 = INIT_PM2;
	mov 0xFFF22, #0xFF
	;***       93 : 	PM3 = INIT_PM3;
	mov 0xFFF23, #0xF0
	;***       94 : 	PM4 = INIT_PM4;
	mov 0xFFF24, #0xFF
	;***       95 : 	PM5 = INIT_PM5;
	mov 0xFFF25, #0xE1
	;***       96 : 
	;***       97 : 	/* Initialize the port mode control register 0 */
	;***       98 : 	PMC0 = INIT_PMC0;
	mov [de+0x30], #0xFC
	;***       99 : 	PMC2 = INIT_PMC2;
	mov [de+0x32], #0xF0
	;***      100 : 	PMC3 = INIT_PMC3;
	mov [de+0x33], #0xF0
	;***      101 : 	PMC5 = INIT_PMC5;
	mov [de+0x35], #0xBF
	ret
.LFE1:
	;***      102 : }
