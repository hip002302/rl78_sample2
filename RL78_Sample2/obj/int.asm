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
#@   src\int.c
#@  compiled at Wed Apr 17 13:20:51 2024

	.PUBLIC _usgADCR
	.PUBLIC _MD_INTP0
	.PUBLIC _MD_INTP1
	.PUBLIC _MD_INTP2
	.PUBLIC _MD_INTP3
	.PUBLIC _MD_INTP4
	.PUBLIC _MD_INTP5
	.PUBLIC _MD_INTP6
	.PUBLIC _MD_INTAD
	.PUBLIC _MD_INTCMP0
	.PUBLIC _MD_INTCMP1
	.PUBLIC _MD_INTDOC
	.PUBLIC _MD_INTIT
	.PUBLIC _INT_Init

	.SECTION .text,TEXT
_MD_INTP0	.vector 0x0008
	.TYPE _MD_INTP0,function,.LFE1-_MD_INTP0
_MD_INTP0:
	.STACK _MD_INTP0 = 4
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
	;***       26 : * File Name    : int.c
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
	;***       41 : #include "int.h"
	;***       42 : #pragma interrupt	MD_INTP0(vect=INTP0)
	;***       43 : #pragma interrupt	MD_INTP1(vect=INTP1)
	;***       44 : #pragma interrupt	MD_INTP2(vect=INTP2)
	;***       45 : #pragma interrupt	MD_INTP3(vect=INTP3)
	;***       46 : #pragma interrupt	MD_INTP4(vect=INTP4)
	;***       47 : #pragma interrupt	MD_INTP5(vect=INTP5)
	;***       48 : 
	;***       49 : #if (defined DEVICE_R5F1057AANA) || (defined DEVICE_R5F1058AALA)
	;***       50 : #pragma interrupt	MD_INTP6(vect=INTP6)
	;***       51 : #endif /* defined DEVICE_R5F1057AANA || defined DEVICE_R5F1058AALA */
	;***       52 : 
	;***       53 : #pragma interrupt	MD_INTAD(vect=INTAD)
	;***       54 : #pragma interrupt	MD_INTCMP0(vect=INTCMP0)
	;***       55 : #pragma interrupt	MD_INTCMP1(vect=INTCMP1)
	;***       56 : #pragma interrupt	MD_INTDOC(vect=INTDOC)
	;***       57 : #pragma interrupt	MD_INTIT(vect=INTIT)
	;***       58 : 
	;***       59 : #else
	;***       60 : #error "undefined compiler"
	;***       61 : #endif
	;***       62 : 
	;***       63 : /*******************************************************************************
	;***       64 : Macro definitions
	;***       65 : *******************************************************************************/
	;***       66 : 
	;***       67 : /*******************************************************************************
	;***       68 : Typedef definitions
	;***       69 : *******************************************************************************/
	;***       70 : 
	;***       71 : /*******************************************************************************
	;***       72 : Imported global variables and functions (from other files)
	;***       73 : *******************************************************************************/
	;***       74 : 
	;***       75 : /*******************************************************************************
	;***       76 : Exported global variables and functions (to be accessed by other files)
	;***       77 : *******************************************************************************/
	;***       78 : USHORT usgADCR;
	;***       79 : 
	;***       80 : /*******************************************************************************
	;***       81 : Private variables and functions
	;***       82 : *******************************************************************************/
	;***       83 : 
	;***       84 : 
	;***       85 : /*******************************************************************************
	;***       86 : * Function Name: __interrupt MD_INTP0
	;***       87 : * Description  : Interrupt processing of external interrupt of signal detection
	;***       88 : * Arguments    : none
	;***       89 : * Return Value : none
	;***       90 : ********************************************************************************/
	;***       91 : #ifdef __CCRL__
	;***       92 : void MD_INTP0( void )
	reti
.LFE1:
_MD_INTP1	.vector 0x000A
	.TYPE _MD_INTP1,function,.LFE2-_MD_INTP1
_MD_INTP1:
	.STACK _MD_INTP1 = 4
	;***       93 : #else
	;***       94 : #error "undefined compiler"
	;***       95 : #endif
	;***       96 : {
	;***       97 : }
	;***       98 : 
	;***       99 : /*******************************************************************************
	;***      100 : * Function Name: __interrupt MD_INTP1
	;***      101 : * Description  : Interrupt processing of external interrupt of signal detection
	;***      102 : * Arguments    : none
	;***      103 : * Return Value : none
	;***      104 : ********************************************************************************/
	;***      105 : #ifdef __CCRL__
	;***      106 : void MD_INTP1( void )
	reti
.LFE2:
_MD_INTP2	.vector 0x000C
	.TYPE _MD_INTP2,function,.LFE3-_MD_INTP2
_MD_INTP2:
	.STACK _MD_INTP2 = 4
	;***      107 : #else
	;***      108 : #error "undefined compiler"
	;***      109 : #endif
	;***      110 : {
	;***      111 : }
	;***      112 : 
	;***      113 : /*******************************************************************************
	;***      114 : * Function Name: __interrupt MD_INTP2
	;***      115 : * Description  : Interrupt processing of external interrupt of signal detection
	;***      116 : * Arguments    : none
	;***      117 : * Return Value : none
	;***      118 : ********************************************************************************/
	;***      119 : #ifdef __CCRL__
	;***      120 : void MD_INTP2( void )
	reti
.LFE3:
_MD_INTP3	.vector 0x000E
	.TYPE _MD_INTP3,function,.LFE4-_MD_INTP3
_MD_INTP3:
	.STACK _MD_INTP3 = 4
	;***      121 : #else
	;***      122 : #error "undefined compiler"
	;***      123 : #endif
	;***      124 : {
	;***      125 : }
	;***      126 : 
	;***      127 : /*******************************************************************************
	;***      128 : * Function Name: __interrupt MD_INTP3
	;***      129 : * Description  : Interrupt processing of external interrupt of signal detection
	;***      130 : * Arguments    : none
	;***      131 : * Return Value : none
	;***      132 : ********************************************************************************/
	;***      133 : #ifdef __CCRL__
	;***      134 : void MD_INTP3( void )
	reti
.LFE4:
_MD_INTP4	.vector 0x0010
	.TYPE _MD_INTP4,function,.LFE5-_MD_INTP4
_MD_INTP4:
	.STACK _MD_INTP4 = 4
	;***      135 : #else
	;***      136 : #error "undefined compiler"
	;***      137 : #endif
	;***      138 : {
	;***      139 : }
	;***      140 : 
	;***      141 : /*******************************************************************************
	;***      142 : * Function Name: __interrupt MD_INTP4
	;***      143 : * Description  : Interrupt processing of external interrupt of signal detection
	;***      144 : * Arguments    : none
	;***      145 : * Return Value : none
	;***      146 : ********************************************************************************/
	;***      147 : #ifdef __CCRL__
	;***      148 : void MD_INTP4( void )
	reti
.LFE5:
_MD_INTP5	.vector 0x0012
	.TYPE _MD_INTP5,function,.LFE6-_MD_INTP5
_MD_INTP5:
	.STACK _MD_INTP5 = 4
	;***      149 : #else
	;***      150 : #error "undefined compiler"
	;***      151 : #endif
	;***      152 : {
	;***      153 : }
	;***      154 : 
	;***      155 : /*******************************************************************************
	;***      156 : * Function Name: __interrupt MD_INTP5
	;***      157 : * Description  : Interrupt processing of external interrupt of signal detection
	;***      158 : * Arguments    : none
	;***      159 : * Return Value : none
	;***      160 : ********************************************************************************/
	;***      161 : #ifdef __CCRL__
	;***      162 : void MD_INTP5( void )
	reti
.LFE6:
_MD_INTP6	.vector 0x0014
	.TYPE _MD_INTP6,function,.LFE7-_MD_INTP6
_MD_INTP6:
	.STACK _MD_INTP6 = 4
	;***      163 : #else
	;***      164 : #error "undefined compiler"
	;***      165 : #endif
	;***      166 : {
	;***      167 : }
	;***      168 : 
	;***      169 : #if (defined DEVICE_R5F1057AANA) || (defined DEVICE_R5F1058AALA)
	;***      170 : /*******************************************************************************
	;***      171 : * Function Name: __interrupt MD_INTP6
	;***      172 : * Description  : Interrupt processing of external interrupt of signal detection
	;***      173 : * Arguments    : none
	;***      174 : * Return Value : none
	;***      175 : ********************************************************************************/
	;***      176 : #ifdef __CCRL__
	;***      177 : void MD_INTP6( void )
	reti
.LFE7:
_MD_INTAD	.vector 0x0034
	.TYPE _MD_INTAD,function,.LFE8-_MD_INTAD
_MD_INTAD:
	.STACK _MD_INTAD = 6
	;***      178 : #else
	;***      179 : #error "undefined compiler"
	;***      180 : #endif
	;***      181 : {
	;***      182 : }
	;***      183 : #endif /* defined DEVICE_R5F1057AANA || defined DEVICE_R5F1058AALA */
	;***      184 : 
	;***      185 : /*******************************************************************************
	;***      186 : * Function Name: __interrupt MD_INTAD
	;***      187 : * Description  : Interrupt processing of AD converter of signal detection
	;***      188 : * Arguments    : none
	;***      189 : * Return Value : none
	;***      190 : ********************************************************************************/
	;***      191 : #ifdef __CCRL__
	;***      192 : void MD_INTAD( void )
	push ax
	;***      193 : #else
	;***      194 : #error "undefined compiler"
	;***      195 : #endif
	;***      196 : {
	;***      197 : 	usgADCR = ADCR;
	movw ax, 0xFFF1E
	movw !LOWW(_usgADCR), ax
	pop ax
	reti
.LFE8:
_MD_INTCMP0	.vector 0x0044
	.TYPE _MD_INTCMP0,function,.LFE9-_MD_INTCMP0
_MD_INTCMP0:
	.STACK _MD_INTCMP0 = 4
	;***      198 : }
	;***      199 : 
	;***      200 : /*******************************************************************************
	;***      201 : * Function Name: __interrupt MD_INTCMP0
	;***      202 : * Description  : Interrupt processing of comparator0 of signal detection
	;***      203 : * Arguments    : none
	;***      204 : * Return Value : none
	;***      205 : ********************************************************************************/
	;***      206 : #ifdef __CCRL__
	;***      207 : void MD_INTCMP0( void )
	reti
.LFE9:
_MD_INTCMP1	.vector 0x0046
	.TYPE _MD_INTCMP1,function,.LFE10-_MD_INTCMP1
_MD_INTCMP1:
	.STACK _MD_INTCMP1 = 4
	;***      208 : #else
	;***      209 : #error "undefined compiler"
	;***      210 : #endif
	;***      211 : {
	;***      212 : }
	;***      213 : 
	;***      214 : /*******************************************************************************
	;***      215 : * Function Name: __interrupt MD_INTCMP1
	;***      216 : * Description  : Interrupt processing of comparator1 of signal detection
	;***      217 : * Arguments    : none
	;***      218 : * Return Value : none
	;***      219 : ********************************************************************************/
	;***      220 : #ifdef __CCRL__
	;***      221 : void MD_INTCMP1( void )
	reti
.LFE10:
_MD_INTDOC	.vector 0x0048
	.TYPE _MD_INTDOC,function,.LFE11-_MD_INTDOC
_MD_INTDOC:
	.STACK _MD_INTDOC = 4
	;***      222 : #else
	;***      223 : #error "undefined compiler"
	;***      224 : #endif
	;***      225 : {
	;***      226 : }
	;***      227 : 
	;***      228 : /*******************************************************************************
	;***      229 : * Function Name: __interrupt MD_INTDOC
	;***      230 : * Description  : Interrupt processing of DOC of signal detection
	;***      231 : * Arguments    : none
	;***      232 : * Return Value : none
	;***      233 : ********************************************************************************/
	;***      234 : #ifdef __CCRL__
	;***      235 : void MD_INTDOC( void )
	reti
.LFE11:
_MD_INTIT	.vector 0x0036
	.TYPE _MD_INTIT,function,.LFE12-_MD_INTIT
_MD_INTIT:
	.STACK _MD_INTIT = 4
	;***      236 : #else
	;***      237 : #error "undefined compiler"
	;***      238 : #endif
	;***      239 : {
	;***      240 : }
	;***      241 : 
	;***      242 : /*******************************************************************************
	;***      243 : * Function Name: __interrupt MD_INTIT
	;***      244 : * Description  : Interrupt processing of interval timer of signal detection
	;***      245 : * Arguments    : none
	;***      246 : * Return Value : none
	;***      247 : ********************************************************************************/
	;***      248 : #ifdef __CCRL__
	;***      249 : void MD_INTIT( void )
	reti
.LFE12:
	.SECTION .textf,TEXTF
	.TYPE _INT_Init,function,.LFE13-_INT_Init
_INT_Init:
	.STACK _INT_Init = 4
	;***      250 : #else
	;***      251 : #error "undefined compiler"
	;***      252 : #endif
	;***      253 : {
	;***      254 : }
	;***      255 : 
	;***      256 : /*******************************************************************************
	;***      257 : * Function Name: INT_Init
	;***      258 : * Description  : This function initializes the external INT,
	;***      259 : *                including enable or disable,priority setting
	;***      260 : * Arguments    : none
	;***      261 : * Return Value : none
	;***      262 : ********************************************************************************/
	;***      263 : void INT_Init( void )
	;***      264 : {
	;***      265 : 	MK0L = 0xFF;			/* All individual interrupt is prohibited	*/
	mov 0xFFFE4, #0xFF
	;***      266 : 	IF0L = 0x00;			/* Interrupt request flag all clearness		*/
	mov 0xFFFE0, #0x00
	;***      267 : 	PR00L = 0xFF;			/* Priority level clearness					*/
	mov 0xFFFE8, #0xFF
	;***      268 : 	PR10L = 0xFF;			/* Priority level clearness					*/
	mov 0xFFFEC, #0xFF
	;***      269 : 
	;***      270 : 	MK0H = 0xFF;			/* All individual interrupt is prohibited	*/
	mov 0xFFFE5, #0xFF
	;***      271 : 	IF0H = 0x00;			/* Interrupt request flag all clearness		*/
	mov 0xFFFE1, #0x00
	;***      272 : 	PR00H = 0xFF;			/* Priority level clearness					*/
	mov 0xFFFE9, #0xFF
	;***      273 : 	PR10H = 0xFF;			/* Priority level clearness					*/
	mov 0xFFFED, #0xFF
	;***      274 : 
	;***      275 : 	MK1L = 0xFF;			/* All individual interrupt is prohibited	*/
	mov 0xFFFE6, #0xFF
	;***      276 : 	IF1L = 0x00;			/* Interrupt request flag all clearness		*/
	mov 0xFFFE2, #0x00
	;***      277 : 	PR01L = 0xFF;			/* Priority level clearness					*/
	mov 0xFFFEA, #0xFF
	;***      278 : 	PR11L = 0xFF;			/* Priority level clearness					*/
	mov 0xFFFEE, #0xFF
	;***      279 : 
	;***      280 : 	MK1H = 0xFF;			/* All individual interrupt is prohibited	*/
	mov 0xFFFE7, #0xFF
	;***      281 : 	IF1H = 0x00;			/* Interrupt request flag all clearness		*/
	mov 0xFFFE3, #0x00
	;***      282 : 	PR01H = 0xFF;			/* Priority level clearness					*/
	mov 0xFFFEB, #0xFF
	;***      283 : 	PR11H = 0xFF;			/* Priority level clearness					*/
	mov 0xFFFEF, #0xFF
	;***      284 : 
	;***      285 : 	MK2L = 0xFF;			/* All individual interrupt is prohibited	*/
	mov 0xFFFD4, #0xFF
	;***      286 : 	IF2L = 0x00;			/* Interrupt request flag all clearness		*/
	mov 0xFFFD0, #0x00
	;***      287 : 	PR02L = 0xFF;			/* Priority level clearness					*/
	mov 0xFFFD8, #0xFF
	;***      288 : 	PR12L = 0xFF;			/* Priority level clearness					*/
	mov 0xFFFDC, #0xFF
	;***      289 : 
	;***      290 : 	MK2H = 0xFF;			/* All individual interrupt is prohibited	*/
	mov 0xFFFD5, #0xFF
	;***      291 : 	IF2H = 0x00;			/* Interrupt request flag all clearness		*/
	mov 0xFFFD1, #0x00
	;***      292 : 	PR02H = 0xFF;			/* Priority level clearness					*/
	mov 0xFFFD9, #0xFF
	;***      293 : 	PR12H = 0xFF;			/* Priority level clearness					*/
	mov 0xFFFDD, #0xFF
	;***      294 : 
	;***      295 : 	EGP0 = 0x00;			/* External interrupt rising edge	*/
	mov 0xFFF38, #0x00
	;***      296 : 	EGN0 = 0x00;			/* External interrupt rising edge	*/
	mov 0xFFF39, #0x00
	;***      297 : 	EGP1 = 0x00;			/* External interrupt rising edge	*/
	mov 0xFFF3A, #0x00
	;***      298 : 	EGN1 = 0x00;			/* External interrupt rising edge	*/
	mov 0xFFF3B, #0x00
	ret
.LFE13:
	;***      299 : }
	.SECTION .bss,BSS
	.ALIGN 2
	.TYPE _usgADCR,object,2
_usgADCR:
	.DS (2)
