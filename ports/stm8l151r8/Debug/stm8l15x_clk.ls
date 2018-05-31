   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  17                     .const:	section	.text
  18  0000               _SYSDivFactor:
  19  0000 01            	dc.b	1
  20  0001 02            	dc.b	2
  21  0002 04            	dc.b	4
  22  0003 08            	dc.b	8
  23  0004 10            	dc.b	16
  52                     ; 120 void CLK_DeInit(void)
  52                     ; 121 {
  54                     .text:	section	.text,new
  55  0000               _CLK_DeInit:
  59                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  61  0000 351150c2      	mov	20674,#17
  62                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  64  0004 725f50c6      	clr	20678
  65                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  67  0008 725f50c1      	clr	20673
  68                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  70  000c 725f50cb      	clr	20683
  71                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  73  0010 350150c8      	mov	20680,#1
  74                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  76  0014 725f50c9      	clr	20681
  77                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  79  0018 350350c0      	mov	20672,#3
  80                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  82  001c 725f50c3      	clr	20675
  83                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  85  0020 358050c4      	mov	20676,#128
  86                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  88  0024 725f50d0      	clr	20688
  89                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  91  0028 725f50ca      	clr	20682
  92                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  94  002c 725f50c5      	clr	20677
  95                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  97  0030 725f50cd      	clr	20685
  98                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
 100  0034 725f50cc      	clr	20684
 101                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 103  0038 725f50ce      	clr	20686
 104                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 106  003c 35b950cf      	mov	20687,#185
 107                     ; 138 }
 110  0040 81            	ret
 165                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 165                     ; 161 {
 166                     .text:	section	.text,new
 167  0000               _CLK_HSICmd:
 171                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 173                     ; 165   if (NewState != DISABLE)
 175  0000 4d            	tnz	a
 176  0001 2706          	jreq	L74
 177                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 179  0003 721050c2      	bset	20674,#0
 181  0007 2004          	jra	L15
 182  0009               L74:
 183                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 185  0009 721150c2      	bres	20674,#0
 186  000d               L15:
 187                     ; 175 }
 190  000d 81            	ret
 224                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 224                     ; 189 {
 225                     .text:	section	.text,new
 226  0000               _CLK_AdjustHSICalibrationValue:
 230                     ; 191   CLK->HSIUNLCKR = 0xAC;
 232  0000 35ac50ce      	mov	20686,#172
 233                     ; 192   CLK->HSIUNLCKR = 0x35;
 235  0004 353550ce      	mov	20686,#53
 236                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 238  0008 c750cd        	ld	20685,a
 239                     ; 196 }
 242  000b 81            	ret
 277                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 277                     ; 213 {
 278                     .text:	section	.text,new
 279  0000               _CLK_LSICmd:
 283                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 285                     ; 218   if (NewState != DISABLE)
 287  0000 4d            	tnz	a
 288  0001 2706          	jreq	L501
 289                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 291  0003 721450c2      	bset	20674,#2
 293  0007 2004          	jra	L701
 294  0009               L501:
 295                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 297  0009 721550c2      	bres	20674,#2
 298  000d               L701:
 299                     ; 228 }
 302  000d 81            	ret
 364                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 364                     ; 250 {
 365                     .text:	section	.text,new
 366  0000               _CLK_HSEConfig:
 370                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 372                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 374  0000 721150c6      	bres	20678,#0
 375                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 377  0004 721950c6      	bres	20678,#4
 378                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 380  0008 ca50c6        	or	a,20678
 381  000b c750c6        	ld	20678,a
 382                     ; 263 }
 385  000e 81            	ret
 447                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 447                     ; 281 {
 448                     .text:	section	.text,new
 449  0000               _CLK_LSEConfig:
 453                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 455                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 457  0000 721550c6      	bres	20678,#2
 458                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 460  0004 721b50c6      	bres	20678,#5
 461                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 463  0008 ca50c6        	or	a,20678
 464  000b c750c6        	ld	20678,a
 465                     ; 295 }
 468  000e 81            	ret
 492                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 492                     ; 307 {
 493                     .text:	section	.text,new
 494  0000               _CLK_ClockSecuritySystemEnable:
 498                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 500  0000 721050ca      	bset	20682,#0
 501                     ; 310 }
 504  0004 81            	ret
 540                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 540                     ; 318 {
 541                     .text:	section	.text,new
 542  0000               _CLK_ClockSecuritySytemDeglitchCmd:
 546                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 548                     ; 322   if (NewState != DISABLE)
 550  0000 4d            	tnz	a
 551  0001 2706          	jreq	L712
 552                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 554  0003 721850ca      	bset	20682,#4
 556  0007 2004          	jra	L122
 557  0009               L712:
 558                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 560  0009 721950ca      	bres	20682,#4
 561  000d               L122:
 562                     ; 332 }
 565  000d 81            	ret
 706                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 706                     ; 357 {
 707                     .text:	section	.text,new
 708  0000               _CLK_CCOConfig:
 710  0000 89            	pushw	x
 711       00000000      OFST:	set	0
 714                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 716                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 718                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 720  0001 9f            	ld	a,xl
 721  0002 1a01          	or	a,(OFST+1,sp)
 722  0004 c750c5        	ld	20677,a
 723                     ; 364 }
 726  0007 85            	popw	x
 727  0008 81            	ret
 801                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 801                     ; 417 {
 802                     .text:	section	.text,new
 803  0000               _CLK_SYSCLKSourceConfig:
 807                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 809                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 811  0000 c750c8        	ld	20680,a
 812                     ; 423 }
 815  0003 81            	ret
 840                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 840                     ; 436 {
 841                     .text:	section	.text,new
 842  0000               _CLK_GetSYSCLKSource:
 846                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 848  0000 c650c7        	ld	a,20679
 851  0003 81            	ret
 915                     ; 478 uint32_t CLK_GetClockFreq(void)
 915                     ; 479 {
 916                     .text:	section	.text,new
 917  0000               _CLK_GetClockFreq:
 919  0000 5209          	subw	sp,#9
 920       00000009      OFST:	set	9
 923                     ; 480   uint32_t clockfrequency = 0;
 925                     ; 481   uint32_t sourcefrequency = 0;
 927  0002 ae0000        	ldw	x,#0
 928  0005 1f07          	ldw	(OFST-2,sp),x
 929  0007 ae0000        	ldw	x,#0
 930  000a 1f05          	ldw	(OFST-4,sp),x
 932                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 934                     ; 483   uint8_t tmp = 0, presc = 0;
 938                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 940  000c c650c7        	ld	a,20679
 941  000f 6b09          	ld	(OFST+0,sp),a
 943                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 945  0011 7b09          	ld	a,(OFST+0,sp)
 946  0013 a101          	cp	a,#1
 947  0015 260c          	jrne	L573
 948                     ; 490     sourcefrequency = HSI_VALUE;
 950  0017 ae2400        	ldw	x,#9216
 951  001a 1f07          	ldw	(OFST-2,sp),x
 952  001c ae00f4        	ldw	x,#244
 953  001f 1f05          	ldw	(OFST-4,sp),x
 956  0021 2022          	jra	L773
 957  0023               L573:
 958                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 960  0023 7b09          	ld	a,(OFST+0,sp)
 961  0025 a102          	cp	a,#2
 962  0027 260c          	jrne	L104
 963                     ; 494     sourcefrequency = LSI_VALUE;
 965  0029 ae9470        	ldw	x,#38000
 966  002c 1f07          	ldw	(OFST-2,sp),x
 967  002e ae0000        	ldw	x,#0
 968  0031 1f05          	ldw	(OFST-4,sp),x
 971  0033 2010          	jra	L773
 972  0035               L104:
 973                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 975  0035 7b09          	ld	a,(OFST+0,sp)
 976  0037 a104          	cp	a,#4
 977  0039 260a          	jrne	L504
 978                     ; 498     sourcefrequency = HSE_VALUE;
 980  003b ae2400        	ldw	x,#9216
 981  003e 1f07          	ldw	(OFST-2,sp),x
 982  0040 ae00f4        	ldw	x,#244
 983  0043 1f05          	ldw	(OFST-4,sp),x
 986  0045               L504:
 987                     ; 502     clockfrequency = LSE_VALUE;
 989  0045               L773:
 990                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 992  0045 c650c0        	ld	a,20672
 993  0048 a407          	and	a,#7
 994  004a 6b09          	ld	(OFST+0,sp),a
 996                     ; 507   presc = SYSDivFactor[tmp];
 998  004c 7b09          	ld	a,(OFST+0,sp)
 999  004e 5f            	clrw	x
1000  004f 97            	ld	xl,a
1001  0050 d60000        	ld	a,(_SYSDivFactor,x)
1002  0053 6b09          	ld	(OFST+0,sp),a
1004                     ; 510   clockfrequency = sourcefrequency / presc;
1006  0055 7b09          	ld	a,(OFST+0,sp)
1007  0057 b703          	ld	c_lreg+3,a
1008  0059 3f02          	clr	c_lreg+2
1009  005b 3f01          	clr	c_lreg+1
1010  005d 3f00          	clr	c_lreg
1011  005f 96            	ldw	x,sp
1012  0060 1c0001        	addw	x,#OFST-8
1013  0063 cd0000        	call	c_rtol
1016  0066 96            	ldw	x,sp
1017  0067 1c0005        	addw	x,#OFST-4
1018  006a cd0000        	call	c_ltor
1020  006d 96            	ldw	x,sp
1021  006e 1c0001        	addw	x,#OFST-8
1022  0071 cd0000        	call	c_ludv
1024  0074 96            	ldw	x,sp
1025  0075 1c0005        	addw	x,#OFST-4
1026  0078 cd0000        	call	c_rtol
1029                     ; 512   return((uint32_t)clockfrequency);
1031  007b 96            	ldw	x,sp
1032  007c 1c0005        	addw	x,#OFST-4
1033  007f cd0000        	call	c_ltor
1037  0082 5b09          	addw	sp,#9
1038  0084 81            	ret
1136                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1136                     ; 529 {
1137                     .text:	section	.text,new
1138  0000               _CLK_SYSCLKDivConfig:
1142                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1144                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1146  0000 c750c0        	ld	20672,a
1147                     ; 534 }
1150  0003 81            	ret
1186                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1186                     ; 542 {
1187                     .text:	section	.text,new
1188  0000               _CLK_SYSCLKSourceSwitchCmd:
1192                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1194                     ; 546   if (NewState != DISABLE)
1196  0000 4d            	tnz	a
1197  0001 2706          	jreq	L174
1198                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1200  0003 721250c9      	bset	20681,#1
1202  0007 2004          	jra	L374
1203  0009               L174:
1204                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1206  0009 721350c9      	bres	20681,#1
1207  000d               L374:
1208                     ; 556 }
1211  000d 81            	ret
1357                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1357                     ; 617 {
1358                     .text:	section	.text,new
1359  0000               _CLK_RTCClockConfig:
1361  0000 89            	pushw	x
1362       00000000      OFST:	set	0
1365                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1367                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1369                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1371  0001 9f            	ld	a,xl
1372  0002 1a01          	or	a,(OFST+1,sp)
1373  0004 c750c1        	ld	20673,a
1374                     ; 624 }
1377  0007 85            	popw	x
1378  0008 81            	ret
1444                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1444                     ; 636 {
1445                     .text:	section	.text,new
1446  0000               _CLK_BEEPClockConfig:
1450                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1452                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1454  0000 c750cb        	ld	20683,a
1455                     ; 643 }
1458  0003 81            	ret
1681                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1681                     ; 678 {
1682                     .text:	section	.text,new
1683  0000               _CLK_PeripheralClockConfig:
1685  0000 89            	pushw	x
1686  0001 88            	push	a
1687       00000001      OFST:	set	1
1690                     ; 679   uint8_t reg = 0;
1692                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1694                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1696                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1698  0002 9e            	ld	a,xh
1699  0003 a4f0          	and	a,#240
1700  0005 6b01          	ld	(OFST+0,sp),a
1702                     ; 688   if ( reg == 0x00)
1704  0007 0d01          	tnz	(OFST+0,sp)
1705  0009 2635          	jrne	L117
1706                     ; 690     if (NewState != DISABLE)
1708  000b 0d03          	tnz	(OFST+2,sp)
1709  000d 2719          	jreq	L317
1710                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1712  000f 7b02          	ld	a,(OFST+1,sp)
1713  0011 a40f          	and	a,#15
1714  0013 5f            	clrw	x
1715  0014 97            	ld	xl,a
1716  0015 a601          	ld	a,#1
1717  0017 5d            	tnzw	x
1718  0018 2704          	jreq	L64
1719  001a               L05:
1720  001a 48            	sll	a
1721  001b 5a            	decw	x
1722  001c 26fc          	jrne	L05
1723  001e               L64:
1724  001e ca50c3        	or	a,20675
1725  0021 c750c3        	ld	20675,a
1727  0024 acaa00aa      	jpf	L717
1728  0028               L317:
1729                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1731  0028 7b02          	ld	a,(OFST+1,sp)
1732  002a a40f          	and	a,#15
1733  002c 5f            	clrw	x
1734  002d 97            	ld	xl,a
1735  002e a601          	ld	a,#1
1736  0030 5d            	tnzw	x
1737  0031 2704          	jreq	L25
1738  0033               L45:
1739  0033 48            	sll	a
1740  0034 5a            	decw	x
1741  0035 26fc          	jrne	L45
1742  0037               L25:
1743  0037 43            	cpl	a
1744  0038 c450c3        	and	a,20675
1745  003b c750c3        	ld	20675,a
1746  003e 206a          	jra	L717
1747  0040               L117:
1748                     ; 701   else if (reg == 0x10)
1750  0040 7b01          	ld	a,(OFST+0,sp)
1751  0042 a110          	cp	a,#16
1752  0044 2633          	jrne	L127
1753                     ; 703     if (NewState != DISABLE)
1755  0046 0d03          	tnz	(OFST+2,sp)
1756  0048 2717          	jreq	L327
1757                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1759  004a 7b02          	ld	a,(OFST+1,sp)
1760  004c a40f          	and	a,#15
1761  004e 5f            	clrw	x
1762  004f 97            	ld	xl,a
1763  0050 a601          	ld	a,#1
1764  0052 5d            	tnzw	x
1765  0053 2704          	jreq	L65
1766  0055               L06:
1767  0055 48            	sll	a
1768  0056 5a            	decw	x
1769  0057 26fc          	jrne	L06
1770  0059               L65:
1771  0059 ca50c4        	or	a,20676
1772  005c c750c4        	ld	20676,a
1774  005f 2049          	jra	L717
1775  0061               L327:
1776                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1778  0061 7b02          	ld	a,(OFST+1,sp)
1779  0063 a40f          	and	a,#15
1780  0065 5f            	clrw	x
1781  0066 97            	ld	xl,a
1782  0067 a601          	ld	a,#1
1783  0069 5d            	tnzw	x
1784  006a 2704          	jreq	L26
1785  006c               L46:
1786  006c 48            	sll	a
1787  006d 5a            	decw	x
1788  006e 26fc          	jrne	L46
1789  0070               L26:
1790  0070 43            	cpl	a
1791  0071 c450c4        	and	a,20676
1792  0074 c750c4        	ld	20676,a
1793  0077 2031          	jra	L717
1794  0079               L127:
1795                     ; 716     if (NewState != DISABLE)
1797  0079 0d03          	tnz	(OFST+2,sp)
1798  007b 2717          	jreq	L137
1799                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1801  007d 7b02          	ld	a,(OFST+1,sp)
1802  007f a40f          	and	a,#15
1803  0081 5f            	clrw	x
1804  0082 97            	ld	xl,a
1805  0083 a601          	ld	a,#1
1806  0085 5d            	tnzw	x
1807  0086 2704          	jreq	L66
1808  0088               L07:
1809  0088 48            	sll	a
1810  0089 5a            	decw	x
1811  008a 26fc          	jrne	L07
1812  008c               L66:
1813  008c ca50d0        	or	a,20688
1814  008f c750d0        	ld	20688,a
1816  0092 2016          	jra	L717
1817  0094               L137:
1818                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1820  0094 7b02          	ld	a,(OFST+1,sp)
1821  0096 a40f          	and	a,#15
1822  0098 5f            	clrw	x
1823  0099 97            	ld	xl,a
1824  009a a601          	ld	a,#1
1825  009c 5d            	tnzw	x
1826  009d 2704          	jreq	L27
1827  009f               L47:
1828  009f 48            	sll	a
1829  00a0 5a            	decw	x
1830  00a1 26fc          	jrne	L47
1831  00a3               L27:
1832  00a3 43            	cpl	a
1833  00a4 c450d0        	and	a,20688
1834  00a7 c750d0        	ld	20688,a
1835  00aa               L717:
1836                     ; 727 }
1839  00aa 5b03          	addw	sp,#3
1840  00ac 81            	ret
1864                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1864                     ; 766 {
1865                     .text:	section	.text,new
1866  0000               _CLK_LSEClockSecuritySystemEnable:
1870                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1872  0000 72105190      	bset	20880,#0
1873                     ; 769 }
1876  0004 81            	ret
1900                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1900                     ; 778 {
1901                     .text:	section	.text,new
1902  0000               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1906                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1908  0000 72125190      	bset	20880,#1
1909                     ; 781 }
1912  0004 81            	ret
1987                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1987                     ; 808 {
1988                     .text:	section	.text,new
1989  0000               _CLK_HaltConfig:
1991  0000 89            	pushw	x
1992       00000000      OFST:	set	0
1995                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
1997                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
1999                     ; 813   if (NewState != DISABLE)
2001  0001 9f            	ld	a,xl
2002  0002 4d            	tnz	a
2003  0003 2709          	jreq	L1101
2004                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
2006  0005 9e            	ld	a,xh
2007  0006 ca50c2        	or	a,20674
2008  0009 c750c2        	ld	20674,a
2010  000c 2009          	jra	L3101
2011  000e               L1101:
2012                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2014  000e 7b01          	ld	a,(OFST+1,sp)
2015  0010 43            	cpl	a
2016  0011 c450c2        	and	a,20674
2017  0014 c750c2        	ld	20674,a
2018  0017               L3101:
2019                     ; 821 }
2022  0017 85            	popw	x
2023  0018 81            	ret
2059                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2059                     ; 832 {
2060                     .text:	section	.text,new
2061  0000               _CLK_MainRegulatorCmd:
2065                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2067                     ; 836   if (NewState != DISABLE)
2069  0000 4d            	tnz	a
2070  0001 2706          	jreq	L3301
2071                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2073  0003 721350cf      	bres	20687,#1
2075  0007 2004          	jra	L5301
2076  0009               L3301:
2077                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2079  0009 721250cf      	bset	20687,#1
2080  000d               L5301:
2081                     ; 846 }
2084  000d 81            	ret
2156                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2156                     ; 876 {
2157                     .text:	section	.text,new
2158  0000               _CLK_ITConfig:
2160  0000 89            	pushw	x
2161       00000000      OFST:	set	0
2164                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2166                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2168                     ; 882   if (NewState != DISABLE)
2170  0001 9f            	ld	a,xl
2171  0002 4d            	tnz	a
2172  0003 271d          	jreq	L3701
2173                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2175  0005 9e            	ld	a,xh
2176  0006 a11c          	cp	a,#28
2177  0008 2606          	jrne	L5701
2178                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2180  000a 721450c9      	bset	20681,#2
2182  000e 202e          	jra	L5011
2183  0010               L5701:
2184                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2186  0010 7b01          	ld	a,(OFST+1,sp)
2187  0012 a12c          	cp	a,#44
2188  0014 2606          	jrne	L1011
2189                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2191  0016 72145190      	bset	20880,#2
2193  001a 2022          	jra	L5011
2194  001c               L1011:
2195                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2197  001c 721450ca      	bset	20682,#2
2198  0020 201c          	jra	L5011
2199  0022               L3701:
2200                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2202  0022 7b01          	ld	a,(OFST+1,sp)
2203  0024 a11c          	cp	a,#28
2204  0026 2606          	jrne	L7011
2205                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2207  0028 721550c9      	bres	20681,#2
2209  002c 2010          	jra	L5011
2210  002e               L7011:
2211                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2213  002e 7b01          	ld	a,(OFST+1,sp)
2214  0030 a12c          	cp	a,#44
2215  0032 2606          	jrne	L3111
2216                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2218  0034 72155190      	bres	20880,#2
2220  0038 2004          	jra	L5011
2221  003a               L3111:
2222                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2224  003a 721550ca      	bres	20682,#2
2225  003e               L5011:
2226                     ; 918 }
2229  003e 85            	popw	x
2230  003f 81            	ret
2449                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2449                     ; 946 {
2450                     .text:	section	.text,new
2451  0000               _CLK_GetFlagStatus:
2453  0000 88            	push	a
2454  0001 89            	pushw	x
2455       00000002      OFST:	set	2
2458                     ; 947   uint8_t reg = 0;
2460                     ; 948   uint8_t pos = 0;
2462                     ; 949   FlagStatus bitstatus = RESET;
2464                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2466                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2468  0002 a4f0          	and	a,#240
2469  0004 6b02          	ld	(OFST+0,sp),a
2471                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2473  0006 7b03          	ld	a,(OFST+1,sp)
2474  0008 a40f          	and	a,#15
2475  000a 6b01          	ld	(OFST-1,sp),a
2477                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2479  000c 0d02          	tnz	(OFST+0,sp)
2480  000e 2607          	jrne	L7221
2481                     ; 962     reg = CLK->CRTCR;
2483  0010 c650c1        	ld	a,20673
2484  0013 6b02          	ld	(OFST+0,sp),a
2487  0015 2060          	jra	L1321
2488  0017               L7221:
2489                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2491  0017 7b02          	ld	a,(OFST+0,sp)
2492  0019 a110          	cp	a,#16
2493  001b 2607          	jrne	L3321
2494                     ; 966     reg = CLK->ICKCR;
2496  001d c650c2        	ld	a,20674
2497  0020 6b02          	ld	(OFST+0,sp),a
2500  0022 2053          	jra	L1321
2501  0024               L3321:
2502                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2504  0024 7b02          	ld	a,(OFST+0,sp)
2505  0026 a120          	cp	a,#32
2506  0028 2607          	jrne	L7321
2507                     ; 970     reg = CLK->CCOR;
2509  002a c650c5        	ld	a,20677
2510  002d 6b02          	ld	(OFST+0,sp),a
2513  002f 2046          	jra	L1321
2514  0031               L7321:
2515                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2517  0031 7b02          	ld	a,(OFST+0,sp)
2518  0033 a130          	cp	a,#48
2519  0035 2607          	jrne	L3421
2520                     ; 974     reg = CLK->ECKCR;
2522  0037 c650c6        	ld	a,20678
2523  003a 6b02          	ld	(OFST+0,sp),a
2526  003c 2039          	jra	L1321
2527  003e               L3421:
2528                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2530  003e 7b02          	ld	a,(OFST+0,sp)
2531  0040 a140          	cp	a,#64
2532  0042 2607          	jrne	L7421
2533                     ; 978     reg = CLK->SWCR;
2535  0044 c650c9        	ld	a,20681
2536  0047 6b02          	ld	(OFST+0,sp),a
2539  0049 202c          	jra	L1321
2540  004b               L7421:
2541                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2543  004b 7b02          	ld	a,(OFST+0,sp)
2544  004d a150          	cp	a,#80
2545  004f 2607          	jrne	L3521
2546                     ; 982     reg = CLK->CSSR;
2548  0051 c650ca        	ld	a,20682
2549  0054 6b02          	ld	(OFST+0,sp),a
2552  0056 201f          	jra	L1321
2553  0058               L3521:
2554                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2556  0058 7b02          	ld	a,(OFST+0,sp)
2557  005a a170          	cp	a,#112
2558  005c 2607          	jrne	L7521
2559                     ; 986     reg = CLK->REGCSR;
2561  005e c650cf        	ld	a,20687
2562  0061 6b02          	ld	(OFST+0,sp),a
2565  0063 2012          	jra	L1321
2566  0065               L7521:
2567                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2569  0065 7b02          	ld	a,(OFST+0,sp)
2570  0067 a180          	cp	a,#128
2571  0069 2607          	jrne	L3621
2572                     ; 990     reg = CSSLSE->CSR;
2574  006b c65190        	ld	a,20880
2575  006e 6b02          	ld	(OFST+0,sp),a
2578  0070 2005          	jra	L1321
2579  0072               L3621:
2580                     ; 994     reg = CLK->CBEEPR;
2582  0072 c650cb        	ld	a,20683
2583  0075 6b02          	ld	(OFST+0,sp),a
2585  0077               L1321:
2586                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2588  0077 7b01          	ld	a,(OFST-1,sp)
2589  0079 5f            	clrw	x
2590  007a 97            	ld	xl,a
2591  007b a601          	ld	a,#1
2592  007d 5d            	tnzw	x
2593  007e 2704          	jreq	L211
2594  0080               L411:
2595  0080 48            	sll	a
2596  0081 5a            	decw	x
2597  0082 26fc          	jrne	L411
2598  0084               L211:
2599  0084 1402          	and	a,(OFST+0,sp)
2600  0086 2706          	jreq	L7621
2601                     ; 1000     bitstatus = SET;
2603  0088 a601          	ld	a,#1
2604  008a 6b02          	ld	(OFST+0,sp),a
2607  008c 2002          	jra	L1721
2608  008e               L7621:
2609                     ; 1004     bitstatus = RESET;
2611  008e 0f02          	clr	(OFST+0,sp)
2613  0090               L1721:
2614                     ; 1008   return((FlagStatus)bitstatus);
2616  0090 7b02          	ld	a,(OFST+0,sp)
2619  0092 5b03          	addw	sp,#3
2620  0094 81            	ret
2643                     ; 1016 void CLK_ClearFlag(void)
2643                     ; 1017 {
2644                     .text:	section	.text,new
2645  0000               _CLK_ClearFlag:
2649                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2651  0000 72175190      	bres	20880,#3
2652                     ; 1021 }
2655  0004 81            	ret
2701                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2701                     ; 1033 {
2702                     .text:	section	.text,new
2703  0000               _CLK_GetITStatus:
2705  0000 88            	push	a
2706  0001 88            	push	a
2707       00000001      OFST:	set	1
2710                     ; 1035   ITStatus bitstatus = RESET;
2712                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2714                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2716  0002 a11c          	cp	a,#28
2717  0004 2611          	jrne	L5231
2718                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2720  0006 c450c9        	and	a,20681
2721  0009 a10c          	cp	a,#12
2722  000b 2606          	jrne	L7231
2723                     ; 1045       bitstatus = SET;
2725  000d a601          	ld	a,#1
2726  000f 6b01          	ld	(OFST+0,sp),a
2729  0011 202e          	jra	L3331
2730  0013               L7231:
2731                     ; 1049       bitstatus = RESET;
2733  0013 0f01          	clr	(OFST+0,sp)
2735  0015 202a          	jra	L3331
2736  0017               L5231:
2737                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2739  0017 7b02          	ld	a,(OFST+1,sp)
2740  0019 a12c          	cp	a,#44
2741  001b 2613          	jrne	L5331
2742                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2744  001d c65190        	ld	a,20880
2745  0020 1402          	and	a,(OFST+1,sp)
2746  0022 a10c          	cp	a,#12
2747  0024 2606          	jrne	L7331
2748                     ; 1057       bitstatus = SET;
2750  0026 a601          	ld	a,#1
2751  0028 6b01          	ld	(OFST+0,sp),a
2754  002a 2015          	jra	L3331
2755  002c               L7331:
2756                     ; 1061       bitstatus = RESET;
2758  002c 0f01          	clr	(OFST+0,sp)
2760  002e 2011          	jra	L3331
2761  0030               L5331:
2762                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2764  0030 c650ca        	ld	a,20682
2765  0033 1402          	and	a,(OFST+1,sp)
2766  0035 a10c          	cp	a,#12
2767  0037 2606          	jrne	L5431
2768                     ; 1069       bitstatus = SET;
2770  0039 a601          	ld	a,#1
2771  003b 6b01          	ld	(OFST+0,sp),a
2774  003d 2002          	jra	L3331
2775  003f               L5431:
2776                     ; 1073       bitstatus = RESET;
2778  003f 0f01          	clr	(OFST+0,sp)
2780  0041               L3331:
2781                     ; 1078   return bitstatus;
2783  0041 7b01          	ld	a,(OFST+0,sp)
2786  0043 85            	popw	x
2787  0044 81            	ret
2823                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2823                     ; 1090 {
2824                     .text:	section	.text,new
2825  0000               _CLK_ClearITPendingBit:
2829                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2831                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2833  0000 a4f0          	and	a,#240
2834  0002 a120          	cp	a,#32
2835  0004 2606          	jrne	L7631
2836                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2838  0006 72175190      	bres	20880,#3
2840  000a 2004          	jra	L1731
2841  000c               L7631:
2842                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2844  000c 721750c9      	bres	20681,#3
2845  0010               L1731:
2846                     ; 1105 }
2849  0010 81            	ret
2874                     	xdef	_SYSDivFactor
2875                     	xdef	_CLK_ClearITPendingBit
2876                     	xdef	_CLK_GetITStatus
2877                     	xdef	_CLK_ClearFlag
2878                     	xdef	_CLK_GetFlagStatus
2879                     	xdef	_CLK_ITConfig
2880                     	xdef	_CLK_MainRegulatorCmd
2881                     	xdef	_CLK_HaltConfig
2882                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2883                     	xdef	_CLK_LSEClockSecuritySystemEnable
2884                     	xdef	_CLK_PeripheralClockConfig
2885                     	xdef	_CLK_BEEPClockConfig
2886                     	xdef	_CLK_RTCClockConfig
2887                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2888                     	xdef	_CLK_SYSCLKDivConfig
2889                     	xdef	_CLK_GetClockFreq
2890                     	xdef	_CLK_GetSYSCLKSource
2891                     	xdef	_CLK_SYSCLKSourceConfig
2892                     	xdef	_CLK_CCOConfig
2893                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2894                     	xdef	_CLK_ClockSecuritySystemEnable
2895                     	xdef	_CLK_LSEConfig
2896                     	xdef	_CLK_HSEConfig
2897                     	xdef	_CLK_LSICmd
2898                     	xdef	_CLK_AdjustHSICalibrationValue
2899                     	xdef	_CLK_HSICmd
2900                     	xdef	_CLK_DeInit
2901                     	xref.b	c_lreg
2902                     	xref.b	c_x
2921                     	xref	c_ludv
2922                     	xref	c_rtol
2923                     	xref	c_ltor
2924                     	end
