   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 56 uint8_t ITC_GetCPUCC(void)
  45                     ; 57 {
  47                     .text:	section	.text,new
  48  0000               _ITC_GetCPUCC:
  52                     ; 59   _asm("push cc");
  55  0000 8a            push cc
  57                     ; 60   _asm("pop a");
  60  0001 84            pop a
  62                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  65  0002 81            	ret
  88                     ; 87 void ITC_DeInit(void)
  88                     ; 88 {
  89                     .text:	section	.text,new
  90  0000               _ITC_DeInit:
  94                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  96  0000 35ff7f70      	mov	32624,#255
  97                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  99  0004 35ff7f71      	mov	32625,#255
 100                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 102  0008 35ff7f72      	mov	32626,#255
 103                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 105  000c 35ff7f73      	mov	32627,#255
 106                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 108  0010 35ff7f74      	mov	32628,#255
 109                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 111  0014 35ff7f75      	mov	32629,#255
 112                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 114  0018 35ff7f76      	mov	32630,#255
 115                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 117  001c 35ff7f77      	mov	32631,#255
 118                     ; 97 }
 121  0020 81            	ret
 146                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 146                     ; 105 {
 147                     .text:	section	.text,new
 148  0000               _ITC_GetSoftIntStatus:
 152                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 154  0000 cd0000        	call	_ITC_GetCPUCC
 156  0003 a428          	and	a,#40
 159  0005 81            	ret
 464                     .const:	section	.text
 465  0000               L22:
 466  0000 0024          	dc.w	L14
 467  0002 0024          	dc.w	L14
 468  0004 0024          	dc.w	L14
 469  0006 002d          	dc.w	L34
 470  0008 002d          	dc.w	L34
 471  000a 002d          	dc.w	L34
 472  000c 002d          	dc.w	L34
 473  000e 0036          	dc.w	L54
 474  0010 0036          	dc.w	L54
 475  0012 0036          	dc.w	L54
 476  0014 0036          	dc.w	L54
 477  0016 003f          	dc.w	L74
 478  0018 003f          	dc.w	L74
 479  001a 003f          	dc.w	L74
 480  001c 003f          	dc.w	L74
 481  001e 0048          	dc.w	L15
 482  0020 0048          	dc.w	L15
 483  0022 0048          	dc.w	L15
 484  0024 0048          	dc.w	L15
 485  0026 0051          	dc.w	L35
 486  0028 0051          	dc.w	L35
 487  002a 0051          	dc.w	L35
 488  002c 0051          	dc.w	L35
 489  002e 005a          	dc.w	L55
 490  0030 005a          	dc.w	L55
 491  0032 005a          	dc.w	L55
 492  0034 005a          	dc.w	L55
 493  0036 0063          	dc.w	L75
 494  0038 0063          	dc.w	L75
 495                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 495                     ; 115 {
 496                     .text:	section	.text,new
 497  0000               _ITC_GetSoftwarePriority:
 499  0000 88            	push	a
 500  0001 89            	pushw	x
 501       00000002      OFST:	set	2
 504                     ; 116   uint8_t Value = 0;
 506  0002 0f02          	clr	(OFST+0,sp)
 508                     ; 117   uint8_t Mask = 0;
 510                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 512                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 514  0004 a403          	and	a,#3
 515  0006 48            	sll	a
 516  0007 5f            	clrw	x
 517  0008 97            	ld	xl,a
 518  0009 a603          	ld	a,#3
 519  000b 5d            	tnzw	x
 520  000c 2704          	jreq	L41
 521  000e               L61:
 522  000e 48            	sll	a
 523  000f 5a            	decw	x
 524  0010 26fc          	jrne	L61
 525  0012               L41:
 526  0012 6b01          	ld	(OFST-1,sp),a
 528                     ; 125   switch (IRQn)
 530  0014 7b03          	ld	a,(OFST+1,sp)
 532                     ; 223     default:
 532                     ; 224       break;
 533  0016 4a            	dec	a
 534  0017 a11d          	cp	a,#29
 535  0019 2407          	jruge	L02
 536  001b 5f            	clrw	x
 537  001c 97            	ld	xl,a
 538  001d 58            	sllw	x
 539  001e de0000        	ldw	x,(L22,x)
 540  0021 fc            	jp	(x)
 541  0022               L02:
 542  0022 2046          	jra	L122
 543  0024               L14:
 544                     ; 127     case FLASH_IRQn:
 544                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 544                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 544                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 546  0024 c67f70        	ld	a,32624
 547  0027 1401          	and	a,(OFST-1,sp)
 548  0029 6b02          	ld	(OFST+0,sp),a
 550                     ; 131       break;
 552  002b 203d          	jra	L122
 553  002d               L34:
 554                     ; 133     case EXTIE_F_PVD_IRQn:
 554                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 554                     ; 135     case RTC_IRQn:
 554                     ; 136     case EXTIB_IRQn:
 554                     ; 137     case EXTID_IRQn:
 554                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 554                     ; 139     case RTC_CSSLSE_IRQn:
 554                     ; 140     case EXTIB_IRQn:
 554                     ; 141     case EXTID_IRQn:
 554                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 554                     ; 143     case RTC_CSSLSE_IRQn:
 554                     ; 144     case EXTIB_G_IRQn:
 554                     ; 145     case EXTID_H_IRQn:
 554                     ; 146 #endif  /* STM8L15X_MD */
 554                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 556  002d c67f71        	ld	a,32625
 557  0030 1401          	and	a,(OFST-1,sp)
 558  0032 6b02          	ld	(OFST+0,sp),a
 560                     ; 148       break;
 562  0034 2034          	jra	L122
 563  0036               L54:
 564                     ; 150     case EXTI0_IRQn:
 564                     ; 151     case EXTI1_IRQn:
 564                     ; 152     case EXTI2_IRQn:
 564                     ; 153     case EXTI3_IRQn:
 564                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 566  0036 c67f72        	ld	a,32626
 567  0039 1401          	and	a,(OFST-1,sp)
 568  003b 6b02          	ld	(OFST+0,sp),a
 570                     ; 155       break;
 572  003d 202b          	jra	L122
 573  003f               L74:
 574                     ; 157     case EXTI4_IRQn:
 574                     ; 158     case EXTI5_IRQn:
 574                     ; 159     case EXTI6_IRQn:
 574                     ; 160     case EXTI7_IRQn:
 574                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 576  003f c67f73        	ld	a,32627
 577  0042 1401          	and	a,(OFST-1,sp)
 578  0044 6b02          	ld	(OFST+0,sp),a
 580                     ; 162       break;
 582  0046 2022          	jra	L122
 583  0048               L15:
 584                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 584                     ; 168 #endif /* STM8L15X_LD */		
 584                     ; 169     case ADC1_COMP_IRQn:
 584                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 584                     ; 171     case LCD_IRQn:
 584                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 584                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 584                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 584                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 584                     ; 176     case LCD_AES_IRQn:
 584                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 584                     ; 178 #endif  /* STM8L15X_MD */
 584                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 586  0048 c67f74        	ld	a,32628
 587  004b 1401          	and	a,(OFST-1,sp)
 588  004d 6b02          	ld	(OFST+0,sp),a
 590                     ; 180       break;
 592  004f 2019          	jra	L122
 593  0051               L35:
 594                     ; 183     case TIM1_UPD_OVF_TRG_IRQn:
 594                     ; 184 #endif /* STM8L15X_LD */		
 594                     ; 185 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 594                     ; 186  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 594                     ; 187     case TIM2_CC_IRQn:
 594                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 594                     ; 189     case TIM3_CC_IRQn:
 594                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 594                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 594                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 594                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 594                     ; 194 #endif  /* STM8L15X_MD */
 594                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 596  0051 c67f75        	ld	a,32629
 597  0054 1401          	and	a,(OFST-1,sp)
 598  0056 6b02          	ld	(OFST+0,sp),a
 600                     ; 196       break;
 602  0058 2010          	jra	L122
 603  005a               L55:
 604                     ; 199     case TIM1_CC_IRQn:
 604                     ; 200 #endif /* STM8L15X_LD */	
 604                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 604                     ; 202     case SPI1_IRQn:
 604                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 604                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 604                     ; 205     case USART1_TX_IRQn:
 604                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 604                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 604                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 604                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 606  005a c67f76        	ld	a,32630
 607  005d 1401          	and	a,(OFST-1,sp)
 608  005f 6b02          	ld	(OFST+0,sp),a
 610                     ; 210       break;
 612  0061 2007          	jra	L122
 613  0063               L75:
 614                     ; 214     case USART1_RX_IRQn:
 614                     ; 215     case I2C1_IRQn:
 614                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 614                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 614                     ; 218     case I2C1_SPI2_IRQn:
 614                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 614                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 616  0063 c67f77        	ld	a,32631
 617  0066 1401          	and	a,(OFST-1,sp)
 618  0068 6b02          	ld	(OFST+0,sp),a
 620                     ; 221       break;
 622  006a               L16:
 623                     ; 223     default:
 623                     ; 224       break;
 625  006a               L122:
 626                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 628  006a 7b03          	ld	a,(OFST+1,sp)
 629  006c a403          	and	a,#3
 630  006e 48            	sll	a
 631  006f 5f            	clrw	x
 632  0070 97            	ld	xl,a
 633  0071 7b02          	ld	a,(OFST+0,sp)
 634  0073 5d            	tnzw	x
 635  0074 2704          	jreq	L42
 636  0076               L62:
 637  0076 44            	srl	a
 638  0077 5a            	decw	x
 639  0078 26fc          	jrne	L62
 640  007a               L42:
 641  007a 6b02          	ld	(OFST+0,sp),a
 643                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 645  007c 7b02          	ld	a,(OFST+0,sp)
 648  007e 5b03          	addw	sp,#3
 649  0080 81            	ret
 709                     	switch	.const
 710  003a               L44:
 711  003a 0038          	dc.w	L322
 712  003c 0038          	dc.w	L322
 713  003e 0038          	dc.w	L322
 714  0040 004a          	dc.w	L522
 715  0042 004a          	dc.w	L522
 716  0044 004a          	dc.w	L522
 717  0046 004a          	dc.w	L522
 718  0048 005c          	dc.w	L722
 719  004a 005c          	dc.w	L722
 720  004c 005c          	dc.w	L722
 721  004e 005c          	dc.w	L722
 722  0050 006e          	dc.w	L132
 723  0052 006e          	dc.w	L132
 724  0054 006e          	dc.w	L132
 725  0056 006e          	dc.w	L132
 726  0058 0080          	dc.w	L332
 727  005a 0080          	dc.w	L332
 728  005c 0080          	dc.w	L332
 729  005e 0080          	dc.w	L332
 730  0060 0092          	dc.w	L532
 731  0062 0092          	dc.w	L532
 732  0064 0092          	dc.w	L532
 733  0066 0092          	dc.w	L532
 734  0068 00a4          	dc.w	L732
 735  006a 00a4          	dc.w	L732
 736  006c 00a4          	dc.w	L732
 737  006e 00a4          	dc.w	L732
 738  0070 00b6          	dc.w	L142
 739  0072 00b6          	dc.w	L142
 740                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 740                     ; 251 {
 741                     .text:	section	.text,new
 742  0000               _ITC_SetSoftwarePriority:
 744  0000 89            	pushw	x
 745  0001 89            	pushw	x
 746       00000002      OFST:	set	2
 749                     ; 252   uint8_t Mask = 0;
 751                     ; 253   uint8_t NewPriority = 0;
 753                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 755                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 757                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 759                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 761  0002 9e            	ld	a,xh
 762  0003 a403          	and	a,#3
 763  0005 48            	sll	a
 764  0006 5f            	clrw	x
 765  0007 97            	ld	xl,a
 766  0008 a603          	ld	a,#3
 767  000a 5d            	tnzw	x
 768  000b 2704          	jreq	L23
 769  000d               L43:
 770  000d 48            	sll	a
 771  000e 5a            	decw	x
 772  000f 26fc          	jrne	L43
 773  0011               L23:
 774  0011 43            	cpl	a
 775  0012 6b01          	ld	(OFST-1,sp),a
 777                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 779  0014 7b03          	ld	a,(OFST+1,sp)
 780  0016 a403          	and	a,#3
 781  0018 48            	sll	a
 782  0019 5f            	clrw	x
 783  001a 97            	ld	xl,a
 784  001b 7b04          	ld	a,(OFST+2,sp)
 785  001d 5d            	tnzw	x
 786  001e 2704          	jreq	L63
 787  0020               L04:
 788  0020 48            	sll	a
 789  0021 5a            	decw	x
 790  0022 26fc          	jrne	L04
 791  0024               L63:
 792  0024 6b02          	ld	(OFST+0,sp),a
 794                     ; 268   switch (IRQn)
 796  0026 7b03          	ld	a,(OFST+1,sp)
 798                     ; 372     default:
 798                     ; 373       break;
 799  0028 4a            	dec	a
 800  0029 a11d          	cp	a,#29
 801  002b 2407          	jruge	L24
 802  002d 5f            	clrw	x
 803  002e 97            	ld	xl,a
 804  002f 58            	sllw	x
 805  0030 de003a        	ldw	x,(L44,x)
 806  0033 fc            	jp	(x)
 807  0034               L24:
 808  0034 acc600c6      	jpf	L572
 809  0038               L322:
 810                     ; 270     case FLASH_IRQn:
 810                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 810                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 810                     ; 273       ITC->ISPR1 &= Mask;
 812  0038 c67f70        	ld	a,32624
 813  003b 1401          	and	a,(OFST-1,sp)
 814  003d c77f70        	ld	32624,a
 815                     ; 274       ITC->ISPR1 |= NewPriority;
 817  0040 c67f70        	ld	a,32624
 818  0043 1a02          	or	a,(OFST+0,sp)
 819  0045 c77f70        	ld	32624,a
 820                     ; 275       break;
 822  0048 207c          	jra	L572
 823  004a               L522:
 824                     ; 277     case EXTIE_F_PVD_IRQn:
 824                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 824                     ; 279     case RTC_IRQn:
 824                     ; 280     case EXTIB_IRQn:
 824                     ; 281     case EXTID_IRQn:
 824                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 824                     ; 283     case RTC_CSSLSE_IRQn:
 824                     ; 284     case EXTIB_IRQn:
 824                     ; 285     case EXTID_IRQn:
 824                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 824                     ; 287     case RTC_CSSLSE_IRQn:
 824                     ; 288     case EXTIB_G_IRQn:
 824                     ; 289     case EXTID_H_IRQn:
 824                     ; 290 #endif  /* STM8L15X_MD */
 824                     ; 291       ITC->ISPR2 &= Mask;
 826  004a c67f71        	ld	a,32625
 827  004d 1401          	and	a,(OFST-1,sp)
 828  004f c77f71        	ld	32625,a
 829                     ; 292       ITC->ISPR2 |= NewPriority;
 831  0052 c67f71        	ld	a,32625
 832  0055 1a02          	or	a,(OFST+0,sp)
 833  0057 c77f71        	ld	32625,a
 834                     ; 293       break;
 836  005a 206a          	jra	L572
 837  005c               L722:
 838                     ; 295     case EXTI0_IRQn:
 838                     ; 296     case EXTI1_IRQn:
 838                     ; 297     case EXTI2_IRQn:
 838                     ; 298     case EXTI3_IRQn:
 838                     ; 299       ITC->ISPR3 &= Mask;
 840  005c c67f72        	ld	a,32626
 841  005f 1401          	and	a,(OFST-1,sp)
 842  0061 c77f72        	ld	32626,a
 843                     ; 300       ITC->ISPR3 |= NewPriority;
 845  0064 c67f72        	ld	a,32626
 846  0067 1a02          	or	a,(OFST+0,sp)
 847  0069 c77f72        	ld	32626,a
 848                     ; 301       break;
 850  006c 2058          	jra	L572
 851  006e               L132:
 852                     ; 303     case EXTI4_IRQn:
 852                     ; 304     case EXTI5_IRQn:
 852                     ; 305     case EXTI6_IRQn:
 852                     ; 306     case EXTI7_IRQn:
 852                     ; 307       ITC->ISPR4 &= Mask;
 854  006e c67f73        	ld	a,32627
 855  0071 1401          	and	a,(OFST-1,sp)
 856  0073 c77f73        	ld	32627,a
 857                     ; 308       ITC->ISPR4 |= NewPriority;
 859  0076 c67f73        	ld	a,32627
 860  0079 1a02          	or	a,(OFST+0,sp)
 861  007b c77f73        	ld	32627,a
 862                     ; 309       break;
 864  007e 2046          	jra	L572
 865  0080               L332:
 866                     ; 311     case SWITCH_CSS_BREAK_DAC_IRQn:
 866                     ; 312 #else
 866                     ; 313     case SWITCH_CSS_IRQn:
 866                     ; 314 #endif /*	STM8L15X_LD	*/
 866                     ; 315     case ADC1_COMP_IRQn:
 866                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 866                     ; 317     case LCD_IRQn:
 866                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 866                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 866                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 866                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 866                     ; 322     case LCD_AES_IRQn:
 866                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 866                     ; 324 #endif  /* STM8L15X_MD */
 866                     ; 325       ITC->ISPR5 &= Mask;
 868  0080 c67f74        	ld	a,32628
 869  0083 1401          	and	a,(OFST-1,sp)
 870  0085 c77f74        	ld	32628,a
 871                     ; 326       ITC->ISPR5 |= NewPriority;
 873  0088 c67f74        	ld	a,32628
 874  008b 1a02          	or	a,(OFST+0,sp)
 875  008d c77f74        	ld	32628,a
 876                     ; 327       break;
 878  0090 2034          	jra	L572
 879  0092               L532:
 880                     ; 329     case TIM1_UPD_OVF_TRG_IRQn:
 880                     ; 330 #endif  /* STM8L15X_LD */
 880                     ; 331 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 880                     ; 332  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 880                     ; 333     case TIM2_CC_IRQn:
 880                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 880                     ; 335     case TIM3_CC_IRQn:
 880                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 880                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 880                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 880                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 880                     ; 340 #endif  /* STM8L15X_MD */
 880                     ; 341       ITC->ISPR6 &= Mask;
 882  0092 c67f75        	ld	a,32629
 883  0095 1401          	and	a,(OFST-1,sp)
 884  0097 c77f75        	ld	32629,a
 885                     ; 342       ITC->ISPR6 |= NewPriority;
 887  009a c67f75        	ld	a,32629
 888  009d 1a02          	or	a,(OFST+0,sp)
 889  009f c77f75        	ld	32629,a
 890                     ; 343       break;
 892  00a2 2022          	jra	L572
 893  00a4               L732:
 894                     ; 346     case TIM1_CC_IRQn:
 894                     ; 347 #endif  /* STM8L15X_LD */
 894                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 894                     ; 349     case SPI1_IRQn:
 894                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 894                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 894                     ; 352     case USART1_TX_IRQn:
 894                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 894                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 894                     ; 355 #endif  /* STM8L15X_MD */
 894                     ; 356       ITC->ISPR7 &= Mask;
 896  00a4 c67f76        	ld	a,32630
 897  00a7 1401          	and	a,(OFST-1,sp)
 898  00a9 c77f76        	ld	32630,a
 899                     ; 357       ITC->ISPR7 |= NewPriority;
 901  00ac c67f76        	ld	a,32630
 902  00af 1a02          	or	a,(OFST+0,sp)
 903  00b1 c77f76        	ld	32630,a
 904                     ; 358       break;
 906  00b4 2010          	jra	L572
 907  00b6               L142:
 908                     ; 362     case USART1_RX_IRQn:
 908                     ; 363     case I2C1_IRQn:
 908                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 908                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 908                     ; 366     case I2C1_SPI2_IRQn:
 908                     ; 367 #endif  /* STM8L15X_MD */
 908                     ; 368       ITC->ISPR8 &= Mask;
 910  00b6 c67f77        	ld	a,32631
 911  00b9 1401          	and	a,(OFST-1,sp)
 912  00bb c77f77        	ld	32631,a
 913                     ; 369       ITC->ISPR8 |= NewPriority;
 915  00be c67f77        	ld	a,32631
 916  00c1 1a02          	or	a,(OFST+0,sp)
 917  00c3 c77f77        	ld	32631,a
 918                     ; 370       break;
 920  00c6               L342:
 921                     ; 372     default:
 921                     ; 373       break;
 923  00c6               L572:
 924                     ; 375 }
 927  00c6 5b04          	addw	sp,#4
 928  00c8 81            	ret
 941                     	xdef	_ITC_GetSoftwarePriority
 942                     	xdef	_ITC_SetSoftwarePriority
 943                     	xdef	_ITC_GetSoftIntStatus
 944                     	xdef	_ITC_GetCPUCC
 945                     	xdef	_ITC_DeInit
 964                     	end
