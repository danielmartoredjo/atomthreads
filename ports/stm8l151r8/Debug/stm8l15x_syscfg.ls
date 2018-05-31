   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  45                     ; 119 void SYSCFG_RIDeInit(void)
  45                     ; 120 {
  47                     .text:	section	.text,new
  48  0000               _SYSCFG_RIDeInit:
  52                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  54  0000 725f5431      	clr	21553
  55                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  57  0004 725f5432      	clr	21554
  58                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  60  0008 725f5439      	clr	21561
  61                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  63  000c 725f543a      	clr	21562
  64                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  66  0010 725f543b      	clr	21563
  67                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  69  0014 725f5457      	clr	21591
  70                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  72  0018 725f543d      	clr	21565
  73                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  75  001c 725f543e      	clr	21566
  76                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  78  0020 725f543f      	clr	21567
  79                     ; 130 }
  82  0024 81            	ret
 341                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 341                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 341                     ; 144 {
 342                     .text:	section	.text,new
 343  0000               _SYSCFG_RITIMInputCaptureConfig:
 345  0000 89            	pushw	x
 346       00000000      OFST:	set	0
 349                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 351                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 353                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
 355  0001 9e            	ld	a,xh
 356  0002 a102          	cp	a,#2
 357  0004 2606          	jrne	L531
 358                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 360  0006 9f            	ld	a,xl
 361  0007 c75431        	ld	21553,a
 363  000a 2005          	jra	L731
 364  000c               L531:
 365                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 367  000c 7b02          	ld	a,(OFST+2,sp)
 368  000e c75432        	ld	21554,a
 369  0011               L731:
 370                     ; 161 }
 373  0011 85            	popw	x
 374  0012 81            	ret
 552                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 552                     ; 185                                  FunctionalState NewState)
 552                     ; 186 {
 553                     .text:	section	.text,new
 554  0000               _SYSCFG_RIAnalogSwitchConfig:
 556  0000 89            	pushw	x
 557  0001 89            	pushw	x
 558       00000002      OFST:	set	2
 561                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 563                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 565                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
 567                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 569  0002 9e            	ld	a,xh
 570  0003 a4f0          	and	a,#240
 571  0005 6b01          	ld	(OFST-1,sp),a
 573                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 575  0007 7b03          	ld	a,(OFST+1,sp)
 576  0009 a40f          	and	a,#15
 577  000b 6b02          	ld	(OFST+0,sp),a
 579                     ; 199   if (NewState != DISABLE)
 581  000d 0d04          	tnz	(OFST+2,sp)
 582  000f 2730          	jreq	L532
 583                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
 585  0011 7b01          	ld	a,(OFST-1,sp)
 586  0013 a110          	cp	a,#16
 587  0015 2615          	jrne	L732
 588                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 590  0017 7b02          	ld	a,(OFST+0,sp)
 591  0019 5f            	clrw	x
 592  001a 97            	ld	xl,a
 593  001b a601          	ld	a,#1
 594  001d 5d            	tnzw	x
 595  001e 2704          	jreq	L21
 596  0020               L41:
 597  0020 48            	sll	a
 598  0021 5a            	decw	x
 599  0022 26fc          	jrne	L41
 600  0024               L21:
 601  0024 ca543d        	or	a,21565
 602  0027 c7543d        	ld	21565,a
 604  002a 2045          	jra	L342
 605  002c               L732:
 606                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 608  002c 7b02          	ld	a,(OFST+0,sp)
 609  002e 5f            	clrw	x
 610  002f 97            	ld	xl,a
 611  0030 a601          	ld	a,#1
 612  0032 5d            	tnzw	x
 613  0033 2704          	jreq	L61
 614  0035               L02:
 615  0035 48            	sll	a
 616  0036 5a            	decw	x
 617  0037 26fc          	jrne	L02
 618  0039               L61:
 619  0039 ca543e        	or	a,21566
 620  003c c7543e        	ld	21566,a
 621  003f 2030          	jra	L342
 622  0041               L532:
 623                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 625  0041 7b01          	ld	a,(OFST-1,sp)
 626  0043 a110          	cp	a,#16
 627  0045 2616          	jrne	L542
 628                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 630  0047 7b02          	ld	a,(OFST+0,sp)
 631  0049 5f            	clrw	x
 632  004a 97            	ld	xl,a
 633  004b a601          	ld	a,#1
 634  004d 5d            	tnzw	x
 635  004e 2704          	jreq	L22
 636  0050               L42:
 637  0050 48            	sll	a
 638  0051 5a            	decw	x
 639  0052 26fc          	jrne	L42
 640  0054               L22:
 641  0054 43            	cpl	a
 642  0055 c4543d        	and	a,21565
 643  0058 c7543d        	ld	21565,a
 645  005b 2014          	jra	L342
 646  005d               L542:
 647                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 649  005d 7b02          	ld	a,(OFST+0,sp)
 650  005f 5f            	clrw	x
 651  0060 97            	ld	xl,a
 652  0061 a601          	ld	a,#1
 653  0063 5d            	tnzw	x
 654  0064 2704          	jreq	L62
 655  0066               L03:
 656  0066 48            	sll	a
 657  0067 5a            	decw	x
 658  0068 26fc          	jrne	L03
 659  006a               L62:
 660  006a 43            	cpl	a
 661  006b c4543e        	and	a,21566
 662  006e c7543e        	ld	21566,a
 663  0071               L342:
 664                     ; 225 }
 667  0071 5b04          	addw	sp,#4
 668  0073 81            	ret
 930                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 930                     ; 235                              FunctionalState NewState)
 930                     ; 236 {
 931                     .text:	section	.text,new
 932  0000               _SYSCFG_RIIOSwitchConfig:
 934  0000 89            	pushw	x
 935  0001 89            	pushw	x
 936       00000002      OFST:	set	2
 939                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 941                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 943                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 945                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 947  0002 9e            	ld	a,xh
 948  0003 a40f          	and	a,#15
 949  0005 6b02          	ld	(OFST+0,sp),a
 951                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 953  0007 7b03          	ld	a,(OFST+1,sp)
 954  0009 a4f0          	and	a,#240
 955  000b 6b01          	ld	(OFST-1,sp),a
 957                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 959  000d 7b01          	ld	a,(OFST-1,sp)
 960  000f a110          	cp	a,#16
 961  0011 2633          	jrne	L373
 962                     ; 252     if (NewState != DISABLE)
 964  0013 0d04          	tnz	(OFST+2,sp)
 965  0015 2717          	jreq	L573
 966                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 968  0017 7b02          	ld	a,(OFST+0,sp)
 969  0019 5f            	clrw	x
 970  001a 97            	ld	xl,a
 971  001b a601          	ld	a,#1
 972  001d 5d            	tnzw	x
 973  001e 2704          	jreq	L43
 974  0020               L63:
 975  0020 48            	sll	a
 976  0021 5a            	decw	x
 977  0022 26fc          	jrne	L63
 978  0024               L43:
 979  0024 ca5439        	or	a,21561
 980  0027 c75439        	ld	21561,a
 982  002a acdd00dd      	jpf	L104
 983  002e               L573:
 984                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 986  002e 7b02          	ld	a,(OFST+0,sp)
 987  0030 5f            	clrw	x
 988  0031 97            	ld	xl,a
 989  0032 a601          	ld	a,#1
 990  0034 5d            	tnzw	x
 991  0035 2704          	jreq	L04
 992  0037               L24:
 993  0037 48            	sll	a
 994  0038 5a            	decw	x
 995  0039 26fc          	jrne	L24
 996  003b               L04:
 997  003b 43            	cpl	a
 998  003c c45439        	and	a,21561
 999  003f c75439        	ld	21561,a
1000  0042 acdd00dd      	jpf	L104
1001  0046               L373:
1002                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
1004  0046 7b01          	ld	a,(OFST-1,sp)
1005  0048 a120          	cp	a,#32
1006  004a 262f          	jrne	L304
1007                     ; 267     if (NewState != DISABLE)
1009  004c 0d04          	tnz	(OFST+2,sp)
1010  004e 2715          	jreq	L504
1011                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1013  0050 7b02          	ld	a,(OFST+0,sp)
1014  0052 5f            	clrw	x
1015  0053 97            	ld	xl,a
1016  0054 a601          	ld	a,#1
1017  0056 5d            	tnzw	x
1018  0057 2704          	jreq	L44
1019  0059               L64:
1020  0059 48            	sll	a
1021  005a 5a            	decw	x
1022  005b 26fc          	jrne	L64
1023  005d               L44:
1024  005d ca543a        	or	a,21562
1025  0060 c7543a        	ld	21562,a
1027  0063 2078          	jra	L104
1028  0065               L504:
1029                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1031  0065 7b02          	ld	a,(OFST+0,sp)
1032  0067 5f            	clrw	x
1033  0068 97            	ld	xl,a
1034  0069 a601          	ld	a,#1
1035  006b 5d            	tnzw	x
1036  006c 2704          	jreq	L05
1037  006e               L25:
1038  006e 48            	sll	a
1039  006f 5a            	decw	x
1040  0070 26fc          	jrne	L25
1041  0072               L05:
1042  0072 43            	cpl	a
1043  0073 c4543a        	and	a,21562
1044  0076 c7543a        	ld	21562,a
1045  0079 2062          	jra	L104
1046  007b               L304:
1047                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
1049  007b 7b01          	ld	a,(OFST-1,sp)
1050  007d a130          	cp	a,#48
1051  007f 262f          	jrne	L314
1052                     ; 282     if (NewState != DISABLE)
1054  0081 0d04          	tnz	(OFST+2,sp)
1055  0083 2715          	jreq	L514
1056                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1058  0085 7b02          	ld	a,(OFST+0,sp)
1059  0087 5f            	clrw	x
1060  0088 97            	ld	xl,a
1061  0089 a601          	ld	a,#1
1062  008b 5d            	tnzw	x
1063  008c 2704          	jreq	L45
1064  008e               L65:
1065  008e 48            	sll	a
1066  008f 5a            	decw	x
1067  0090 26fc          	jrne	L65
1068  0092               L45:
1069  0092 ca543b        	or	a,21563
1070  0095 c7543b        	ld	21563,a
1072  0098 2043          	jra	L104
1073  009a               L514:
1074                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1076  009a 7b02          	ld	a,(OFST+0,sp)
1077  009c 5f            	clrw	x
1078  009d 97            	ld	xl,a
1079  009e a601          	ld	a,#1
1080  00a0 5d            	tnzw	x
1081  00a1 2704          	jreq	L06
1082  00a3               L26:
1083  00a3 48            	sll	a
1084  00a4 5a            	decw	x
1085  00a5 26fc          	jrne	L26
1086  00a7               L06:
1087  00a7 43            	cpl	a
1088  00a8 c4543b        	and	a,21563
1089  00ab c7543b        	ld	21563,a
1090  00ae 202d          	jra	L104
1091  00b0               L314:
1092                     ; 297     if (NewState != DISABLE)
1094  00b0 0d04          	tnz	(OFST+2,sp)
1095  00b2 2715          	jreq	L324
1096                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1098  00b4 7b02          	ld	a,(OFST+0,sp)
1099  00b6 5f            	clrw	x
1100  00b7 97            	ld	xl,a
1101  00b8 a601          	ld	a,#1
1102  00ba 5d            	tnzw	x
1103  00bb 2704          	jreq	L46
1104  00bd               L66:
1105  00bd 48            	sll	a
1106  00be 5a            	decw	x
1107  00bf 26fc          	jrne	L66
1108  00c1               L46:
1109  00c1 ca5457        	or	a,21591
1110  00c4 c75457        	ld	21591,a
1112  00c7 2014          	jra	L104
1113  00c9               L324:
1114                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1116  00c9 7b02          	ld	a,(OFST+0,sp)
1117  00cb 5f            	clrw	x
1118  00cc 97            	ld	xl,a
1119  00cd a601          	ld	a,#1
1120  00cf 5d            	tnzw	x
1121  00d0 2704          	jreq	L07
1122  00d2               L27:
1123  00d2 48            	sll	a
1124  00d3 5a            	decw	x
1125  00d4 26fc          	jrne	L27
1126  00d6               L07:
1127  00d6 43            	cpl	a
1128  00d7 c45457        	and	a,21591
1129  00da c75457        	ld	21591,a
1130  00dd               L104:
1131                     ; 308 }
1134  00dd 5b04          	addw	sp,#4
1135  00df 81            	ret
1215                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1215                     ; 321 {
1216                     .text:	section	.text,new
1217  0000               _SYSCFG_RIResistorConfig:
1219  0000 89            	pushw	x
1220       00000000      OFST:	set	0
1223                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
1225                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1227                     ; 326   if (NewState != DISABLE)
1229  0001 9f            	ld	a,xl
1230  0002 4d            	tnz	a
1231  0003 2709          	jreq	L564
1232                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
1234  0005 9e            	ld	a,xh
1235  0006 ca543f        	or	a,21567
1236  0009 c7543f        	ld	21567,a
1238  000c 2009          	jra	L764
1239  000e               L564:
1240                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
1242  000e 7b01          	ld	a,(OFST+1,sp)
1243  0010 43            	cpl	a
1244  0011 c4543f        	and	a,21567
1245  0014 c7543f        	ld	21567,a
1246  0017               L764:
1247                     ; 336 }
1250  0017 85            	popw	x
1251  0018 81            	ret
1274                     ; 368 void SYSCFG_REMAPDeInit(void)
1274                     ; 369 {
1275                     .text:	section	.text,new
1276  0000               _SYSCFG_REMAPDeInit:
1280                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1282  0000 350c509e      	mov	20638,#12
1283                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1285  0004 725f509f      	clr	20639
1286                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1288  0008 725f509d      	clr	20637
1289                     ; 378 }
1292  000c 81            	ret
1508                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1508                     ; 412 {
1509                     .text:	section	.text,new
1510  0000               _SYSCFG_REMAPPinConfig:
1512  0000 89            	pushw	x
1513  0001 88            	push	a
1514       00000001      OFST:	set	1
1517                     ; 413   uint8_t regindex = 0;
1519                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
1521                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
1523                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1525  0002 9e            	ld	a,xh
1526  0003 6b01          	ld	(OFST+0,sp),a
1528                     ; 422   if (regindex == 0x01)
1530  0005 7b01          	ld	a,(OFST+0,sp)
1531  0007 a101          	cp	a,#1
1532  0009 261e          	jrne	L106
1533                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1535  000b 9f            	ld	a,xl
1536  000c 97            	ld	xl,a
1537  000d a610          	ld	a,#16
1538  000f 42            	mul	x,a
1539  0010 9f            	ld	a,xl
1540  0011 aa0f          	or	a,#15
1541  0013 c4509e        	and	a,20638
1542  0016 c7509e        	ld	20638,a
1543                     ; 425     if (NewState != DISABLE)
1545  0019 0d06          	tnz	(OFST+5,sp)
1546  001b 2742          	jreq	L506
1547                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1549  001d 7b03          	ld	a,(OFST+2,sp)
1550  001f a4f0          	and	a,#240
1551  0021 ca509e        	or	a,20638
1552  0024 c7509e        	ld	20638,a
1553  0027 2036          	jra	L506
1554  0029               L106:
1555                     ; 431   else if (regindex == 0x02)
1557  0029 7b01          	ld	a,(OFST+0,sp)
1558  002b a102          	cp	a,#2
1559  002d 2619          	jrne	L706
1560                     ; 433     if (NewState != DISABLE)
1562  002f 0d06          	tnz	(OFST+5,sp)
1563  0031 270a          	jreq	L116
1564                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1566  0033 c6509f        	ld	a,20639
1567  0036 1a03          	or	a,(OFST+2,sp)
1568  0038 c7509f        	ld	20639,a
1570  003b 2022          	jra	L506
1571  003d               L116:
1572                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1574  003d 7b03          	ld	a,(OFST+2,sp)
1575  003f 43            	cpl	a
1576  0040 c4509f        	and	a,20639
1577  0043 c7509f        	ld	20639,a
1578  0046 2017          	jra	L506
1579  0048               L706:
1580                     ; 445     if (NewState != DISABLE)
1582  0048 0d06          	tnz	(OFST+5,sp)
1583  004a 270a          	jreq	L716
1584                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1586  004c c6509d        	ld	a,20637
1587  004f 1a03          	or	a,(OFST+2,sp)
1588  0051 c7509d        	ld	20637,a
1590  0054 2009          	jra	L506
1591  0056               L716:
1592                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1594  0056 7b03          	ld	a,(OFST+2,sp)
1595  0058 43            	cpl	a
1596  0059 c4509d        	and	a,20637
1597  005c c7509d        	ld	20637,a
1598  005f               L506:
1599                     ; 454 }
1602  005f 5b03          	addw	sp,#3
1603  0061 81            	ret
1709                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1709                     ; 471 {
1710                     .text:	section	.text,new
1711  0000               _SYSCFG_REMAPDMAChannelConfig:
1713  0000 88            	push	a
1714       00000000      OFST:	set	0
1717                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1719                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
1721  0001 a5f0          	bcp	a,#240
1722  0003 270a          	jreq	L566
1723                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1725  0005 c6509e        	ld	a,20638
1726  0008 a4f3          	and	a,#243
1727  000a c7509e        	ld	20638,a
1729  000d 2008          	jra	L766
1730  000f               L566:
1731                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1733  000f c6509e        	ld	a,20638
1734  0012 a4fc          	and	a,#252
1735  0014 c7509e        	ld	20638,a
1736  0017               L766:
1737                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1739  0017 7b01          	ld	a,(OFST+1,sp)
1740  0019 a40f          	and	a,#15
1741  001b ca509e        	or	a,20638
1742  001e c7509e        	ld	20638,a
1743                     ; 489 }
1746  0021 84            	pop	a
1747  0022 81            	ret
1760                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1761                     	xdef	_SYSCFG_REMAPPinConfig
1762                     	xdef	_SYSCFG_REMAPDeInit
1763                     	xdef	_SYSCFG_RIResistorConfig
1764                     	xdef	_SYSCFG_RIIOSwitchConfig
1765                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1766                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1767                     	xdef	_SYSCFG_RIDeInit
1786                     	end
