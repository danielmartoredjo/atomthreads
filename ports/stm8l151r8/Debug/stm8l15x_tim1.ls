   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 181 void TIM1_DeInit(void)
  45                     ; 182 {
  47                     .text:	section	.text,new
  48  0000               _TIM1_DeInit:
  52                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  54  0000 725f52b0      	clr	21168
  55                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  57  0004 725f52b1      	clr	21169
  58                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  60  0008 725f52b2      	clr	21170
  61                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  63  000c 725f52b3      	clr	21171
  64                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  66  0010 725f52b5      	clr	21173
  67                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  69  0014 725f52bd      	clr	21181
  70                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  72  0018 725f52be      	clr	21182
  73                     ; 193   TIM1->CCMR1 = 0x01;
  75  001c 350152b9      	mov	21177,#1
  76                     ; 194   TIM1->CCMR2 = 0x01;
  78  0020 350152ba      	mov	21178,#1
  79                     ; 195   TIM1->CCMR3 = 0x01;
  81  0024 350152bb      	mov	21179,#1
  82                     ; 196   TIM1->CCMR4 = 0x01;
  84  0028 350152bc      	mov	21180,#1
  85                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  87  002c 725f52bd      	clr	21181
  88                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  90  0030 725f52be      	clr	21182
  91                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  93  0034 725f52b9      	clr	21177
  94                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  96  0038 725f52ba      	clr	21178
  97                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  99  003c 725f52bb      	clr	21179
 100                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 102  0040 725f52bc      	clr	21180
 103                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 105  0044 725f52bf      	clr	21183
 106                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 108  0048 725f52c0      	clr	21184
 109                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 111  004c 725f52c1      	clr	21185
 112                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 114  0050 725f52c2      	clr	21186
 115                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 117  0054 35ff52c3      	mov	21187,#255
 118                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 120  0058 35ff52c4      	mov	21188,#255
 121                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 123  005c 725f52c6      	clr	21190
 124                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 126  0060 725f52c7      	clr	21191
 127                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 129  0064 725f52c8      	clr	21192
 130                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 132  0068 725f52c9      	clr	21193
 133                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 135  006c 725f52ca      	clr	21194
 136                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 138  0070 725f52cb      	clr	21195
 139                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 141  0074 725f52cc      	clr	21196
 142                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 144  0078 725f52cd      	clr	21197
 145                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 147  007c 725f52d0      	clr	21200
 148                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 150  0080 350152b8      	mov	21176,#1
 151                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 153  0084 725f52cf      	clr	21199
 154                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 156  0088 725f52ce      	clr	21198
 157                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 159  008c 725f52c5      	clr	21189
 160                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 162  0090 725f52b6      	clr	21174
 163                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 165  0094 725f52b7      	clr	21175
 166                     ; 225 }
 169  0098 81            	ret
 272                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 272                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 272                     ; 243                        uint16_t TIM1_Period,
 272                     ; 244                        uint8_t TIM1_RepetitionCounter)
 272                     ; 245 {
 273                     .text:	section	.text,new
 274  0000               _TIM1_TimeBaseInit:
 276  0000 89            	pushw	x
 277       00000000      OFST:	set	0
 280                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 282                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 284  0001 7b06          	ld	a,(OFST+6,sp)
 285  0003 c752c3        	ld	21187,a
 286                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 288  0006 7b07          	ld	a,(OFST+7,sp)
 289  0008 c752c4        	ld	21188,a
 290                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 292  000b 9e            	ld	a,xh
 293  000c c752c1        	ld	21185,a
 294                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 296  000f 9f            	ld	a,xl
 297  0010 c752c2        	ld	21186,a
 298                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 298                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 300  0013 c652b0        	ld	a,21168
 301  0016 a48f          	and	a,#143
 302  0018 1a05          	or	a,(OFST+5,sp)
 303  001a c752b0        	ld	21168,a
 304                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 306  001d 7b08          	ld	a,(OFST+8,sp)
 307  001f c752c5        	ld	21189,a
 308                     ; 265 }
 311  0022 85            	popw	x
 312  0023 81            	ret
 377                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 377                     ; 280 {
 378                     .text:	section	.text,new
 379  0000               _TIM1_PrescalerConfig:
 381  0000 89            	pushw	x
 382       00000000      OFST:	set	0
 385                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 387                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 389  0001 9e            	ld	a,xh
 390  0002 c752c1        	ld	21185,a
 391                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 393  0005 9f            	ld	a,xl
 394  0006 c752c2        	ld	21186,a
 395                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 397  0009 7b05          	ld	a,(OFST+5,sp)
 398  000b c752b8        	ld	21176,a
 399                     ; 290 }
 402  000e 85            	popw	x
 403  000f 81            	ret
 439                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 439                     ; 304 {
 440                     .text:	section	.text,new
 441  0000               _TIM1_CounterModeConfig:
 443  0000 88            	push	a
 444       00000000      OFST:	set	0
 447                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 449                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 449                     ; 311                         | (uint8_t)TIM1_CounterMode);
 451  0001 c652b0        	ld	a,21168
 452  0004 a48f          	and	a,#143
 453  0006 1a01          	or	a,(OFST+1,sp)
 454  0008 c752b0        	ld	21168,a
 455                     ; 312 }
 458  000b 84            	pop	a
 459  000c 81            	ret
 491                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 491                     ; 321 {
 492                     .text:	section	.text,new
 493  0000               _TIM1_SetCounter:
 497                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 499  0000 9e            	ld	a,xh
 500  0001 c752bf        	ld	21183,a
 501                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 503  0004 9f            	ld	a,xl
 504  0005 c752c0        	ld	21184,a
 505                     ; 325 }
 508  0008 81            	ret
 540                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 540                     ; 334 {
 541                     .text:	section	.text,new
 542  0000               _TIM1_SetAutoreload:
 546                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 548  0000 9e            	ld	a,xh
 549  0001 c752c3        	ld	21187,a
 550                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 552  0004 9f            	ld	a,xl
 553  0005 c752c4        	ld	21188,a
 554                     ; 338 }
 557  0008 81            	ret
 603                     ; 345 uint16_t TIM1_GetCounter(void)
 603                     ; 346 {
 604                     .text:	section	.text,new
 605  0000               _TIM1_GetCounter:
 607  0000 5204          	subw	sp,#4
 608       00000004      OFST:	set	4
 611                     ; 348   uint16_t tmpcntr = 0;
 613                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 617                     ; 351   tmpcntrh = TIM1->CNTRH;
 619  0002 c652bf        	ld	a,21183
 620  0005 6b02          	ld	(OFST-2,sp),a
 622                     ; 352   tmpcntrl = TIM1->CNTRL;
 624  0007 c652c0        	ld	a,21184
 625  000a 6b01          	ld	(OFST-3,sp),a
 627                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 629  000c 7b01          	ld	a,(OFST-3,sp)
 630  000e 5f            	clrw	x
 631  000f 97            	ld	xl,a
 632  0010 1f03          	ldw	(OFST-1,sp),x
 634                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 636  0012 7b02          	ld	a,(OFST-2,sp)
 637  0014 5f            	clrw	x
 638  0015 97            	ld	xl,a
 639  0016 4f            	clr	a
 640  0017 02            	rlwa	x,a
 641  0018 01            	rrwa	x,a
 642  0019 1a04          	or	a,(OFST+0,sp)
 643  001b 01            	rrwa	x,a
 644  001c 1a03          	or	a,(OFST-1,sp)
 645  001e 01            	rrwa	x,a
 646  001f 1f03          	ldw	(OFST-1,sp),x
 648                     ; 358   return (uint16_t)tmpcntr;
 650  0021 1e03          	ldw	x,(OFST-1,sp)
 653  0023 5b04          	addw	sp,#4
 654  0025 81            	ret
 686                     ; 366 uint16_t TIM1_GetPrescaler(void)
 686                     ; 367 {
 687                     .text:	section	.text,new
 688  0000               _TIM1_GetPrescaler:
 690  0000 89            	pushw	x
 691       00000002      OFST:	set	2
 694                     ; 368   uint16_t tmpreg = 0;
 696                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 698  0001 c652c1        	ld	a,21185
 699  0004 5f            	clrw	x
 700  0005 97            	ld	xl,a
 701  0006 4f            	clr	a
 702  0007 02            	rlwa	x,a
 703  0008 1f01          	ldw	(OFST-1,sp),x
 705                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 707  000a c652c2        	ld	a,21186
 708  000d 5f            	clrw	x
 709  000e 97            	ld	xl,a
 710  000f 01            	rrwa	x,a
 711  0010 1a02          	or	a,(OFST+0,sp)
 712  0012 01            	rrwa	x,a
 713  0013 1a01          	or	a,(OFST-1,sp)
 714  0015 01            	rrwa	x,a
 717  0016 5b02          	addw	sp,#2
 718  0018 81            	ret
 774                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 774                     ; 381 {
 775                     .text:	section	.text,new
 776  0000               _TIM1_UpdateDisableConfig:
 780                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 782                     ; 386   if (NewState != DISABLE)
 784  0000 4d            	tnz	a
 785  0001 2706          	jreq	L352
 786                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 788  0003 721252b0      	bset	21168,#1
 790  0007 2004          	jra	L552
 791  0009               L352:
 792                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 794  0009 721352b0      	bres	21168,#1
 795  000d               L552:
 796                     ; 394 }
 799  000d 81            	ret
 857                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 857                     ; 405 {
 858                     .text:	section	.text,new
 859  0000               _TIM1_UpdateRequestConfig:
 863                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 865                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 867  0000 4d            	tnz	a
 868  0001 2706          	jreq	L503
 869                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 871  0003 721452b0      	bset	21168,#2
 873  0007 2004          	jra	L703
 874  0009               L503:
 875                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 877  0009 721552b0      	bres	21168,#2
 878  000d               L703:
 879                     ; 418 }
 882  000d 81            	ret
 918                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 918                     ; 427 {
 919                     .text:	section	.text,new
 920  0000               _TIM1_ARRPreloadConfig:
 924                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 926                     ; 432   if (NewState != DISABLE)
 928  0000 4d            	tnz	a
 929  0001 2706          	jreq	L723
 930                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 932  0003 721e52b0      	bset	21168,#7
 934  0007 2004          	jra	L133
 935  0009               L723:
 936                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 938  0009 721f52b0      	bres	21168,#7
 939  000d               L133:
 940                     ; 440 }
 943  000d 81            	ret
1000                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
1000                     ; 451 {
1001                     .text:	section	.text,new
1002  0000               _TIM1_SelectOnePulseMode:
1006                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
1008                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
1010  0000 4d            	tnz	a
1011  0001 2706          	jreq	L163
1012                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
1014  0003 721652b0      	bset	21168,#3
1016  0007 2004          	jra	L363
1017  0009               L163:
1018                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1020  0009 721752b0      	bres	21168,#3
1021  000d               L363:
1022                     ; 464 }
1025  000d 81            	ret
1060                     ; 472 void TIM1_Cmd(FunctionalState NewState)
1060                     ; 473 {
1061                     .text:	section	.text,new
1062  0000               _TIM1_Cmd:
1066                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1068                     ; 478   if (NewState != DISABLE)
1070  0000 4d            	tnz	a
1071  0001 2706          	jreq	L304
1072                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
1074  0003 721052b0      	bset	21168,#0
1076  0007 2004          	jra	L504
1077  0009               L304:
1078                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1080  0009 721152b0      	bres	21168,#0
1081  000d               L504:
1082                     ; 486 }
1085  000d 81            	ret
1368                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1368                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
1368                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1368                     ; 580                   uint16_t TIM1_Pulse,
1368                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1368                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1368                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1368                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1368                     ; 585 {
1369                     .text:	section	.text,new
1370  0000               _TIM1_OC1Init:
1372  0000 89            	pushw	x
1373  0001 5203          	subw	sp,#3
1374       00000003      OFST:	set	3
1377                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1379                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1381                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1383                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1385                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1387                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1389                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1391                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1391                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1393  0003 c652bd        	ld	a,21181
1394  0006 a4f0          	and	a,#240
1395  0008 c752bd        	ld	21181,a
1396                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1396                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1396                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1396                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1398  000b 7b0c          	ld	a,(OFST+9,sp)
1399  000d a408          	and	a,#8
1400  000f 6b03          	ld	(OFST+0,sp),a
1402  0011 7b0b          	ld	a,(OFST+8,sp)
1403  0013 a402          	and	a,#2
1404  0015 1a03          	or	a,(OFST+0,sp)
1405  0017 6b02          	ld	(OFST-1,sp),a
1407  0019 7b08          	ld	a,(OFST+5,sp)
1408  001b a404          	and	a,#4
1409  001d 6b01          	ld	(OFST-2,sp),a
1411  001f 9f            	ld	a,xl
1412  0020 a401          	and	a,#1
1413  0022 1a01          	or	a,(OFST-2,sp)
1414  0024 1a02          	or	a,(OFST-1,sp)
1415  0026 ca52bd        	or	a,21181
1416  0029 c752bd        	ld	21181,a
1417                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1417                     ; 608                           | (uint8_t)TIM1_OCMode);
1419  002c c652b9        	ld	a,21177
1420  002f a48f          	and	a,#143
1421  0031 1a04          	or	a,(OFST+1,sp)
1422  0033 c752b9        	ld	21177,a
1423                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1425  0036 c652d0        	ld	a,21200
1426  0039 a4fc          	and	a,#252
1427  003b c752d0        	ld	21200,a
1428                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1428                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1430  003e 7b0e          	ld	a,(OFST+11,sp)
1431  0040 a402          	and	a,#2
1432  0042 6b03          	ld	(OFST+0,sp),a
1434  0044 7b0d          	ld	a,(OFST+10,sp)
1435  0046 a401          	and	a,#1
1436  0048 1a03          	or	a,(OFST+0,sp)
1437  004a ca52d0        	or	a,21200
1438  004d c752d0        	ld	21200,a
1439                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1441  0050 7b09          	ld	a,(OFST+6,sp)
1442  0052 c752c6        	ld	21190,a
1443                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1445  0055 7b0a          	ld	a,(OFST+7,sp)
1446  0057 c752c7        	ld	21191,a
1447                     ; 619 }
1450  005a 5b05          	addw	sp,#5
1451  005c 81            	ret
1553                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1553                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
1553                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1553                     ; 661                   uint16_t TIM1_Pulse,
1553                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1553                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1553                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1553                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1553                     ; 666 {
1554                     .text:	section	.text,new
1555  0000               _TIM1_OC2Init:
1557  0000 89            	pushw	x
1558  0001 5203          	subw	sp,#3
1559       00000003      OFST:	set	3
1562                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1564                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1566                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1568                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1570                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1572                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1574                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1576                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1578  0003 c652bd        	ld	a,21181
1579  0006 a40f          	and	a,#15
1580  0008 c752bd        	ld	21181,a
1581                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1581                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1583  000b 7b0c          	ld	a,(OFST+9,sp)
1584  000d a480          	and	a,#128
1585  000f 6b03          	ld	(OFST+0,sp),a
1587  0011 7b0b          	ld	a,(OFST+8,sp)
1588  0013 a420          	and	a,#32
1589  0015 1a03          	or	a,(OFST+0,sp)
1590  0017 6b02          	ld	(OFST-1,sp),a
1592  0019 7b08          	ld	a,(OFST+5,sp)
1593  001b a440          	and	a,#64
1594  001d 6b01          	ld	(OFST-2,sp),a
1596  001f 9f            	ld	a,xl
1597  0020 a410          	and	a,#16
1598  0022 1a01          	or	a,(OFST-2,sp)
1599  0024 1a02          	or	a,(OFST-1,sp)
1600  0026 ca52bd        	or	a,21181
1601  0029 c752bd        	ld	21181,a
1602                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1604  002c c652ba        	ld	a,21178
1605  002f a48f          	and	a,#143
1606  0031 1a04          	or	a,(OFST+1,sp)
1607  0033 c752ba        	ld	21178,a
1608                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1610  0036 c652d0        	ld	a,21200
1611  0039 a4f3          	and	a,#243
1612  003b c752d0        	ld	21200,a
1613                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1615  003e 7b0e          	ld	a,(OFST+11,sp)
1616  0040 a408          	and	a,#8
1617  0042 6b03          	ld	(OFST+0,sp),a
1619  0044 7b0d          	ld	a,(OFST+10,sp)
1620  0046 a404          	and	a,#4
1621  0048 1a03          	or	a,(OFST+0,sp)
1622  004a ca52d0        	or	a,21200
1623  004d c752d0        	ld	21200,a
1624                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1626  0050 7b09          	ld	a,(OFST+6,sp)
1627  0052 c752c8        	ld	21192,a
1628                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1630  0055 7b0a          	ld	a,(OFST+7,sp)
1631  0057 c752c9        	ld	21193,a
1632                     ; 696 }
1635  005a 5b05          	addw	sp,#5
1636  005c 81            	ret
1738                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1738                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
1738                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1738                     ; 738                   uint16_t TIM1_Pulse,
1738                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1738                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1738                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1738                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1738                     ; 743 {
1739                     .text:	section	.text,new
1740  0000               _TIM1_OC3Init:
1742  0000 89            	pushw	x
1743  0001 5203          	subw	sp,#3
1744       00000003      OFST:	set	3
1747                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1749                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1751                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1753                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1755                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1757                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1759                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1761                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1763  0003 c652be        	ld	a,21182
1764  0006 a4f0          	and	a,#240
1765  0008 c752be        	ld	21182,a
1766                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1766                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1768  000b 7b0c          	ld	a,(OFST+9,sp)
1769  000d a408          	and	a,#8
1770  000f 6b03          	ld	(OFST+0,sp),a
1772  0011 7b0b          	ld	a,(OFST+8,sp)
1773  0013 a402          	and	a,#2
1774  0015 1a03          	or	a,(OFST+0,sp)
1775  0017 6b02          	ld	(OFST-1,sp),a
1777  0019 7b08          	ld	a,(OFST+5,sp)
1778  001b a404          	and	a,#4
1779  001d 6b01          	ld	(OFST-2,sp),a
1781  001f 9f            	ld	a,xl
1782  0020 a401          	and	a,#1
1783  0022 1a01          	or	a,(OFST-2,sp)
1784  0024 1a02          	or	a,(OFST-1,sp)
1785  0026 ca52be        	or	a,21182
1786  0029 c752be        	ld	21182,a
1787                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1789  002c c652bb        	ld	a,21179
1790  002f a48f          	and	a,#143
1791  0031 1a04          	or	a,(OFST+1,sp)
1792  0033 c752bb        	ld	21179,a
1793                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1795  0036 c652d0        	ld	a,21200
1796  0039 a4cf          	and	a,#207
1797  003b c752d0        	ld	21200,a
1798                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1800  003e 7b0e          	ld	a,(OFST+11,sp)
1801  0040 a420          	and	a,#32
1802  0042 6b03          	ld	(OFST+0,sp),a
1804  0044 7b0d          	ld	a,(OFST+10,sp)
1805  0046 a410          	and	a,#16
1806  0048 1a03          	or	a,(OFST+0,sp)
1807  004a ca52d0        	or	a,21200
1808  004d c752d0        	ld	21200,a
1809                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1811  0050 7b09          	ld	a,(OFST+6,sp)
1812  0052 c752ca        	ld	21194,a
1813                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1815  0055 7b0a          	ld	a,(OFST+7,sp)
1816  0057 c752cb        	ld	21195,a
1817                     ; 773 }
1820  005a 5b05          	addw	sp,#5
1821  005c 81            	ret
2026                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2026                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2026                     ; 805                      uint8_t TIM1_DeadTime,
2026                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
2026                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2026                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2026                     ; 809 {
2027                     .text:	section	.text,new
2028  0000               _TIM1_BDTRConfig:
2030  0000 89            	pushw	x
2031  0001 88            	push	a
2032       00000001      OFST:	set	1
2035                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2037                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2039                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2041                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2043                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2045                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2047  0002 7b06          	ld	a,(OFST+5,sp)
2048  0004 c752cf        	ld	21199,a
2049                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2049                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2049                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
2051  0007 7b07          	ld	a,(OFST+6,sp)
2052  0009 1a08          	or	a,(OFST+7,sp)
2053  000b 1a09          	or	a,(OFST+8,sp)
2054  000d 6b01          	ld	(OFST+0,sp),a
2056  000f 9f            	ld	a,xl
2057  0010 1a02          	or	a,(OFST+1,sp)
2058  0012 1a01          	or	a,(OFST+0,sp)
2059  0014 c752ce        	ld	21198,a
2060                     ; 826 }
2063  0017 5b03          	addw	sp,#3
2064  0019 81            	ret
2100                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2100                     ; 835 {
2101                     .text:	section	.text,new
2102  0000               _TIM1_CtrlPWMOutputs:
2106                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
2108                     ; 841   if (NewState != DISABLE)
2110  0000 4d            	tnz	a
2111  0001 2706          	jreq	L1301
2112                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
2114  0003 721e52ce      	bset	21198,#7
2116  0007 2004          	jra	L3301
2117  0009               L1301:
2118                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2120  0009 721f52ce      	bres	21198,#7
2121  000d               L3301:
2122                     ; 849 }
2125  000d 81            	ret
2204                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2204                     ; 872 {
2205                     .text:	section	.text,new
2206  0000               _TIM1_SelectOCxM:
2208  0000 89            	pushw	x
2209       00000000      OFST:	set	0
2212                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2214                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2216                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
2218  0001 9e            	ld	a,xh
2219  0002 4d            	tnz	a
2220  0003 2610          	jrne	L3701
2221                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2223  0005 721152bd      	bres	21181,#0
2224                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2226  0009 c652b9        	ld	a,21177
2227  000c a48f          	and	a,#143
2228  000e 1a02          	or	a,(OFST+2,sp)
2229  0010 c752b9        	ld	21177,a
2231  0013 2024          	jra	L5701
2232  0015               L3701:
2233                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
2235  0015 7b01          	ld	a,(OFST+1,sp)
2236  0017 a101          	cp	a,#1
2237  0019 2610          	jrne	L7701
2238                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2240  001b 721952bd      	bres	21181,#4
2241                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2243  001f c652ba        	ld	a,21178
2244  0022 a48f          	and	a,#143
2245  0024 1a02          	or	a,(OFST+2,sp)
2246  0026 c752ba        	ld	21178,a
2248  0029 200e          	jra	L5701
2249  002b               L7701:
2250                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2252  002b 721152be      	bres	21182,#0
2253                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2255  002f c652bb        	ld	a,21179
2256  0032 a48f          	and	a,#143
2257  0034 1a02          	or	a,(OFST+2,sp)
2258  0036 c752bb        	ld	21179,a
2259  0039               L5701:
2260                     ; 902 }
2263  0039 85            	popw	x
2264  003a 81            	ret
2296                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
2296                     ; 911 {
2297                     .text:	section	.text,new
2298  0000               _TIM1_SetCompare1:
2302                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2304  0000 9e            	ld	a,xh
2305  0001 c752c6        	ld	21190,a
2306                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
2308  0004 9f            	ld	a,xl
2309  0005 c752c7        	ld	21191,a
2310                     ; 916 }
2313  0008 81            	ret
2345                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
2345                     ; 925 {
2346                     .text:	section	.text,new
2347  0000               _TIM1_SetCompare2:
2351                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2353  0000 9e            	ld	a,xh
2354  0001 c752c8        	ld	21192,a
2355                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
2357  0004 9f            	ld	a,xl
2358  0005 c752c9        	ld	21193,a
2359                     ; 929 }
2362  0008 81            	ret
2394                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
2394                     ; 938 {
2395                     .text:	section	.text,new
2396  0000               _TIM1_SetCompare3:
2400                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2402  0000 9e            	ld	a,xh
2403  0001 c752ca        	ld	21194,a
2404                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
2406  0004 9f            	ld	a,xl
2407  0005 c752cb        	ld	21195,a
2408                     ; 942 }
2411  0008 81            	ret
2443                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
2443                     ; 951 {
2444                     .text:	section	.text,new
2445  0000               _TIM1_SetCompare4:
2449                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2451  0000 9e            	ld	a,xh
2452  0001 c752cc        	ld	21196,a
2453                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
2455  0004 9f            	ld	a,xl
2456  0005 c752cd        	ld	21197,a
2457                     ; 955 }
2460  0008 81            	ret
2496                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
2496                     ; 964 {
2497                     .text:	section	.text,new
2498  0000               _TIM1_CCPreloadControl:
2502                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
2504                     ; 969   if (NewState != DISABLE)
2506  0000 4d            	tnz	a
2507  0001 2706          	jreq	L1021
2508                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
2510  0003 721052b1      	bset	21169,#0
2512  0007 2004          	jra	L3021
2513  0009               L1021:
2514                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2516  0009 721152b1      	bres	21169,#0
2517  000d               L3021:
2518                     ; 977 }
2521  000d 81            	ret
2579                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2579                     ; 988 {
2580                     .text:	section	.text,new
2581  0000               _TIM1_ForcedOC1Config:
2583  0000 88            	push	a
2584       00000000      OFST:	set	0
2587                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2589                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2591  0001 c652b9        	ld	a,21177
2592  0004 a48f          	and	a,#143
2593  0006 1a01          	or	a,(OFST+1,sp)
2594  0008 c752b9        	ld	21177,a
2595                     ; 994 }
2598  000b 84            	pop	a
2599  000c 81            	ret
2635                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2635                     ; 1005 {
2636                     .text:	section	.text,new
2637  0000               _TIM1_ForcedOC2Config:
2639  0000 88            	push	a
2640       00000000      OFST:	set	0
2643                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2645                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2647  0001 c652ba        	ld	a,21178
2648  0004 a48f          	and	a,#143
2649  0006 1a01          	or	a,(OFST+1,sp)
2650  0008 c752ba        	ld	21178,a
2651                     ; 1011 }
2654  000b 84            	pop	a
2655  000c 81            	ret
2691                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2691                     ; 1022 {
2692                     .text:	section	.text,new
2693  0000               _TIM1_ForcedOC3Config:
2695  0000 88            	push	a
2696       00000000      OFST:	set	0
2699                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2701                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2703  0001 c652bb        	ld	a,21179
2704  0004 a48f          	and	a,#143
2705  0006 1a01          	or	a,(OFST+1,sp)
2706  0008 c752bb        	ld	21179,a
2707                     ; 1028 }
2710  000b 84            	pop	a
2711  000c 81            	ret
2747                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2747                     ; 1037 {
2748                     .text:	section	.text,new
2749  0000               _TIM1_OC1PreloadConfig:
2753                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
2755                     ; 1042   if (NewState != DISABLE)
2757  0000 4d            	tnz	a
2758  0001 2706          	jreq	L5031
2759                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2761  0003 721652b9      	bset	21177,#3
2763  0007 2004          	jra	L7031
2764  0009               L5031:
2765                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2767  0009 721752b9      	bres	21177,#3
2768  000d               L7031:
2769                     ; 1050 }
2772  000d 81            	ret
2808                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2808                     ; 1059 {
2809                     .text:	section	.text,new
2810  0000               _TIM1_OC2PreloadConfig:
2814                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
2816                     ; 1064   if (NewState != DISABLE)
2818  0000 4d            	tnz	a
2819  0001 2706          	jreq	L7231
2820                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2822  0003 721652ba      	bset	21178,#3
2824  0007 2004          	jra	L1331
2825  0009               L7231:
2826                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2828  0009 721752ba      	bres	21178,#3
2829  000d               L1331:
2830                     ; 1072 }
2833  000d 81            	ret
2869                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2869                     ; 1081 {
2870                     .text:	section	.text,new
2871  0000               _TIM1_OC3PreloadConfig:
2875                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
2877                     ; 1086   if (NewState != DISABLE)
2879  0000 4d            	tnz	a
2880  0001 2706          	jreq	L1531
2881                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2883  0003 721652bb      	bset	21179,#3
2885  0007 2004          	jra	L3531
2886  0009               L1531:
2887                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2889  0009 721752bb      	bres	21179,#3
2890  000d               L3531:
2891                     ; 1094 }
2894  000d 81            	ret
2930                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2930                     ; 1103 {
2931                     .text:	section	.text,new
2932  0000               _TIM1_OC4PreloadConfig:
2936                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
2938                     ; 1108   if (NewState != DISABLE)
2940  0000 4d            	tnz	a
2941  0001 2706          	jreq	L3731
2942                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2944  0003 721652bc      	bset	21180,#3
2946  0007 2004          	jra	L5731
2947  0009               L3731:
2948                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2950  0009 721752bc      	bres	21180,#3
2951  000d               L5731:
2952                     ; 1116 }
2955  000d 81            	ret
2990                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
2990                     ; 1125 {
2991                     .text:	section	.text,new
2992  0000               _TIM1_OC1FastConfig:
2996                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
2998                     ; 1130   if (NewState != DISABLE)
3000  0000 4d            	tnz	a
3001  0001 2706          	jreq	L5141
3002                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
3004  0003 721452b9      	bset	21177,#2
3006  0007 2004          	jra	L7141
3007  0009               L5141:
3008                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3010  0009 721552b9      	bres	21177,#2
3011  000d               L7141:
3012                     ; 1138 }
3015  000d 81            	ret
3050                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
3050                     ; 1147 {
3051                     .text:	section	.text,new
3052  0000               _TIM1_OC2FastConfig:
3056                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
3058                     ; 1152   if (NewState != DISABLE)
3060  0000 4d            	tnz	a
3061  0001 2706          	jreq	L7341
3062                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3064  0003 721452ba      	bset	21178,#2
3066  0007 2004          	jra	L1441
3067  0009               L7341:
3068                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3070  0009 721552ba      	bres	21178,#2
3071  000d               L1441:
3072                     ; 1160 }
3075  000d 81            	ret
3110                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
3110                     ; 1169 {
3111                     .text:	section	.text,new
3112  0000               _TIM1_OC3FastConfig:
3116                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
3118                     ; 1174   if (NewState != DISABLE)
3120  0000 4d            	tnz	a
3121  0001 2706          	jreq	L1641
3122                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3124  0003 721452bb      	bset	21179,#2
3126  0007 2004          	jra	L3641
3127  0009               L1641:
3128                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3130  0009 721552bb      	bres	21179,#2
3131  000d               L3641:
3132                     ; 1182 }
3135  000d 81            	ret
3170                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
3170                     ; 1191 {
3171                     .text:	section	.text,new
3172  0000               _TIM1_ClearOC1Ref:
3176                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
3178                     ; 1196   if (NewState != DISABLE)
3180  0000 4d            	tnz	a
3181  0001 2706          	jreq	L3051
3182                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3184  0003 721e52b9      	bset	21177,#7
3186  0007 2004          	jra	L5051
3187  0009               L3051:
3188                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3190  0009 721f52b9      	bres	21177,#7
3191  000d               L5051:
3192                     ; 1204 }
3195  000d 81            	ret
3230                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
3230                     ; 1213 {
3231                     .text:	section	.text,new
3232  0000               _TIM1_ClearOC2Ref:
3236                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
3238                     ; 1218   if (NewState != DISABLE)
3240  0000 4d            	tnz	a
3241  0001 2706          	jreq	L5251
3242                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3244  0003 721e52ba      	bset	21178,#7
3246  0007 2004          	jra	L7251
3247  0009               L5251:
3248                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3250  0009 721f52ba      	bres	21178,#7
3251  000d               L7251:
3252                     ; 1226 }
3255  000d 81            	ret
3290                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
3290                     ; 1235 {
3291                     .text:	section	.text,new
3292  0000               _TIM1_ClearOC3Ref:
3296                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
3298                     ; 1240   if (NewState != DISABLE)
3300  0000 4d            	tnz	a
3301  0001 2706          	jreq	L7451
3302                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3304  0003 721e52bb      	bset	21179,#7
3306  0007 2004          	jra	L1551
3307  0009               L7451:
3308                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3310  0009 721f52bb      	bres	21179,#7
3311  000d               L1551:
3312                     ; 1248 }
3315  000d 81            	ret
3350                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
3350                     ; 1257 {
3351                     .text:	section	.text,new
3352  0000               _TIM1_ClearOC4Ref:
3356                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
3358                     ; 1262   if (NewState != DISABLE)
3360  0000 4d            	tnz	a
3361  0001 2706          	jreq	L1751
3362                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3364  0003 721e52bc      	bset	21180,#7
3366  0007 2004          	jra	L3751
3367  0009               L1751:
3368                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3370  0009 721f52bc      	bres	21180,#7
3371  000d               L3751:
3372                     ; 1270 }
3375  000d 81            	ret
3411                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3411                     ; 1281 {
3412                     .text:	section	.text,new
3413  0000               _TIM1_OC1PolarityConfig:
3417                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3419                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3421  0000 4d            	tnz	a
3422  0001 2706          	jreq	L3161
3423                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3425  0003 721252bd      	bset	21181,#1
3427  0007 2004          	jra	L5161
3428  0009               L3161:
3429                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3431  0009 721352bd      	bres	21181,#1
3432  000d               L5161:
3433                     ; 1294 }
3436  000d 81            	ret
3472                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3472                     ; 1305 {
3473                     .text:	section	.text,new
3474  0000               _TIM1_OC1NPolarityConfig:
3478                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3480                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3482  0000 4d            	tnz	a
3483  0001 2706          	jreq	L5361
3484                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3486  0003 721652bd      	bset	21181,#3
3488  0007 2004          	jra	L7361
3489  0009               L5361:
3490                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3492  0009 721752bd      	bres	21181,#3
3493  000d               L7361:
3494                     ; 1318 }
3497  000d 81            	ret
3533                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3533                     ; 1329 {
3534                     .text:	section	.text,new
3535  0000               _TIM1_OC2PolarityConfig:
3539                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3541                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3543  0000 4d            	tnz	a
3544  0001 2706          	jreq	L7561
3545                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3547  0003 721a52bd      	bset	21181,#5
3549  0007 2004          	jra	L1661
3550  0009               L7561:
3551                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3553  0009 721b52bd      	bres	21181,#5
3554  000d               L1661:
3555                     ; 1342 }
3558  000d 81            	ret
3594                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3594                     ; 1353 {
3595                     .text:	section	.text,new
3596  0000               _TIM1_OC2NPolarityConfig:
3600                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3602                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3604  0000 4d            	tnz	a
3605  0001 2706          	jreq	L1071
3606                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3608  0003 721e52bd      	bset	21181,#7
3610  0007 2004          	jra	L3071
3611  0009               L1071:
3612                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3614  0009 721f52bd      	bres	21181,#7
3615  000d               L3071:
3616                     ; 1366 }
3619  000d 81            	ret
3655                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3655                     ; 1377 {
3656                     .text:	section	.text,new
3657  0000               _TIM1_OC3PolarityConfig:
3661                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3663                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3665  0000 4d            	tnz	a
3666  0001 2706          	jreq	L3271
3667                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3669  0003 721252be      	bset	21182,#1
3671  0007 2004          	jra	L5271
3672  0009               L3271:
3673                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3675  0009 721352be      	bres	21182,#1
3676  000d               L5271:
3677                     ; 1390 }
3680  000d 81            	ret
3716                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3716                     ; 1401 {
3717                     .text:	section	.text,new
3718  0000               _TIM1_OC3NPolarityConfig:
3722                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3724                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3726  0000 4d            	tnz	a
3727  0001 2706          	jreq	L5471
3728                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3730  0003 721652be      	bset	21182,#3
3732  0007 2004          	jra	L7471
3733  0009               L5471:
3734                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3736  0009 721752be      	bres	21182,#3
3737  000d               L7471:
3738                     ; 1414 }
3741  000d 81            	ret
3800                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3800                     ; 1425 {
3801                     .text:	section	.text,new
3802  0000               _TIM1_SelectOCREFClear:
3806                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3808                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3810  0000 721752b2      	bres	21170,#3
3811                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3813  0004 ca52b2        	or	a,21170
3814  0007 c752b2        	ld	21170,a
3815                     ; 1432 }
3818  000a 81            	ret
3853                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
3853                     ; 1441 {
3854                     .text:	section	.text,new
3855  0000               _TIM1_SelectCOM:
3859                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3861                     ; 1446   if (NewState != DISABLE)
3863  0000 4d            	tnz	a
3864  0001 2706          	jreq	L5102
3865                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
3867  0003 721452b1      	bset	21169,#2
3869  0007 2004          	jra	L7102
3870  0009               L5102:
3871                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3873  0009 721552b1      	bres	21169,#2
3874  000d               L7102:
3875                     ; 1454 }
3878  000d 81            	ret
3923                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3923                     ; 1469 {
3924                     .text:	section	.text,new
3925  0000               _TIM1_CCxCmd:
3927  0000 89            	pushw	x
3928       00000000      OFST:	set	0
3931                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3933                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
3935                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
3937  0001 9e            	ld	a,xh
3938  0002 4d            	tnz	a
3939  0003 2610          	jrne	L3402
3940                     ; 1477     if (NewState != DISABLE)
3942  0005 9f            	ld	a,xl
3943  0006 4d            	tnz	a
3944  0007 2706          	jreq	L5402
3945                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3947  0009 721052bd      	bset	21181,#0
3949  000d 2040          	jra	L1502
3950  000f               L5402:
3951                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3953  000f 721152bd      	bres	21181,#0
3954  0013 203a          	jra	L1502
3955  0015               L3402:
3956                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
3958  0015 7b01          	ld	a,(OFST+1,sp)
3959  0017 a101          	cp	a,#1
3960  0019 2610          	jrne	L3502
3961                     ; 1489     if (NewState != DISABLE)
3963  001b 0d02          	tnz	(OFST+2,sp)
3964  001d 2706          	jreq	L5502
3965                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3967  001f 721852bd      	bset	21181,#4
3969  0023 202a          	jra	L1502
3970  0025               L5502:
3971                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3973  0025 721952bd      	bres	21181,#4
3974  0029 2024          	jra	L1502
3975  002b               L3502:
3976                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
3978  002b 7b01          	ld	a,(OFST+1,sp)
3979  002d a102          	cp	a,#2
3980  002f 2610          	jrne	L3602
3981                     ; 1501     if (NewState != DISABLE)
3983  0031 0d02          	tnz	(OFST+2,sp)
3984  0033 2706          	jreq	L5602
3985                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
3987  0035 721052be      	bset	21182,#0
3989  0039 2014          	jra	L1502
3990  003b               L5602:
3991                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
3993  003b 721152be      	bres	21182,#0
3994  003f 200e          	jra	L1502
3995  0041               L3602:
3996                     ; 1513     if (NewState != DISABLE)
3998  0041 0d02          	tnz	(OFST+2,sp)
3999  0043 2706          	jreq	L3702
4000                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
4002  0045 721852be      	bset	21182,#4
4004  0049 2004          	jra	L1502
4005  004b               L3702:
4006                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
4008  004b 721952be      	bres	21182,#4
4009  004f               L1502:
4010                     ; 1522 }
4013  004f 85            	popw	x
4014  0050 81            	ret
4059                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4059                     ; 1536 {
4060                     .text:	section	.text,new
4061  0000               _TIM1_CCxNCmd:
4063  0000 89            	pushw	x
4064       00000000      OFST:	set	0
4067                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4069                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
4071                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
4073  0001 9e            	ld	a,xh
4074  0002 4d            	tnz	a
4075  0003 2610          	jrne	L1212
4076                     ; 1544     if (NewState != DISABLE)
4078  0005 9f            	ld	a,xl
4079  0006 4d            	tnz	a
4080  0007 2706          	jreq	L3212
4081                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4083  0009 721452bd      	bset	21181,#2
4085  000d 202a          	jra	L7212
4086  000f               L3212:
4087                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4089  000f 721552bd      	bres	21181,#2
4090  0013 2024          	jra	L7212
4091  0015               L1212:
4092                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
4094  0015 7b01          	ld	a,(OFST+1,sp)
4095  0017 a101          	cp	a,#1
4096  0019 2610          	jrne	L1312
4097                     ; 1556     if (NewState != DISABLE)
4099  001b 0d02          	tnz	(OFST+2,sp)
4100  001d 2706          	jreq	L3312
4101                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4103  001f 721c52bd      	bset	21181,#6
4105  0023 2014          	jra	L7212
4106  0025               L3312:
4107                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4109  0025 721d52bd      	bres	21181,#6
4110  0029 200e          	jra	L7212
4111  002b               L1312:
4112                     ; 1568     if (NewState != DISABLE)
4114  002b 0d02          	tnz	(OFST+2,sp)
4115  002d 2706          	jreq	L1412
4116                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4118  002f 721452be      	bset	21182,#2
4120  0033 2004          	jra	L7212
4121  0035               L1412:
4122                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4124  0035 721552be      	bres	21182,#2
4125  0039               L7212:
4126                     ; 1577 }
4129  0039 85            	popw	x
4130  003a 81            	ret
4296                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4296                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4296                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4296                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4296                     ; 1668                  uint8_t TIM1_ICFilter)
4296                     ; 1669 {
4297                     .text:	section	.text,new
4298  0000               _TIM1_ICInit:
4300  0000 89            	pushw	x
4301       00000000      OFST:	set	0
4304                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4306                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4308                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4310                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4312                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4314                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
4316  0001 9e            	ld	a,xh
4317  0002 4d            	tnz	a
4318  0003 2614          	jrne	L7322
4319                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4321  0005 7b07          	ld	a,(OFST+7,sp)
4322  0007 88            	push	a
4323  0008 7b06          	ld	a,(OFST+6,sp)
4324  000a 97            	ld	xl,a
4325  000b 7b03          	ld	a,(OFST+3,sp)
4326  000d 95            	ld	xh,a
4327  000e cd0000        	call	L3_TI1_Config
4329  0011 84            	pop	a
4330                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4332  0012 7b06          	ld	a,(OFST+6,sp)
4333  0014 cd0000        	call	_TIM1_SetIC1Prescaler
4336  0017 2046          	jra	L1422
4337  0019               L7322:
4338                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
4340  0019 7b01          	ld	a,(OFST+1,sp)
4341  001b a101          	cp	a,#1
4342  001d 2614          	jrne	L3422
4343                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4345  001f 7b07          	ld	a,(OFST+7,sp)
4346  0021 88            	push	a
4347  0022 7b06          	ld	a,(OFST+6,sp)
4348  0024 97            	ld	xl,a
4349  0025 7b03          	ld	a,(OFST+3,sp)
4350  0027 95            	ld	xh,a
4351  0028 cd0000        	call	L5_TI2_Config
4353  002b 84            	pop	a
4354                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4356  002c 7b06          	ld	a,(OFST+6,sp)
4357  002e cd0000        	call	_TIM1_SetIC2Prescaler
4360  0031 202c          	jra	L1422
4361  0033               L3422:
4362                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
4364  0033 7b01          	ld	a,(OFST+1,sp)
4365  0035 a102          	cp	a,#2
4366  0037 2614          	jrne	L7422
4367                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4369  0039 7b07          	ld	a,(OFST+7,sp)
4370  003b 88            	push	a
4371  003c 7b06          	ld	a,(OFST+6,sp)
4372  003e 97            	ld	xl,a
4373  003f 7b03          	ld	a,(OFST+3,sp)
4374  0041 95            	ld	xh,a
4375  0042 cd0000        	call	L7_TI3_Config
4377  0045 84            	pop	a
4378                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4380  0046 7b06          	ld	a,(OFST+6,sp)
4381  0048 cd0000        	call	_TIM1_SetIC3Prescaler
4384  004b 2012          	jra	L1422
4385  004d               L7422:
4386                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4388  004d 7b07          	ld	a,(OFST+7,sp)
4389  004f 88            	push	a
4390  0050 7b06          	ld	a,(OFST+6,sp)
4391  0052 97            	ld	xl,a
4392  0053 7b03          	ld	a,(OFST+3,sp)
4393  0055 95            	ld	xh,a
4394  0056 cd0000        	call	L11_TI4_Config
4396  0059 84            	pop	a
4397                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4399  005a 7b06          	ld	a,(OFST+6,sp)
4400  005c cd0000        	call	_TIM1_SetIC4Prescaler
4402  005f               L1422:
4403                     ; 1706 }
4406  005f 85            	popw	x
4407  0060 81            	ret
4503                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4503                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4503                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4503                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4503                     ; 1737                      uint8_t TIM1_ICFilter)
4503                     ; 1738 {
4504                     .text:	section	.text,new
4505  0000               _TIM1_PWMIConfig:
4507  0000 89            	pushw	x
4508  0001 89            	pushw	x
4509       00000002      OFST:	set	2
4512                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4514                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4516                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4518                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4520                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4522                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4524                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4526  0002 9f            	ld	a,xl
4527  0003 a101          	cp	a,#1
4528  0005 2706          	jreq	L7132
4529                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
4531  0007 a601          	ld	a,#1
4532  0009 6b01          	ld	(OFST-1,sp),a
4535  000b 2002          	jra	L1232
4536  000d               L7132:
4537                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
4539  000d 0f01          	clr	(OFST-1,sp)
4541  000f               L1232:
4542                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4544  000f 7b07          	ld	a,(OFST+5,sp)
4545  0011 a101          	cp	a,#1
4546  0013 2606          	jrne	L3232
4547                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
4549  0015 a602          	ld	a,#2
4550  0017 6b02          	ld	(OFST+0,sp),a
4553  0019 2004          	jra	L5232
4554  001b               L3232:
4555                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
4557  001b a601          	ld	a,#1
4558  001d 6b02          	ld	(OFST+0,sp),a
4560  001f               L5232:
4561                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
4563  001f 0d03          	tnz	(OFST+1,sp)
4564  0021 2626          	jrne	L7232
4565                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4567  0023 7b09          	ld	a,(OFST+7,sp)
4568  0025 88            	push	a
4569  0026 7b08          	ld	a,(OFST+6,sp)
4570  0028 97            	ld	xl,a
4571  0029 7b05          	ld	a,(OFST+3,sp)
4572  002b 95            	ld	xh,a
4573  002c cd0000        	call	L3_TI1_Config
4575  002f 84            	pop	a
4576                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4578  0030 7b08          	ld	a,(OFST+6,sp)
4579  0032 cd0000        	call	_TIM1_SetIC1Prescaler
4581                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4583  0035 7b09          	ld	a,(OFST+7,sp)
4584  0037 88            	push	a
4585  0038 7b03          	ld	a,(OFST+1,sp)
4586  003a 97            	ld	xl,a
4587  003b 7b02          	ld	a,(OFST+0,sp)
4588  003d 95            	ld	xh,a
4589  003e cd0000        	call	L5_TI2_Config
4591  0041 84            	pop	a
4592                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4594  0042 7b08          	ld	a,(OFST+6,sp)
4595  0044 cd0000        	call	_TIM1_SetIC2Prescaler
4598  0047 2024          	jra	L1332
4599  0049               L7232:
4600                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4602  0049 7b09          	ld	a,(OFST+7,sp)
4603  004b 88            	push	a
4604  004c 7b08          	ld	a,(OFST+6,sp)
4605  004e 97            	ld	xl,a
4606  004f 7b05          	ld	a,(OFST+3,sp)
4607  0051 95            	ld	xh,a
4608  0052 cd0000        	call	L5_TI2_Config
4610  0055 84            	pop	a
4611                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4613  0056 7b08          	ld	a,(OFST+6,sp)
4614  0058 cd0000        	call	_TIM1_SetIC2Prescaler
4616                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4618  005b 7b09          	ld	a,(OFST+7,sp)
4619  005d 88            	push	a
4620  005e 7b03          	ld	a,(OFST+1,sp)
4621  0060 97            	ld	xl,a
4622  0061 7b02          	ld	a,(OFST+0,sp)
4623  0063 95            	ld	xh,a
4624  0064 cd0000        	call	L3_TI1_Config
4626  0067 84            	pop	a
4627                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4629  0068 7b08          	ld	a,(OFST+6,sp)
4630  006a cd0000        	call	_TIM1_SetIC1Prescaler
4632  006d               L1332:
4633                     ; 1796 }
4636  006d 5b04          	addw	sp,#4
4637  006f 81            	ret
4683                     ; 1803 uint16_t TIM1_GetCapture1(void)
4683                     ; 1804 {
4684                     .text:	section	.text,new
4685  0000               _TIM1_GetCapture1:
4687  0000 5204          	subw	sp,#4
4688       00000004      OFST:	set	4
4691                     ; 1807   uint16_t tmpccr1 = 0;
4693                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4697                     ; 1810   tmpccr1h = TIM1->CCR1H;
4699  0002 c652c6        	ld	a,21190
4700  0005 6b02          	ld	(OFST-2,sp),a
4702                     ; 1811   tmpccr1l = TIM1->CCR1L;
4704  0007 c652c7        	ld	a,21191
4705  000a 6b01          	ld	(OFST-3,sp),a
4707                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
4709  000c 7b01          	ld	a,(OFST-3,sp)
4710  000e 5f            	clrw	x
4711  000f 97            	ld	xl,a
4712  0010 1f03          	ldw	(OFST-1,sp),x
4714                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4716  0012 7b02          	ld	a,(OFST-2,sp)
4717  0014 5f            	clrw	x
4718  0015 97            	ld	xl,a
4719  0016 4f            	clr	a
4720  0017 02            	rlwa	x,a
4721  0018 01            	rrwa	x,a
4722  0019 1a04          	or	a,(OFST+0,sp)
4723  001b 01            	rrwa	x,a
4724  001c 1a03          	or	a,(OFST-1,sp)
4725  001e 01            	rrwa	x,a
4726  001f 1f03          	ldw	(OFST-1,sp),x
4728                     ; 1816   return (uint16_t)tmpccr1;
4730  0021 1e03          	ldw	x,(OFST-1,sp)
4733  0023 5b04          	addw	sp,#4
4734  0025 81            	ret
4780                     ; 1824 uint16_t TIM1_GetCapture2(void)
4780                     ; 1825 {
4781                     .text:	section	.text,new
4782  0000               _TIM1_GetCapture2:
4784  0000 5204          	subw	sp,#4
4785       00000004      OFST:	set	4
4788                     ; 1828   uint16_t tmpccr2 = 0;
4790                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4794                     ; 1831   tmpccr2h = TIM1->CCR2H;
4796  0002 c652c8        	ld	a,21192
4797  0005 6b02          	ld	(OFST-2,sp),a
4799                     ; 1832   tmpccr2l = TIM1->CCR2L;
4801  0007 c652c9        	ld	a,21193
4802  000a 6b01          	ld	(OFST-3,sp),a
4804                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
4806  000c 7b01          	ld	a,(OFST-3,sp)
4807  000e 5f            	clrw	x
4808  000f 97            	ld	xl,a
4809  0010 1f03          	ldw	(OFST-1,sp),x
4811                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4813  0012 7b02          	ld	a,(OFST-2,sp)
4814  0014 5f            	clrw	x
4815  0015 97            	ld	xl,a
4816  0016 4f            	clr	a
4817  0017 02            	rlwa	x,a
4818  0018 01            	rrwa	x,a
4819  0019 1a04          	or	a,(OFST+0,sp)
4820  001b 01            	rrwa	x,a
4821  001c 1a03          	or	a,(OFST-1,sp)
4822  001e 01            	rrwa	x,a
4823  001f 1f03          	ldw	(OFST-1,sp),x
4825                     ; 1837   return (uint16_t)tmpccr2;
4827  0021 1e03          	ldw	x,(OFST-1,sp)
4830  0023 5b04          	addw	sp,#4
4831  0025 81            	ret
4877                     ; 1845 uint16_t TIM1_GetCapture3(void)
4877                     ; 1846 {
4878                     .text:	section	.text,new
4879  0000               _TIM1_GetCapture3:
4881  0000 5204          	subw	sp,#4
4882       00000004      OFST:	set	4
4885                     ; 1848   uint16_t tmpccr3 = 0;
4887                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4891                     ; 1851   tmpccr3h = TIM1->CCR3H;
4893  0002 c652ca        	ld	a,21194
4894  0005 6b02          	ld	(OFST-2,sp),a
4896                     ; 1852   tmpccr3l = TIM1->CCR3L;
4898  0007 c652cb        	ld	a,21195
4899  000a 6b01          	ld	(OFST-3,sp),a
4901                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
4903  000c 7b01          	ld	a,(OFST-3,sp)
4904  000e 5f            	clrw	x
4905  000f 97            	ld	xl,a
4906  0010 1f03          	ldw	(OFST-1,sp),x
4908                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4910  0012 7b02          	ld	a,(OFST-2,sp)
4911  0014 5f            	clrw	x
4912  0015 97            	ld	xl,a
4913  0016 4f            	clr	a
4914  0017 02            	rlwa	x,a
4915  0018 01            	rrwa	x,a
4916  0019 1a04          	or	a,(OFST+0,sp)
4917  001b 01            	rrwa	x,a
4918  001c 1a03          	or	a,(OFST-1,sp)
4919  001e 01            	rrwa	x,a
4920  001f 1f03          	ldw	(OFST-1,sp),x
4922                     ; 1857   return (uint16_t)tmpccr3;
4924  0021 1e03          	ldw	x,(OFST-1,sp)
4927  0023 5b04          	addw	sp,#4
4928  0025 81            	ret
4974                     ; 1865 uint16_t TIM1_GetCapture4(void)
4974                     ; 1866 {
4975                     .text:	section	.text,new
4976  0000               _TIM1_GetCapture4:
4978  0000 5204          	subw	sp,#4
4979       00000004      OFST:	set	4
4982                     ; 1868   uint16_t tmpccr4 = 0;
4984                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
4988                     ; 1871   tmpccr4h = TIM1->CCR4H;
4990  0002 c652cc        	ld	a,21196
4991  0005 6b02          	ld	(OFST-2,sp),a
4993                     ; 1872   tmpccr4l = TIM1->CCR4L;
4995  0007 c652cd        	ld	a,21197
4996  000a 6b01          	ld	(OFST-3,sp),a
4998                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
5000  000c 7b01          	ld	a,(OFST-3,sp)
5001  000e 5f            	clrw	x
5002  000f 97            	ld	xl,a
5003  0010 1f03          	ldw	(OFST-1,sp),x
5005                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
5007  0012 7b02          	ld	a,(OFST-2,sp)
5008  0014 5f            	clrw	x
5009  0015 97            	ld	xl,a
5010  0016 4f            	clr	a
5011  0017 02            	rlwa	x,a
5012  0018 01            	rrwa	x,a
5013  0019 1a04          	or	a,(OFST+0,sp)
5014  001b 01            	rrwa	x,a
5015  001c 1a03          	or	a,(OFST-1,sp)
5016  001e 01            	rrwa	x,a
5017  001f 1f03          	ldw	(OFST-1,sp),x
5019                     ; 1877   return (uint16_t)tmpccr4;
5021  0021 1e03          	ldw	x,(OFST-1,sp)
5024  0023 5b04          	addw	sp,#4
5025  0025 81            	ret
5061                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5061                     ; 1891 {
5062                     .text:	section	.text,new
5063  0000               _TIM1_SetIC1Prescaler:
5065  0000 88            	push	a
5066       00000000      OFST:	set	0
5069                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5071                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5073  0001 c652b9        	ld	a,21177
5074  0004 a4f3          	and	a,#243
5075  0006 1a01          	or	a,(OFST+1,sp)
5076  0008 c752b9        	ld	21177,a
5077                     ; 1897 }
5080  000b 84            	pop	a
5081  000c 81            	ret
5117                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5117                     ; 1910 {
5118                     .text:	section	.text,new
5119  0000               _TIM1_SetIC2Prescaler:
5121  0000 88            	push	a
5122       00000000      OFST:	set	0
5125                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5127                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5129  0001 c652ba        	ld	a,21178
5130  0004 a4f3          	and	a,#243
5131  0006 1a01          	or	a,(OFST+1,sp)
5132  0008 c752ba        	ld	21178,a
5133                     ; 1916 }
5136  000b 84            	pop	a
5137  000c 81            	ret
5173                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5173                     ; 1929 {
5174                     .text:	section	.text,new
5175  0000               _TIM1_SetIC3Prescaler:
5177  0000 88            	push	a
5178       00000000      OFST:	set	0
5181                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5183                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5185  0001 c652bb        	ld	a,21179
5186  0004 a4f3          	and	a,#243
5187  0006 1a01          	or	a,(OFST+1,sp)
5188  0008 c752bb        	ld	21179,a
5189                     ; 1936 }
5192  000b 84            	pop	a
5193  000c 81            	ret
5229                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5229                     ; 1949 {
5230                     .text:	section	.text,new
5231  0000               _TIM1_SetIC4Prescaler:
5233  0000 88            	push	a
5234       00000000      OFST:	set	0
5237                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5239                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5241  0001 c652bc        	ld	a,21180
5242  0004 a4f3          	and	a,#243
5243  0006 1a01          	or	a,(OFST+1,sp)
5244  0008 c752bc        	ld	21180,a
5245                     ; 1956 }
5248  000b 84            	pop	a
5249  000c 81            	ret
5356                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5356                     ; 1992 {
5357                     .text:	section	.text,new
5358  0000               _TIM1_ITConfig:
5360  0000 89            	pushw	x
5361       00000000      OFST:	set	0
5364                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
5366                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
5368                     ; 1997   if (NewState != DISABLE)
5370  0001 9f            	ld	a,xl
5371  0002 4d            	tnz	a
5372  0003 2709          	jreq	L1752
5373                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
5375  0005 9e            	ld	a,xh
5376  0006 ca52b5        	or	a,21173
5377  0009 c752b5        	ld	21173,a
5379  000c 2009          	jra	L3752
5380  000e               L1752:
5381                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5383  000e 7b01          	ld	a,(OFST+1,sp)
5384  0010 43            	cpl	a
5385  0011 c452b5        	and	a,21173
5386  0014 c752b5        	ld	21173,a
5387  0017               L3752:
5388                     ; 2007 }
5391  0017 85            	popw	x
5392  0018 81            	ret
5497                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5497                     ; 2024 {
5498                     .text:	section	.text,new
5499  0000               _TIM1_GenerateEvent:
5503                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5505                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
5507  0000 c752b8        	ld	21176,a
5508                     ; 2030 }
5511  0003 81            	ret
5681                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5681                     ; 2050 {
5682                     .text:	section	.text,new
5683  0000               _TIM1_GetFlagStatus:
5685  0000 89            	pushw	x
5686  0001 89            	pushw	x
5687       00000002      OFST:	set	2
5690                     ; 2051   FlagStatus bitstatus = RESET;
5692                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5696                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5698                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5700  0002 9f            	ld	a,xl
5701  0003 c452b6        	and	a,21174
5702  0006 6b01          	ld	(OFST-1,sp),a
5704                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5706  0008 c652b7        	ld	a,21175
5707  000b 1403          	and	a,(OFST+1,sp)
5708  000d 6b02          	ld	(OFST+0,sp),a
5710                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5712  000f 7b01          	ld	a,(OFST-1,sp)
5713  0011 1a02          	or	a,(OFST+0,sp)
5714  0013 2706          	jreq	L1372
5715                     ; 2062     bitstatus = SET;
5717  0015 a601          	ld	a,#1
5718  0017 6b02          	ld	(OFST+0,sp),a
5721  0019 2002          	jra	L3372
5722  001b               L1372:
5723                     ; 2066     bitstatus = RESET;
5725  001b 0f02          	clr	(OFST+0,sp)
5727  001d               L3372:
5728                     ; 2068   return (FlagStatus)(bitstatus);
5730  001d 7b02          	ld	a,(OFST+0,sp)
5733  001f 5b04          	addw	sp,#4
5734  0021 81            	ret
5769                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5769                     ; 2090 {
5770                     .text:	section	.text,new
5771  0000               _TIM1_ClearFlag:
5773  0000 89            	pushw	x
5774       00000000      OFST:	set	0
5777                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5779                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5781  0001 9f            	ld	a,xl
5782  0002 43            	cpl	a
5783  0003 c752b6        	ld	21174,a
5784                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5786  0006 7b01          	ld	a,(OFST+1,sp)
5787  0008 43            	cpl	a
5788  0009 a41e          	and	a,#30
5789  000b c752b7        	ld	21175,a
5790                     ; 2097 }
5793  000e 85            	popw	x
5794  000f 81            	ret
5854                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5854                     ; 2115 {
5855                     .text:	section	.text,new
5856  0000               _TIM1_GetITStatus:
5858  0000 88            	push	a
5859  0001 89            	pushw	x
5860       00000002      OFST:	set	2
5863                     ; 2116   ITStatus bitstatus = RESET;
5865                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5869                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5871                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5873  0002 c452b6        	and	a,21174
5874  0005 6b01          	ld	(OFST-1,sp),a
5876                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5878  0007 c652b5        	ld	a,21173
5879  000a 1403          	and	a,(OFST+1,sp)
5880  000c 6b02          	ld	(OFST+0,sp),a
5882                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5884  000e 0d01          	tnz	(OFST-1,sp)
5885  0010 270a          	jreq	L1003
5887  0012 0d02          	tnz	(OFST+0,sp)
5888  0014 2706          	jreq	L1003
5889                     ; 2129     bitstatus = SET;
5891  0016 a601          	ld	a,#1
5892  0018 6b02          	ld	(OFST+0,sp),a
5895  001a 2002          	jra	L3003
5896  001c               L1003:
5897                     ; 2133     bitstatus = RESET;
5899  001c 0f02          	clr	(OFST+0,sp)
5901  001e               L3003:
5902                     ; 2135   return (ITStatus)(bitstatus);
5904  001e 7b02          	ld	a,(OFST+0,sp)
5907  0020 5b03          	addw	sp,#3
5908  0022 81            	ret
5944                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
5944                     ; 2153 {
5945                     .text:	section	.text,new
5946  0000               _TIM1_ClearITPendingBit:
5950                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
5952                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
5954  0000 43            	cpl	a
5955  0001 c752b6        	ld	21174,a
5956                     ; 2159 }
5959  0004 81            	ret
6497                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6497                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6497                     ; 2169 {
6498                     .text:	section	.text,new
6499  0000               _TIM1_DMAConfig:
6503                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6505                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6507                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6509  0000 9e            	ld	a,xh
6510  0001 c752d1        	ld	21201,a
6511                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6513  0004 9f            	ld	a,xl
6514  0005 c752d2        	ld	21202,a
6515                     ; 2177 }
6518  0008 81            	ret
6612                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6612                     ; 2190 {
6613                     .text:	section	.text,new
6614  0000               _TIM1_DMACmd:
6616  0000 89            	pushw	x
6617       00000000      OFST:	set	0
6620                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
6622                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6624                     ; 2195   if (NewState != DISABLE)
6626  0001 9f            	ld	a,xl
6627  0002 4d            	tnz	a
6628  0003 2709          	jreq	L7133
6629                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
6631  0005 9e            	ld	a,xh
6632  0006 ca52b4        	or	a,21172
6633  0009 c752b4        	ld	21172,a
6635  000c 2009          	jra	L1233
6636  000e               L7133:
6637                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6639  000e 7b01          	ld	a,(OFST+1,sp)
6640  0010 43            	cpl	a
6641  0011 c452b4        	and	a,21172
6642  0014 c752b4        	ld	21172,a
6643  0017               L1233:
6644                     ; 2205 }
6647  0017 85            	popw	x
6648  0018 81            	ret
6683                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
6683                     ; 2214 {
6684                     .text:	section	.text,new
6685  0000               _TIM1_SelectCCDMA:
6689                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
6691                     ; 2218   if (NewState != DISABLE)
6693  0000 4d            	tnz	a
6694  0001 2706          	jreq	L1433
6695                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
6697  0003 721652b1      	bset	21169,#3
6699  0007 2004          	jra	L3433
6700  0009               L1433:
6701                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6703  0009 721752b1      	bres	21169,#3
6704  000d               L3433:
6705                     ; 2228 }
6708  000d 81            	ret
6732                     ; 2251 void TIM1_InternalClockConfig(void)
6732                     ; 2252 {
6733                     .text:	section	.text,new
6734  0000               _TIM1_InternalClockConfig:
6738                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6740  0000 c652b2        	ld	a,21170
6741  0003 a4f8          	and	a,#248
6742  0005 c752b2        	ld	21170,a
6743                     ; 2255 }
6746  0008 81            	ret
6833                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6833                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6833                     ; 2274                                  uint8_t ICFilter)
6833                     ; 2275 {
6834                     .text:	section	.text,new
6835  0000               _TIM1_TIxExternalClockConfig:
6837  0000 89            	pushw	x
6838       00000000      OFST:	set	0
6841                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6843                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6845                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6847                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6849  0001 9e            	ld	a,xh
6850  0002 a160          	cp	a,#96
6851  0004 260e          	jrne	L3143
6852                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6854  0006 7b05          	ld	a,(OFST+5,sp)
6855  0008 88            	push	a
6856  0009 9f            	ld	a,xl
6857  000a ae0001        	ldw	x,#1
6858  000d 95            	ld	xh,a
6859  000e cd0000        	call	L5_TI2_Config
6861  0011 84            	pop	a
6863  0012 200d          	jra	L5143
6864  0014               L3143:
6865                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6867  0014 7b05          	ld	a,(OFST+5,sp)
6868  0016 88            	push	a
6869  0017 7b03          	ld	a,(OFST+3,sp)
6870  0019 ae0001        	ldw	x,#1
6871  001c 95            	ld	xh,a
6872  001d cd0000        	call	L3_TI1_Config
6874  0020 84            	pop	a
6875  0021               L5143:
6876                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6878  0021 7b01          	ld	a,(OFST+1,sp)
6879  0023 cd0000        	call	_TIM1_SelectInputTrigger
6881                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6883  0026 c652b2        	ld	a,21170
6884  0029 aa07          	or	a,#7
6885  002b c752b2        	ld	21170,a
6886                     ; 2296 }
6889  002e 85            	popw	x
6890  002f 81            	ret
7005                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7005                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7005                     ; 2316                               uint8_t ExtTRGFilter)
7005                     ; 2317 {
7006                     .text:	section	.text,new
7007  0000               _TIM1_ETRClockMode1Config:
7009  0000 89            	pushw	x
7010       00000000      OFST:	set	0
7013                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7015                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7017                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7019                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7021  0001 7b05          	ld	a,(OFST+5,sp)
7022  0003 88            	push	a
7023  0004 9f            	ld	a,xl
7024  0005 97            	ld	xl,a
7025  0006 7b02          	ld	a,(OFST+2,sp)
7026  0008 95            	ld	xh,a
7027  0009 cd0000        	call	_TIM1_ETRConfig
7029  000c 84            	pop	a
7030                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
7030                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
7032  000d c652b2        	ld	a,21170
7033  0010 a488          	and	a,#136
7034  0012 aa77          	or	a,#119
7035  0014 c752b2        	ld	21170,a
7036                     ; 2329 }
7039  0017 85            	popw	x
7040  0018 81            	ret
7096                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7096                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7096                     ; 2349                               uint8_t ExtTRGFilter)
7096                     ; 2350 {
7097                     .text:	section	.text,new
7098  0000               _TIM1_ETRClockMode2Config:
7100  0000 89            	pushw	x
7101       00000000      OFST:	set	0
7104                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7106                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7108                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7110  0001 7b05          	ld	a,(OFST+5,sp)
7111  0003 88            	push	a
7112  0004 9f            	ld	a,xl
7113  0005 97            	ld	xl,a
7114  0006 7b02          	ld	a,(OFST+2,sp)
7115  0008 95            	ld	xh,a
7116  0009 cd0000        	call	_TIM1_ETRConfig
7118  000c 84            	pop	a
7119                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
7121  000d 721c52b3      	bset	21171,#6
7122                     ; 2360 }
7125  0011 85            	popw	x
7126  0012 81            	ret
7233                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7233                     ; 2411 {
7234                     .text:	section	.text,new
7235  0000               _TIM1_SelectInputTrigger:
7237  0000 88            	push	a
7238       00000000      OFST:	set	0
7241                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7243                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7245  0001 c652b2        	ld	a,21170
7246  0004 a48f          	and	a,#143
7247  0006 1a01          	or	a,(OFST+1,sp)
7248  0008 c752b2        	ld	21170,a
7249                     ; 2417 }
7252  000b 84            	pop	a
7253  000c 81            	ret
7359                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7359                     ; 2434 {
7360                     .text:	section	.text,new
7361  0000               _TIM1_SelectOutputTrigger:
7363  0000 88            	push	a
7364       00000000      OFST:	set	0
7367                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7369                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7371  0001 c652b1        	ld	a,21169
7372  0004 a48f          	and	a,#143
7373  0006 1a01          	or	a,(OFST+1,sp)
7374  0008 c752b1        	ld	21169,a
7375                     ; 2439 }
7378  000b 84            	pop	a
7379  000c 81            	ret
7453                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7453                     ; 2452 {
7454                     .text:	section	.text,new
7455  0000               _TIM1_SelectSlaveMode:
7457  0000 88            	push	a
7458       00000000      OFST:	set	0
7461                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7463                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7465  0001 c652b2        	ld	a,21170
7466  0004 a4f8          	and	a,#248
7467  0006 1a01          	or	a,(OFST+1,sp)
7468  0008 c752b2        	ld	21170,a
7469                     ; 2459 }
7472  000b 84            	pop	a
7473  000c 81            	ret
7509                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7509                     ; 2468 {
7510                     .text:	section	.text,new
7511  0000               _TIM1_SelectMasterSlaveMode:
7515                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
7517                     ; 2473   if (NewState != DISABLE)
7519  0000 4d            	tnz	a
7520  0001 2706          	jreq	L7663
7521                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
7523  0003 721e52b2      	bset	21170,#7
7525  0007 2004          	jra	L1763
7526  0009               L7663:
7527                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7529  0009 721f52b2      	bres	21170,#7
7530  000d               L1763:
7531                     ; 2481 }
7534  000d 81            	ret
7588                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7588                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7588                     ; 2501                     uint8_t ExtTRGFilter)
7588                     ; 2502 {
7589                     .text:	section	.text,new
7590  0000               _TIM1_ETRConfig:
7592  0000 89            	pushw	x
7593       00000000      OFST:	set	0
7596                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7598                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7598                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
7598                     ; 2508                          | (uint8_t) ExtTRGFilter);
7600  0001 9f            	ld	a,xl
7601  0002 1a01          	or	a,(OFST+1,sp)
7602  0004 1a05          	or	a,(OFST+5,sp)
7603  0006 ca52b3        	or	a,21171
7604  0009 c752b3        	ld	21171,a
7605                     ; 2509 }
7608  000c 85            	popw	x
7609  000d 81            	ret
7695                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7695                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7695                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7695                     ; 2550 {
7696                     .text:	section	.text,new
7697  0000               _TIM1_EncoderInterfaceConfig:
7699  0000 89            	pushw	x
7700       00000000      OFST:	set	0
7703                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7705                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7707                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7709                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7711  0001 9f            	ld	a,xl
7712  0002 4d            	tnz	a
7713  0003 2706          	jreq	L7573
7714                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7716  0005 721252bd      	bset	21181,#1
7718  0009 2004          	jra	L1673
7719  000b               L7573:
7720                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7722  000b 721352bd      	bres	21181,#1
7723  000f               L1673:
7724                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7726  000f 0d05          	tnz	(OFST+5,sp)
7727  0011 2706          	jreq	L3673
7728                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7730  0013 721a52bd      	bset	21181,#5
7732  0017 2004          	jra	L5673
7733  0019               L3673:
7734                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7736  0019 721b52bd      	bres	21181,#5
7737  001d               L5673:
7738                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7740  001d c652b2        	ld	a,21170
7741  0020 a4f0          	and	a,#240
7742  0022 1a01          	or	a,(OFST+1,sp)
7743  0024 c752b2        	ld	21170,a
7744                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7746  0027 c652b9        	ld	a,21177
7747  002a a4fc          	and	a,#252
7748  002c aa01          	or	a,#1
7749  002e c752b9        	ld	21177,a
7750                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7752  0031 c652ba        	ld	a,21178
7753  0034 a4fc          	and	a,#252
7754  0036 aa01          	or	a,#1
7755  0038 c752ba        	ld	21178,a
7756                     ; 2581 }
7759  003b 85            	popw	x
7760  003c 81            	ret
7796                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
7796                     ; 2590 {
7797                     .text:	section	.text,new
7798  0000               _TIM1_SelectHallSensor:
7802                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
7804                     ; 2595   if (NewState != DISABLE)
7806  0000 4d            	tnz	a
7807  0001 2706          	jreq	L5004
7808                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
7810  0003 721e52b1      	bset	21169,#7
7812  0007 2004          	jra	L7004
7813  0009               L5004:
7814                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7816  0009 721f52b1      	bres	21169,#7
7817  000d               L7004:
7818                     ; 2603 }
7821  000d 81            	ret
7867                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7867                     ; 2624 {
7868                     .text:	section	.text,new
7869  0000               L3_TI1_Config:
7871  0000 89            	pushw	x
7872  0001 88            	push	a
7873       00000001      OFST:	set	1
7876                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7878  0002 721152bd      	bres	21181,#0
7879                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7879                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7881  0006 7b06          	ld	a,(OFST+5,sp)
7882  0008 97            	ld	xl,a
7883  0009 a610          	ld	a,#16
7884  000b 42            	mul	x,a
7885  000c 9f            	ld	a,xl
7886  000d 1a03          	or	a,(OFST+2,sp)
7887  000f 6b01          	ld	(OFST+0,sp),a
7889  0011 c652b9        	ld	a,21177
7890  0014 a40c          	and	a,#12
7891  0016 1a01          	or	a,(OFST+0,sp)
7892  0018 c752b9        	ld	21177,a
7893                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7895  001b 0d02          	tnz	(OFST+1,sp)
7896  001d 2706          	jreq	L1304
7897                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7899  001f 721252bd      	bset	21181,#1
7901  0023 2004          	jra	L3304
7902  0025               L1304:
7903                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7905  0025 721352bd      	bres	21181,#1
7906  0029               L3304:
7907                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7909  0029 721052bd      	bset	21181,#0
7910                     ; 2647 }
7913  002d 5b03          	addw	sp,#3
7914  002f 81            	ret
7960                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7960                     ; 2664 {
7961                     .text:	section	.text,new
7962  0000               L5_TI2_Config:
7964  0000 89            	pushw	x
7965  0001 88            	push	a
7966       00000001      OFST:	set	1
7969                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7971  0002 721952bd      	bres	21181,#4
7972                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7972                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7974  0006 7b06          	ld	a,(OFST+5,sp)
7975  0008 97            	ld	xl,a
7976  0009 a610          	ld	a,#16
7977  000b 42            	mul	x,a
7978  000c 9f            	ld	a,xl
7979  000d 1a03          	or	a,(OFST+2,sp)
7980  000f 6b01          	ld	(OFST+0,sp),a
7982  0011 c652ba        	ld	a,21178
7983  0014 a40c          	and	a,#12
7984  0016 1a01          	or	a,(OFST+0,sp)
7985  0018 c752ba        	ld	21178,a
7986                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7988  001b 0d02          	tnz	(OFST+1,sp)
7989  001d 2706          	jreq	L5504
7990                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7992  001f 721a52bd      	bset	21181,#5
7994  0023 2004          	jra	L7504
7995  0025               L5504:
7996                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7998  0025 721b52bd      	bres	21181,#5
7999  0029               L7504:
8000                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
8002  0029 721852bd      	bset	21181,#4
8003                     ; 2682 }
8006  002d 5b03          	addw	sp,#3
8007  002f 81            	ret
8053                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8053                     ; 2699 {
8054                     .text:	section	.text,new
8055  0000               L7_TI3_Config:
8057  0000 89            	pushw	x
8058  0001 88            	push	a
8059       00000001      OFST:	set	1
8062                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8064  0002 721152be      	bres	21182,#0
8065                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8065                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8067  0006 7b06          	ld	a,(OFST+5,sp)
8068  0008 97            	ld	xl,a
8069  0009 a610          	ld	a,#16
8070  000b 42            	mul	x,a
8071  000c 9f            	ld	a,xl
8072  000d 1a03          	or	a,(OFST+2,sp)
8073  000f 6b01          	ld	(OFST+0,sp),a
8075  0011 c652bb        	ld	a,21179
8076  0014 a40c          	and	a,#12
8077  0016 1a01          	or	a,(OFST+0,sp)
8078  0018 c752bb        	ld	21179,a
8079                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8081  001b 0d02          	tnz	(OFST+1,sp)
8082  001d 2706          	jreq	L1014
8083                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8085  001f 721252be      	bset	21182,#1
8087  0023 2004          	jra	L3014
8088  0025               L1014:
8089                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8091  0025 721352be      	bres	21182,#1
8092  0029               L3014:
8093                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8095  0029 721052be      	bset	21182,#0
8096                     ; 2718 }
8099  002d 5b03          	addw	sp,#3
8100  002f 81            	ret
8146                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8146                     ; 2734 {
8147                     .text:	section	.text,new
8148  0000               L11_TI4_Config:
8150  0000 89            	pushw	x
8151  0001 88            	push	a
8152       00000001      OFST:	set	1
8155                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8157  0002 721952be      	bres	21182,#4
8158                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8158                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8160  0006 7b06          	ld	a,(OFST+5,sp)
8161  0008 97            	ld	xl,a
8162  0009 a610          	ld	a,#16
8163  000b 42            	mul	x,a
8164  000c 9f            	ld	a,xl
8165  000d 1a03          	or	a,(OFST+2,sp)
8166  000f 6b01          	ld	(OFST+0,sp),a
8168  0011 c652bc        	ld	a,21180
8169  0014 a40c          	and	a,#12
8170  0016 1a01          	or	a,(OFST+0,sp)
8171  0018 c752bc        	ld	21180,a
8172                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8174  001b 0d02          	tnz	(OFST+1,sp)
8175  001d 2706          	jreq	L5214
8176                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8178  001f 721a52be      	bset	21182,#5
8180  0023 2004          	jra	L7214
8181  0025               L5214:
8182                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8184  0025 721b52be      	bres	21182,#5
8185  0029               L7214:
8186                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8188  0029 721852be      	bset	21182,#4
8189                     ; 2755 }
8192  002d 5b03          	addw	sp,#3
8193  002f 81            	ret
8206                     	xdef	_TIM1_SelectHallSensor
8207                     	xdef	_TIM1_EncoderInterfaceConfig
8208                     	xdef	_TIM1_ETRConfig
8209                     	xdef	_TIM1_SelectMasterSlaveMode
8210                     	xdef	_TIM1_SelectSlaveMode
8211                     	xdef	_TIM1_SelectOutputTrigger
8212                     	xdef	_TIM1_SelectInputTrigger
8213                     	xdef	_TIM1_ETRClockMode2Config
8214                     	xdef	_TIM1_ETRClockMode1Config
8215                     	xdef	_TIM1_TIxExternalClockConfig
8216                     	xdef	_TIM1_InternalClockConfig
8217                     	xdef	_TIM1_SelectCCDMA
8218                     	xdef	_TIM1_DMACmd
8219                     	xdef	_TIM1_DMAConfig
8220                     	xdef	_TIM1_ClearITPendingBit
8221                     	xdef	_TIM1_GetITStatus
8222                     	xdef	_TIM1_ClearFlag
8223                     	xdef	_TIM1_GetFlagStatus
8224                     	xdef	_TIM1_GenerateEvent
8225                     	xdef	_TIM1_ITConfig
8226                     	xdef	_TIM1_SetIC4Prescaler
8227                     	xdef	_TIM1_SetIC3Prescaler
8228                     	xdef	_TIM1_SetIC2Prescaler
8229                     	xdef	_TIM1_SetIC1Prescaler
8230                     	xdef	_TIM1_GetCapture4
8231                     	xdef	_TIM1_GetCapture3
8232                     	xdef	_TIM1_GetCapture2
8233                     	xdef	_TIM1_GetCapture1
8234                     	xdef	_TIM1_PWMIConfig
8235                     	xdef	_TIM1_ICInit
8236                     	xdef	_TIM1_CCxNCmd
8237                     	xdef	_TIM1_CCxCmd
8238                     	xdef	_TIM1_SelectCOM
8239                     	xdef	_TIM1_SelectOCREFClear
8240                     	xdef	_TIM1_OC3NPolarityConfig
8241                     	xdef	_TIM1_OC3PolarityConfig
8242                     	xdef	_TIM1_OC2NPolarityConfig
8243                     	xdef	_TIM1_OC2PolarityConfig
8244                     	xdef	_TIM1_OC1NPolarityConfig
8245                     	xdef	_TIM1_OC1PolarityConfig
8246                     	xdef	_TIM1_ClearOC4Ref
8247                     	xdef	_TIM1_ClearOC3Ref
8248                     	xdef	_TIM1_ClearOC2Ref
8249                     	xdef	_TIM1_ClearOC1Ref
8250                     	xdef	_TIM1_OC3FastConfig
8251                     	xdef	_TIM1_OC2FastConfig
8252                     	xdef	_TIM1_OC1FastConfig
8253                     	xdef	_TIM1_OC4PreloadConfig
8254                     	xdef	_TIM1_OC3PreloadConfig
8255                     	xdef	_TIM1_OC2PreloadConfig
8256                     	xdef	_TIM1_OC1PreloadConfig
8257                     	xdef	_TIM1_ForcedOC3Config
8258                     	xdef	_TIM1_ForcedOC2Config
8259                     	xdef	_TIM1_ForcedOC1Config
8260                     	xdef	_TIM1_CCPreloadControl
8261                     	xdef	_TIM1_SetCompare4
8262                     	xdef	_TIM1_SetCompare3
8263                     	xdef	_TIM1_SetCompare2
8264                     	xdef	_TIM1_SetCompare1
8265                     	xdef	_TIM1_SelectOCxM
8266                     	xdef	_TIM1_CtrlPWMOutputs
8267                     	xdef	_TIM1_BDTRConfig
8268                     	xdef	_TIM1_OC3Init
8269                     	xdef	_TIM1_OC2Init
8270                     	xdef	_TIM1_OC1Init
8271                     	xdef	_TIM1_Cmd
8272                     	xdef	_TIM1_SelectOnePulseMode
8273                     	xdef	_TIM1_ARRPreloadConfig
8274                     	xdef	_TIM1_UpdateRequestConfig
8275                     	xdef	_TIM1_UpdateDisableConfig
8276                     	xdef	_TIM1_GetPrescaler
8277                     	xdef	_TIM1_GetCounter
8278                     	xdef	_TIM1_SetAutoreload
8279                     	xdef	_TIM1_SetCounter
8280                     	xdef	_TIM1_CounterModeConfig
8281                     	xdef	_TIM1_PrescalerConfig
8282                     	xdef	_TIM1_TimeBaseInit
8283                     	xdef	_TIM1_DeInit
8302                     	end
