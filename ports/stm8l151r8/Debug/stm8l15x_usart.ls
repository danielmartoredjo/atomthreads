   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
 165                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
 165                     ; 149 {
 167                     .text:	section	.text,new
 168  0000               _USART_DeInit:
 172                     ; 153   (void) USARTx->SR;
 174  0000 f6            	ld	a,(x)
 175                     ; 154   (void) USARTx->DR;
 177  0001 e601          	ld	a,(1,x)
 178                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 180  0003 6f03          	clr	(3,x)
 181                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 183  0005 6f02          	clr	(2,x)
 184                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 186  0007 6f04          	clr	(4,x)
 187                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 189  0009 6f05          	clr	(5,x)
 190                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 192  000b 6f06          	clr	(6,x)
 193                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 195  000d 6f07          	clr	(7,x)
 196                     ; 163 }
 199  000f 81            	ret
 387                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 387                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 387                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 387                     ; 195 {
 388                     .text:	section	.text,new
 389  0000               _USART_Init:
 391  0000 89            	pushw	x
 392  0001 5204          	subw	sp,#4
 393       00000004      OFST:	set	4
 396                     ; 196   uint32_t BaudRate_Mantissa = 0;
 398                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
 400                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 402                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
 404                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
 406                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
 408                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 410  0003 e604          	ld	a,(4,x)
 411  0005 a4e9          	and	a,#233
 412  0007 e704          	ld	(4,x),a
 413                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 415  0009 7b0d          	ld	a,(OFST+9,sp)
 416  000b 1a0f          	or	a,(OFST+11,sp)
 417  000d ea04          	or	a,(4,x)
 418  000f e704          	ld	(4,x),a
 419                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 421  0011 e606          	ld	a,(6,x)
 422  0013 a4cf          	and	a,#207
 423  0015 e706          	ld	(6,x),a
 424                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
 426  0017 e606          	ld	a,(6,x)
 427  0019 1a0e          	or	a,(OFST+10,sp)
 428  001b e706          	ld	(6,x),a
 429                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 431  001d 6f02          	clr	(2,x)
 432                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 434  001f e603          	ld	a,(3,x)
 435  0021 a40f          	and	a,#15
 436  0023 e703          	ld	(3,x),a
 437                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 439  0025 e603          	ld	a,(3,x)
 440  0027 a4f0          	and	a,#240
 441  0029 e703          	ld	(3,x),a
 442                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 444  002b cd0000        	call	_CLK_GetClockFreq
 446  002e 96            	ldw	x,sp
 447  002f 1c0009        	addw	x,#OFST+5
 448  0032 cd0000        	call	c_ludv
 450  0035 96            	ldw	x,sp
 451  0036 1c0001        	addw	x,#OFST-3
 452  0039 cd0000        	call	c_rtol
 455                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 457  003c 7b03          	ld	a,(OFST-1,sp)
 458  003e a4f0          	and	a,#240
 459  0040 1e05          	ldw	x,(OFST+1,sp)
 460  0042 e703          	ld	(3,x),a
 461                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 463  0044 1e05          	ldw	x,(OFST+1,sp)
 464  0046 7b04          	ld	a,(OFST+0,sp)
 465  0048 a40f          	and	a,#15
 466  004a ea03          	or	a,(3,x)
 467  004c e703          	ld	(3,x),a
 468                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 470  004e 96            	ldw	x,sp
 471  004f 1c0001        	addw	x,#OFST-3
 472  0052 cd0000        	call	c_ltor
 474  0055 a604          	ld	a,#4
 475  0057 cd0000        	call	c_lursh
 477  005a b603          	ld	a,c_lreg+3
 478  005c 1e05          	ldw	x,(OFST+1,sp)
 479  005e e702          	ld	(2,x),a
 480                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 482  0060 1e05          	ldw	x,(OFST+1,sp)
 483  0062 e605          	ld	a,(5,x)
 484  0064 a4f3          	and	a,#243
 485  0066 e705          	ld	(5,x),a
 486                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 488  0068 1e05          	ldw	x,(OFST+1,sp)
 489  006a e605          	ld	a,(5,x)
 490  006c 1a10          	or	a,(OFST+12,sp)
 491  006e e705          	ld	(5,x),a
 492                     ; 239 }
 495  0070 5b06          	addw	sp,#6
 496  0072 81            	ret
 656                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 656                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 656                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 656                     ; 267 {
 657                     .text:	section	.text,new
 658  0000               _USART_ClockInit:
 660  0000 89            	pushw	x
 661       00000000      OFST:	set	0
 664                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 666                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 668                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 670                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 672                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 674  0001 e606          	ld	a,(6,x)
 675  0003 a4f8          	and	a,#248
 676  0005 e706          	ld	(6,x),a
 677                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 679  0007 7b06          	ld	a,(OFST+6,sp)
 680  0009 1a07          	or	a,(OFST+7,sp)
 681  000b 1a08          	or	a,(OFST+8,sp)
 682  000d ea06          	or	a,(6,x)
 683  000f e706          	ld	(6,x),a
 684                     ; 279   if (USART_Clock != USART_Clock_Disable)
 686  0011 0d05          	tnz	(OFST+5,sp)
 687  0013 2708          	jreq	L123
 688                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 690  0015 e606          	ld	a,(6,x)
 691  0017 aa08          	or	a,#8
 692  0019 e706          	ld	(6,x),a
 694  001b 2008          	jra	L323
 695  001d               L123:
 696                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 698  001d 1e01          	ldw	x,(OFST+1,sp)
 699  001f e606          	ld	a,(6,x)
 700  0021 a4f7          	and	a,#247
 701  0023 e706          	ld	(6,x),a
 702  0025               L323:
 703                     ; 287 }
 706  0025 85            	popw	x
 707  0026 81            	ret
 774                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 774                     ; 297 {
 775                     .text:	section	.text,new
 776  0000               _USART_Cmd:
 778  0000 89            	pushw	x
 779       00000000      OFST:	set	0
 782                     ; 298   if (NewState != DISABLE)
 784  0001 0d05          	tnz	(OFST+5,sp)
 785  0003 2708          	jreq	L163
 786                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 788  0005 e604          	ld	a,(4,x)
 789  0007 a4df          	and	a,#223
 790  0009 e704          	ld	(4,x),a
 792  000b 2008          	jra	L363
 793  000d               L163:
 794                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 796  000d 1e01          	ldw	x,(OFST+1,sp)
 797  000f e604          	ld	a,(4,x)
 798  0011 aa20          	or	a,#32
 799  0013 e704          	ld	(4,x),a
 800  0015               L363:
 801                     ; 306 }
 804  0015 85            	popw	x
 805  0016 81            	ret
 849                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 849                     ; 330 {
 850                     .text:	section	.text,new
 851  0000               _USART_SetPrescaler:
 853  0000 89            	pushw	x
 854       00000000      OFST:	set	0
 857                     ; 332   USARTx->PSCR = USART_Prescaler;
 859  0001 7b05          	ld	a,(OFST+5,sp)
 860  0003 1e01          	ldw	x,(OFST+1,sp)
 861  0005 e70a          	ld	(10,x),a
 862                     ; 333 }
 865  0007 85            	popw	x
 866  0008 81            	ret
 903                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 903                     ; 341 {
 904                     .text:	section	.text,new
 905  0000               _USART_SendBreak:
 909                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 911  0000 e605          	ld	a,(5,x)
 912  0002 aa01          	or	a,#1
 913  0004 e705          	ld	(5,x),a
 914                     ; 343 }
 917  0006 81            	ret
 954                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 954                     ; 383 {
 955                     .text:	section	.text,new
 956  0000               _USART_ReceiveData8:
 960                     ; 384   return USARTx->DR;
 962  0000 e601          	ld	a,(1,x)
 965  0002 81            	ret
1009                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1009                     ; 393 {
1010                     .text:	section	.text,new
1011  0000               _USART_ReceiveData9:
1013  0000 89            	pushw	x
1014  0001 89            	pushw	x
1015       00000002      OFST:	set	2
1018                     ; 394   uint16_t temp = 0;
1020                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1022  0002 e604          	ld	a,(4,x)
1023  0004 5f            	clrw	x
1024  0005 a480          	and	a,#128
1025  0007 5f            	clrw	x
1026  0008 02            	rlwa	x,a
1027  0009 58            	sllw	x
1028  000a 1f01          	ldw	(OFST-1,sp),x
1030                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1032  000c 1e03          	ldw	x,(OFST+1,sp)
1033  000e e601          	ld	a,(1,x)
1034  0010 5f            	clrw	x
1035  0011 97            	ld	xl,a
1036  0012 01            	rrwa	x,a
1037  0013 1a02          	or	a,(OFST+0,sp)
1038  0015 01            	rrwa	x,a
1039  0016 1a01          	or	a,(OFST-1,sp)
1040  0018 01            	rrwa	x,a
1041  0019 01            	rrwa	x,a
1042  001a a4ff          	and	a,#255
1043  001c 01            	rrwa	x,a
1044  001d a401          	and	a,#1
1045  001f 01            	rrwa	x,a
1048  0020 5b04          	addw	sp,#4
1049  0022 81            	ret
1093                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1093                     ; 406 {
1094                     .text:	section	.text,new
1095  0000               _USART_SendData8:
1097  0000 89            	pushw	x
1098       00000000      OFST:	set	0
1101                     ; 408   USARTx->DR = Data;
1103  0001 7b05          	ld	a,(OFST+5,sp)
1104  0003 1e01          	ldw	x,(OFST+1,sp)
1105  0005 e701          	ld	(1,x),a
1106                     ; 409 }
1109  0007 85            	popw	x
1110  0008 81            	ret
1154                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1154                     ; 419 {
1155                     .text:	section	.text,new
1156  0000               _USART_SendData9:
1158  0000 89            	pushw	x
1159       00000000      OFST:	set	0
1162                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
1164                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1166  0001 e604          	ld	a,(4,x)
1167  0003 a4bf          	and	a,#191
1168  0005 e704          	ld	(4,x),a
1169                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1171  0007 1605          	ldw	y,(OFST+5,sp)
1172  0009 9054          	srlw	y
1173  000b 9054          	srlw	y
1174  000d 909f          	ld	a,yl
1175  000f a440          	and	a,#64
1176  0011 ea04          	or	a,(4,x)
1177  0013 e704          	ld	(4,x),a
1178                     ; 429   USARTx->DR   = (uint8_t)(Data);
1180  0015 7b06          	ld	a,(OFST+6,sp)
1181  0017 1e01          	ldw	x,(OFST+1,sp)
1182  0019 e701          	ld	(1,x),a
1183                     ; 430 }
1186  001b 85            	popw	x
1187  001c 81            	ret
1235                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1235                     ; 474 {
1236                     .text:	section	.text,new
1237  0000               _USART_ReceiverWakeUpCmd:
1239  0000 89            	pushw	x
1240       00000000      OFST:	set	0
1243                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1245                     ; 477   if (NewState != DISABLE)
1247  0001 0d05          	tnz	(OFST+5,sp)
1248  0003 2708          	jreq	L165
1249                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
1251  0005 e605          	ld	a,(5,x)
1252  0007 aa02          	or	a,#2
1253  0009 e705          	ld	(5,x),a
1255  000b 2008          	jra	L365
1256  000d               L165:
1257                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1259  000d 1e01          	ldw	x,(OFST+1,sp)
1260  000f e605          	ld	a,(5,x)
1261  0011 a4fd          	and	a,#253
1262  0013 e705          	ld	(5,x),a
1263  0015               L365:
1264                     ; 487 }
1267  0015 85            	popw	x
1268  0016 81            	ret
1312                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1312                     ; 497 {
1313                     .text:	section	.text,new
1314  0000               _USART_SetAddress:
1316  0000 89            	pushw	x
1317       00000000      OFST:	set	0
1320                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
1322                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1324  0001 e607          	ld	a,(7,x)
1325  0003 a4f0          	and	a,#240
1326  0005 e707          	ld	(7,x),a
1327                     ; 504   USARTx->CR4 |= USART_Address;
1329  0007 e607          	ld	a,(7,x)
1330  0009 1a05          	or	a,(OFST+5,sp)
1331  000b e707          	ld	(7,x),a
1332                     ; 505 }
1335  000d 85            	popw	x
1336  000e 81            	ret
1405                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1405                     ; 516 {
1406                     .text:	section	.text,new
1407  0000               _USART_WakeUpConfig:
1409  0000 89            	pushw	x
1410       00000000      OFST:	set	0
1413                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1415                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1417  0001 e604          	ld	a,(4,x)
1418  0003 a4f7          	and	a,#247
1419  0005 e704          	ld	(4,x),a
1420                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1422  0007 e604          	ld	a,(4,x)
1423  0009 1a05          	or	a,(OFST+5,sp)
1424  000b e704          	ld	(4,x),a
1425                     ; 521 }
1428  000d 85            	popw	x
1429  000e 81            	ret
1477                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1477                     ; 567 {
1478                     .text:	section	.text,new
1479  0000               _USART_HalfDuplexCmd:
1481  0000 89            	pushw	x
1482       00000000      OFST:	set	0
1485                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1487                     ; 570   if (NewState != DISABLE)
1489  0001 0d05          	tnz	(OFST+5,sp)
1490  0003 2708          	jreq	L766
1491                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1493  0005 e608          	ld	a,(8,x)
1494  0007 aa08          	or	a,#8
1495  0009 e708          	ld	(8,x),a
1497  000b 2008          	jra	L176
1498  000d               L766:
1499                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1501  000d 1e01          	ldw	x,(OFST+1,sp)
1502  000f e608          	ld	a,(8,x)
1503  0011 a4f7          	and	a,#247
1504  0013 e708          	ld	(8,x),a
1505  0015               L176:
1506                     ; 578 }
1509  0015 85            	popw	x
1510  0016 81            	ret
1557                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1557                     ; 645 {
1558                     .text:	section	.text,new
1559  0000               _USART_SmartCardCmd:
1561  0000 89            	pushw	x
1562       00000000      OFST:	set	0
1565                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
1567                     ; 648   if (NewState != DISABLE)
1569  0001 0d05          	tnz	(OFST+5,sp)
1570  0003 2708          	jreq	L717
1571                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
1573  0005 e608          	ld	a,(8,x)
1574  0007 aa20          	or	a,#32
1575  0009 e708          	ld	(8,x),a
1577  000b 2008          	jra	L127
1578  000d               L717:
1579                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1581  000d 1e01          	ldw	x,(OFST+1,sp)
1582  000f e608          	ld	a,(8,x)
1583  0011 a4df          	and	a,#223
1584  0013 e708          	ld	(8,x),a
1585  0015               L127:
1586                     ; 658 }
1589  0015 85            	popw	x
1590  0016 81            	ret
1638                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1638                     ; 668 {
1639                     .text:	section	.text,new
1640  0000               _USART_SmartCardNACKCmd:
1642  0000 89            	pushw	x
1643       00000000      OFST:	set	0
1646                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
1648                     ; 671   if (NewState != DISABLE)
1650  0001 0d05          	tnz	(OFST+5,sp)
1651  0003 2708          	jreq	L747
1652                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
1654  0005 e608          	ld	a,(8,x)
1655  0007 aa10          	or	a,#16
1656  0009 e708          	ld	(8,x),a
1658  000b 2008          	jra	L157
1659  000d               L747:
1660                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1662  000d 1e01          	ldw	x,(OFST+1,sp)
1663  000f e608          	ld	a,(8,x)
1664  0011 a4ef          	and	a,#239
1665  0013 e708          	ld	(8,x),a
1666  0015               L157:
1667                     ; 681 }
1670  0015 85            	popw	x
1671  0016 81            	ret
1715                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1715                     ; 691 {
1716                     .text:	section	.text,new
1717  0000               _USART_SetGuardTime:
1719  0000 89            	pushw	x
1720       00000000      OFST:	set	0
1723                     ; 693   USARTx->GTR = USART_GuardTime;
1725  0001 7b05          	ld	a,(OFST+5,sp)
1726  0003 1e01          	ldw	x,(OFST+1,sp)
1727  0005 e709          	ld	(9,x),a
1728                     ; 694 }
1731  0007 85            	popw	x
1732  0008 81            	ret
1801                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1801                     ; 752 {
1802                     .text:	section	.text,new
1803  0000               _USART_IrDAConfig:
1805  0000 89            	pushw	x
1806       00000000      OFST:	set	0
1809                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1811                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
1813  0001 0d05          	tnz	(OFST+5,sp)
1814  0003 2708          	jreq	L1301
1815                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
1817  0005 e608          	ld	a,(8,x)
1818  0007 aa04          	or	a,#4
1819  0009 e708          	ld	(8,x),a
1821  000b 2008          	jra	L3301
1822  000d               L1301:
1823                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1825  000d 1e01          	ldw	x,(OFST+1,sp)
1826  000f e608          	ld	a,(8,x)
1827  0011 a4fb          	and	a,#251
1828  0013 e708          	ld	(8,x),a
1829  0015               L3301:
1830                     ; 763 }
1833  0015 85            	popw	x
1834  0016 81            	ret
1881                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1881                     ; 773 {
1882                     .text:	section	.text,new
1883  0000               _USART_IrDACmd:
1885  0000 89            	pushw	x
1886       00000000      OFST:	set	0
1889                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
1891                     ; 778   if (NewState != DISABLE)
1893  0001 0d05          	tnz	(OFST+5,sp)
1894  0003 2708          	jreq	L1601
1895                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
1897  0005 e608          	ld	a,(8,x)
1898  0007 aa02          	or	a,#2
1899  0009 e708          	ld	(8,x),a
1901  000b 2008          	jra	L3601
1902  000d               L1601:
1903                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1905  000d 1e01          	ldw	x,(OFST+1,sp)
1906  000f e608          	ld	a,(8,x)
1907  0011 a4fd          	and	a,#253
1908  0013 e708          	ld	(8,x),a
1909  0015               L3601:
1910                     ; 788 }
1913  0015 85            	popw	x
1914  0016 81            	ret
1991                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
1991                     ; 819                   FunctionalState NewState)
1991                     ; 820 {
1992                     .text:	section	.text,new
1993  0000               _USART_DMACmd:
1995  0000 89            	pushw	x
1996       00000000      OFST:	set	0
1999                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
2001                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
2003                     ; 825   if (NewState != DISABLE)
2005  0001 0d06          	tnz	(OFST+6,sp)
2006  0003 2708          	jreq	L5211
2007                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2009  0005 e608          	ld	a,(8,x)
2010  0007 1a05          	or	a,(OFST+5,sp)
2011  0009 e708          	ld	(8,x),a
2013  000b 2009          	jra	L7211
2014  000d               L5211:
2015                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2017  000d 1e01          	ldw	x,(OFST+1,sp)
2018  000f 7b05          	ld	a,(OFST+5,sp)
2019  0011 43            	cpl	a
2020  0012 e408          	and	a,(8,x)
2021  0014 e708          	ld	(8,x),a
2022  0016               L7211:
2023                     ; 837 }
2026  0016 85            	popw	x
2027  0017 81            	ret
2167                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2167                     ; 940 {
2168                     .text:	section	.text,new
2169  0000               _USART_ITConfig:
2171  0000 89            	pushw	x
2172  0001 89            	pushw	x
2173       00000002      OFST:	set	2
2176                     ; 941   uint8_t usartreg, itpos = 0x00;
2178                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
2180                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
2182                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2184  0002 7b07          	ld	a,(OFST+5,sp)
2185  0004 6b01          	ld	(OFST-1,sp),a
2187                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2189  0006 7b08          	ld	a,(OFST+6,sp)
2190  0008 a40f          	and	a,#15
2191  000a 5f            	clrw	x
2192  000b 97            	ld	xl,a
2193  000c a601          	ld	a,#1
2194  000e 5d            	tnzw	x
2195  000f 2704          	jreq	L65
2196  0011               L06:
2197  0011 48            	sll	a
2198  0012 5a            	decw	x
2199  0013 26fc          	jrne	L06
2200  0015               L65:
2201  0015 6b02          	ld	(OFST+0,sp),a
2203                     ; 950   if (NewState != DISABLE)
2205  0017 0d09          	tnz	(OFST+7,sp)
2206  0019 272a          	jreq	L3121
2207                     ; 953     if (usartreg == 0x01)
2209  001b 7b01          	ld	a,(OFST-1,sp)
2210  001d a101          	cp	a,#1
2211  001f 260a          	jrne	L5121
2212                     ; 955       USARTx->CR1 |= itpos;
2214  0021 1e03          	ldw	x,(OFST+1,sp)
2215  0023 e604          	ld	a,(4,x)
2216  0025 1a02          	or	a,(OFST+0,sp)
2217  0027 e704          	ld	(4,x),a
2219  0029 2045          	jra	L5221
2220  002b               L5121:
2221                     ; 957     else if (usartreg == 0x05)
2223  002b 7b01          	ld	a,(OFST-1,sp)
2224  002d a105          	cp	a,#5
2225  002f 260a          	jrne	L1221
2226                     ; 959       USARTx->CR5 |= itpos;
2228  0031 1e03          	ldw	x,(OFST+1,sp)
2229  0033 e608          	ld	a,(8,x)
2230  0035 1a02          	or	a,(OFST+0,sp)
2231  0037 e708          	ld	(8,x),a
2233  0039 2035          	jra	L5221
2234  003b               L1221:
2235                     ; 964       USARTx->CR2 |= itpos;
2237  003b 1e03          	ldw	x,(OFST+1,sp)
2238  003d e605          	ld	a,(5,x)
2239  003f 1a02          	or	a,(OFST+0,sp)
2240  0041 e705          	ld	(5,x),a
2241  0043 202b          	jra	L5221
2242  0045               L3121:
2243                     ; 970     if (usartreg == 0x01)
2245  0045 7b01          	ld	a,(OFST-1,sp)
2246  0047 a101          	cp	a,#1
2247  0049 260b          	jrne	L7221
2248                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
2250  004b 1e03          	ldw	x,(OFST+1,sp)
2251  004d 7b02          	ld	a,(OFST+0,sp)
2252  004f 43            	cpl	a
2253  0050 e404          	and	a,(4,x)
2254  0052 e704          	ld	(4,x),a
2256  0054 201a          	jra	L5221
2257  0056               L7221:
2258                     ; 974     else if (usartreg == 0x05)
2260  0056 7b01          	ld	a,(OFST-1,sp)
2261  0058 a105          	cp	a,#5
2262  005a 260b          	jrne	L3321
2263                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
2265  005c 1e03          	ldw	x,(OFST+1,sp)
2266  005e 7b02          	ld	a,(OFST+0,sp)
2267  0060 43            	cpl	a
2268  0061 e408          	and	a,(8,x)
2269  0063 e708          	ld	(8,x),a
2271  0065 2009          	jra	L5221
2272  0067               L3321:
2273                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
2275  0067 1e03          	ldw	x,(OFST+1,sp)
2276  0069 7b02          	ld	a,(OFST+0,sp)
2277  006b 43            	cpl	a
2278  006c e405          	and	a,(5,x)
2279  006e e705          	ld	(5,x),a
2280  0070               L5221:
2281                     ; 984 }
2284  0070 5b04          	addw	sp,#4
2285  0072 81            	ret
2433                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2433                     ; 1003 {
2434                     .text:	section	.text,new
2435  0000               _USART_GetFlagStatus:
2437  0000 89            	pushw	x
2438  0001 88            	push	a
2439       00000001      OFST:	set	1
2442                     ; 1004   FlagStatus status = RESET;
2444                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
2446                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
2448  0002 1e06          	ldw	x,(OFST+5,sp)
2449  0004 a30101        	cpw	x,#257
2450  0007 2612          	jrne	L5231
2451                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2453  0009 1e02          	ldw	x,(OFST+1,sp)
2454  000b e605          	ld	a,(5,x)
2455  000d 1507          	bcp	a,(OFST+6,sp)
2456  000f 2706          	jreq	L7231
2457                     ; 1014       status = SET;
2459  0011 a601          	ld	a,#1
2460  0013 6b01          	ld	(OFST+0,sp),a
2463  0015 2013          	jra	L3331
2464  0017               L7231:
2465                     ; 1019       status = RESET;
2467  0017 0f01          	clr	(OFST+0,sp)
2469  0019 200f          	jra	L3331
2470  001b               L5231:
2471                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2473  001b 1e02          	ldw	x,(OFST+1,sp)
2474  001d f6            	ld	a,(x)
2475  001e 1507          	bcp	a,(OFST+6,sp)
2476  0020 2706          	jreq	L5331
2477                     ; 1027       status = SET;
2479  0022 a601          	ld	a,#1
2480  0024 6b01          	ld	(OFST+0,sp),a
2483  0026 2002          	jra	L3331
2484  0028               L5331:
2485                     ; 1032       status = RESET;
2487  0028 0f01          	clr	(OFST+0,sp)
2489  002a               L3331:
2490                     ; 1036   return status;
2492  002a 7b01          	ld	a,(OFST+0,sp)
2495  002c 5b03          	addw	sp,#3
2496  002e 81            	ret
2543                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2543                     ; 1061 {
2544                     .text:	section	.text,new
2545  0000               _USART_ClearFlag:
2547  0000 89            	pushw	x
2548       00000000      OFST:	set	0
2551                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2553                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2555  0001 7b06          	ld	a,(OFST+6,sp)
2556  0003 43            	cpl	a
2557  0004 1e01          	ldw	x,(OFST+1,sp)
2558  0006 f7            	ld	(x),a
2559                     ; 1066 }
2562  0007 85            	popw	x
2563  0008 81            	ret
2656                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2656                     ; 1084 {
2657                     .text:	section	.text,new
2658  0000               _USART_GetITStatus:
2660  0000 89            	pushw	x
2661  0001 5203          	subw	sp,#3
2662       00000003      OFST:	set	3
2665                     ; 1085   ITStatus pendingbitstatus = RESET;
2667                     ; 1086   uint8_t temp = 0;
2669                     ; 1087   uint8_t itpos = 0;
2671                     ; 1088   uint8_t itmask1 = 0;
2673                     ; 1089   uint8_t itmask2 = 0;
2675                     ; 1090   uint8_t enablestatus = 0;
2677                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
2679                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2681  0003 7b09          	ld	a,(OFST+6,sp)
2682  0005 a40f          	and	a,#15
2683  0007 5f            	clrw	x
2684  0008 97            	ld	xl,a
2685  0009 a601          	ld	a,#1
2686  000b 5d            	tnzw	x
2687  000c 2704          	jreq	L07
2688  000e               L27:
2689  000e 48            	sll	a
2690  000f 5a            	decw	x
2691  0010 26fc          	jrne	L27
2692  0012               L07:
2693  0012 6b02          	ld	(OFST-1,sp),a
2695                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2697  0014 7b09          	ld	a,(OFST+6,sp)
2698  0016 4e            	swap	a
2699  0017 a40f          	and	a,#15
2700  0019 6b03          	ld	(OFST+0,sp),a
2702                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2704  001b 7b03          	ld	a,(OFST+0,sp)
2705  001d 5f            	clrw	x
2706  001e 97            	ld	xl,a
2707  001f a601          	ld	a,#1
2708  0021 5d            	tnzw	x
2709  0022 2704          	jreq	L47
2710  0024               L67:
2711  0024 48            	sll	a
2712  0025 5a            	decw	x
2713  0026 26fc          	jrne	L67
2714  0028               L47:
2715  0028 6b03          	ld	(OFST+0,sp),a
2717                     ; 1103   if (USART_IT == USART_IT_PE)
2719  002a 1e08          	ldw	x,(OFST+5,sp)
2720  002c a30100        	cpw	x,#256
2721  002f 261d          	jrne	L7241
2722                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2724  0031 1e04          	ldw	x,(OFST+1,sp)
2725  0033 e604          	ld	a,(4,x)
2726  0035 1403          	and	a,(OFST+0,sp)
2727  0037 6b03          	ld	(OFST+0,sp),a
2729                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2731  0039 1e04          	ldw	x,(OFST+1,sp)
2732  003b f6            	ld	a,(x)
2733  003c 1502          	bcp	a,(OFST-1,sp)
2734  003e 270a          	jreq	L1341
2736  0040 0d03          	tnz	(OFST+0,sp)
2737  0042 2706          	jreq	L1341
2738                     ; 1112       pendingbitstatus = SET;
2740  0044 a601          	ld	a,#1
2741  0046 6b03          	ld	(OFST+0,sp),a
2744  0048 204f          	jra	L5341
2745  004a               L1341:
2746                     ; 1117       pendingbitstatus = RESET;
2748  004a 0f03          	clr	(OFST+0,sp)
2750  004c 204b          	jra	L5341
2751  004e               L7241:
2752                     ; 1121   else if (USART_IT == USART_IT_OR)
2754  004e 1e08          	ldw	x,(OFST+5,sp)
2755  0050 a30235        	cpw	x,#565
2756  0053 2629          	jrne	L7341
2757                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2759  0055 1e04          	ldw	x,(OFST+1,sp)
2760  0057 e605          	ld	a,(5,x)
2761  0059 1403          	and	a,(OFST+0,sp)
2762  005b 6b03          	ld	(OFST+0,sp),a
2764                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2766  005d 1e04          	ldw	x,(OFST+1,sp)
2767  005f e608          	ld	a,(8,x)
2768  0061 a401          	and	a,#1
2769  0063 6b01          	ld	(OFST-2,sp),a
2771                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2773  0065 1e04          	ldw	x,(OFST+1,sp)
2774  0067 f6            	ld	a,(x)
2775  0068 1502          	bcp	a,(OFST-1,sp)
2776  006a 270e          	jreq	L1441
2778  006c 0d03          	tnz	(OFST+0,sp)
2779  006e 2604          	jrne	L3441
2781  0070 0d01          	tnz	(OFST-2,sp)
2782  0072 2706          	jreq	L1441
2783  0074               L3441:
2784                     ; 1132       pendingbitstatus = SET;
2786  0074 a601          	ld	a,#1
2787  0076 6b03          	ld	(OFST+0,sp),a
2790  0078 201f          	jra	L5341
2791  007a               L1441:
2792                     ; 1137       pendingbitstatus = RESET;
2794  007a 0f03          	clr	(OFST+0,sp)
2796  007c 201b          	jra	L5341
2797  007e               L7341:
2798                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2800  007e 1e04          	ldw	x,(OFST+1,sp)
2801  0080 e605          	ld	a,(5,x)
2802  0082 1403          	and	a,(OFST+0,sp)
2803  0084 6b03          	ld	(OFST+0,sp),a
2805                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2807  0086 1e04          	ldw	x,(OFST+1,sp)
2808  0088 f6            	ld	a,(x)
2809  0089 1502          	bcp	a,(OFST-1,sp)
2810  008b 270a          	jreq	L1541
2812  008d 0d03          	tnz	(OFST+0,sp)
2813  008f 2706          	jreq	L1541
2814                     ; 1149       pendingbitstatus = SET;
2816  0091 a601          	ld	a,#1
2817  0093 6b03          	ld	(OFST+0,sp),a
2820  0095 2002          	jra	L5341
2821  0097               L1541:
2822                     ; 1154       pendingbitstatus = RESET;
2824  0097 0f03          	clr	(OFST+0,sp)
2826  0099               L5341:
2827                     ; 1159   return  pendingbitstatus;
2829  0099 7b03          	ld	a,(OFST+0,sp)
2832  009b 5b05          	addw	sp,#5
2833  009d 81            	ret
2871                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2871                     ; 1184 {
2872                     .text:	section	.text,new
2873  0000               _USART_ClearITPendingBit:
2877                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
2879                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2881  0000 f6            	ld	a,(x)
2882  0001 a4bf          	and	a,#191
2883  0003 f7            	ld	(x),a
2884                     ; 1189 }
2887  0004 81            	ret
2900                     	xdef	_USART_ClearITPendingBit
2901                     	xdef	_USART_GetITStatus
2902                     	xdef	_USART_ClearFlag
2903                     	xdef	_USART_GetFlagStatus
2904                     	xdef	_USART_ITConfig
2905                     	xdef	_USART_DMACmd
2906                     	xdef	_USART_IrDACmd
2907                     	xdef	_USART_IrDAConfig
2908                     	xdef	_USART_SetGuardTime
2909                     	xdef	_USART_SmartCardNACKCmd
2910                     	xdef	_USART_SmartCardCmd
2911                     	xdef	_USART_HalfDuplexCmd
2912                     	xdef	_USART_SetAddress
2913                     	xdef	_USART_ReceiverWakeUpCmd
2914                     	xdef	_USART_WakeUpConfig
2915                     	xdef	_USART_ReceiveData9
2916                     	xdef	_USART_ReceiveData8
2917                     	xdef	_USART_SendData9
2918                     	xdef	_USART_SendData8
2919                     	xdef	_USART_SendBreak
2920                     	xdef	_USART_SetPrescaler
2921                     	xdef	_USART_Cmd
2922                     	xdef	_USART_ClockInit
2923                     	xdef	_USART_Init
2924                     	xdef	_USART_DeInit
2925                     	xref	_CLK_GetClockFreq
2926                     	xref.b	c_lreg
2927                     	xref.b	c_x
2946                     	xref	c_lursh
2947                     	xref	c_ltor
2948                     	xref	c_rtol
2949                     	xref	c_ludv
2950                     	end
