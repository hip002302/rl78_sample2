/***********************************************************************************************************************
* DISCLAIMER
* This software is supplied by Renesas Electronics Corporation and is only intended for use with Renesas products.
* No other uses are authorized. This software is owned by Renesas Electronics Corporation and is protected under all
* applicable laws, including copyright laws. 
* THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS MAKES NO WARRANTIES REGARDING THIS SOFTWARE, WHETHER EXPRESS, IMPLIED
* OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NON-INFRINGEMENT.  ALL SUCH WARRANTIES ARE EXPRESSLY DISCLAIMED.TO THE MAXIMUM EXTENT PERMITTED NOT PROHIBITED BY
* LAW, NEITHER RENESAS ELECTRONICS CORPORATION NOR ANY OF ITS AFFILIATED COMPANIES SHALL BE LIABLE FOR ANY DIRECT,
* INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES FOR ANY REASON RELATED TO THIS SOFTWARE, EVEN IF RENESAS OR
* ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
* Renesas reserves the right, without notice, to make changes to this software and to discontinue the availability 
* of this software. By using this software, you agree to the additional terms and conditions found by accessing the 
* following link:
* http://www.renesas.com/disclaimer
*
* Copyright (C) 2016, 2021 Renesas Electronics Corporation. All rights reserved.
***********************************************************************************************************************/

/***********************************************************************************************************************
* File Name    : r_cg_doc.h
* Version      : Code Generator for RL78/G11 V1.02.06.02 [08 Nov 2021]
* Device(s)    : R5F1058A
* Tool-Chain   : CCRL
* Description  : This file implements device driver for DOC module.
* Creation Date: 2024/06/19
***********************************************************************************************************************/
#ifndef DOC_H
#define DOC_H

/***********************************************************************************************************************
Macro definitions (Register bit)
***********************************************************************************************************************/
/*
    DOC control register (DOCR) 
*/
/* Operating mode select (OMS1,OMS0) */
#define _00_DOC_MODE_COMPARISON                     (0x00U) /* data comparison mode */
#define _01_DOC_MODE_ADDITION                       (0x01U) /* data addition mode */
#define _02_DOC_MODE_SUBTRACTION                    (0x02U) /* data subtraction mode */
/* Detection condition select (DCSEL) */
#define _00_DOC_COMPARISON_DETECT_MISMATCH          (0x00U) /* data mismatch is detected */
#define _04_DOC_COMPARISON_DETECT_MATCH             (0x04U) /* data match is detected. */
/* Data operation circuit interrupt enable (DOPCIE) */
#define _00_DOC_DOPCF_INTERRUPT_DISABLE             (0x00U) /* disables interrupts from the data operation circuit */
#define _10_DOC_DOPCF_INTERRUPT_ENABLE              (0x10U) /* enables interrupts from the data operation circuit */
/* Data Operation Circuit Flag (DOPCF) */
#define _00_DOC_DOPCF_CLEAR_SET                     (0x00U) /* 1 is written to the DOPCFCL bit */
#define _20_DOC_DOPCF_GENERATE_RESULT               (0x20U) /* indicates the result of an operation */
/* DOPCF clear (DOPCFCL) */
#define _00_DOC_DOPCF_MAINTAIN                      (0x00U) /* maintains the DOPCF flag state */
#define _40_DOC_DOPCF_CLEAR                         (0x40U) /* clears the DOPCF flag */


/***********************************************************************************************************************
Macro definitions
***********************************************************************************************************************/
#define _0000_DOC_REFERENCE_DATA                    (0x0000U) /* 16-bit data as a reference or results */

/***********************************************************************************************************************
Typedef definitions
***********************************************************************************************************************/
typedef enum
{
    COMPARE_MATCH,
    COMPARE_MISMATCH,
    ADDITION,
    SUBTRACTION
} doc_mode_t;

/***********************************************************************************************************************
Global functions
***********************************************************************************************************************/
void R_DOC_Create(void);
MD_STATUS R_DOC_SetMode(doc_mode_t mode, uint16_t value);
void R_DOC_WriteData(uint16_t data);
void R_DOC_GetResult(uint16_t * const data);
void R_DOC_ClearFlag(void);
/* Start user code for function. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */
#endif
