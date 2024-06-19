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
* File Name    : r_cg_doc.c
* Version      : Code Generator for RL78/G11 V1.02.06.02 [08 Nov 2021]
* Device(s)    : R5F1058A
* Tool-Chain   : CCRL
* Description  : This file implements device driver for DOC module.
* Creation Date: 2024/06/19
***********************************************************************************************************************/

/***********************************************************************************************************************
Includes
***********************************************************************************************************************/
#include "r_cg_macrodriver.h"
#include "r_cg_doc.h"
/* Start user code for include. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */
#include "r_cg_userdefine.h"

/***********************************************************************************************************************
Pragma directive
***********************************************************************************************************************/
/* Start user code for pragma. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */

/***********************************************************************************************************************
Global variables and functions
***********************************************************************************************************************/
/* Start user code for global. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */

/***********************************************************************************************************************
* Function Name: R_DOC_Create
* Description  : This function initializes the DOC module.
* Arguments    : None
* Return Value : None
***********************************************************************************************************************/
void R_DOC_Create(void)
{
    DOCRES = 1U;    /* reset DOC */
    DOCRES = 0U;    /* reset release of DOC */
    DOCEN = 1U;     /* enables input clock supply */
    DOCMK = 1U;     /* disable INTDOC interrupt */
    DOCIF = 0U;     /* clear INTDOC interrupt flag */
    /* Set INTDOC low priority */
    DOCPR1 = 1U;
    DOCPR0 = 1U;
    /* Set control registers */
    DOCR = _10_DOC_DOPCF_INTERRUPT_ENABLE | _01_DOC_MODE_ADDITION;
    /* Set comparsion reference or initial value of addition/subtraction result */
    DODSR = _0000_DOC_REFERENCE_DATA;
    /* Clear DOPCF flag */
    DOPCFCL = 1U;   /* clears the DOPCF flag */
    /* Enable DOPCF interrupt */
    DOCIF = 0U;     /* clear INTDOC interrupt flag */
    DOCMK = 0U;     /* enable INTDOC interrupt */
}
/***********************************************************************************************************************
* Function Name: R_DOC_SetMode
* Description  : This function configures the operation mode of DOC.
* Arguments    : mode -
*                    new mode of DOC operation
*                value -
*                    base value to compare, add or subtract
* Return Value : status -
*                    MD_OK or MD_ARGERROR
***********************************************************************************************************************/
MD_STATUS R_DOC_SetMode(doc_mode_t mode, uint16_t value)
{
    MD_STATUS         status = MD_OK;

    /* Set DOC mode */
    switch(mode)
    {
        case ADDITION:

            OMS1 = 0U;
            OMS0 = 1U;
            DODSR = value;

            break;

        case SUBTRACTION:

            OMS1 = 1U;
            OMS0 = 0U;
            DODSR = value;

            break;

        case COMPARE_MATCH:

            OMS1 = 0U;
            OMS0 = 0U;
            DCSEL = 1U;
            DODSR = value;

            break;

        case COMPARE_MISMATCH:
        
            OMS1 = 0U;
            OMS0 = 0U;
            DCSEL = 0U;
            DODSR = value;

            break;
            
        default:
        
            status = MD_ARGERROR;
            
            break;
    }    

    return (status);
}
/***********************************************************************************************************************
* Function Name: R_DOC_WriteData
* Description  : This function writes new data to compare, add or subtract.
* Arguments    : data -
*                    data to compare, add or subtract
* Return Value : None
***********************************************************************************************************************/
void R_DOC_WriteData(uint16_t data)
{
    /* Write data to DODIR register */
    DODIR = data;
}
/***********************************************************************************************************************
* Function Name: R_DOC_GetResult
* Description  : This function gets result of addition or subtraction.
* Arguments    : data -
*                    pointer to where result will be stored
* Return Value : None
***********************************************************************************************************************/
void R_DOC_GetResult(uint16_t * const data)
{
    /* Get data in DODSR register */
    * data = DODSR;
}
/***********************************************************************************************************************
* Function Name: R_DOC_ClearFlag
* Description  : This function clears DOPCF flag.
* Arguments    : None
* Return Value : None
***********************************************************************************************************************/
void R_DOC_ClearFlag(void)
{
    /* Clear DOPCF flag */
    DOPCFCL = 1U;   /* clears the DOPCF flag */
}

/* Start user code for adding. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */
