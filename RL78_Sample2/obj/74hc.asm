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
#@   src\74hc.c
#@  compiled at Wed Apr 17 13:20:54 2024

	.PUBLIC _g74HC4511_LastNum
	.PUBLIC _g74HC4511_Count
	.PUBLIC _IC_74HC4511_Judge_State
	.PUBLIC _IC_74HC4511_Evaluate
	.EXTERN _ByteMemSet
	.EXTERN _ByteMemGet
	.PUBLIC _IC74HC4511_Initialize
	.EXTERN _memset
	.PUBLIC _IC74HC4511_Counter_Clear
	.PUBLIC _IC74HC4511_Counter

	.SECTION .textf,TEXTF
	.TYPE _IC_74HC4511_Judge_State,function,.LFE1-_IC_74HC4511_Judge_State
_IC_74HC4511_Judge_State:
	.STACK _IC_74HC4511_Judge_State = 4
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
	;***       26 : * File Name    : 74hc.c
	;***       27 : * Version      : Applilet EZ PL for RL78
	;***       28 : * Device(s)    : R5F1056A,R5F1057A,R5F1058A
	;***       29 : * Tool-Chain   : CC-RL
	;***       30 : * Description  : This file implements the function of 74HC IC Series.
	;***       31 : * Creation Date: 2016/09/14
	;***       32 : *******************************************************************************/
	;***       33 : 
	;***       34 : /*******************************************************************************
	;***       35 : Includes <System Includes> , "Project Includes"
	;***       36 : *******************************************************************************/
	;***       37 : #include "sfr.h"
	;***       38 : #include "common.h"
	;***       39 : #include <string.h>
	;***       40 : #include "74hc.h"
	;***       41 : #include "config.h"
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
	;***       58 : #if defined IC74HC112_USED
	;***       59 : UCHAR	g74HC112_LastQ[(IC74HC112_USED / 8) + 1];
	;***       60 : UCHAR	g74HC112_LastCK[(IC74HC112_USED / 8) + 1];
	;***       61 : UCHAR	g74HC112_Count = 0;
	;***       62 : #endif /* end of defined IC74HC112_USED */
	;***       63 : 
	;***       64 : #if defined IC74HC77_USED
	;***       65 : UCHAR	g74HC77_LastQ[(IC74HC77_USED / 8) + 1];
	;***       66 : UCHAR	g74HC77_Count = 0;
	;***       67 : #endif /* end of defined IC74HC77_USED */
	;***       68 : 
	;***       69 : #if defined IC74HC4511_USED
	;***       70 : UCHAR	g74HC4511_LastNum[IC74HC4511_USED];
	;***       71 : UCHAR	g74HC4511_Count = 0;
	;***       72 : #endif /* end of defined IC74HC4511_USED */
	;***       73 : 
	;***       74 : #if defined IC74HC166_USED
	;***       75 : UCHAR	g74HC166_LastCK[(IC74HC166_USED / 8) + 1];
	;***       76 : UCHAR	g74HC166_LastValue[IC74HC166_USED];
	;***       77 : UCHAR	g74HC166_Count = 0;
	;***       78 : #endif /* end of defined IC74HC166_USED */
	;***       79 : 
	;***       80 : /*******************************************************************************
	;***       81 : Private variables and functions
	;***       82 : *******************************************************************************/
	;***       83 : 
	;***       84 : #if defined IC74HC112_USED
	;***       85 : /*******************************************************************************
	;***       86 : * Function Name: IC_74HC112_Out_Q
	;***       87 : * Description  : J-K Flip-Flop with Preset and Clear.
	;***       88 : *                (Q-terminal output value calculate)
	;***       89 : * Arguments    : J_in	J-terminal input value (HIGH or LOW)
	;***       90 : *                K_in	K-terminal input value (HIGH or LOW)
	;***       91 : *                CLR_in CLR-terminal input value (HIGH or LOW)
	;***       92 : *                PR_in 	PR-terminal input value (HIGH or LOW)
	;***       93 : *                CK_in	CK-terminal input value (HIGH or LOW)
	;***       94 : * Return Value : Q-terminal output value (HIGH or LOW)
	;***       95 : ********************************************************************************/
	;***       96 : UCHAR  IC_74HC112_Out_Q( UCHAR J_in, UCHAR K_in, UCHAR CLR_in, UCHAR PR_in, UCHAR CK_in )
	;***       97 : {
	;***       98 : 	UCHAR	Q_out;
	;***       99 : 	UCHAR	work;
	;***      100 : 	UCHAR	lastQ;
	;***      101 : 	UCHAR	lastCK;
	;***      102 : 	
	;***      103 : 	lastQ = BitMemGet(g74HC112_LastQ, g74HC112_Count);
	;***      104 : 	lastCK = BitMemGet(g74HC112_LastCK, g74HC112_Count);
	;***      105 : 	if(PR_in == HIGH)
	;***      106 : 	{
	;***      107 : 		if(CLR_in == HIGH)
	;***      108 : 		{
	;***      109 : 			if(CK_in == LOW)
	;***      110 : 			{
	;***      111 : 				if(lastCK == HIGH)
	;***      112 : 				{
	;***      113 : 					work = J_in + K_in;
	;***      114 : 					if	   (work == 0)	Q_out = lastQ;
	;***      115 : 					else if(work == 1)	Q_out = J_in;
	;***      116 : 					else 				Q_out = (~lastQ) & 0x01;	/* work == 2 */
	;***      117 : 				}
	;***      118 : 				else	/* lastCK == LOW */
	;***      119 : 				{
	;***      120 : 					Q_out = lastQ;
	;***      121 : 				}
	;***      122 : 			}
	;***      123 : 			else	/* CK_in == HIGH */
	;***      124 : 			{
	;***      125 : 				Q_out = lastQ;
	;***      126 : 			}
	;***      127 : 		}
	;***      128 : 		else	/* CLR_in == LOW */
	;***      129 : 		{
	;***      130 : 			Q_out = LOW;
	;***      131 : 		}
	;***      132 : 	}
	;***      133 : 	else	/* PR_in == LOW */
	;***      134 : 	{
	;***      135 : 		Q_out = HIGH;
	;***      136 : 	}
	;***      137 : 	BitMemSet(g74HC112_LastCK, g74HC112_Count, CK_in);
	;***      138 : 	BitMemSet(g74HC112_LastQ, g74HC112_Count, Q_out);
	;***      139 : 
	;***      140 : 	return (Q_out);
	;***      141 : }
	;***      142 : 
	;***      143 : /*******************************************************************************
	;***      144 : * Function Name: IC_74HC112_Out_invQ
	;***      145 : * Description  : J-K Flip-Flop with Preset and Clear
	;***      146 : *                (~Q-terminal output value calculate)
	;***      147 : * Arguments    : Q_out	Q-terminal output value (HIGH or LOW)
	;***      148 : *                CLR_in	CLR-terminal input value (HIGH or LOW)
	;***      149 : *                PR_in 	PR-terminal input value (HIGH or LOW)
	;***      150 : * Return Value : ~Q-terminal output value (HIGH or LOW)
	;***      151 : ********************************************************************************/
	;***      152 : UCHAR IC_74HC112_Out_invQ( UCHAR Q_out, UCHAR CLR_in, UCHAR PR_in )
	;***      153 : {
	;***      154 : 	UCHAR	invQ_out;
	;***      155 : 	
	;***      156 : 	if(PR_in == LOW){
	;***      157 : 		if(CLR_in == LOW){
	;***      158 : 			return (HIGH);
	;***      159 : 		}
	;***      160 : 	}
	;***      161 : 	invQ_out = (~Q_out) & 0x01;
	;***      162 : 	
	;***      163 : 	return invQ_out;
	;***      164 : }
	;***      165 : 
	;***      166 : /*******************************************************************************
	;***      167 : * Function Name: IC74HC112_Initialize
	;***      168 : * Description  : IC74HC112 Panel Initialize.
	;***      169 : * Arguments    : none
	;***      170 : * Return Value : none
	;***      171 : ********************************************************************************/
	;***      172 : void IC74HC112_Initialize( void )
	;***      173 : {
	;***      174 : 	memset(g74HC112_LastQ, 0, (IC74HC112_USED / 8) + 1);
	;***      175 : 	memset(g74HC112_LastCK, 0, (IC74HC112_USED / 8) + 1);
	;***      176 : }
	;***      177 : 
	;***      178 : /*******************************************************************************
	;***      179 : * Function Name: IC74HC112_Counter_Clear
	;***      180 : * Description  : IC74HC112 Panel Counter Clear.
	;***      181 : * Arguments    : none
	;***      182 : * Return Value : none
	;***      183 : ********************************************************************************/
	;***      184 : void IC74HC112_Counter_Clear( void )
	;***      185 : {
	;***      186 : 	g74HC112_Count = 0;
	;***      187 : }
	;***      188 : 
	;***      189 : /*******************************************************************************
	;***      190 : * Function Name: IC74HC112_Counter
	;***      191 : * Description  : IC74HC112 Panel Counter.
	;***      192 : * Arguments    : none
	;***      193 : * Return Value : none
	;***      194 : ********************************************************************************/
	;***      195 : void IC74HC112_Counter( void )
	;***      196 : {
	;***      197 : 	g74HC112_Count ++;
	;***      198 : }
	;***      199 : #endif /* end of defined IC74HC112_USED */
	;***      200 : 
	;***      201 : 
	;***      202 : #if defined IC74HC153_USED
	;***      203 : /*******************************************************************************
	;***      204 : * Function Name: IC_74HC153
	;***      205 : * Description  : 4-Channel Multiplexer
	;***      206 : * Arguments    : G_in	G-terminal input value (HIGH or LOW)
	;***      207 : *                A_in	A-terminal input value (HIGH or LOW)
	;***      208 : *                B_in 	B-terminal input value (HIGH or LOW)
	;***      209 : *                C0_in 	C0-terminal input value (HIGH or LOW)
	;***      210 : *                C1_in	C1-terminal input value (HIGH or LOW)
	;***      211 : *                C2_in 	C2-terminal input value (HIGH or LOW)
	;***      212 : *                C3_in 	C3-terminal input value (HIGH or LOW)
	;***      213 : * Return Value : Y-terminal output value (HIGH or LOW)
	;***      214 : ********************************************************************************/
	;***      215 : UCHAR  IC_74HC153( UCHAR G_in, UCHAR A_in, UCHAR B_in, UCHAR C0_in, UCHAR C1_in, UCHAR C2_in, UCHAR C3_in )
	;***      216 : {
	;***      217 : 	UCHAR	Y_out;
	;***      218 : 	
	;***      219 : 	if(G_in == LOW){
	;***      220 : 		switch(A_in + (B_in << 1)){
	;***      221 : 			case 0:
	;***      222 : 				Y_out = C0_in;
	;***      223 : 				break;
	;***      224 : 			case 1:
	;***      225 : 				Y_out = C1_in;
	;***      226 : 				break;
	;***      227 : 			case 2:
	;***      228 : 				Y_out = C2_in;
	;***      229 : 				break;
	;***      230 : 			case 3:
	;***      231 : 				Y_out = C3_in;
	;***      232 : 				break;
	;***      233 : 		}
	;***      234 : 	}else{	/* G_in == HIGH */
	;***      235 : 		Y_out = LOW;
	;***      236 : 	}
	;***      237 : 	
	;***      238 : 	return Y_out;
	;***      239 : }
	;***      240 : #endif /* end of defined IC74HC153_USED */
	;***      241 : 
	;***      242 : #if defined IC74HC138_USED
	;***      243 : /*******************************************************************************
	;***      244 : * Function Name: IC_74HC138_Judge_Enable
	;***      245 : * Description  : 3-to-8 Line Decoder
	;***      246 : *                (enable or disable of operation is judged)
	;***      247 : * Arguments    : G1_in	G1-terminal input value (HIGH or LOW)
	;***      248 : *                G2A_in	G2A-terminal input value (HIGH or LOW)
	;***      249 : *                G2B_in 	G2B-terminal input value (HIGH or LOW)
	;***      250 : * Return Value : permission of operation (enable:HIGH  disable:LOW)
	;***      251 : ********************************************************************************/
	;***      252 : UCHAR  IC_74HC138_Judge_Enable( UCHAR G1_in, UCHAR G2A_in, UCHAR G2B_in )
	;***      253 : {
	;***      254 : 	UCHAR	state;
	;***      255 : 	UCHAR	work;
	;***      256 : 	
	;***      257 : 	if(G1_in == HIGH)
	;***      258 : 	{
	;***      259 : 		work = G2A_in | G2B_in;
	;***      260 : 		if(work == LOW)	state = HIGH;
	;***      261 : 		else			state = LOW;	/* work == HIGH */
	;***      262 : 	}
	;***      263 : 	else	/* G1_in == LOW */
	;***      264 : 	{
	;***      265 : 		state = LOW;
	;***      266 : 	}
	;***      267 : 	
	;***      268 : 	return (state);
	;***      269 : }
	;***      270 : 
	;***      271 : /*******************************************************************************
	;***      272 : * Function Name: IC_74HC138_Evaluate
	;***      273 : * Description  : 3-to-8 Line Decoder
	;***      274 : *                (address value calculate)
	;***      275 : * Arguments    : A_in	A-terminal input value (HIGH or LOW)
	;***      276 : *                B_in	B-terminal input value (HIGH or LOW)
	;***      277 : *                C_in 	C-terminal input value (HIGH or LOW)
	;***      278 : * Return Value : address value that input value indicates
	;***      279 : ********************************************************************************/
	;***      280 : UCHAR  IC_74HC138_Evaluate( UCHAR G1_in, UCHAR G2A_in, UCHAR G2B_in, UCHAR A_in, UCHAR B_in, UCHAR C_in )
	;***      281 : {
	;***      282 : 	UCHAR	ucRet = 0b11111111;
	;***      283 : 
	;***      284 : 	UCHAR	ucEnable = LOW;
	;***      285 : 	
	;***      286 : 	if(G1_in == HIGH){
	;***      287 : 		if ((G2A_in | G2B_in)==0){
	;***      288 : 			ucRet = 0;
	;***      289 : 			switch(A_in + (B_in << 1) + (C_in << 2)){
	;***      290 : 			case 0: ucRet = 0b11111110; break;
	;***      291 : 			case 1: ucRet = 0b11111101; break;
	;***      292 : 			case 2: ucRet = 0b11111011; break;
	;***      293 : 			case 3: ucRet = 0b11110111; break;
	;***      294 : 			case 4: ucRet = 0b11101111; break;
	;***      295 : 			case 5: ucRet = 0b11011111; break;
	;***      296 : 			case 6: ucRet = 0b10111111; break;
	;***      297 : 			case 7: ucRet = 0b01111111; break;
	;***      298 : 			default:
	;***      299 : 					ucRet = 0b11111111;
	;***      300 : 			}
	;***      301 : 		}
	;***      302 : 	}	
	;***      303 : 
	;***      304 : 	return ucRet;
	;***      305 : }
	;***      306 : 
	;***      307 : /*******************************************************************************
	;***      308 : * Function Name: IC_74HC138_Out_Y0
	;***      309 : * Description  : 3-to-8 Line Decoder
	;***      310 : *                (Y0-terminal output value calculate)
	;***      311 : * Arguments    : State	permission of operation
	;***      312 : *                Addr	address value
	;***      313 : * Return Value : Y0-terminal output value
	;***      314 : ********************************************************************************/
	;***      315 : UCHAR  IC_74HC138_Out_Y0( UCHAR State, UCHAR Addr )
	;***      316 : {
	;***      317 : 	UCHAR	Y0_out;
	;***      318 : 	
	;***      319 : 	if(State == HIGH)
	;***      320 : 	{
	;***      321 : 		if(Addr == 0)	Y0_out = LOW;
	;***      322 : 		else			Y0_out = HIGH;	/* Addr != 0 */
	;***      323 : 	}
	;***      324 : 	else	/* State == LOW */
	;***      325 : 	{
	;***      326 : 		Y0_out = HIGH;
	;***      327 : 	}
	;***      328 : 	return(Y0_out);
	;***      329 : 	
	;***      330 : }
	;***      331 : 
	;***      332 : /*******************************************************************************
	;***      333 : * Function Name: IC_74HC138_Out_Y1
	;***      334 : * Description  : 3-to-8 Line Decoder
	;***      335 : *                (Y1-terminal output value calculate)
	;***      336 : * Arguments    : State	permission of operation
	;***      337 : *                Addr	address value
	;***      338 : * Return Value : Y1-terminal output value
	;***      339 : ********************************************************************************/
	;***      340 : UCHAR  IC_74HC138_Out_Y1( UCHAR State, UCHAR Addr )
	;***      341 : {
	;***      342 : 	UCHAR	Y1_out;
	;***      343 : 	
	;***      344 : 	if(State == HIGH)
	;***      345 : 	{
	;***      346 : 		if(Addr == 1)	Y1_out = LOW;
	;***      347 : 		else			Y1_out = HIGH;	/* Addr != 0 */
	;***      348 : 	}
	;***      349 : 	else	/* State == LOW */
	;***      350 : 	{
	;***      351 : 		Y1_out = HIGH;
	;***      352 : 	}
	;***      353 : 	return(Y1_out);
	;***      354 : 	
	;***      355 : }
	;***      356 : 
	;***      357 : /*******************************************************************************
	;***      358 : * Function Name: IC_74HC138_Out_Y2
	;***      359 : * Description  : 3-to-8 Line Decoder
	;***      360 : *                (Y2-terminal output value calculate)
	;***      361 : * Arguments    : State	permission of operation
	;***      362 : *                Addr	address value
	;***      363 : * Return Value : Y2-terminal output value
	;***      364 : ********************************************************************************/
	;***      365 : UCHAR  IC_74HC138_Out_Y2( UCHAR State, UCHAR Addr )
	;***      366 : {
	;***      367 : 	UCHAR	Y2_out;
	;***      368 : 	
	;***      369 : 	if(State == HIGH)
	;***      370 : 	{
	;***      371 : 		if(Addr == 2)	Y2_out = LOW;
	;***      372 : 		else			Y2_out = HIGH;	/* Addr != 0 */
	;***      373 : 	}
	;***      374 : 	else	/* State == LOW */
	;***      375 : 	{
	;***      376 : 		Y2_out = HIGH;
	;***      377 : 	}
	;***      378 : 	return(Y2_out);
	;***      379 : 	
	;***      380 : }
	;***      381 : 
	;***      382 : /*******************************************************************************
	;***      383 : * Function Name: IC_74HC138_Out_Y3
	;***      384 : * Description  : 3-to-8 Line Decoder
	;***      385 : *                (Y3-terminal output value calculate)
	;***      386 : * Arguments    : State	permission of operation
	;***      387 : *                Addr	address value
	;***      388 : * Return Value : Y3-terminal output value
	;***      389 : ********************************************************************************/
	;***      390 : UCHAR  IC_74HC138_Out_Y3( UCHAR State, UCHAR Addr )
	;***      391 : {
	;***      392 : 	UCHAR	Y3_out;
	;***      393 : 	
	;***      394 : 	if(State == HIGH)
	;***      395 : 	{
	;***      396 : 		if(Addr == 3)	Y3_out = LOW;
	;***      397 : 		else			Y3_out = HIGH;	/* Addr != 0 */
	;***      398 : 	}
	;***      399 : 	else	/* State == LOW */
	;***      400 : 	{
	;***      401 : 		Y3_out = HIGH;
	;***      402 : 	}
	;***      403 : 	return(Y3_out);
	;***      404 : 	
	;***      405 : }
	;***      406 : 
	;***      407 : /*******************************************************************************
	;***      408 : * Function Name: IC_74HC138_Out_Y4
	;***      409 : * Description  : 3-to-8 Line Decoder
	;***      410 : *                (Y4-terminal output value calculate)
	;***      411 : * Arguments    : State	permission of operation
	;***      412 : *                Addr	address value
	;***      413 : * Return Value : Y4-terminal output value
	;***      414 : ********************************************************************************/
	;***      415 : UCHAR  IC_74HC138_Out_Y4( UCHAR State, UCHAR Addr )
	;***      416 : {
	;***      417 : 	UCHAR	Y4_out;
	;***      418 : 	
	;***      419 : 	if(State == HIGH)
	;***      420 : 	{
	;***      421 : 		if(Addr == 4)	Y4_out = LOW;
	;***      422 : 		else			Y4_out = HIGH;	/* Addr != 0 */
	;***      423 : 	}
	;***      424 : 	else	/* State == LOW */
	;***      425 : 	{
	;***      426 : 		Y4_out = HIGH;
	;***      427 : 	}
	;***      428 : 	return(Y4_out);
	;***      429 : 	
	;***      430 : }
	;***      431 : 
	;***      432 : /*******************************************************************************
	;***      433 : * Function Name: IC_74HC138_Out_Y5
	;***      434 : * Description  : 3-to-8 Line Decoder
	;***      435 : *                (Y5-terminal output value calculate)
	;***      436 : * Arguments    : State	permission of operation
	;***      437 : *                Addr	address value
	;***      438 : * Return Value : Y5-terminal output value
	;***      439 : ********************************************************************************/
	;***      440 : UCHAR  IC_74HC138_Out_Y5( UCHAR State, UCHAR Addr )
	;***      441 : {
	;***      442 : 	UCHAR	Y5_out;
	;***      443 : 	
	;***      444 : 	if(State == HIGH)
	;***      445 : 	{
	;***      446 : 		if(Addr == 5)	Y5_out = LOW;
	;***      447 : 		else			Y5_out = HIGH;	/* Addr != 0 */
	;***      448 : 	}
	;***      449 : 	else	/* State == LOW */
	;***      450 : 	{
	;***      451 : 		Y5_out = HIGH;
	;***      452 : 	}
	;***      453 : 	return(Y5_out);
	;***      454 : 	
	;***      455 : }
	;***      456 : 
	;***      457 : /*******************************************************************************
	;***      458 : * Function Name: IC_74HC138_Out_Y6
	;***      459 : * Description  : 3-to-8 Line Decoder
	;***      460 : *                (Y6-terminal output value calculate)
	;***      461 : * Arguments    : State	permission of operation
	;***      462 : *                Addr	address value
	;***      463 : * Return Value : Y6-terminal output value
	;***      464 : ********************************************************************************/
	;***      465 : UCHAR  IC_74HC138_Out_Y6( UCHAR State, UCHAR Addr )
	;***      466 : {
	;***      467 : 	UCHAR	Y6_out;
	;***      468 : 	
	;***      469 : 	if(State == HIGH)
	;***      470 : 	{
	;***      471 : 		if(Addr == 6)	Y6_out = LOW;
	;***      472 : 		else			Y6_out = HIGH;	/* Addr != 0 */
	;***      473 : 	}
	;***      474 : 	else	/* State == LOW */
	;***      475 : 	{
	;***      476 : 		Y6_out = HIGH;
	;***      477 : 	}
	;***      478 : 	return(Y6_out);
	;***      479 : 	
	;***      480 : }
	;***      481 : 
	;***      482 : /*******************************************************************************
	;***      483 : * Function Name: IC_74HC138_Out_Y7
	;***      484 : * Description  : 3-to-8 Line Decoder
	;***      485 : *                (Y7-terminal output value calculate)
	;***      486 : * Arguments    : State	permission of operation
	;***      487 : *                Addr	address value
	;***      488 : * Return Value : Y7-terminal output value
	;***      489 : ********************************************************************************/
	;***      490 : UCHAR  IC_74HC138_Out_Y7( UCHAR State, UCHAR Addr )
	;***      491 : {
	;***      492 : 	UCHAR	Y7_out;
	;***      493 : 	
	;***      494 : 	if(State == HIGH)
	;***      495 : 	{
	;***      496 : 		if(Addr == 7)	Y7_out = LOW;
	;***      497 : 		else			Y7_out = HIGH;	/* Addr != 0 */
	;***      498 : 	}
	;***      499 : 	else	/* State == LOW */
	;***      500 : 	{
	;***      501 : 		Y7_out = HIGH;
	;***      502 : 	}
	;***      503 : 	return(Y7_out);
	;***      504 : 	
	;***      505 : }
	;***      506 : #endif /* end of defined IC74HC138_USED */
	;***      507 : 
	;***      508 : #if defined IC74HC148_USED
	;***      509 : /*******************************************************************************
	;***      510 : * Function Name: IC_74HC148_Evaluate
	;***      511 : * Description  : 8-to-3 Line Priority Encoder
	;***      512 : *                (address value calculate)
	;***      513 : * Arguments    : In0_in	In0-terminal input value (HIGH or LOW)
	;***      514 : *                In1_in	In1-terminal input value (HIGH or LOW)
	;***      515 : *                In2_in 	In2-terminal input value (HIGH or LOW)
	;***      516 : *                In3_in 	In3-terminal input value (HIGH or LOW)
	;***      517 : *                In4_in	In4-terminal input value (HIGH or LOW)
	;***      518 : *                In5_in 	In5-terminal input value (HIGH or LOW)
	;***      519 : *                In6_in 	In6-terminal input value (HIGH or LOW)
	;***      520 : *                In7_in 	In7-terminal input value (HIGH or LOW)
	;***      521 : * Return Value : address value that input value indicates
	;***      522 : *                (If all the input values are HIGH, 8 is returned)
	;***      523 : ********************************************************************************/
	;***      524 : UCHAR  IC_74HC148_Evaluate( UCHAR E0_in, UCHAR In0_in, UCHAR In1_in, UCHAR In2_in, UCHAR In3_in, UCHAR In4_in, UCHAR In5_in, UCHAR In6_in, UCHAR In7_in )
	;***      525 : {
	;***      526 : 	/*	E0,GS,A2,A1,A0 */
	;***      527 : 	UCHAR ucRet;
	;***      528 : 	
	;***      529 : 	if (E0_in==HIGH){
	;***      530 : 		ucRet = 0b00011111;
	;***      531 : 	}else{
	;***      532 : 		if(In7_in == LOW)		ucRet = 0b00010000;
	;***      533 : 		else if(In6_in == LOW)	ucRet = 0b00010001;
	;***      534 : 		else if(In5_in == LOW)	ucRet = 0b00010010;
	;***      535 : 		else if(In4_in == LOW)	ucRet = 0b00010011;
	;***      536 : 		else if(In3_in == LOW)	ucRet = 0b00010100;
	;***      537 : 		else if(In2_in == LOW)	ucRet = 0b00010101;
	;***      538 : 		else if(In1_in == LOW)	ucRet = 0b00010110;
	;***      539 : 		else if(In0_in == LOW)	ucRet = 0b00010111;
	;***      540 : 		else 					ucRet = 0b00001111;
	;***      541 : 	}
	;***      542 : 
	;***      543 : 	return ucRet;
	;***      544 : 
	;***      545 : }
	;***      546 : 
	;***      547 : /*******************************************************************************
	;***      548 : * Function Name: IC_74HC148_Out_A0
	;***      549 : * Description  : 8-to-3 Line Priority Encoder
	;***      550 : *                (A0-terminal output value calculate)
	;***      551 : * Arguments    : E1_in	E1-terminal input value (HIGH or LOW)
	;***      552 : *                Addr	address value
	;***      553 : * Return Value : A0-terminal output value
	;***      554 : ********************************************************************************/
	;***      555 : UCHAR  IC_74HC148_Out_A0( UCHAR E1_in, UCHAR Addr )
	;***      556 : {
	;***      557 : 	UCHAR	A0_out;
	;***      558 : 	
	;***      559 : 	if(E1_in == LOW)
	;***      560 : 	{
	;***      561 : 		if(Addr == 8)	A0_out = HIGH;
	;***      562 : 		else			A0_out = (~Addr) & 0x01;	/* Addr != 8 */
	;***      563 : 	}
	;***      564 : 	else	/* E1_in == HIGH */
	;***      565 : 	{
	;***      566 : 		A0_out = HIGH;
	;***      567 : 	}
	;***      568 : 	return(A0_out);
	;***      569 : 	
	;***      570 : }
	;***      571 : 
	;***      572 : /*******************************************************************************
	;***      573 : * Function Name: IC_74HC148_Out_A1
	;***      574 : * Description  : 8-to-3 Line Priority Encoder
	;***      575 : *                (A1-terminal output value calculate)
	;***      576 : * Arguments    : E1_in	E1-terminal input value (HIGH or LOW)
	;***      577 : *                Addr	address value
	;***      578 : * Return Value : A1-terminal output value
	;***      579 : ********************************************************************************/
	;***      580 : UCHAR  IC_74HC148_Out_A1( UCHAR E1_in, UCHAR Addr )
	;***      581 : {
	;***      582 : 	UCHAR	A1_out;
	;***      583 : 	
	;***      584 : 	if(E1_in == LOW)
	;***      585 : 	{
	;***      586 : 		if(Addr == 8)	A1_out = HIGH;
	;***      587 : 		else			A1_out = ((~Addr) >> 1) & 0x01;	/* Addr != 8 */
	;***      588 : 	}
	;***      589 : 	else	/* E1_in == HIGH */
	;***      590 : 	{
	;***      591 : 		A1_out = HIGH;
	;***      592 : 	}
	;***      593 : 	return(A1_out);
	;***      594 : 	
	;***      595 : }
	;***      596 : 
	;***      597 : /*******************************************************************************
	;***      598 : * Function Name: IC_74HC148_Out_A2
	;***      599 : * Description  : 8-to-3 Line Priority Encoder
	;***      600 : *                (A2-terminal output value calculate)
	;***      601 : * Arguments    : E1_in	E1-terminal input value (HIGH or LOW)
	;***      602 : *                Addr	address value
	;***      603 : * Return Value : A2-terminal output value
	;***      604 : ********************************************************************************/
	;***      605 : UCHAR  IC_74HC148_Out_A2( UCHAR E1_in, UCHAR Addr )
	;***      606 : {
	;***      607 : 	UCHAR	A2_out;
	;***      608 : 	
	;***      609 : 	if(E1_in == LOW)
	;***      610 : 	{
	;***      611 : 		if(Addr == 8)	A2_out = HIGH;
	;***      612 : 		else			A2_out = ((~Addr) >> 2) & 0x01;	/* Addr != 8 */
	;***      613 : 	}
	;***      614 : 	else	/* E1_in == HIGH */
	;***      615 : 	{
	;***      616 : 		A2_out = HIGH;
	;***      617 : 	}
	;***      618 : 	return(A2_out);
	;***      619 : 	
	;***      620 : }
	;***      621 : 
	;***      622 : /*******************************************************************************
	;***      623 : * Function Name: IC_74HC148_Out_GS
	;***      624 : * Description  : 8-to-3 Line Priority Encoder
	;***      625 : *                (GS-terminal output value calculate)
	;***      626 : * Arguments    : E1_in	E1-terminal input value (HIGH or LOW)
	;***      627 : *                Addr	address value
	;***      628 : * Return Value : GS-terminal output value
	;***      629 : ********************************************************************************/
	;***      630 : UCHAR  IC_74HC148_Out_GS( UCHAR E1_in, UCHAR Addr )
	;***      631 : {
	;***      632 : 	UCHAR	GS_out;
	;***      633 : 	
	;***      634 : 	if (E1_in == LOW){
	;***      635 : 		if(Addr == 8)	GS_out = HIGH;
	;***      636 : 		else			GS_out = LOW;	/* Addr != 8 */
	;***      637 : 	
	;***      638 : 	}else{	/* E1_in == HIGH */
	;***      639 : 		GS_out = HIGH;
	;***      640 : 	}
	;***      641 : 	return GS_out;
	;***      642 : 	
	;***      643 : }
	;***      644 : 
	;***      645 : /*******************************************************************************
	;***      646 : * Function Name: IC_74HC148_Out_EO
	;***      647 : * Description  : 8-to-3 Line Priority Encoder
	;***      648 : *                (EO-terminal output value calculate)
	;***      649 : * Arguments    : E1_in	E1-terminal input value (HIGH or LOW)
	;***      650 : *                Addr	address value
	;***      651 : * Return Value : EO-terminal output value
	;***      652 : ********************************************************************************/
	;***      653 : UCHAR  IC_74HC148_Out_EO( UCHAR E1_in, UCHAR Addr )
	;***      654 : {
	;***      655 : 	UCHAR	EO_out;
	;***      656 : 	
	;***      657 : 	if (E1_in == LOW){
	;***      658 : 		if(Addr == 8)	EO_out = LOW;
	;***      659 : 		else			EO_out = HIGH;	/* Addr != 8 */
	;***      660 : 	
	;***      661 : 	}else{	/* E1_in == HIGH */
	;***      662 : 		EO_out = HIGH;
	;***      663 : 	}
	;***      664 : 	
	;***      665 : 	return EO_out;
	;***      666 : 	
	;***      667 : }
	;***      668 : #endif /* end of defined IC74HC148_USED */
	;***      669 : 
	;***      670 : #if defined IC74HC77_USED
	;***      671 : /*******************************************************************************
	;***      672 : * Function Name: IC_74HC77
	;***      673 : * Description  : Bistable Latch
	;***      674 : * Arguments    : D_in	D-terminal input value (HIGH or LOW)
	;***      675 : *                G_in	G-terminal input value (HIGH or LOW)
	;***      676 : * Return Value : Q-terminal output value (HIGH or LOW)
	;***      677 : ********************************************************************************/
	;***      678 : UCHAR  IC_74HC77( UCHAR D_in, UCHAR G_in )
	;***      679 : {
	;***      680 : 	UCHAR	Q_out;
	;***      681 : 	UCHAR	lastQ;
	;***      682 : 	
	;***      683 : 	lastQ = BitMemGet(g74HC77_LastQ, g74HC77_Count);
	;***      684 : 	
	;***      685 : 	if (G_in == HIGH)	Q_out = D_in;
	;***      686 : 	else				Q_out = lastQ;	/* G_in == LOW */
	;***      687 : 
	;***      688 : 	BitMemSet(g74HC77_LastQ, g74HC77_Count, Q_out);
	;***      689 : 	
	;***      690 : 	return Q_out;
	;***      691 : }
	;***      692 : 
	;***      693 : /*******************************************************************************
	;***      694 : * Function Name: IC74HC77_Initialize
	;***      695 : * Description  : IC74HC77 Panel Initialize.
	;***      696 : * Arguments    : none
	;***      697 : * Return Value : none
	;***      698 : ********************************************************************************/
	;***      699 : void IC74HC77_Initialize( void )
	;***      700 : {
	;***      701 : 	memset(g74HC77_LastQ, 0, (IC74HC77_USED / 8) + 1);
	;***      702 : }
	;***      703 : 
	;***      704 : /*******************************************************************************
	;***      705 : * Function Name: IC74HC77_Counter_Clear
	;***      706 : * Description  : IC74HC77 Panel Counter Clear.
	;***      707 : * Arguments    : none
	;***      708 : * Return Value : none
	;***      709 : ********************************************************************************/
	;***      710 : void IC74HC77_Counter_Clear( void )
	;***      711 : {
	;***      712 : 	g74HC77_Count = 0;
	;***      713 : }
	;***      714 : 
	;***      715 : /*******************************************************************************
	;***      716 : * Function Name: IC74HC77_Counter
	;***      717 : * Description  : IC74HC77 Panel Counter.
	;***      718 : * Arguments    : none
	;***      719 : * Return Value : none
	;***      720 : ********************************************************************************/
	;***      721 : void IC74HC77_Counter( void )
	;***      722 : {
	;***      723 : 	g74HC77_Count ++;
	;***      724 : }
	;***      725 : #endif /* end of defined IC74HC77_USED */
	;***      726 : 
	;***      727 : #if defined IC74HC4511_USED
	;***      728 : /*******************************************************************************
	;***      729 : * Function Name: IC_74HC4511_Judge_State
	;***      730 : * Description  : BCD-to-7-Segment Latch/Decoder/Driver
	;***      731 : *                (state of operation of IC is judged)
	;***      732 : * Arguments    : LE_in	LE-terminal input value (HIGH or LOW)
	;***      733 : *                BI_in	BI-terminal input value (HIGH or LOW)
	;***      734 : *                LT_in	LT-terminal input value (HIGH or LOW)
	;***      735 : * Return Value : state of operation of IC	(0 - 3)
	;***      736 : *                    0:Numeric Display
	;***      737 : *                    1:All Lightning
	;***      738 : *                    2:All Turning Off
	;***      739 : *                    3:Display Continuance
	;***      740 : ********************************************************************************/
	;***      741 : UCHAR  IC_74HC4511_Judge_State( UCHAR LE_in, UCHAR BI_in, UCHAR LT_in )
	;***      742 : {
	;***      743 : 	UCHAR	state;
	;***      744 : 
	;***      745 : 	if (LT_in == HIGH){
	dec c
	bz $.BB@LABEL@1_2
.BB@LABEL@1_1:	; entry.if_break_bb19_crit_edge
	oneb a
	br $.BB@LABEL@1_6
.BB@LABEL@1_2:	; if_then_bb
	;***      746 : 		if (BI_in == HIGH){
	dec x
	bz $.BB@LABEL@1_4
.BB@LABEL@1_3:	; if_then_bb.if_break_bb19_crit_edge
	mov a, #0x02
	br $.BB@LABEL@1_6
.BB@LABEL@1_4:	; if_then_bb9
	;***      747 : 			if (LE_in == LOW)	state = 0;
	cmp0 a
	clrb a
	skz
.BB@LABEL@1_5:	; if_else_bb
	;***      748 : 			else				state = 3;	/* LE_in == HIGH */
	mov a, #0x03
.BB@LABEL@1_6:	; if_break_bb19
	ret
.LFE1:
	.TYPE _IC_74HC4511_Evaluate,function,.LFE2-_IC_74HC4511_Evaluate
_IC_74HC4511_Evaluate:
	.STACK _IC_74HC4511_Evaluate = 6
	;***      749 : 		
	;***      750 : 		}else{	/* BI_in == LOW */
	;***      751 : 			state = 2;
	;***      752 : 		}
	;***      753 : 	}else{	/* LT_in == LOW */
	;***      754 : 		state = 1;
	;***      755 : 	}
	;***      756 : 	
	;***      757 : 	return state;
	;***      758 : 	
	;***      759 : }
	;***      760 : 
	;***      761 : /*******************************************************************************
	;***      762 : * Function Name: IC_74HC4511_Evaluate
	;***      763 : * Description  : BCD-to-7-Segment Latch/Decoder/Driver
	;***      764 : *                (numerical value that the input value shows is calculated )
	;***      765 : * Arguments    : State	state of operation of IC (0 - 3)
	;***      766 : *                A_in	A-terminal input value (HIGH or LOW)
	;***      767 : *                B_in	B-terminal input value (HIGH or LOW)
	;***      768 : *                C_in	C-terminal input value (HIGH or LOW)
	;***      769 : *                D_in	D-terminal input value (HIGH or LOW)
	;***      770 : * Return Value : Numerical value that input value shows	(0-10)
	;***      771 : *                (Ten is set in case of ten or more)
	;***      772 : ********************************************************************************/
	;***      773 : UCHAR  IC_74HC4511_Evaluate( UCHAR State, UCHAR A_in, UCHAR B_in, UCHAR C_in, UCHAR D_in )
	push ax
	;***      774 : {
	;***      775 : 	/*							   abcdefgh		*/
	;***      776 : 	UCHAR ucRet[11] =  { 0b11111100, 0b01100000, 0b11011010, 0b11110010, 0b01100110,
	;***      777 : 							     0b10110110, 0b00111110, 0b11100000, 0b11111110, 0b11100110, 0b00000000 };
	;***      778 : 	UCHAR	ucValue;
	;***      779 : 	
	;***      780 : 	switch(State)
	cmp0 a
	bz $.BB@LABEL@2_5
.BB@LABEL@2_1:	; entry
	dec a
	bz $.BB@LABEL@2_4
.BB@LABEL@2_2:	; entry
	cmp a, #0x02
	bnz $.BB@LABEL@2_9
.BB@LABEL@2_3:	; switch_clause_bb26
	;***      781 : 	{
	;***      782 : 		case 0:
	;***      783 : 			ucValue = A_in + (B_in << 1) + (C_in << 2) + (D_in << 3);
	;***      784 : 			if(ucValue > 10) ucValue = 10;
	;***      785 : 			ByteMemSet(g74HC4511_LastNum, g74HC4511_Count, ucValue);
	;***      786 : 			break;
	;***      787 : 		case 1:
	;***      788 : 			ucValue = 8;
	;***      789 : 			break;
	;***      790 : 		case 2:
	;***      791 : 			ucValue = 10;
	;***      792 : 			break;
	;***      793 : 		case 3:
	;***      794 : 			ucValue = ByteMemGet(g74HC4511_LastNum, g74HC4511_Count);
	mov c, !LOWW(_g74HC4511_Count)
	movw ax, #LOWW(_g74HC4511_LastNum)
	call !!_ByteMemGet
	mov [sp+0x00], a
	br $.BB@LABEL@2_8
.BB@LABEL@2_4:	; entry.if_break_bb36_crit_edge
	mov [sp+0x00], #0x08
	br $.BB@LABEL@2_10
.BB@LABEL@2_5:	; switch_clause_bb
	mov a, b
	mov x, #0x03
	mulu x
	mov a, [sp+0x00]
	add b, a
	shl c, 0x01
	mov a, e
	shl a, 0x03
	add a, x
	add a, b
	add a, c
	mov [sp+0x00], a
	cmp a, #0x0B
	bc $.BB@LABEL@2_7
.BB@LABEL@2_6:	; if_then_bb
	mov a, #0x0A
	mov [sp+0x00], a
.BB@LABEL@2_7:	; if_break_bb
	mov b, a
	mov c, !LOWW(_g74HC4511_Count)
	movw ax, #LOWW(_g74HC4511_LastNum)
	call !!_ByteMemSet
	mov a, [sp+0x00]
.BB@LABEL@2_8:	; switch_break_bb
	;***      795 : 			break;
	;***      796 : 		default:
	;***      797 : 			ucValue = 10;
	;***      798 : 			break;
	;***      799 : 	}
	;***      800 : 	
	;***      801 : 	if (ucValue > 10) ucValue = 10;
	cmp a, #0x0B
	skc
.BB@LABEL@2_9:	; if_then_bb35
	mov [sp+0x00], #0x0A
.BB@LABEL@2_10:	; if_break_bb36
	mov a, [sp+0x00]
	mov b, a
	;***      802 : 	return ucRet[ucValue];
	mov a, SMRLW(.STR@1)[b]
	;***      803 : }
	pop bc
	ret
.LFE2:
	.TYPE _IC74HC4511_Initialize,function,.LFE3-_IC74HC4511_Initialize
_IC74HC4511_Initialize:
	.STACK _IC74HC4511_Initialize = 4
	;***      804 : 
	;***      805 : /*******************************************************************************
	;***      806 : * Function Name: IC74HC4511_Initialize
	;***      807 : * Description  : IC74HC4511 Panel Initialize.
	;***      808 : * Arguments    : none
	;***      809 : * Return Value : none
	;***      810 : ********************************************************************************/
	;***      811 : void IC74HC4511_Initialize( void )
	;***      812 : {
	;***      813 : 	memset(g74HC4511_LastNum, 0, IC74HC4511_USED);
	onew ax
	movw de, ax
	clrw bc
	movw ax, #LOWW(_g74HC4511_LastNum)
	br !!_memset
.LFE3:
	.TYPE _IC74HC4511_Counter_Clear,function,.LFE4-_IC74HC4511_Counter_Clear
_IC74HC4511_Counter_Clear:
	.STACK _IC74HC4511_Counter_Clear = 4
	;***      814 : }
	;***      815 : 
	;***      816 : /*******************************************************************************
	;***      817 : * Function Name: IC74HC4511_Counter_Clear
	;***      818 : * Description  : IC74HC4511 Panel Counter Clear.
	;***      819 : * Arguments    : none
	;***      820 : * Return Value : none
	;***      821 : ********************************************************************************/
	;***      822 : void IC74HC4511_Counter_Clear( void )
	;***      823 : {
	;***      824 : 	g74HC4511_Count = 0;
	clrb !LOWW(_g74HC4511_Count)
	ret
.LFE4:
	.TYPE _IC74HC4511_Counter,function,.LFE5-_IC74HC4511_Counter
_IC74HC4511_Counter:
	.STACK _IC74HC4511_Counter = 4
	;***      825 : }
	;***      826 : 
	;***      827 : /*******************************************************************************
	;***      828 : * Function Name: IC74HC4511_Counter
	;***      829 : * Description  : IC74HC4511 Panel Counter.
	;***      830 : * Arguments    : none
	;***      831 : * Return Value : none
	;***      832 : ********************************************************************************/
	;***      833 : void IC74HC4511_Counter( void )
	;***      834 : {
	;***      835 : 	g74HC4511_Count ++;
	inc !LOWW(_g74HC4511_Count)
	ret
.LFE5:
	;***      836 : }
	;***      837 : #endif /* end of defined IC74HC4511_USED */
	;***      838 : 
	;***      839 : #if defined IC74HC166_USED
	;***      840 : /*******************************************************************************
	;***      841 : * Function Name: IC_74HC166_Judge_State
	;***      842 : * Description  : 8-bit parallel-in / serial-out shift register
	;***      843 : *                (state of operation of IC is judged)
	;***      844 : * Arguments    : CLR_in		CLR-terminal input value (HIGH or LOW)
	;***      845 : *                SL_in		SL-terminal input value (HIGH or LOW)
	;***      846 : *                CK_INH_in	CKINH-terminal input value (HIGH or LOW)
	;***      847 : *                CK_in		CK-terminal input value (HIGH or LOW)
	;***      848 : * Return Value : state of operation of IC	(0 - 3)
	;***      849 : *                    0:Clear
	;***      850 : *                    1:Load
	;***      851 : *                    2:Shift
	;***      852 : *                    3:Continuance
	;***      853 : ********************************************************************************/
	;***      854 : UCHAR  IC_74HC166_Judge_State( UCHAR CLR_in, UCHAR SL_in, UCHAR CK_INH_in, UCHAR CK_in )
	;***      855 : {
	;***      856 : 	UCHAR	state;
	;***      857 : 	UCHAR	last_CK;
	;***      858 : 
	;***      859 : 	if (CLR_in == HIGH){
	;***      860 : 		if (CK_INH_in == LOW){
	;***      861 : 			if (CK_in == HIGH){
	;***      862 : 				last_CK = BitMemGet(g74HC166_LastCK, g74HC166_Count);
	;***      863 : 				if (last_CK == LOW){
	;***      864 : 					if (SL_in == LOW)	state = 1;
	;***      865 : 					else				state = 2;	/* SL_in == HIGH */
	;***      866 : 				
	;***      867 : 				}else{	/* last_CK == HIGH	*/
	;***      868 : 					state = 3;
	;***      869 : 				}
	;***      870 : 			}else{	/* CK_in == LOW */
	;***      871 : 				state = 3;
	;***      872 : 			}
	;***      873 : 		}else{	/* CK_INH_in == HIGH */
	;***      874 : 			state = 3;
	;***      875 : 		}
	;***      876 : 	}else{	/* CLR_in == LOW */
	;***      877 : 		state = 0;
	;***      878 : 	}
	;***      879 : 	BitMemSet(g74HC166_LastCK, g74HC166_Count, CK_in);
	;***      880 : 	return state;
	;***      881 : }
	;***      882 : 
	;***      883 : /*******************************************************************************
	;***      884 : * Function Name: IC_74HC166_Out_QH
	;***      885 : * Description  : 8-bit parallel-in / serial-out shift register
	;***      886 : *                (QH-terminal output value calculate)
	;***      887 : * Arguments    : State	State of operation of IC	(0 - 3)
	;***      888 : *                S_IN_in	S_IN-terminal input value (HIGH or LOW)
	;***      889 : *                A_in	A-terminal input value (HIGH or LOW)
	;***      890 : *                B_in	B-terminal input value (HIGH or LOW)
	;***      891 : *                C_in	C-terminal input value (HIGH or LOW)
	;***      892 : *                D_in	D-terminal input value (HIGH or LOW)
	;***      893 : *                E_in	E-terminal input value (HIGH or LOW)
	;***      894 : *                F_in	F-terminal input value (HIGH or LOW)
	;***      895 : *                G_in	G-terminal input value (HIGH or LOW)
	;***      896 : *                H_in	H-terminal input value (HIGH or LOW)
	;***      897 : * Return Value : QH-terminal output value (HIGH or LOW)
	;***      898 : ********************************************************************************/
	;***      899 : UCHAR  IC_74HC166_Out_QH( UCHAR State, UCHAR S_IN_in, UCHAR A_in, UCHAR B_in, UCHAR C_in, UCHAR D_in, UCHAR E_in, UCHAR F_in, UCHAR G_in, UCHAR H_in )
	;***      900 : {
	;***      901 : 	UCHAR	work;
	;***      902 : 	UCHAR	QH_out;
	;***      903 : 	
	;***      904 : 	switch(State)
	;***      905 : 	{
	;***      906 : 		case 0:
	;***      907 : 			work = 0b00000000;
	;***      908 : 			QH_out = LOW;
	;***      909 : 			ByteMemSet(g74HC166_LastValue, g74HC166_Count, work);
	;***      910 : 			break;
	;***      911 : 		case 1:
	;***      912 : 			work = A_in + (B_in << 1) + (C_in << 2) + (D_in << 3) + 
	;***      913 : 			        (E_in << 4) + (F_in << 5) + (G_in << 6) + (H_in << 7);
	;***      914 : 			QH_out = H_in;
	;***      915 : 			ByteMemSet(g74HC166_LastValue, g74HC166_Count, work);
	;***      916 : 			break;
	;***      917 : 		case 2:
	;***      918 : 			work = ByteMemGet(g74HC166_LastValue, g74HC166_Count);
	;***      919 : 			work <<= 1;
	;***      920 : 			QH_out = (work >> 7) & 0x01;
	;***      921 : 			work += S_IN_in;
	;***      922 : 			ByteMemSet(g74HC166_LastValue, g74HC166_Count, work);
	;***      923 : 			break;
	;***      924 : 		case 3	:
	;***      925 : 			work = ByteMemGet(g74HC166_LastValue, g74HC166_Count);
	;***      926 : 			QH_out = (work >> 7) & 0x01;
	;***      927 : 			break;
	;***      928 : 		default:
	;***      929 : 			break;
	;***      930 : 	}
	;***      931 : 	return QH_out;
	;***      932 : }
	;***      933 : 
	;***      934 : /*******************************************************************************
	;***      935 : * Function Name: IC74HC166_Initialize
	;***      936 : * Description  : IC74HC166 Panel Initialize.
	;***      937 : * Arguments    : none
	;***      938 : * Return Value : none
	;***      939 : ********************************************************************************/
	;***      940 : void IC74HC166_Initialize( void )
	;***      941 : {
	;***      942 : 	memset(g74HC166_LastCK, 0, (IC74HC166_USED / 8) + 1);
	;***      943 : 	memset(g74HC166_LastValue, 0, IC74HC166_USED);
	;***      944 : }
	;***      945 : 
	;***      946 : /*******************************************************************************
	;***      947 : * Function Name: IC74HC166_Counter_Clear
	;***      948 : * Description  : IC74HC166 Panel Counter Clear.
	;***      949 : * Arguments    : none
	;***      950 : * Return Value : none
	;***      951 : ********************************************************************************/
	;***      952 : void IC74HC166_Counter_Clear( void )
	;***      953 : {
	;***      954 : 	g74HC166_Count = 0;
	;***      955 : }
	;***      956 : 
	;***      957 : /*******************************************************************************
	;***      958 : * Function Name: IC74HC166_Counter
	;***      959 : * Description  : IC74HC166 Panel Counter.
	;***      960 : * Arguments    : none
	;***      961 : * Return Value : none
	;***      962 : ********************************************************************************/
	;***      963 : void IC74HC166_Counter( void )
	;***      964 : {
	;***      965 : 	g74HC166_Count ++;
	;***      966 : }
	;***      967 : #endif /* end of defined IC74HC166_USED */
	;***      968 : 
	;***      969 : #if defined IC74HC283_USED
	;***      970 : /*******************************************************************************
	;***      971 : * Function Name: IC_74HC283_Evaluate
	;***      972 : * Description  : 4-Bit Binary Full Adder
	;***      973 : *                (sum total of two values of 4bit indicated by input value and C0_in is calculated)
	;***      974 : * Arguments    : A1_in	A1-terminal input value (HIGH or LOW)
	;***      975 : *                A2_in	A2_IN-terminal input value (HIGH or LOW)
	;***      976 : *                A3_in	A3-terminal input value (HIGH or LOW)
	;***      977 : *                A4_in	A4-terminal input value (HIGH or LOW)
	;***      978 : *                B1_in	B1-terminal input value (HIGH or LOW)
	;***      979 : *                B2_in	B2-terminal input value (HIGH or LOW)
	;***      980 : *                B3_in	B3-terminal input value (HIGH or LOW)
	;***      981 : *                B4_in	B4-terminal input value (HIGH or LOW)
	;***      982 : *                C0_in	C0-terminal input value (HIGH or LOW)
	;***      983 : * Return Value : sum total of two values of 4bit indicated by input value and C0_in
	;***      984 : ********************************************************************************/
	;***      985 : UCHAR  IC_74HC283_Evaluate( UCHAR A1_in, UCHAR A2_in, UCHAR A3_in, UCHAR A4_in, UCHAR B1_in, UCHAR B2_in, UCHAR B3_in, UCHAR B4_in, UCHAR C0_in )
	;***      986 : {
	;***      987 : 	UCHAR	work_a;
	;***      988 : 	UCHAR	work_b;
	;***      989 : 	UCHAR	work;
	;***      990 : 
	;***      991 : 	work_a = A1_in + (A2_in << 1) + (A3_in << 2) + (A4_in << 3);
	;***      992 : 	work_b = B1_in + (B2_in << 1) + (B3_in << 2) + (B4_in << 3);
	;***      993 : 	work = work_a + work_b + C0_in;
	;***      994 : 	return (work);
	;***      995 : }
	;***      996 : #endif /* end of defined IC74HC283_USED */
	;***      997 : 
	;***      998 : #if defined IC74HC280_USED
	;***      999 : /*******************************************************************************
	;***     1000 : * Function Name: IC_74HC280_Evaluate
	;***     1001 : * Description  : 9-Bit Parity Generator/Checker
	;***     1002 : *                (sum total in input terminal where input value is HIGH is calculated)
	;***     1003 : * Arguments    : A_in	A-terminal input value (HIGH or LOW)
	;***     1004 : *                B_in	B_IN-terminal input value (HIGH or LOW)
	;***     1005 : *                C_in	C-terminal input value (HIGH or LOW)
	;***     1006 : *                D_in	D-terminal input value (HIGH or LOW)
	;***     1007 : *                E_in	E-terminal input value (HIGH or LOW)
	;***     1008 : *                F_in	F-terminal input value (HIGH or LOW)
	;***     1009 : *                G_in	G-terminal input value (HIGH or LOW)
	;***     1010 : *                H_in	H-terminal input value (HIGH or LOW)
	;***     1011 : *                I_in	I-terminal input value (HIGH or LOW)
	;***     1012 : * Return Value : sum total in input terminal where input value is HIGH
	;***     1013 : ********************************************************************************/
	;***     1014 : UCHAR  IC_74HC280_Evaluate( UCHAR A_in, UCHAR B_in, UCHAR C_in, UCHAR D_in, UCHAR E_in, UCHAR F_in, UCHAR G_in, UCHAR H_in, UCHAR I_in )
	;***     1015 : {
	;***     1016 : 	UCHAR	ucCnt;
	;***     1017 : 
	;***     1018 : 	ucCnt = A_in + B_in + C_in + D_in + E_in + F_in + G_in + H_in + I_in;
	;***     1019 : 	return ucCnt;
	;***     1020 : }
	;***     1021 : #endif /* end of defined IC74HC280_USED */
	;***     1022 : 
	.SECTION .bss,BSS
	.TYPE _g74HC4511_LastNum,object,1
_g74HC4511_LastNum:
	.DS (1)
	.SECTION .data,DATA
	.TYPE _g74HC4511_Count,object,1
_g74HC4511_Count:
	.DS (1)
	.SECTION .const,CONST
.STR@1:
	.DB 0xFC,0x60,0xDA,0xF2,0x66,0xB6,0x3E,0xE0,0xFE,0xE6
	.DS (1)
