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
#@   src\timer.c
#@  compiled at Wed Apr 17 13:20:51 2024

	.EXTERN _fTm10ms
	.EXTERN _fTrg50ms
	.EXTERN _fTrg1s
	.EXTERN _fTrg10ms
	.PUBLIC _SysTm10ms
	.PUBLIC _SysTm50ms
	.PUBLIC _SysTm1s
	.PUBLIC _MD_INTTM00
	.PUBLIC _TM00_Init
	.PUBLIC _TM_10ms

	.SECTION .text,TEXT
_MD_INTTM00	.vector 0x0020
	.TYPE _MD_INTTM00,function,.LFE1-_MD_INTTM00
_MD_INTTM00:
	.STACK _MD_INTTM00 = 6
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
	;***       26 : * File Name    : timer.c
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
	;***       37 : #ifdef __CCRL__
	;***       38 : #include "sfr.h"
	;***       39 : #include "common.h"
	;***       40 : #include "config.h"
	;***       41 : #include "timer.h"
	;***       42 : #pragma interrupt	MD_INTTM00(vect=INTTM00)
	;***       43 : 
	;***       44 : #else
	;***       45 : #error "undefined compiler"
	;***       46 : #endif
	;***       47 : 
	;***       48 : /*******************************************************************************
	;***       49 : Macro definitions
	;***       50 : *******************************************************************************/
	;***       51 : #define	TM_10MS		40				/* Standard timer interrupt(250us) x 40 times */
	;***       52 : #define	TM_50MS		5				/* 10ms x 5 times */
	;***       53 : #define	TM_1MS		4				/* 250us x 4 times */
	;***       54 : #define	TM_1S		20				/* 50ms x 20 times */
	;***       55 : 
	;***       56 : #define	TM_250US_1250K	312			/* 250us = 1/1.25MHz * 312 */
	;***       57 : #define	TM_250US_2500K	625			/* 250us = 1/2.5MHz  * 625 */
	;***       58 : 
	;***       59 : /*******************************************************************************
	;***       60 : Typedef definitions
	;***       61 : *******************************************************************************/
	;***       62 : 
	;***       63 : /*******************************************************************************
	;***       64 : Imported global variables and functions (from other files)
	;***       65 : *******************************************************************************/
	;***       66 : #ifdef PULSE_USED
	;***       67 : extern UCHAR	ucgPULSE_Tm;
	;***       68 : #endif /* end of defined PULSE_USED */
	;***       69 : 
	;***       70 : /*******************************************************************************
	;***       71 : Exported global variables and functions (to be accessed by other files)
	;***       72 : *******************************************************************************/
	;***       73 : #ifdef __CCRL__
	;***       74 : __saddr UCHAR	SysTm10ms;				/* 10ms Timer for making */
	;***       75 : __saddr UCHAR	SysTm50ms;				/* 50ms Timer for making */
	;***       76 : __saddr UCHAR	SysTm1s;				/*   1s Timer for making */
	;***       77 : 
	;***       78 : #else
	;***       79 : #error "undefined compiler"
	;***       80 : #endif
	;***       81 : 
	;***       82 : /*******************************************************************************
	;***       83 : * Function Name: __interrupt MD_INTTM00
	;***       84 : * Description  : Interrupt processing of standard cycle
	;***       85 : * Arguments    : none
	;***       86 : * Return Value : none
	;***       87 : ********************************************************************************/
	;***       88 : #ifdef __CCRL__
	;***       89 : void MD_INTTM00( void )
	push ax
	;***       90 : #else
	;***       91 : #error "undefined compiler"
	;***       92 : #endif
	;***       93 : {
	;***       94 : 	SysTm10ms++;				/* System timer processing */
	mov a, _SysTm10ms
	inc a
	mov _SysTm10ms, a
	;***       95 : 	if(SysTm10ms >= TM_10MS){
	cmp a, #0x28
	bc $.BB@LABEL@1_2
.BB@LABEL@1_1:	; if_then_bb
	;***       96 : 		SysTm10ms = 0;
	clrb _SysTm10ms
	;***       97 : 		fTm10ms = 1;
	oneb _fTm10ms
.BB@LABEL@1_2:	; return
	pop ax
	reti
.LFE1:
	.SECTION .textf,TEXTF
	.TYPE _TM00_Init,function,.LFE2-_TM00_Init
_TM00_Init:
	.STACK _TM00_Init = 4
	;***       98 : 	}
	;***       99 : 
	;***      100 : #ifdef PULSE_USED
	;***      101 : 	/* Pulse output processing */
	;***      102 : 	ucgPULSE_Tm++;
	;***      103 : #endif /* end of defined PULSE_USED */
	;***      104 : }
	;***      105 : 
	;***      106 : #if !defined PWM_USED
	;***      107 : /*******************************************************************************
	;***      108 : * Function Name: TM00_Init
	;***      109 : * Description  : This function initializes TM00_module.
	;***      110 : * Arguments    : none
	;***      111 : * Return Value : none
	;***      112 : ********************************************************************************/
	;***      113 : void TM00_Init( void )
	movw de, #0x00F0
	movw hl, #0x00F0
	clrw ax
	;***      114 : {
	;***      115 : 	TAU0EN = 1;	/* enables input clock supply */
	set1 [hl].0
	;***      116 : 	
	;***      117 : 	TMMK00 = 1;
	set1 0xFFFE5.6
	;***      118 : 	TMIF00 = 0;
	clr1 0xFFFE1.6
	;***      119 : 
	;***      120 : 	/* 16bit TIMER */
	;***      121 : 	TPS0 =0x0000;
	movw [de+0xC6], ax
	incw ax
	;***      122 : 	TT0  = 0x0001;			/* TT00 = 1(timer stop) */
	movw [de+0xC4], ax
	decw ax
	;***      123 : 	TMR00 = 0x0000;
	movw [de+0xA0], ax
	;***      124 : 
	;***      125 : 	TDR00 = SYS_CLOCK_FREQ * 250 - 1;	/* 0.25ms */
	movw 0xFFF18, #0x0BB7
	;***      126 : 
	;***      127 : 	TO0  &= ~0x0001;		/* TO00  = 1 */
	movw ax, [de+0xC8]
	xch a, x
	and a, #0xFE
	xch a, x
	movw [de+0xC8], ax
	;***      128 : 	TOE0 &= ~0x0001;		/* TOE00 = 1 */
	movw ax, [de+0xCA]
	xch a, x
	and a, #0xFE
	xch a, x
	movw [de+0xCA], ax
	;***      129 : 
	;***      130 : 	TMIF00 = 0;
	clr1 0xFFFE1.6
	;***      131 : 	TMMK00 = 0;
	clr1 0xFFFE5.6
	;***      132 : 	TS0 |= 0x0001;			/* TS00   = 1(timer start) */
	movw ax, [de+0xC2]
	xch a, x
	or a, #0x01
	xch a, x
	movw [de+0xC2], ax
	ret
.LFE2:
	.TYPE _TM_10ms,function,.LFE3-_TM_10ms
_TM_10ms:
	.STACK _TM_10ms = 4
	;***      133 : }
	;***      134 : 
	;***      135 : /*******************************************************************************
	;***      136 : * Function Name: TM_10ms
	;***      137 : * Description  : 10ms count Processing.
	;***      138 : * Arguments    : none
	;***      139 : * Return Value : status
	;***      140 : ********************************************************************************/
	;***      141 : UCHAR TM_10ms( void )
	;***      142 : {
	;***      143 : 	/* Timer trigger generation */
	;***      144 : 	fTrg10ms = 0;
	clrb _fTrg10ms
	;***      145 : 	fTrg50ms = 0;
	clrb _fTrg50ms
	;***      146 : 	fTrg1s = 0;
	clrb _fTrg1s
	;***      147 : 	
	;***      148 : 	if(fTm10ms == 1){
	cmp _fTm10ms, #0x01
	bnz $.BB@LABEL@3_5
.BB@LABEL@3_1:	; if_then_bb
	;***      149 : 		fTrg10ms = 1;
	oneb _fTrg10ms
	;***      150 : 		SysTm50ms++;
	mov a, _SysTm50ms
	inc a
	mov _SysTm50ms, a
	;***      151 : 		if(SysTm50ms >= TM_50MS){
	cmp a, #0x05
	bc $.BB@LABEL@3_4
.BB@LABEL@3_2:	; if_then_bb12
	;***      152 : 			SysTm50ms = 0;
	clrb _SysTm50ms
	;***      153 : 			fTrg50ms = 1;
	oneb _fTrg50ms
	;***      154 : 
	;***      155 : 			SysTm1s++;
	mov a, _SysTm1s
	inc a
	mov _SysTm1s, a
	;***      156 : 			if(SysTm1s >= TM_1S){
	cmp a, #0x14
	bc $.BB@LABEL@3_4
.BB@LABEL@3_3:	; if_then_bb20
	;***      157 : 				SysTm1s = 0;
	clrb _SysTm1s
	;***      158 : 				fTrg1s = 1;
	oneb _fTrg1s
.BB@LABEL@3_4:	; if_break_bb21
	;***      159 : 			}
	;***      160 : 		}
	;***      161 : 		fTm10ms = 0;
	clrb _fTm10ms
	;***      162 : 		return(1);
	oneb a
	ret
.BB@LABEL@3_5:	; bb24
	;***      163 : 	}
	;***      164 : 	return(0);
	;***      165 : }
	clrb a
	ret
.LFE3:
	;***      166 : #endif /* end of defined PWM_USED */
	;***      167 : 
	.SECTION .sbss,SBSS
	.TYPE _SysTm10ms,object,1
_SysTm10ms:
	.DS (1)
	.TYPE _SysTm50ms,object,1
_SysTm50ms:
	.DS (1)
	.TYPE _SysTm1s,object,1
_SysTm1s:
	.DS (1)
