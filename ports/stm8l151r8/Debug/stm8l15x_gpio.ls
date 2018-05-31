   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
 111                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 111                     ; 97 {
 113                     .text:	section	.text,new
 114  0000               _GPIO_DeInit:
 118                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 120  0000 6f04          	clr	(4,x)
 121                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 123  0002 7f            	clr	(x)
 124                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 126  0003 6f02          	clr	(2,x)
 127                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 129  0005 6f03          	clr	(3,x)
 130                     ; 102 }
 133  0007 81            	ret
 287                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 287                     ; 134 {
 288                     .text:	section	.text,new
 289  0000               _GPIO_Init:
 291  0000 89            	pushw	x
 292       00000000      OFST:	set	0
 295                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
 297                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
 299                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 301  0001 7b05          	ld	a,(OFST+5,sp)
 302  0003 43            	cpl	a
 303  0004 e404          	and	a,(4,x)
 304  0006 e704          	ld	(4,x),a
 305                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 307  0008 7b06          	ld	a,(OFST+6,sp)
 308  000a a580          	bcp	a,#128
 309  000c 271d          	jreq	L341
 310                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 312  000e 7b06          	ld	a,(OFST+6,sp)
 313  0010 a510          	bcp	a,#16
 314  0012 2706          	jreq	L541
 315                     ; 153       GPIOx->ODR |= GPIO_Pin;
 317  0014 f6            	ld	a,(x)
 318  0015 1a05          	or	a,(OFST+5,sp)
 319  0017 f7            	ld	(x),a
 321  0018 2007          	jra	L741
 322  001a               L541:
 323                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 325  001a 1e01          	ldw	x,(OFST+1,sp)
 326  001c 7b05          	ld	a,(OFST+5,sp)
 327  001e 43            	cpl	a
 328  001f f4            	and	a,(x)
 329  0020 f7            	ld	(x),a
 330  0021               L741:
 331                     ; 159     GPIOx->DDR |= GPIO_Pin;
 333  0021 1e01          	ldw	x,(OFST+1,sp)
 334  0023 e602          	ld	a,(2,x)
 335  0025 1a05          	or	a,(OFST+5,sp)
 336  0027 e702          	ld	(2,x),a
 338  0029 2009          	jra	L151
 339  002b               L341:
 340                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 342  002b 1e01          	ldw	x,(OFST+1,sp)
 343  002d 7b05          	ld	a,(OFST+5,sp)
 344  002f 43            	cpl	a
 345  0030 e402          	and	a,(2,x)
 346  0032 e702          	ld	(2,x),a
 347  0034               L151:
 348                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 350  0034 7b06          	ld	a,(OFST+6,sp)
 351  0036 a540          	bcp	a,#64
 352  0038 270a          	jreq	L351
 353                     ; 172     GPIOx->CR1 |= GPIO_Pin;
 355  003a 1e01          	ldw	x,(OFST+1,sp)
 356  003c e603          	ld	a,(3,x)
 357  003e 1a05          	or	a,(OFST+5,sp)
 358  0040 e703          	ld	(3,x),a
 360  0042 2009          	jra	L551
 361  0044               L351:
 362                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 364  0044 1e01          	ldw	x,(OFST+1,sp)
 365  0046 7b05          	ld	a,(OFST+5,sp)
 366  0048 43            	cpl	a
 367  0049 e403          	and	a,(3,x)
 368  004b e703          	ld	(3,x),a
 369  004d               L551:
 370                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 372  004d 7b06          	ld	a,(OFST+6,sp)
 373  004f a520          	bcp	a,#32
 374  0051 270a          	jreq	L751
 375                     ; 184     GPIOx->CR2 |= GPIO_Pin;
 377  0053 1e01          	ldw	x,(OFST+1,sp)
 378  0055 e604          	ld	a,(4,x)
 379  0057 1a05          	or	a,(OFST+5,sp)
 380  0059 e704          	ld	(4,x),a
 382  005b 2009          	jra	L161
 383  005d               L751:
 384                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 386  005d 1e01          	ldw	x,(OFST+1,sp)
 387  005f 7b05          	ld	a,(OFST+5,sp)
 388  0061 43            	cpl	a
 389  0062 e404          	and	a,(4,x)
 390  0064 e704          	ld	(4,x),a
 391  0066               L161:
 392                     ; 190 }
 395  0066 85            	popw	x
 396  0067 81            	ret
 471                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 471                     ; 210 {
 472                     .text:	section	.text,new
 473  0000               _GPIO_ExternalPullUpConfig:
 475  0000 89            	pushw	x
 476       00000000      OFST:	set	0
 479                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 481                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 483                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 485  0001 0d06          	tnz	(OFST+6,sp)
 486  0003 2708          	jreq	L122
 487                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 489  0005 e603          	ld	a,(3,x)
 490  0007 1a05          	or	a,(OFST+5,sp)
 491  0009 e703          	ld	(3,x),a
 493  000b 2009          	jra	L322
 494  000d               L122:
 495                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 497  000d 1e01          	ldw	x,(OFST+1,sp)
 498  000f 7b05          	ld	a,(OFST+5,sp)
 499  0011 43            	cpl	a
 500  0012 e403          	and	a,(3,x)
 501  0014 e703          	ld	(3,x),a
 502  0016               L322:
 503                     ; 222 }
 506  0016 85            	popw	x
 507  0017 81            	ret
 551                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 551                     ; 249 {
 552                     .text:	section	.text,new
 553  0000               _GPIO_Write:
 555  0000 89            	pushw	x
 556       00000000      OFST:	set	0
 559                     ; 250   GPIOx->ODR = GPIO_PortVal;
 561  0001 7b05          	ld	a,(OFST+5,sp)
 562  0003 1e01          	ldw	x,(OFST+1,sp)
 563  0005 f7            	ld	(x),a
 564                     ; 251 }
 567  0006 85            	popw	x
 568  0007 81            	ret
 728                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 728                     ; 271 {
 729                     .text:	section	.text,new
 730  0000               _GPIO_WriteBit:
 732  0000 89            	pushw	x
 733       00000000      OFST:	set	0
 736                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 738                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 740                     ; 276   if (GPIO_BitVal != RESET)
 742  0001 0d06          	tnz	(OFST+6,sp)
 743  0003 2706          	jreq	L143
 744                     ; 278     GPIOx->ODR |= GPIO_Pin;
 746  0005 f6            	ld	a,(x)
 747  0006 1a05          	or	a,(OFST+5,sp)
 748  0008 f7            	ld	(x),a
 750  0009 2007          	jra	L343
 751  000b               L143:
 752                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 754  000b 1e01          	ldw	x,(OFST+1,sp)
 755  000d 7b05          	ld	a,(OFST+5,sp)
 756  000f 43            	cpl	a
 757  0010 f4            	and	a,(x)
 758  0011 f7            	ld	(x),a
 759  0012               L343:
 760                     ; 285 }
 763  0012 85            	popw	x
 764  0013 81            	ret
 808                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 808                     ; 304 {
 809                     .text:	section	.text,new
 810  0000               _GPIO_SetBits:
 812  0000 89            	pushw	x
 813       00000000      OFST:	set	0
 816                     ; 305   GPIOx->ODR |= GPIO_Pin;
 818  0001 f6            	ld	a,(x)
 819  0002 1a05          	or	a,(OFST+5,sp)
 820  0004 f7            	ld	(x),a
 821                     ; 306 }
 824  0005 85            	popw	x
 825  0006 81            	ret
 869                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 869                     ; 325 {
 870                     .text:	section	.text,new
 871  0000               _GPIO_ResetBits:
 873  0000 89            	pushw	x
 874       00000000      OFST:	set	0
 877                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 879  0001 7b05          	ld	a,(OFST+5,sp)
 880  0003 43            	cpl	a
 881  0004 f4            	and	a,(x)
 882  0005 f7            	ld	(x),a
 883                     ; 327 }
 886  0006 85            	popw	x
 887  0007 81            	ret
 931                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 931                     ; 337 {
 932                     .text:	section	.text,new
 933  0000               _GPIO_ToggleBits:
 935  0000 89            	pushw	x
 936       00000000      OFST:	set	0
 939                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 941  0001 f6            	ld	a,(x)
 942  0002 1805          	xor	a,	(OFST+5,sp)
 943  0004 f7            	ld	(x),a
 944                     ; 339 }
 947  0005 85            	popw	x
 948  0006 81            	ret
 985                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 985                     ; 348 {
 986                     .text:	section	.text,new
 987  0000               _GPIO_ReadInputData:
 991                     ; 349   return ((uint8_t)GPIOx->IDR);
 993  0000 e601          	ld	a,(1,x)
 996  0002 81            	ret
1034                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1034                     ; 359 {
1035                     .text:	section	.text,new
1036  0000               _GPIO_ReadOutputData:
1040                     ; 360   return ((uint8_t)GPIOx->ODR);
1042  0000 f6            	ld	a,(x)
1045  0001 81            	ret
1094                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1094                     ; 379 {
1095                     .text:	section	.text,new
1096  0000               _GPIO_ReadInputDataBit:
1098  0000 89            	pushw	x
1099       00000000      OFST:	set	0
1102                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1104  0001 e601          	ld	a,(1,x)
1105  0003 1405          	and	a,(OFST+5,sp)
1108  0005 85            	popw	x
1109  0006 81            	ret
1158                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1158                     ; 390 {
1159                     .text:	section	.text,new
1160  0000               _GPIO_ReadOutputDataBit:
1162  0000 89            	pushw	x
1163       00000000      OFST:	set	0
1166                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1168  0001 f6            	ld	a,(x)
1169  0002 1405          	and	a,(OFST+5,sp)
1172  0004 85            	popw	x
1173  0005 81            	ret
1186                     	xdef	_GPIO_ReadOutputDataBit
1187                     	xdef	_GPIO_ReadInputDataBit
1188                     	xdef	_GPIO_ReadOutputData
1189                     	xdef	_GPIO_ReadInputData
1190                     	xdef	_GPIO_ToggleBits
1191                     	xdef	_GPIO_ResetBits
1192                     	xdef	_GPIO_SetBits
1193                     	xdef	_GPIO_WriteBit
1194                     	xdef	_GPIO_Write
1195                     	xdef	_GPIO_ExternalPullUpConfig
1196                     	xdef	_GPIO_Init
1197                     	xdef	_GPIO_DeInit
1216                     	end
