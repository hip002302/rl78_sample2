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
#@   src\counter.c
#@  compiled at Wed Apr 17 13:20:53 2024

	.PUBLIC _BCNT_Initialize
	.EXTERN _memset
	.PUBLIC _BCNT_Counter_Clear
	.PUBLIC _BCNT_Evaluate
	.EXTERN _BitMemGet
	.EXTERN _ByteMemGet
	.EXTERN _BitMemSet
	.EXTERN _ByteMemSet
	.PUBLIC _BCNT_Counter

	.SECTION .textf,TEXTF
	.TYPE _BCNT_Initialize,function,.LFE1-_BCNT_Initialize
_BCNT_Initialize:
	.STACK _BCNT_Initialize = 4
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
	;***       26 : * File Name    : counter.c
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
	;***       40 : #include <string.h>
	;***       41 : #include "counter.h"
	;***       42 : 
	;***       43 : /*******************************************************************************
	;***       44 : Macro definitions
	;***       45 : *******************************************************************************/
	;***       46 : 
	;***       47 : /*******************************************************************************
	;***       48 : Typedef definitions
	;***       49 : *******************************************************************************/
	;***       50 : 
	;***       51 : /*******************************************************************************
	;***       52 : Imported global variables and functions (from other files)
	;***       53 : *******************************************************************************/
	;***       54 : 
	;***       55 : /*******************************************************************************
	;***       56 : Exported global variables and functions (to be accessed by other files)
	;***       57 : *******************************************************************************/
	;***       58 : 
	;***       59 : /*******************************************************************************
	;***       60 : Private variables and functions
	;***       61 : *******************************************************************************/
	;***       62 : #if defined CNT_USED
	;***       63 : static UCHAR	ucgCNT_Flg[(CNT_USED / 8) + 1];
	;***       64 : static USHORT	usgCNT_Val[CNT_USED];
	;***       65 : static UCHAR	ucgCNT_Cnt;
	;***       66 : #endif /* end of defined CNT_USED */
	;***       67 : 
	;***       68 : #if defined BCNT_USED
	;***       69 : static UCHAR	g_ucBCNT_LastCounterVal[BCNT_USED];
	;***       70 : static UCHAR	g_ucBCNT_LastCp0[(BCNT_USED / 8) + 1];
	;***       71 : static UCHAR	g_ucBCNT_LastCp1[(BCNT_USED / 8) + 1];
	;***       72 : static UCHAR	g_ucBCNT_Count;
	;***       73 : #endif /* end of defined BCNT_USED */
	;***       74 : 
	;***       75 : #if defined CNT_USED
	;***       76 : /*******************************************************************************
	;***       77 : * Function Name: CNT_Set
	;***       78 : * Description  : Counter panel increment.
	;***       79 : * Arguments    : Limit 	... count limit
	;***       80 : *                Type 	... count mode (HOLD/CYCLINC)
	;***       81 : *                In    	... enable(=1)/disable(=0)
	;***       82 : *                Reset   ... reset(=1)
	;***       83 : * Return Value : none
	;***       84 : ********************************************************************************/
	;***       85 : void CNT_Set( USHORT Limit, UCHAR Type, UCHAR In, UCHAR Reset )
	;***       86 : {
	;***       87 : 	UCHAR	ucflg;
	;***       88 : 
	;***       89 : 	if (Reset == HIGH)
	;***       90 : 	{
	;***       91 : 		BitMemSet(ucgCNT_Flg, ucgCNT_Cnt, 1);
	;***       92 : 		usgCNT_Val[ucgCNT_Cnt] = 0;
	;***       93 : 		return;
	;***       94 : 	}
	;***       95 : 	
	;***       96 : 	ucflg = BitMemGet(ucgCNT_Flg, ucgCNT_Cnt);
	;***       97 : 	
	;***       98 : 	if(In == HIGH)
	;***       99 : 	{
	;***      100 : 		if(ucflg == LOW)
	;***      101 : 		{
	;***      102 : 			usgCNT_Val[ucgCNT_Cnt]++;
	;***      103 : 			if(usgCNT_Val[ucgCNT_Cnt] > Limit)
	;***      104 : 			{
	;***      105 : 				if(Type == CNT_HOLDTYPE)			usgCNT_Val[ucgCNT_Cnt] = Limit;
	;***      106 : 				else if(Type == CNT_CYCLICTYPE)		usgCNT_Val[ucgCNT_Cnt] = 0;
	;***      107 : 			}
	;***      108 : 		}
	;***      109 : 	}
	;***      110 : 	
	;***      111 : 	BitMemSet(ucgCNT_Flg, ucgCNT_Cnt, In);
	;***      112 : }
	;***      113 : 
	;***      114 : /*******************************************************************************
	;***      115 : * Function Name: CNT_Compare
	;***      116 : * Description  : Compare counter.
	;***      117 : * Arguments    : Val ... compare value.
	;***      118 : * Return Value : none
	;***      119 : ********************************************************************************/
	;***      120 : UCHAR CNT_Compare( USHORT Val )
	;***      121 : {
	;***      122 : 	if (usgCNT_Val[ucgCNT_Cnt-1] == Val) return 1;
	;***      123 : 	return 0;
	;***      124 : }
	;***      125 : 
	;***      126 : /*******************************************************************************
	;***      127 : * Function Name: CNT_Initialize
	;***      128 : * Description  : COUNTER Panel Initialize.
	;***      129 : * Arguments    : none
	;***      130 : * Return Value : none
	;***      131 : ********************************************************************************/
	;***      132 : void CNT_Initialize( void )
	;***      133 : {
	;***      134 : 	memset(ucgCNT_Flg, 0, (CNT_USED / 8) + 1);
	;***      135 : 	memset(usgCNT_Val, 0, CNT_USED * 2);
	;***      136 : }
	;***      137 : 
	;***      138 : /*******************************************************************************
	;***      139 : * Function Name: CNT_Counter_Clear
	;***      140 : * Description  : COUNTER Panel Counter Clear.
	;***      141 : * Arguments    : none
	;***      142 : * Return Value : none
	;***      143 : ********************************************************************************/
	;***      144 : void CNT_Counter_Clear( void )
	;***      145 : {
	;***      146 : 	ucgCNT_Cnt = 0;
	;***      147 : }
	;***      148 : 
	;***      149 : /*******************************************************************************
	;***      150 : * Function Name: CNT_Counter
	;***      151 : * Description  : COUNTER Panel Counter.
	;***      152 : * Arguments    : none
	;***      153 : * Return Value : none
	;***      154 : ********************************************************************************/
	;***      155 : void CNT_Counter( void )
	;***      156 : {
	;***      157 : 	ucgCNT_Cnt++;
	;***      158 : }
	;***      159 : #endif /* end of defined CNT_USED */
	;***      160 : 
	;***      161 : #if defined BCNT_USED
	;***      162 : /*******************************************************************************
	;***      163 : * Function Name: BCNT_Initialize
	;***      164 : * Description  : COUNTER Panel BCNT_Initialize.
	;***      165 : * Arguments    : none
	;***      166 : * Return Value : none
	;***      167 : ********************************************************************************/
	;***      168 : void BCNT_Initialize( void )
	;***      169 : {
	;***      170 : 	/* memset( "Count value of binary counter", 0, "Number of binary counters" ) */
	;***      171 : 	memset( g_ucBCNT_LastCounterVal, 0, BCNT_USED );
	onew ax
	movw de, ax
	clrw bc
	movw ax, #LOWW(_g_ucBCNT_LastCounterVal@1)
	call $!__CommonCode@0
	;***      172 : 	
	;***      173 : 	/* memset( "Last value of cp0 of binary counter" , 0, "Number of binary counters" / 8 + 1 ) */
	;***      174 : 	memset( g_ucBCNT_LastCp0, 0, (BCNT_USED / 8)+1 );
	movw ax, #LOWW(_g_ucBCNT_LastCp0@2)
	call $!__CommonCode@0
	;***      175 : 	
	;***      176 : 	/* memset( "Last value of cp1 of binary counter" , 0, "Number of binary counters" / 8 + 1 ) */
	;***      177 : 	memset( g_ucBCNT_LastCp1, 0, (BCNT_USED / 8)+1 );
	movw ax, #LOWW(_g_ucBCNT_LastCp1@3)
	br !!_memset
.LFE1:
	.TYPE __CommonCode@0,function,.LFE2-__CommonCode@0
__CommonCode@0:
	.STACK __CommonCode@0 = 4
	call !!_memset
	onew ax
	movw de, ax
	clrw bc
	ret
.LFE2:
	.TYPE _BCNT_Counter_Clear,function,.LFE3-_BCNT_Counter_Clear
_BCNT_Counter_Clear:
	.STACK _BCNT_Counter_Clear = 4
	;***      178 : }
	;***      179 : 
	;***      180 : /*******************************************************************************
	;***      181 : * Function Name: BCNT_Counter_Clear
	;***      182 : * Description  : COUNTER Panel BCNT_Counter_Clear.
	;***      183 : * Arguments    : none
	;***      184 : * Return Value : none
	;***      185 : ********************************************************************************/
	;***      186 : void BCNT_Counter_Clear( void )
	;***      187 : {
	;***      188 : 	/* "Count of PROC of binary counter" <- 0 */
	;***      189 : 	g_ucBCNT_Count = 0;
	clrb !LOWW(_g_ucBCNT_Count@4)
	ret
.LFE3:
	.TYPE _BCNT_Evaluate,function,.LFE4-_BCNT_Evaluate
_BCNT_Evaluate:
	.STACK _BCNT_Evaluate = 12
	;***      190 : }
	;***      191 : 
	;***      192 : /*******************************************************************************
	;***      193 : * Function Name: BCNT_Evaluate
	;***      194 : * Description  : COUNTER Panel BCNT_Evaluate.
	;***      195 : * Arguments    : mr
	;***      196 : *                cp0 ... cp0 of binary counter
	;***      197 : *                cp1 ... cp1 of binary counter
	;***      198 : *                maximum value
	;***      199 : * Return Value : Count value of binary counter
	;***      200 : ********************************************************************************/
	;***      201 : UCHAR BCNT_Evaluate( UCHAR mr, UCHAR cp0, UCHAR cp1, UCHAR max )
	push bc
	push ax
	subw sp, #0x04
	;***      202 : {
	;***      203 : 	UCHAR	lastcp0;	/* Last input value of cp0 terminal */
	;***      204 : 	UCHAR	lastcp1;	/* Last input value of cp1 terminal */
	;***      205 : 	UCHAR	count;		/* Count value of binary counter */
	;***      206 : 	
	;***      207 : 	/* Last value of cp0 of binary counter is acquired. */
	;***      208 : 	lastcp0 = BitMemGet(g_ucBCNT_LastCp0, g_ucBCNT_Count);
	mov c, !LOWW(_g_ucBCNT_Count@4)
	movw ax, #LOWW(_g_ucBCNT_LastCp0@2)
	call !!_BitMemGet
	mov [sp+0x02], a
	;***      209 : 	
	;***      210 : 	/* Last value of cp1 of binary counter is acquired. */
	;***      211 : 	lastcp1 = BitMemGet(g_ucBCNT_LastCp1, g_ucBCNT_Count);
	mov c, !LOWW(_g_ucBCNT_Count@4)
	movw ax, #LOWW(_g_ucBCNT_LastCp1@3)
	call !!_BitMemGet
	mov [sp+0x00], a
	;***      212 : 	
	;***      213 : 	/* Count value of binary counter is acquired. */
	;***      214 : 	count = ByteMemGet(g_ucBCNT_LastCounterVal, g_ucBCNT_Count);
	mov c, !LOWW(_g_ucBCNT_Count@4)
	movw ax, #LOWW(_g_ucBCNT_LastCounterVal@1)
	call !!_ByteMemGet
	mov x, a
	mov [sp+0x01], a
	mov a, [sp+0x05]
	;***      215 : 	
	;***      216 : 	if (mr == LOW) {
	cmp0 a
	bz $.BB@LABEL@4_2
.BB@LABEL@4_1:	; entry.if_break_bb49_crit_edge
	clrb x
	br $.BB@LABEL@4_7
.BB@LABEL@4_2:	; if_then_bb
	mov a, [sp+0x04]
	;***      217 : 		if (cp0 == LOW) {
	cmp0 a
	bnz $.BB@LABEL@4_11
.BB@LABEL@4_3:	; if_then_bb15
	mov a, [sp+0x00]
	;***      218 : 			if (cp1 == LOW) {
	dec a
	bnz $.BB@LABEL@4_8
.BB@LABEL@4_4:	; if_then_bb15
	mov a, [sp+0x06]
	cmp0 a
.BB@LABEL@4_5:	; if_then_bb15
	bnz $.BB@LABEL@4_8
.BB@LABEL@4_6:	; if_break_bb49.PartialDrain
	inc x
.BB@LABEL@4_7:	; if_break_bb49.PartialDrain
	mov a, x
	mov [sp+0x01], a
.BB@LABEL@4_8:	; if_break_bb49
	mov a, [sp+0x07]
	;***      219 : 				if (lastcp1 == HIGH) {
	;***      220 : 					/* (Count value of binary counter)++ */
	;***      221 : 					count++;
	;***      222 : 				}
	;***      223 : 			}
	;***      224 : 		}
	;***      225 : 		else {
	;***      226 : 			if (lastcp0 == LOW) {
	;***      227 : 				if (cp1 == HIGH) {
	;***      228 : 					/* (Count value of binary counter)++ */
	;***      229 : 					count++;
	;***      230 : 				}
	;***      231 : 			}
	;***      232 : 		}
	;***      233 : 	}
	;***      234 : 	
	;***      235 : 	else {
	;***      236 : 		/* (Count value of binary counter)<-0 */
	;***      237 : 		count = 0;
	;***      238 : 	}
	;***      239 : 	
	;***      240 : 	/* If the count value is larger than the count maximum value, it returns it to 0. */
	;***      241 : 	if (count > max) {
	cmp x, a
	bnh $.BB@LABEL@4_10
.BB@LABEL@4_9:	; if_then_bb57
	clrb a
	mov [sp+0x01], a
.BB@LABEL@4_10:	; if_break_bb58
	mov a, [sp+0x04]
	mov b, a
	;***      242 : 		/* (Count value of binary counter)<-0 */
	;***      243 : 		count = 0;
	;***      244 : 	}
	;***      245 : 	
	;***      246 : 	/* This value of cp0 of binary counter is preserved. */
	;***      247 : 	BitMemSet(g_ucBCNT_LastCp0, g_ucBCNT_Count, cp0);
	mov c, !LOWW(_g_ucBCNT_Count@4)
	movw ax, #LOWW(_g_ucBCNT_LastCp0@2)
	call !!_BitMemSet
	mov a, [sp+0x06]
	mov b, a
	;***      248 : 	
	;***      249 : 	/* This value of cp1 of binary counter is preserved. */
	;***      250 : 	BitMemSet(g_ucBCNT_LastCp1, g_ucBCNT_Count, cp1);
	mov c, !LOWW(_g_ucBCNT_Count@4)
	movw ax, #LOWW(_g_ucBCNT_LastCp1@3)
	call !!_BitMemSet
	pop bc
	push bc
	;***      251 : 	
	;***      252 : 	/* This count value of binary counter is preserved. */
	;***      253 : 	ByteMemSet(g_ucBCNT_LastCounterVal, g_ucBCNT_Count, count);
	mov c, !LOWW(_g_ucBCNT_Count@4)
	movw ax, #LOWW(_g_ucBCNT_LastCounterVal@1)
	call !!_ByteMemSet
	mov a, [sp+0x01]
	;***      254 : 	
	;***      255 : 	/* (Count value of binary counter) is returned. */
	;***      256 : 	return count;
	;***      257 : }
	addw sp, #0x08
	ret
.BB@LABEL@4_11:	; if_else_bb
	mov a, [sp+0x02]
	cmp0 a
	bnz $.BB@LABEL@4_8
.BB@LABEL@4_12:	; if_else_bb
	mov a, [sp+0x06]
	dec a
	br $.BB@LABEL@4_5
.LFE4:
	.TYPE _BCNT_Counter,function,.LFE5-_BCNT_Counter
_BCNT_Counter:
	.STACK _BCNT_Counter = 4
	;***      258 : 
	;***      259 : /*******************************************************************************
	;***      260 : * Function Name: BCNT_Counter
	;***      261 : * Description  : COUNTER Panel BCDCNT_Counter.
	;***      262 : * Arguments    : none
	;***      263 : * Return Value : none
	;***      264 : ********************************************************************************/
	;***      265 : void BCNT_Counter( void )
	;***      266 : {
	;***      267 : 	/* "Count of PROC of binary counter"++ */
	;***      268 : 	g_ucBCNT_Count++;
	inc !LOWW(_g_ucBCNT_Count@4)
	ret
.LFE5:
	;***      269 : }
	;***      270 : 
	;***      271 : #endif /* end of defined BCNT_USED */
	.SECTION .bss,BSS
	.TYPE _g_ucBCNT_LastCounterVal@1,object,1
_g_ucBCNT_LastCounterVal@1:
	.DS (1)
	.TYPE _g_ucBCNT_LastCp0@2,object,1
_g_ucBCNT_LastCp0@2:
	.DS (1)
	.TYPE _g_ucBCNT_LastCp1@3,object,1
_g_ucBCNT_LastCp1@3:
	.DS (1)
	.TYPE _g_ucBCNT_Count@4,object,1
_g_ucBCNT_Count@4:
	.DS (1)
