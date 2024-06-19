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
#@   src\digitalio.c
#@  compiled at Wed Apr 17 13:20:53 2024

	.PUBLIC _g_ucDGIN_LastRet
	.PUBLIC _g_ucDGIN_ElapsedTime
	.PUBLIC _g_ucDGIN_Count
	.PUBLIC _DGOUT_setValue
	.EXTERN _Port_Set
	.PUBLIC _DGIN_Initialize
	.EXTERN _BitMemSet
	.EXTERN _ByteMemSet
	.PUBLIC _DGIN_Counter_Clear
	.PUBLIC _DGIN_getValue
	.EXTERN _Port_Get
	.EXTERN _BitMemGet
	.EXTERN _ByteMemGet
	.PUBLIC _DGIN_Counter

	.SECTION .textf,TEXTF
	.TYPE _DGOUT_setValue,function,.LFE1-_DGOUT_setValue
_DGOUT_setValue:
	.STACK _DGOUT_setValue = 6
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
	;***       26 : * File Name    : digitalio.c
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
	;***       40 : #include "digitalio.h"
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
	;***       57 : #if defined DGIN_USED
	;***       58 : UCHAR g_ucDGIN_LastRet[(DGIN_USED / 8) + 1];
	;***       59 : UCHAR g_ucDGIN_ElapsedTime[ DGIN_USED ];
	;***       60 : UCHAR g_ucDGIN_Count;
	;***       61 : #endif /* end of defined DGIN_USED */
	;***       62 : 
	;***       63 : /*******************************************************************************
	;***       64 : Private variables and functions
	;***       65 : *******************************************************************************/
	;***       66 : 
	;***       67 : #if defined DGOUT_USED
	;***       68 : /*******************************************************************************
	;***       69 : * Function Name: DGOUT_setValue
	;***       70 : * Description  : Digital Process
	;***       71 : * Arguments    : port   ... output port number
	;***       72 : *                In     ... Out Value.
	;***       73 : *                Active ... high or low.
	;***       74 : * Return Value : none
	;***       75 : ********************************************************************************/
	;***       76 : void DGOUT_setValue( UCHAR port, UCHAR In, UCHAR Active )
	push hl
	mov b, a
	mov a, x
	;***       77 : {
	;***       78 : 	UCHAR	ucVal;
	;***       79 : 
	;***       80 : 	ucVal = In & 0x01;
	and a, #0x01
	mov [sp+0x00], a
	;***       81 : 	if (Active==LOW){
	cmp0 c
	bnz $.BB@LABEL@1_2
.BB@LABEL@1_1:	; if_then_bb
	;***       82 : 		ucVal = (~ucVal) & 0x01;
	xor a, #0x01
	mov [sp+0x00], a
.BB@LABEL@1_2:	; if_break_bb
	call $!__CommonCode@1
	mov a, [sp+0x00]
	mov c, a
	;***       83 : 	}
	;***       84 : 
	;***       85 : 	Port_Set(port/10,port%10,ucVal);
	mov a, e
	mov x, a
	mov a, b
	pop de
	br !!_Port_Set
.LFE1:
	.TYPE __CommonCode@1,function,.LFE2-__CommonCode@1
__CommonCode@1:
	.STACK __CommonCode@1 = 4
	mov a, b
	shrw ax, 8+0x00000
	movw de, #0x000A
	divhu
	mov a, x
	mov b, a
	ret
.LFE2:
	.TYPE _DGIN_Initialize,function,.LFE3-_DGIN_Initialize
_DGIN_Initialize:
	.STACK _DGIN_Initialize = 4
	;***       86 : }
	;***       87 : #endif /* end of defined DGOUT_USED */
	;***       88 : 
	;***       89 : #if defined DGIN_USED
	;***       90 : /*******************************************************************************
	;***       91 : * Function Name: DGIN_Initialize
	;***       92 : * Description  : Digital Process
	;***       93 : * Arguments    : Active
	;***       94 : * Return Value : none
	;***       95 : ********************************************************************************/
	;***       96 : void DGIN_Initialize( UCHAR Active )
	;***       97 : {
	;***       98 : 	/* BitMemSet( "Last input value of DGIN", "Number of DGIN panels", 0) */
	;***       99 : 	BitMemSet(g_ucDGIN_LastRet, g_ucDGIN_Count, ~Active & 0x01);
	and a, #0x01
	xor a, #0x01
	mov b, a
	call $!__CommonCode@0
	;***      100 : 
	;***      101 : 	/* BitMemSet( "Count value of DGIN panel", "Number of DGIN panels", 0) */
	;***      102 : 	ByteMemSet(g_ucDGIN_ElapsedTime,g_ucDGIN_Count, 0);
	mov c, !LOWW(_g_ucDGIN_Count)
	clrb b
	movw ax, #LOWW(_g_ucDGIN_ElapsedTime)
	br !!_ByteMemSet
.LFE3:
	.TYPE __CommonCode@0,function,.LFE4-__CommonCode@0
__CommonCode@0:
	.STACK __CommonCode@0 = 4
	mov c, !LOWW(_g_ucDGIN_Count)
	movw ax, #LOWW(_g_ucDGIN_LastRet)
	br !!_BitMemSet
.LFE4:
	.TYPE _DGIN_Counter_Clear,function,.LFE5-_DGIN_Counter_Clear
_DGIN_Counter_Clear:
	.STACK _DGIN_Counter_Clear = 4
	;***      103 : }
	;***      104 : 
	;***      105 : /*******************************************************************************
	;***      106 : * Function Name: DGIN_Counter_Clear
	;***      107 : * Description  : DGIN_Counter_Clear
	;***      108 : * Arguments    : none
	;***      109 : * Return Value : none
	;***      110 : ********************************************************************************/
	;***      111 : void DGIN_Counter_Clear( void )
	;***      112 : {
	;***      113 : 	/* "Count value of DGIN panel" <- 0 */
	;***      114 : 	g_ucDGIN_Count = 0;
	clrb !LOWW(_g_ucDGIN_Count)
	ret
.LFE5:
	.TYPE _DGIN_getValue,function,.LFE6-_DGIN_getValue
_DGIN_getValue:
	.STACK _DGIN_getValue = 10
	;***      115 : }
	;***      116 : 
	;***      117 : /*******************************************************************************
	;***      118 : * Function Name: DGIN_getValue
	;***      119 : * Description  : DGIN_getValue
	;***      120 : * Arguments    : Port     ...Terminal number
	;***      121 : *                Active   ...Active
	;***      122 : *                Value    ...Chattering absorption time(Each 10ms)
	;***      123 : *                Trig     ...Count trigger(Fix 10ms)
	;***      124 : * Return Value : Input value
	;***      125 : ********************************************************************************/
	;***      126 : UCHAR DGIN_getValue( UCHAR Port, UCHAR Value, UCHAR Trig )
	push bc
	push ax
	push hl
	mov b, a
	call $!__CommonCode@1
	;***      127 : {
	;***      128 : 
	;***      129 : 	UCHAR	ucInputValue;	/* Input value of specified port */
	;***      130 : 	UCHAR	ucRet;			/* Return value */
	;***      131 : 	UCHAR	uccount;		/* Count value of DGIN */
	;***      132 : 	UCHAR	ucLastLet;		/* Last input value of DGIN */
	;***      133 : 	
	;***      134 : 	/* (Input value of specified port) <- PORT_in( (Port) ) */
	;***      135 : 	ucInputValue = Port_Get( Port/10, Port%10 );
	mov a, e
	mov x, a
	mov a, b
	call !!_Port_Get
	mov [sp+0x01], a
	mov a, [sp+0x02]
	;***      136 : 	if (Value == 0) {
	cmp0 a
	bnz $.BB@LABEL@6_3
.BB@LABEL@6_1:	; bb56
	mov a, [sp+0x01]
.BB@LABEL@6_2:	; bb56
	addw sp, #0x06
	ret
.BB@LABEL@6_3:	; if_break_bb
	;***      137 : 		return ucInputValue;
	;***      138 : 	}
	;***      139 : 	/* Last value of DGIN is acquired. */
	;***      140 : 	ucLastLet = BitMemGet(g_ucDGIN_LastRet, g_ucDGIN_Count);
	mov c, !LOWW(_g_ucDGIN_Count)
	movw ax, #LOWW(_g_ucDGIN_LastRet)
	call !!_BitMemGet
	mov [sp+0x00], a
	;***      141 : 	
	;***      142 : 	/* Count value of DGIN panel is acquired. */
	;***      143 : 	uccount = ByteMemGet(g_ucDGIN_ElapsedTime, g_ucDGIN_Count);
	mov c, !LOWW(_g_ucDGIN_Count)
	movw ax, #LOWW(_g_ucDGIN_ElapsedTime)
	call !!_ByteMemGet
	mov c, a
	mov a, [sp+0x01]
	mov b, a
	mov a, [sp+0x00]
	;***      144 : 	
	;***      145 : 	if (ucInputValue != ucLastLet) {
	cmp b, a
	bnz $.BB@LABEL@6_5
.BB@LABEL@6_4:	; if_break_bb.if_break_bb50_crit_edge
	clrb c
	br $.BB@LABEL@6_8
.BB@LABEL@6_5:	; if_then_bb27
	mov a, [sp+0x04]
	;***      146 : 
	;***      147 : 		if (Trig == 1) {
	dec a
	bnz $.BB@LABEL@6_8
.BB@LABEL@6_6:	; if_then_bb33
	mov a, [sp+0x02]
	mov x, a
	;***      148 : 			/*  "Count value of DGIN" <- "Count value of DGIN" + 1 */
	;***      149 : 			uccount++;
	inc c
	mov a, c
	;***      150 : 			if ( uccount >= Value) {
	cmp a, x
	bc $.BB@LABEL@6_8
.BB@LABEL@6_7:	; if_then_bb44
	call $!__CommonCode@0
	clrb c
	mov a, [sp+0x01]
	mov [sp+0x00], a
.BB@LABEL@6_8:	; if_break_bb50
	mov a, c
	;***      151 : 				/* (Last value of DGIN) <- (Input value of specified port) */
	;***      152 : 				ucLastLet = ucInputValue;
	;***      153 : 				
	;***      154 : 				/* "Count value of DGIN" <- 0 */
	;***      155 : 				uccount = 0;
	;***      156 : 				/* Last value of DGIN is preserved. */
	;***      157 : 				BitMemSet(g_ucDGIN_LastRet, g_ucDGIN_Count, ucInputValue);
	;***      158 : 			}
	;***      159 : 		}
	;***      160 : 	}
	;***      161 : 	else {
	;***      162 : 		/* "Count value of DGIN" <- 0 */
	;***      163 : 		uccount = 0;
	;***      164 : 	}
	;***      165 : 	
	;***      166 : 	/* "Count value of DGIN" is preserved. */
	;***      167 : 	ByteMemSet(g_ucDGIN_ElapsedTime,g_ucDGIN_Count, uccount);
	mov b, a
	mov c, !LOWW(_g_ucDGIN_Count)
	movw ax, #LOWW(_g_ucDGIN_ElapsedTime)
	call !!_ByteMemSet
	mov a, [sp+0x00]
	br $.BB@LABEL@6_2
.LFE6:
	.TYPE _DGIN_Counter,function,.LFE7-_DGIN_Counter
_DGIN_Counter:
	.STACK _DGIN_Counter = 4
	;***      168 : 	
	;***      169 : 	/* (Return value) <- Last value of DGIN */
	;***      170 : 	ucRet = ucLastLet;
	;***      171 : 	
	;***      172 : 	return ucRet;
	;***      173 : 
	;***      174 : }
	;***      175 : 
	;***      176 : /*******************************************************************************
	;***      177 : * Function Name: DGIN_Counter
	;***      178 : * Description  : DGIN_Counter
	;***      179 : * Arguments    : none
	;***      180 : * Return Value : none
	;***      181 : ********************************************************************************/
	;***      182 : void DGIN_Counter( void )
	;***      183 : {
	;***      184 : 	/* "Count value of DGIN panel" <- "Count value of DGIN panel" + 1 */
	;***      185 : 	g_ucDGIN_Count++;
	inc !LOWW(_g_ucDGIN_Count)
	ret
.LFE7:
	;***      186 : }
	;***      187 : #endif /* end of defined DGIN_USED */
	.SECTION .bss,BSS
	.TYPE _g_ucDGIN_LastRet,object,1
_g_ucDGIN_LastRet:
	.DS (1)
	.TYPE _g_ucDGIN_ElapsedTime,object,1
_g_ucDGIN_ElapsedTime:
	.DS (1)
	.TYPE _g_ucDGIN_Count,object,1
_g_ucDGIN_Count:
	.DS (1)
