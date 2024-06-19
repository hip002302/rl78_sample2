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
#@   src\panel.c
#@  compiled at Wed Apr 17 13:20:53 2024

	.EXTERN _fTrg10ms
	.PUBLIC _I_18
	.PUBLIC _F0416
	.PUBLIC _F0614
	.PUBLIC _F0615
	.PUBLIC _F0617
	.PUBLIC _F0618
	.PUBLIC _F0619
	.PUBLIC _F0620
	.PUBLIC _F0914
	.PUBLIC _F0915
	.PUBLIC _F0916
	.PUBLIC _F0917
	.PUBLIC _F0918
	.PUBLIC _F0919
	.PUBLIC _F0920
	.PUBLIC _F1321
	.PUBLIC _panel_init0
	.EXTERN _DGIN_Initialize
	.EXTERN _DGIN_Counter
	.EXTERN _BCNT_Initialize
	.EXTERN _IC74HC4511_Initialize
	.PUBLIC _panel
	.EXTERN _DGIN_Counter_Clear
	.EXTERN _BCNT_Counter_Clear
	.EXTERN _IC74HC4511_Counter_Clear
	.EXTERN _DGIN_getValue
	.EXTERN _BCNT_Evaluate
	.EXTERN _BCNT_Counter
	.EXTERN _IC_74HC4511_Judge_State
	.EXTERN _IC_74HC4511_Evaluate
	.EXTERN _IC74HC4511_Counter
	.EXTERN _DGOUT_setValue

	.SECTION .textf,TEXTF
	.TYPE _panel_init0,function,.LFE1-_panel_init0
_panel_init0:
	.STACK _panel_init0 = 4
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
	;***       26 : * File Name    : panel.c
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
	;***       40 : #include "panel.h"
	;***       41 : 
	;***       42 : /*******************************************************************************
	;***       43 : Exported global variables and functions (to be accessed by other files)
	;***       44 : *******************************************************************************/
	;***       45 : #if defined DTC_USED || defined STANDBY_USED
	;***       46 : #pragma address dtc_vectortable = VECTOR_ADDRESS
	;***       47 : UCHAR __near dtc_vectortable[40];
	;***       48 : #pragma address dtc_controldata = CONTROLDATA_ADDRESS
	;***       49 : ST_DTC_DATA __near dtc_controldata[24];
	;***       50 : #endif /*DTC_USED || STANDBY_USED*/
	;***       51 : /*--- Variable declaration ---*/
	;***       52 : 	UCHAR I_18;
	;***       53 : 	UCHAR F0416 = 0;
	;***       54 : 	UCHAR F0614 = 0;
	;***       55 : 	UCHAR F0615 = 0;
	;***       56 : 	UCHAR F0617 = 0;
	;***       57 : 	UCHAR F0618 = 0;
	;***       58 : 	UCHAR F0619 = 0;
	;***       59 : 	UCHAR F0620 = 0;
	;***       60 : 	UCHAR F0914 = 0;
	;***       61 : 	UCHAR F0915 = 0;
	;***       62 : 	UCHAR F0916 = 0;
	;***       63 : 	UCHAR F0917 = 0;
	;***       64 : 	UCHAR F0918 = 0;
	;***       65 : 	UCHAR F0919 = 0;
	;***       66 : 	UCHAR F0920 = 0;
	;***       67 : 	UCHAR F1321 = 0;
	;***       68 : 
	;***       69 : /*----------------------------*/
	;***       70 : 
	;***       71 : void panel_init0(void)
	;***       72 : {
	;***       73 : 
	;***       74 : 	DGIN_INIT0(0);
	clrb a
	call !!_DGIN_Initialize
	call !!_DGIN_Counter
	;***       75 : 	BCNT_INIT0;
	call !!_BCNT_Initialize
	;***       76 : 	IC74HC4511_INIT0;
	br !!_IC74HC4511_Initialize
.LFE1:
	.TYPE _panel,function,.LFE2-_panel
_panel:
	.STACK _panel = 4
	;***       77 : }
	;***       78 : 
	;***       79 : void panel(void)
	;***       80 : {
	;***       81 : 	DGIN_INIT;
	call !!_DGIN_Counter_Clear
	;***       82 : 	BCNT_INIT;
	call !!_BCNT_Counter_Clear
	;***       83 : 	IC74HC4511_INIT;
	call !!_IC74HC4511_Counter_Clear
	;***       84 : 
	;***       85 : 	DGIN_PROC( I_18,0, LOW,0,fTrg10ms);
	mov c, _fTrg10ms
	clrw ax
	call !!_DGIN_getValue
	and a, #0x01
	xor a, #0x01
	mov !LOWW(_I_18), a
	call !!_DGIN_Counter
	;***       86 : 	BCNT_PROC( 9,fOFF,fOFF,I_18,F0617,F0618,F0619,F0620 );
	mov c, !LOWW(_I_18)
	mov b, #0x09
	clrw ax
	call !!_BCNT_Evaluate
	mov x, a
	and a, #0x01
	mov !LOWW(_F0617), a
	mov a, x
	shr a, 0x01
	and a, #0x01
	mov !LOWW(_F0618), a
	mov a, x
	shr a, 0x02
	and a, #0x01
	mov !LOWW(_F0619), a
	mov a, x
	shr a, 0x03
	and a, #0x01
	mov !LOWW(_F0620), a
	call !!_BCNT_Counter
	;***       87 : 	IC74HC4511_PROC( fOFF,fON,fON,F0617,F0618,F0619,F0620,F0914,F0915,F0916,F0917,F0918,F0919,F0920 );
	oneb c
	onew ax
	call !!_IC_74HC4511_Judge_State
	mov d, a
	mov a, !LOWW(_F0620)
	mov e, a
	mov b, !LOWW(_F0619)
	mov c, !LOWW(_F0618)
	mov x, !LOWW(_F0617)
	mov a, d
	call !!_IC_74HC4511_Evaluate
	mov x, a
	shr a, 0x07
	mov !LOWW(_F0914), a
	mov a, x
	shr a, 0x06
	and a, #0x01
	mov !LOWW(_F0915), a
	mov a, x
	shr a, 0x05
	and a, #0x01
	mov !LOWW(_F0916), a
	mov a, x
	shr a, 0x04
	and a, #0x01
	mov !LOWW(_F0917), a
	mov a, x
	shr a, 0x03
	and a, #0x01
	mov !LOWW(_F0918), a
	mov a, x
	shr a, 0x02
	and a, #0x01
	mov !LOWW(_F0919), a
	mov a, x
	shr a, 0x01
	and a, #0x01
	mov !LOWW(_F0920), a
	call !!_IC74HC4511_Counter
	;***       88 : 	DGOUT_PROC( 30, F0914, HIGH );
	mov x, !LOWW(_F0914)
	oneb c
	mov a, #0x1E
	call !!_DGOUT_setValue
	;***       89 : 	DGOUT_PROC( 31, F0915, HIGH );
	mov x, !LOWW(_F0915)
	oneb c
	mov a, #0x1F
	call !!_DGOUT_setValue
	;***       90 : 	DGOUT_PROC( 32, F0916, HIGH );
	mov x, !LOWW(_F0916)
	oneb c
	mov a, #0x20
	call !!_DGOUT_setValue
	;***       91 : 	DGOUT_PROC( 33, F0917, HIGH );
	mov x, !LOWW(_F0917)
	oneb c
	mov a, #0x21
	call !!_DGOUT_setValue
	;***       92 : 	DGOUT_PROC( 51, F0918, HIGH );
	mov x, !LOWW(_F0918)
	oneb c
	mov a, #0x33
	call !!_DGOUT_setValue
	;***       93 : 	DGOUT_PROC( 52, F0919, HIGH );
	mov x, !LOWW(_F0919)
	oneb c
	mov a, #0x34
	call !!_DGOUT_setValue
	;***       94 : 	DGOUT_PROC( 53, F0920, HIGH );
	mov x, !LOWW(_F0920)
	oneb c
	mov a, #0x35
	call !!_DGOUT_setValue
	;***       95 : 	DGOUT_PROC( 54, fOFF, HIGH );
	oneb c
	movw ax, #0x3600
	br !!_DGOUT_setValue
.LFE2:
	;***       96 : }
	.SECTION .bss,BSS
	.TYPE _I_18,object,1
_I_18:
	.DS (1)
	.SECTION .data,DATA
	.TYPE _F0416,object,1
_F0416:
	.DS (1)
	.TYPE _F0614,object,1
_F0614:
	.DS (1)
	.TYPE _F0615,object,1
_F0615:
	.DS (1)
	.TYPE _F0617,object,1
_F0617:
	.DS (1)
	.TYPE _F0618,object,1
_F0618:
	.DS (1)
	.TYPE _F0619,object,1
_F0619:
	.DS (1)
	.TYPE _F0620,object,1
_F0620:
	.DS (1)
	.TYPE _F0914,object,1
_F0914:
	.DS (1)
	.TYPE _F0915,object,1
_F0915:
	.DS (1)
	.TYPE _F0916,object,1
_F0916:
	.DS (1)
	.TYPE _F0917,object,1
_F0917:
	.DS (1)
	.TYPE _F0918,object,1
_F0918:
	.DS (1)
	.TYPE _F0919,object,1
_F0919:
	.DS (1)
	.TYPE _F0920,object,1
_F0920:
	.DS (1)
	.TYPE _F1321,object,1
_F1321:
	.DS (1)
