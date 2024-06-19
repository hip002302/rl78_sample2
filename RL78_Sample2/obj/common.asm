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
#@   src\common.c
#@  compiled at Wed Apr 17 13:20:50 2024

	.PUBLIC _fTx0Done
	.PUBLIC _fTx6Done
	.PUBLIC _fTm10ms
	.PUBLIC _fTrg50ms
	.PUBLIC _fTrg1s
	.PUBLIC _fTrg10ms
	.PUBLIC _MOV1_
	.PUBLIC _NOT1_
	.PUBLIC _WAIT
	.PUBLIC _BitMemGet
	.PUBLIC _ByteMemGet
	.PUBLIC _BitMemSet
	.PUBLIC _ByteMemSet
	.PUBLIC _Port_Set
	.PUBLIC _Port_Get

	.SECTION .textf,TEXTF
	.TYPE _MOV1_,function,.LFE1-_MOV1_
_MOV1_:
	.STACK _MOV1_ = 4
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
	;***       26 : * File Name    : common.c
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
	;***       39 : 
	;***       40 : /*******************************************************************************
	;***       41 : Macro definitions
	;***       42 : *******************************************************************************/
	;***       43 : 
	;***       44 : /*******************************************************************************
	;***       45 : Typedef definitions
	;***       46 : *******************************************************************************/
	;***       47 : 
	;***       48 : /*******************************************************************************
	;***       49 : Imported global variables and functions (from other files)
	;***       50 : *******************************************************************************/
	;***       51 : 
	;***       52 : /*******************************************************************************
	;***       53 : Exported global variables and functions (to be accessed by other files)
	;***       54 : *******************************************************************************/
	;***       55 : #ifdef __CCRL__
	;***       56 : __saddr UCHAR	fTx0Done;	/* UART0 transmission completion flag(For standing up detection of trigger flag) */
	;***       57 : __saddr UCHAR	fTx6Done;	/* UART6 transmission completion flag(For standing up detection of trigger flag) */
	;***       58 : __saddr UCHAR	fTm10ms;	/* 10ms cycle flag */
	;***       59 : __saddr UCHAR	fTrg50ms;	/* Trigger flag of 50ms cycle */
	;***       60 : __saddr UCHAR	fTrg1s;		/* Trigger flag of   1s cycle */
	;***       61 : __saddr UCHAR	fTrg10ms;	/* Trigger flag of 10ms cycle */
	;***       62 : 
	;***       63 : #else
	;***       64 : #error "undefined compiler"
	;***       65 : #endif
	;***       66 : 
	;***       67 : /*******************************************************************************
	;***       68 : * Function Name: MOV1_
	;***       69 : * Description  : MOV1_
	;***       70 : * Arguments    : Fin
	;***       71 : * Return Value : The value set to the Input argument is returned.
	;***       72 : ********************************************************************************/
	;***       73 : UCHAR MOV1_( UCHAR Fin )
	;***       74 : {
	;***       75 : 	return Fin;
	;***       76 : }
	ret
.LFE1:
	.TYPE _NOT1_,function,.LFE2-_NOT1_
_NOT1_:
	.STACK _NOT1_ = 4
	;***       77 : 
	;***       78 : /*******************************************************************************
	;***       79 : * Function Name: NOT1_
	;***       80 : * Description  : NOT1_
	;***       81 : * Arguments    : Fin
	;***       82 : * Return Value : The value set to the Input argument is returned.(0 or 1)
	;***       83 : ********************************************************************************/
	;***       84 : UCHAR NOT1_( UCHAR Fin )
	;***       85 : {
	;***       86 : 	return (Fin == HIGH) ?  LOW : HIGH;
	dec a
	clrb a
	skz
.BB@LABEL@2_1:	; entry
	oneb a
.BB@LABEL@2_2:	; entry
	ret
.LFE2:
	.TYPE _WAIT,function,.LFE3-_WAIT
_WAIT:
	.STACK _WAIT = 4
	;***       87 : }
	;***       88 : 
	;***       89 : /*******************************************************************************
	;***       90 : * Function Name: WAIT
	;***       91 : * Description  : WAIT
	;***       92 : * Arguments    : count
	;***       93 : * Return Value : none
	;***       94 : ********************************************************************************/
	;***       95 : void WAIT( UCHAR count )
	;***       96 : {
	;***       97 : 	USHORT	delay = (count * 100);
	mov x, #0x64
	mulu x
	movw bc, ax
	clrw ax
.BB@LABEL@3_1:	; bb5
	;***       98 : 	register USHORT	i;
	;***       99 : 
	;***      100 : 	for (i = 0; i < delay; i++)
	cmpw ax, bc
	bnc $.BB@LABEL@3_3
.BB@LABEL@3_2:	; bb
	;***      101 : 		__nop();
	nop
	incw ax
	br $.BB@LABEL@3_1
.BB@LABEL@3_3:	; return
	;***      102 : 	return;
	;***      103 : }
	ret
.LFE3:
	.TYPE _BitMemGet,function,.LFE4-_BitMemGet
_BitMemGet:
	.STACK _BitMemGet = 6
	;***      104 : 
	;***      105 : /*******************************************************************************
	;***      106 : * Function Name: BitMemGet
	;***      107 : * Description  : BitMemGet
	;***      108 : * Arguments    : memp
	;***      109 : *                count
	;***      110 : * Return Value : BitMem
	;***      111 : ********************************************************************************/
	;***      112 : UCHAR BitMemGet( UCHAR* memp, UCHAR count )
	push hl
	movw hl, ax
	;***      113 : {
	;***      114 : 	UCHAR	bit_num;
	;***      115 : 	UCHAR	elem_num;
	;***      116 : 	UCHAR	work;
	;***      117 : 
	;***      118 : 	elem_num = count / 8;
	mov a, c
	shr a, 0x03
	mov b, a
	mov a, c
	;***      119 : 	bit_num = count % 8;
	and a, #0x07
	mov [sp+0x00], a
	;***      120 : 	work = (UCHAR)(*(memp + elem_num));
	;***      121 : 	work >>= bit_num;
	mov a, [hl+b]
	shrw ax, 8+0x00000
	movw bc, ax
	mov a, [sp+0x00]
	xchw ax, bc
.LFE4:
	.TYPE __CommonCode@0,function,.LFE5-__CommonCode@0
__CommonCode@0:
	.STACK __CommonCode@0 = 4
	cmp0 b
	br $.BB@LABEL@5_2
.BB@LABEL@5_1:	; entry
	shrw ax, 0x01
	dec b
.BB@LABEL@5_2:	; entry
	bnz $.BB@LABEL@5_1
.BB@LABEL@5_3:	; entry
	mov a, x
	and a, #0x01
	pop bc
	ret
.LFE5:
	.TYPE _ByteMemGet,function,.LFE6-_ByteMemGet
_ByteMemGet:
	.STACK _ByteMemGet = 4
	;***      122 : 	work &= 0x01;
	;***      123 : 	return(work);
	;***      124 : }
	;***      125 : 
	;***      126 : /*******************************************************************************
	;***      127 : * Function Name: ByteMemGet
	;***      128 : * Description  : ByteMemGet
	;***      129 : * Arguments    : memp
	;***      130 : *                count
	;***      131 : * Return Value : ByteMem
	;***      132 : ********************************************************************************/
	;***      133 : UCHAR ByteMemGet( UCHAR* memp, UCHAR count )
	movw hl, ax
	;***      134 : {
	;***      135 : 	UCHAR	work;
	;***      136 : 
	;***      137 : 	work = (UCHAR)(*(memp + count));
	mov a, [hl+c]
	;***      138 : 	return(work);
	;***      139 : }
	ret
.LFE6:
	.TYPE _BitMemSet,function,.LFE7-_BitMemSet
_BitMemSet:
	.STACK _BitMemSet = 6
	;***      140 : 
	;***      141 : /*******************************************************************************
	;***      142 : * Function Name: BitMemSet
	;***      143 : * Description  : BitMemSet
	;***      144 : * Arguments    : memp
	;***      145 : *                count
	;***      146 : *                value
	;***      147 : * Return Value : none
	;***      148 : ********************************************************************************/
	;***      149 : void BitMemSet( UCHAR* memp, UCHAR count, UCHAR value )
	push hl
	movw hl, ax
	mov a, b
	mov [sp+0x00], a
	;***      150 : {
	;***      151 : 	UCHAR	elem_num;
	;***      152 : 	UCHAR	mask;
	;***      153 : 	UCHAR	update;
	;***      154 : 
	;***      155 : 	mask = (UCHAR)0x01 << (count & 0x07);
	mov a, c
	and a, #0x07
	mov b, a
	mov a, c
	;***      156 : 	update = value << (count & 0x07);
	;***      157 : 	elem_num = count / 8;
	shr a, 0x03
	mov [sp+0x01], a
	mov a, [sp+0x00]
	shrw ax, 8+0x00000
	movw de, ax
	mov a, b
	mov c, a
	movw ax, de
	cmp0 c
	br $.BB@LABEL@7_2
.BB@LABEL@7_1:	; entry
	addw ax, ax
	dec c
.BB@LABEL@7_2:	; entry
	bnz $.BB@LABEL@7_1
.BB@LABEL@7_3:	; entry
	mov a, x
	mov [sp+0x00], a
	call $!__CommonCode@1
	mov a, x
	;***      158 : 
	;***      159 : 	*((UCHAR*)(memp + elem_num)) &= ~mask;
	xor a, #0xFF
	mov x, a
	pop bc
	push bc
	mov a, [sp+0x00]
	xch a, x
	and a, [hl+b]
	;***      160 : 	*((UCHAR*)(memp + elem_num)) |= update;
	or a, x
	mov [hl+b], a
	pop ax
	ret
.LFE7:
	.TYPE __CommonCode@1,function,.LFE8-__CommonCode@1
__CommonCode@1:
	.STACK __CommonCode@1 = 4
	onew ax
	cmp0 b
	br $.BB@LABEL@8_2
.BB@LABEL@8_1:	; entry
	addw ax, ax
	dec b
.BB@LABEL@8_2:	; entry
	bnz $.BB@LABEL@8_1
.BB@LABEL@8_3:	; entry
	ret
.LFE8:
	.TYPE _ByteMemSet,function,.LFE9-_ByteMemSet
_ByteMemSet:
	.STACK _ByteMemSet = 4
	;***      161 : }
	;***      162 : 
	;***      163 : /*******************************************************************************
	;***      164 : * Function Name: ByteMemSet
	;***      165 : * Description  : ByteMemSet
	;***      166 : * Arguments    : memp
	;***      167 : *                count
	;***      168 : *                value
	;***      169 : * Return Value : none
	;***      170 : ********************************************************************************/
	;***      171 : void ByteMemSet( UCHAR* memp, UCHAR count, UCHAR value )
	movw hl, ax
	mov a, b
	;***      172 : {
	;***      173 : 	UCHAR*	work;
	;***      174 : 
	;***      175 : 	work = memp + count;
	;***      176 : 	*work = value;
	mov [hl+c], a
	ret
.LFE9:
	.TYPE _Port_Set,function,.LFE10-_Port_Set
_Port_Set:
	.STACK _Port_Set = 4
	;***      177 : }
	;***      178 : 
	;***      179 : /*******************************************************************************
	;***      180 : * Function Name: Port_Set
	;***      181 : * Description  : Port_Set
	;***      182 : * Arguments    : Port
	;***      183 : *                TermNum
	;***      184 : *                value
	;***      185 : * Return Value : none
	;***      186 : ********************************************************************************/
	;***      187 : void Port_Set( UCHAR Port, UCHAR TermNum, UCHAR Val )
	mov d, a
	mov a, x
	mov b, a
	call $!__CommonCode@1
	movw hl, ax
	mov a, d
	;***      188 : {
	;***      189 : 	volatile UCHAR *ucp_port;
	;***      190 : 	UCHAR	ucport;
	;***      191 : 	UCHAR	ucset = Val;
	;***      192 : 
	;***      193 : 	ucp_port = &P0;
	;***      194 : 	ucp_port += Port;
	shrw ax, 8+0x00000
	mov a, #0xFF
	movw de, ax
	;***      195 : 	ucport = *ucp_port;
	;***      196 : 	ucset = 1;
	;***      197 : 	ucset <<= TermNum;
	;***      198 : 	if (Val == HIGH){
	dec c
	mov a, [de]
	mov b, a
	mov a, l
	mov x, a
	bnz $.BB@LABEL@10_2
.BB@LABEL@10_1:	; if_then_bb
	mov a, b
	;***      199 : 		ucport |= ucset;
	or a, x
	br $.BB@LABEL@10_3
.BB@LABEL@10_2:	; if_else_bb
	;***      200 : 	}else{
	;***      201 : 		ucport &= ~ucset;
	xor a, #0xFF
	and a, b
.BB@LABEL@10_3:	; if_break_bb
	;***      202 : 	}
	;***      203 : 	*ucp_port = ucport;
	mov [de], a
	ret
.LFE10:
	.TYPE _Port_Get,function,.LFE11-_Port_Get
_Port_Get:
	.STACK _Port_Get = 6
	;***      204 : }
	;***      205 : 
	;***      206 : /*******************************************************************************
	;***      207 : * Function Name: Port_Get
	;***      208 : * Description  : Port_Get
	;***      209 : * Arguments    : Port
	;***      210 : *                TermNum
	;***      211 : * Return Value : The value set to the Port is returned.(0 or 1)
	;***      212 : ********************************************************************************/
	;***      213 : UCHAR Port_Get( UCHAR Port, UCHAR TermNum )
	push ax
	;***      214 : {
	;***      215 : 	volatile UCHAR *ucp_port;
	;***      216 : 	UCHAR	ucport;
	;***      217 : 	UCHAR	ucret;
	;***      218 : 
	;***      219 : 	ucp_port = &P0;
	;***      220 : 	ucp_port += Port;
	shrw ax, 8+0x00000
	mov a, #0xFF
	movw de, ax
	mov a, [sp+0x00]
	mov b, a
	;***      221 : 	ucport = *ucp_port;
	;***      222 : 	ucret = (ucport >> TermNum) & 0x01;
	mov a, [de]
	shrw ax, 8+0x00000
	br $!__CommonCode@0
.LFE11:
	;***      223 : 
	;***      224 : 	return(ucret);
	;***      225 : }
	.SECTION .sbss,SBSS
	.TYPE _fTx0Done,object,1
_fTx0Done:
	.DS (1)
	.TYPE _fTx6Done,object,1
_fTx6Done:
	.DS (1)
	.TYPE _fTm10ms,object,1
_fTm10ms:
	.DS (1)
	.TYPE _fTrg50ms,object,1
_fTrg50ms:
	.DS (1)
	.TYPE _fTrg1s,object,1
_fTrg1s:
	.DS (1)
	.TYPE _fTrg10ms,object,1
_fTrg10ms:
	.DS (1)
