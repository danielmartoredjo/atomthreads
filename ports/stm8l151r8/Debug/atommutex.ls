   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
 268                     ; 143 uint8_t atomMutexCreate (ATOM_MUTEX *mutex)
 268                     ; 144 {
 270                     .text:	section	.text,new
 271  0000               _atomMutexCreate:
 273  0000 89            	pushw	x
 274  0001 88            	push	a
 275       00000001      OFST:	set	1
 278                     ; 148     if (mutex == NULL)
 280  0002 a30000        	cpw	x,#0
 281  0005 2606          	jrne	L161
 282                     ; 151         status = ATOM_ERR_PARAM;
 284  0007 a6c9          	ld	a,#201
 285  0009 6b01          	ld	(OFST+0,sp),a
 288  000b 2011          	jra	L361
 289  000d               L161:
 290                     ; 156         mutex->owner = NULL;
 292  000d 1e02          	ldw	x,(OFST+1,sp)
 293  000f 905f          	clrw	y
 294  0011 ef02          	ldw	(2,x),y
 295                     ; 159         mutex->count = 0;
 297  0013 1e02          	ldw	x,(OFST+1,sp)
 298  0015 6f04          	clr	(4,x)
 299                     ; 162         mutex->suspQ = NULL;
 301  0017 1e02          	ldw	x,(OFST+1,sp)
 302  0019 905f          	clrw	y
 303  001b ff            	ldw	(x),y
 304                     ; 165         status = ATOM_OK;
 306  001c 0f01          	clr	(OFST+0,sp)
 308  001e               L361:
 309                     ; 168     return (status);
 311  001e 7b01          	ld	a,(OFST+0,sp)
 314  0020 5b03          	addw	sp,#3
 315  0022 81            	ret
 392                     ; 192 uint8_t atomMutexDelete (ATOM_MUTEX *mutex)
 392                     ; 193 {
 393                     .text:	section	.text,new
 394  0000               _atomMutexDelete:
 396  0000 89            	pushw	x
 397  0001 5205          	subw	sp,#5
 398       00000005      OFST:	set	5
 401                     ; 197     uint8_t woken_threads = FALSE;
 403  0003 0f01          	clr	(OFST-4,sp)
 405                     ; 200     if (mutex == NULL)
 407  0005 a30000        	cpw	x,#0
 408  0008 2608          	jrne	L122
 409                     ; 203         status = ATOM_ERR_PARAM;
 411  000a a6c9          	ld	a,#201
 412  000c 6b02          	ld	(OFST-3,sp),a
 415  000e ac920092      	jpf	L322
 416  0012               L122:
 417                     ; 208         status = ATOM_OK;
 419  0012 0f02          	clr	(OFST-3,sp)
 421  0014               L522:
 422                     ; 214             CRITICAL_START ();
 424  0014 96            	ldw	x,sp
 425  0015 1c0003        	addw	x,#OFST-2
 427  0018 8a            push CC
 428  0019 84            pop a
 429  001a f7            ld (X),A
 430  001b 9b            sim
 432                     ; 217             tcb_ptr = tcbDequeueHead (&mutex->suspQ);
 434  001c 1e06          	ldw	x,(OFST+1,sp)
 435  001e cd0000        	call	_tcbDequeueHead
 437  0021 1f04          	ldw	(OFST-1,sp),x
 439                     ; 220             if (tcb_ptr)
 441  0023 1e04          	ldw	x,(OFST-1,sp)
 442  0025 2752          	jreq	L132
 443                     ; 223                 tcb_ptr->suspend_wake_status = ATOM_ERR_DELETED;
 445  0027 1e04          	ldw	x,(OFST-1,sp)
 446  0029 a6ca          	ld	a,#202
 447  002b e70e          	ld	(14,x),a
 448                     ; 226                 if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 450  002d 1e04          	ldw	x,(OFST-1,sp)
 451  002f 89            	pushw	x
 452  0030 ae0000        	ldw	x,#_tcbReadyQ
 453  0033 cd0000        	call	_tcbEnqueuePriority
 455  0036 85            	popw	x
 456  0037 4d            	tnz	a
 457  0038 270d          	jreq	L332
 458                     ; 229                     CRITICAL_END ();
 460  003a 96            	ldw	x,sp
 461  003b 1c0003        	addw	x,#OFST-2
 463  003e f6            ld A,(X)
 464  003f 88            push A
 465  0040 86            pop CC
 467                     ; 232                     status = ATOM_ERR_QUEUE;
 469  0041 a6cc          	ld	a,#204
 470  0043 6b02          	ld	(OFST-3,sp),a
 472                     ; 233                     break;
 474  0045 2039          	jra	L722
 475  0047               L332:
 476                     ; 237                 if (tcb_ptr->suspend_timo_cb)
 478  0047 1e04          	ldw	x,(OFST-1,sp)
 479  0049 e610          	ld	a,(16,x)
 480  004b ea0f          	or	a,(15,x)
 481  004d 271d          	jreq	L532
 482                     ; 240                     if (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK)
 484  004f 1e04          	ldw	x,(OFST-1,sp)
 485  0051 ee0f          	ldw	x,(15,x)
 486  0053 cd0000        	call	_atomTimerCancel
 488  0056 4d            	tnz	a
 489  0057 270d          	jreq	L732
 490                     ; 243                         CRITICAL_END ();
 492  0059 96            	ldw	x,sp
 493  005a 1c0003        	addw	x,#OFST-2
 495  005d f6            ld A,(X)
 496  005e 88            push A
 497  005f 86            pop CC
 499                     ; 246                         status = ATOM_ERR_TIMER;
 501  0060 a6cd          	ld	a,#205
 502  0062 6b02          	ld	(OFST-3,sp),a
 504                     ; 247                         break;
 506  0064 201a          	jra	L722
 507  0066               L732:
 508                     ; 251                     tcb_ptr->suspend_timo_cb = NULL;
 510  0066 1e04          	ldw	x,(OFST-1,sp)
 511  0068 905f          	clrw	y
 512  006a ef0f          	ldw	(15,x),y
 513  006c               L532:
 514                     ; 256                 CRITICAL_END ();
 516  006c 96            	ldw	x,sp
 517  006d 1c0003        	addw	x,#OFST-2
 519  0070 f6            ld A,(X)
 520  0071 88            push A
 521  0072 86            pop CC
 523                     ; 259                 woken_threads = TRUE;
 525  0073 a601          	ld	a,#1
 526  0075 6b01          	ld	(OFST-4,sp),a
 529  0077 209b          	jra	L522
 530  0079               L132:
 531                     ; 266                 CRITICAL_END ();
 533  0079 96            	ldw	x,sp
 534  007a 1c0003        	addw	x,#OFST-2
 536  007d f6            ld A,(X)
 537  007e 88            push A
 538  007f 86            pop CC
 540                     ; 267                 break;
 541  0080               L722:
 542                     ; 272         if (woken_threads == TRUE)
 544  0080 7b01          	ld	a,(OFST-4,sp)
 545  0082 a101          	cp	a,#1
 546  0084 260c          	jrne	L322
 547                     ; 278             if (atomCurrentContext())
 549  0086 cd0000        	call	_atomCurrentContext
 551  0089 a30000        	cpw	x,#0
 552  008c 2704          	jreq	L322
 553                     ; 279                 atomSched (FALSE);
 555  008e 4f            	clr	a
 556  008f cd0000        	call	_atomSched
 558  0092               L322:
 559                     ; 283     return (status);
 561  0092 7b02          	ld	a,(OFST-3,sp)
 564  0094 5b07          	addw	sp,#7
 565  0096 81            	ret
 694                     ; 339 uint8_t atomMutexGet (ATOM_MUTEX *mutex, int32_t timeout)
 694                     ; 340 {
 695                     .text:	section	.text,new
 696  0000               _atomMutexGet:
 698  0000 89            	pushw	x
 699  0001 5212          	subw	sp,#18
 700       00000012      OFST:	set	18
 703                     ; 348     if (mutex == NULL)
 705  0003 a30000        	cpw	x,#0
 706  0006 2608          	jrne	L333
 707                     ; 351         status = ATOM_ERR_PARAM;
 709  0008 a6c9          	ld	a,#201
 710  000a 6b10          	ld	(OFST-2,sp),a
 713  000c ac210121      	jpf	L533
 714  0010               L333:
 715                     ; 356         curr_tcb_ptr = atomCurrentContext();
 717  0010 cd0000        	call	_atomCurrentContext
 719  0013 1f11          	ldw	(OFST-1,sp),x
 721                     ; 359         CRITICAL_START ();
 723  0015 96            	ldw	x,sp
 724  0016 1c000f        	addw	x,#OFST-3
 726  0019 8a            push CC
 727  001a 84            pop a
 728  001b f7            ld (X),A
 729  001c 9b            sim
 731                     ; 366         if (curr_tcb_ptr == NULL)
 733  001d 1e11          	ldw	x,(OFST-1,sp)
 734  001f 260f          	jrne	L733
 735                     ; 369             CRITICAL_END ();
 737  0021 96            	ldw	x,sp
 738  0022 1c000f        	addw	x,#OFST-3
 740  0025 f6            ld A,(X)
 741  0026 88            push A
 742  0027 86            pop CC
 744                     ; 372             status = ATOM_ERR_CONTEXT;
 746  0028 a6c8          	ld	a,#200
 747  002a 6b10          	ld	(OFST-2,sp),a
 750  002c ac210121      	jpf	L533
 751  0030               L733:
 752                     ; 376         else if ((mutex->owner != NULL) && (mutex->owner != curr_tcb_ptr))
 754  0030 1e13          	ldw	x,(OFST+1,sp)
 755  0032 e603          	ld	a,(3,x)
 756  0034 ea02          	or	a,(2,x)
 757  0036 2603          	jrne	L21
 758  0038 cc00f8        	jp	L343
 759  003b               L21:
 761  003b 1e13          	ldw	x,(OFST+1,sp)
 762  003d 9093          	ldw	y,x
 763  003f 51            	exgw	x,y
 764  0040 ee02          	ldw	x,(2,x)
 765  0042 1311          	cpw	x,(OFST-1,sp)
 766  0044 51            	exgw	x,y
 767  0045 2603          	jrne	L41
 768  0047 cc00f8        	jp	L343
 769  004a               L41:
 770                     ; 379             if (timeout >= 0)
 772  004a 9c            	rvf
 773  004b 9c            	rvf
 774  004c 0d17          	tnz	(OFST+5,sp)
 775  004e 2e03          	jrsge	L61
 776  0050 cc00eb        	jp	L543
 777  0053               L61:
 778                     ; 382                 if (tcbEnqueuePriority (&mutex->suspQ, curr_tcb_ptr) != ATOM_OK)
 780  0053 1e11          	ldw	x,(OFST-1,sp)
 781  0055 89            	pushw	x
 782  0056 1e15          	ldw	x,(OFST+3,sp)
 783  0058 cd0000        	call	_tcbEnqueuePriority
 785  005b 85            	popw	x
 786  005c 4d            	tnz	a
 787  005d 270f          	jreq	L743
 788                     ; 385                     CRITICAL_END ();
 790  005f 96            	ldw	x,sp
 791  0060 1c000f        	addw	x,#OFST-3
 793  0063 f6            ld A,(X)
 794  0064 88            push A
 795  0065 86            pop CC
 797                     ; 388                     status = ATOM_ERR_QUEUE;
 799  0066 a6cc          	ld	a,#204
 800  0068 6b10          	ld	(OFST-2,sp),a
 803  006a ac210121      	jpf	L533
 804  006e               L743:
 805                     ; 393                     curr_tcb_ptr->suspended = TRUE;
 807  006e 1e11          	ldw	x,(OFST-1,sp)
 808  0070 a601          	ld	a,#1
 809  0072 e70d          	ld	(13,x),a
 810                     ; 396                     status = ATOM_OK;
 812  0074 0f10          	clr	(OFST-2,sp)
 814                     ; 399                     if (timeout)
 816  0076 96            	ldw	x,sp
 817  0077 1c0017        	addw	x,#OFST+5
 818  007a cd0000        	call	c_lzmp
 820  007d 2747          	jreq	L353
 821                     ; 402                         timer_data.tcb_ptr = curr_tcb_ptr;
 823  007f 1e11          	ldw	x,(OFST-1,sp)
 824  0081 1f01          	ldw	(OFST-17,sp),x
 826                     ; 403                         timer_data.mutex_ptr = mutex;
 828  0083 1e13          	ldw	x,(OFST+1,sp)
 829  0085 1f03          	ldw	(OFST-15,sp),x
 831                     ; 406                         timer_cb.cb_func = atomMutexTimerCallback;
 833  0087 ae0000        	ldw	x,#L3_atomMutexTimerCallback
 834  008a 1f05          	ldw	(OFST-13,sp),x
 836                     ; 407                         timer_cb.cb_data = (POINTER)&timer_data;
 838  008c 96            	ldw	x,sp
 839  008d 1c0001        	addw	x,#OFST-17
 840  0090 1f07          	ldw	(OFST-11,sp),x
 842                     ; 408                         timer_cb.cb_ticks = timeout;
 844  0092 1e19          	ldw	x,(OFST+7,sp)
 845  0094 1f0b          	ldw	(OFST-7,sp),x
 846  0096 1e17          	ldw	x,(OFST+5,sp)
 847  0098 1f09          	ldw	(OFST-9,sp),x
 849                     ; 415                         curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 851  009a 96            	ldw	x,sp
 852  009b 1c0005        	addw	x,#OFST-13
 853  009e 1611          	ldw	y,(OFST-1,sp)
 854  00a0 90ef0f        	ldw	(15,y),x
 855                     ; 418                         if (atomTimerRegister (&timer_cb) != ATOM_OK)
 857  00a3 96            	ldw	x,sp
 858  00a4 1c0005        	addw	x,#OFST-13
 859  00a7 cd0000        	call	_atomTimerRegister
 861  00aa 4d            	tnz	a
 862  00ab 271f          	jreq	L753
 863                     ; 421                             status = ATOM_ERR_TIMER;
 865  00ad a6cd          	ld	a,#205
 866  00af 6b10          	ld	(OFST-2,sp),a
 868                     ; 424                             (void)tcbDequeueEntry (&mutex->suspQ, curr_tcb_ptr);
 870  00b1 1e11          	ldw	x,(OFST-1,sp)
 871  00b3 89            	pushw	x
 872  00b4 1e15          	ldw	x,(OFST+3,sp)
 873  00b6 cd0000        	call	_tcbDequeueEntry
 875  00b9 85            	popw	x
 876                     ; 425                             curr_tcb_ptr->suspended = FALSE;
 878  00ba 1e11          	ldw	x,(OFST-1,sp)
 879  00bc 6f0d          	clr	(13,x)
 880                     ; 426                             curr_tcb_ptr->suspend_timo_cb = NULL;
 882  00be 1e11          	ldw	x,(OFST-1,sp)
 883  00c0 905f          	clrw	y
 884  00c2 ef0f          	ldw	(15,x),y
 885  00c4 2006          	jra	L753
 886  00c6               L353:
 887                     ; 434                         curr_tcb_ptr->suspend_timo_cb = NULL;
 889  00c6 1e11          	ldw	x,(OFST-1,sp)
 890  00c8 905f          	clrw	y
 891  00ca ef0f          	ldw	(15,x),y
 892  00cc               L753:
 893                     ; 438                     CRITICAL_END ();
 895  00cc 96            	ldw	x,sp
 896  00cd 1c000f        	addw	x,#OFST-3
 898  00d0 f6            ld A,(X)
 899  00d1 88            push A
 900  00d2 86            pop CC
 902                     ; 441                     if (status == ATOM_OK)
 904  00d3 0d10          	tnz	(OFST-2,sp)
 905  00d5 264a          	jrne	L533
 906                     ; 448                         atomSched (FALSE);
 908  00d7 4f            	clr	a
 909  00d8 cd0000        	call	_atomSched
 911                     ; 454                         status = curr_tcb_ptr->suspend_wake_status;
 913  00db 1e11          	ldw	x,(OFST-1,sp)
 914  00dd e60e          	ld	a,(14,x)
 915  00df 6b10          	ld	(OFST-2,sp),a
 917                     ; 466                         if (status == ATOM_OK)
 919  00e1 0d10          	tnz	(OFST-2,sp)
 920  00e3 263c          	jrne	L533
 921                     ; 473                             mutex->count++;
 923  00e5 1e13          	ldw	x,(OFST+1,sp)
 924  00e7 6c04          	inc	(4,x)
 925  00e9 2036          	jra	L533
 926  00eb               L543:
 927                     ; 481                 CRITICAL_END();
 929  00eb 96            	ldw	x,sp
 930  00ec 1c000f        	addw	x,#OFST-3
 932  00ef f6            ld A,(X)
 933  00f0 88            push A
 934  00f1 86            pop CC
 936                     ; 482                 status = ATOM_WOULDBLOCK;
 938  00f2 a603          	ld	a,#3
 939  00f4 6b10          	ld	(OFST-2,sp),a
 941  00f6 2029          	jra	L533
 942  00f8               L343:
 943                     ; 490             if (mutex->count == 255)
 945  00f8 1e13          	ldw	x,(OFST+1,sp)
 946  00fa e604          	ld	a,(4,x)
 947  00fc a1ff          	cp	a,#255
 948  00fe 2606          	jrne	L173
 949                     ; 493                 status = ATOM_ERR_OVF;
 951  0100 a6cb          	ld	a,#203
 952  0102 6b10          	ld	(OFST-2,sp),a
 955  0104 2014          	jra	L373
 956  0106               L173:
 957                     ; 498                 mutex->count++;
 959  0106 1e13          	ldw	x,(OFST+1,sp)
 960  0108 6c04          	inc	(4,x)
 961                     ; 501                 if (mutex->owner == NULL)
 963  010a 1e13          	ldw	x,(OFST+1,sp)
 964  010c e603          	ld	a,(3,x)
 965  010e ea02          	or	a,(2,x)
 966  0110 2606          	jrne	L573
 967                     ; 503                     mutex->owner = curr_tcb_ptr;
 969  0112 1e13          	ldw	x,(OFST+1,sp)
 970  0114 1611          	ldw	y,(OFST-1,sp)
 971  0116 ef02          	ldw	(2,x),y
 972  0118               L573:
 973                     ; 507                 status = ATOM_OK;
 975  0118 0f10          	clr	(OFST-2,sp)
 977  011a               L373:
 978                     ; 511             CRITICAL_END ();
 980  011a 96            	ldw	x,sp
 981  011b 1c000f        	addw	x,#OFST-3
 983  011e f6            ld A,(X)
 984  011f 88            push A
 985  0120 86            pop CC
 987  0121               L533:
 988                     ; 515     return (status);
 990  0121 7b10          	ld	a,(OFST-2,sp)
 993  0123 5b14          	addw	sp,#20
 994  0125 81            	ret
1076                     ; 545 uint8_t atomMutexPut (ATOM_MUTEX * mutex)
1076                     ; 546 {
1077                     .text:	section	.text,new
1078  0000               _atomMutexPut:
1080  0000 89            	pushw	x
1081  0001 5204          	subw	sp,#4
1082       00000004      OFST:	set	4
1085                     ; 552     if (mutex == NULL)
1087  0003 a30000        	cpw	x,#0
1088  0006 2608          	jrne	L734
1089                     ; 555         status = ATOM_ERR_PARAM;
1091  0008 a6c9          	ld	a,#201
1092  000a 6b02          	ld	(OFST-2,sp),a
1095  000c acbd00bd      	jpf	L144
1096  0010               L734:
1097                     ; 560         curr_tcb_ptr = atomCurrentContext();
1099  0010 cd0000        	call	_atomCurrentContext
1101  0013 1f03          	ldw	(OFST-1,sp),x
1103                     ; 563         CRITICAL_START ();
1105  0015 96            	ldw	x,sp
1106  0016 1c0001        	addw	x,#OFST-3
1108  0019 8a            push CC
1109  001a 84            pop a
1110  001b f7            ld (X),A
1111  001c 9b            sim
1113                     ; 566         if (mutex->owner != curr_tcb_ptr)
1115  001d 1e05          	ldw	x,(OFST+1,sp)
1116  001f 9093          	ldw	y,x
1117  0021 51            	exgw	x,y
1118  0022 ee02          	ldw	x,(2,x)
1119  0024 1303          	cpw	x,(OFST-1,sp)
1120  0026 51            	exgw	x,y
1121  0027 270f          	jreq	L344
1122                     ; 569             CRITICAL_END ();
1124  0029 96            	ldw	x,sp
1125  002a 1c0001        	addw	x,#OFST-3
1127  002d f6            ld A,(X)
1128  002e 88            push A
1129  002f 86            pop CC
1131                     ; 572             status = ATOM_ERR_OWNERSHIP;
1133  0030 a6cf          	ld	a,#207
1134  0032 6b02          	ld	(OFST-2,sp),a
1137  0034 acbd00bd      	jpf	L144
1138  0038               L344:
1139                     ; 577             mutex->count--;
1141  0038 1e05          	ldw	x,(OFST+1,sp)
1142  003a 6a04          	dec	(4,x)
1143                     ; 580             if (mutex->count == 0)
1145  003c 1e05          	ldw	x,(OFST+1,sp)
1146  003e 6d04          	tnz	(4,x)
1147  0040 2702          	jreq	L22
1148  0042 2070          	jp	L744
1149  0044               L22:
1150                     ; 583                 mutex->owner = NULL;
1152  0044 1e05          	ldw	x,(OFST+1,sp)
1153  0046 905f          	clrw	y
1154  0048 ef02          	ldw	(2,x),y
1155                     ; 586                 if (mutex->suspQ)
1157  004a 1e05          	ldw	x,(OFST+1,sp)
1158  004c e601          	ld	a,(1,x)
1159  004e fa            	or	a,(x)
1160  004f 2758          	jreq	L154
1161                     ; 593                     tcb_ptr = tcbDequeueHead (&mutex->suspQ);
1163  0051 1e05          	ldw	x,(OFST+1,sp)
1164  0053 cd0000        	call	_tcbDequeueHead
1166  0056 1f03          	ldw	(OFST-1,sp),x
1168                     ; 594                     if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
1170  0058 1e03          	ldw	x,(OFST-1,sp)
1171  005a 89            	pushw	x
1172  005b ae0000        	ldw	x,#_tcbReadyQ
1173  005e cd0000        	call	_tcbEnqueuePriority
1175  0061 85            	popw	x
1176  0062 4d            	tnz	a
1177  0063 270d          	jreq	L354
1178                     ; 597                         CRITICAL_END ();
1180  0065 96            	ldw	x,sp
1181  0066 1c0001        	addw	x,#OFST-3
1183  0069 f6            ld A,(X)
1184  006a 88            push A
1185  006b 86            pop CC
1187                     ; 600                         status = ATOM_ERR_QUEUE;
1189  006c a6cc          	ld	a,#204
1190  006e 6b02          	ld	(OFST-2,sp),a
1193  0070 204b          	jra	L144
1194  0072               L354:
1195                     ; 605                         tcb_ptr->suspend_wake_status = ATOM_OK;
1197  0072 1e03          	ldw	x,(OFST-1,sp)
1198  0074 6f0e          	clr	(14,x)
1199                     ; 608                         mutex->owner = tcb_ptr;
1201  0076 1e05          	ldw	x,(OFST+1,sp)
1202  0078 1603          	ldw	y,(OFST-1,sp)
1203  007a ef02          	ldw	(2,x),y
1204                     ; 611                         if ((tcb_ptr->suspend_timo_cb != NULL)
1204                     ; 612                             && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
1206  007c 1e03          	ldw	x,(OFST-1,sp)
1207  007e e610          	ld	a,(16,x)
1208  0080 ea0f          	or	a,(15,x)
1209  0082 2710          	jreq	L754
1211  0084 1e03          	ldw	x,(OFST-1,sp)
1212  0086 ee0f          	ldw	x,(15,x)
1213  0088 cd0000        	call	_atomTimerCancel
1215  008b 4d            	tnz	a
1216  008c 2706          	jreq	L754
1217                     ; 615                             status = ATOM_ERR_TIMER;
1219  008e a6cd          	ld	a,#205
1220  0090 6b02          	ld	(OFST-2,sp),a
1223  0092 2008          	jra	L164
1224  0094               L754:
1225                     ; 620                             tcb_ptr->suspend_timo_cb = NULL;
1227  0094 1e03          	ldw	x,(OFST-1,sp)
1228  0096 905f          	clrw	y
1229  0098 ef0f          	ldw	(15,x),y
1230                     ; 623                             status = ATOM_OK;
1232  009a 0f02          	clr	(OFST-2,sp)
1234  009c               L164:
1235                     ; 627                         CRITICAL_END ();
1237  009c 96            	ldw	x,sp
1238  009d 1c0001        	addw	x,#OFST-3
1240  00a0 f6            ld A,(X)
1241  00a1 88            push A
1242  00a2 86            pop CC
1244                     ; 634                         atomSched (FALSE);
1246  00a3 4f            	clr	a
1247  00a4 cd0000        	call	_atomSched
1249  00a7 2014          	jra	L144
1250  00a9               L154:
1251                     ; 645                     CRITICAL_END ();
1253  00a9 96            	ldw	x,sp
1254  00aa 1c0001        	addw	x,#OFST-3
1256  00ad f6            ld A,(X)
1257  00ae 88            push A
1258  00af 86            pop CC
1260                     ; 648                     status = ATOM_OK;
1262  00b0 0f02          	clr	(OFST-2,sp)
1264  00b2 2009          	jra	L144
1265  00b4               L744:
1266                     ; 659                 CRITICAL_END ();
1268  00b4 96            	ldw	x,sp
1269  00b5 1c0001        	addw	x,#OFST-3
1271  00b8 f6            ld A,(X)
1272  00b9 88            push A
1273  00ba 86            pop CC
1275                     ; 662                 status = ATOM_OK;
1277  00bb 0f02          	clr	(OFST-2,sp)
1279  00bd               L144:
1280                     ; 667     return (status);
1282  00bd 7b02          	ld	a,(OFST-2,sp)
1285  00bf 5b06          	addw	sp,#6
1286  00c1 81            	ret
1344                     ; 683 static void atomMutexTimerCallback (POINTER cb_data)
1344                     ; 684 {
1345                     .text:	section	.text,new
1346  0000               L3_atomMutexTimerCallback:
1348  0000 5203          	subw	sp,#3
1349       00000003      OFST:	set	3
1352                     ; 689     timer_data_ptr = (MUTEX_TIMER *)cb_data;
1354  0002 1f02          	ldw	(OFST-1,sp),x
1356                     ; 692     if (timer_data_ptr)
1358  0004 1e02          	ldw	x,(OFST-1,sp)
1359  0006 2734          	jreq	L515
1360                     ; 695         CRITICAL_START ();
1362  0008 96            	ldw	x,sp
1363  0009 1c0001        	addw	x,#OFST-2
1365  000c 8a            push CC
1366  000d 84            pop a
1367  000e f7            ld (X),A
1368  000f 9b            sim
1370                     ; 698         timer_data_ptr->tcb_ptr->suspend_wake_status = ATOM_TIMEOUT;
1372  0010 1e02          	ldw	x,(OFST-1,sp)
1373  0012 fe            	ldw	x,(x)
1374  0013 a602          	ld	a,#2
1375  0015 e70e          	ld	(14,x),a
1376                     ; 701         timer_data_ptr->tcb_ptr->suspend_timo_cb = NULL;
1378  0017 1e02          	ldw	x,(OFST-1,sp)
1379  0019 fe            	ldw	x,(x)
1380  001a 905f          	clrw	y
1381  001c ef0f          	ldw	(15,x),y
1382                     ; 704         (void)tcbDequeueEntry (&timer_data_ptr->mutex_ptr->suspQ, timer_data_ptr->tcb_ptr);
1384  001e 1e02          	ldw	x,(OFST-1,sp)
1385  0020 fe            	ldw	x,(x)
1386  0021 89            	pushw	x
1387  0022 1e04          	ldw	x,(OFST+1,sp)
1388  0024 ee02          	ldw	x,(2,x)
1389  0026 cd0000        	call	_tcbDequeueEntry
1391  0029 85            	popw	x
1392                     ; 707         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1394  002a 1e02          	ldw	x,(OFST-1,sp)
1395  002c fe            	ldw	x,(x)
1396  002d 89            	pushw	x
1397  002e ae0000        	ldw	x,#_tcbReadyQ
1398  0031 cd0000        	call	_tcbEnqueuePriority
1400  0034 85            	popw	x
1401                     ; 710         CRITICAL_END ();
1403  0035 96            	ldw	x,sp
1404  0036 1c0001        	addw	x,#OFST-2
1406  0039 f6            ld A,(X)
1407  003a 88            push A
1408  003b 86            pop CC
1410  003c               L515:
1411                     ; 717 }
1414  003c 5b03          	addw	sp,#3
1415  003e 81            	ret
1428                     	xdef	_atomMutexPut
1429                     	xdef	_atomMutexGet
1430                     	xdef	_atomMutexDelete
1431                     	xdef	_atomMutexCreate
1432                     	xref	_atomCurrentContext
1433                     	xref	_tcbDequeueEntry
1434                     	xref	_tcbDequeueHead
1435                     	xref	_tcbEnqueuePriority
1436                     	xref	_atomSched
1437                     	xref	_tcbReadyQ
1438                     	xref	_atomTimerCancel
1439                     	xref	_atomTimerRegister
1458                     	xref	c_lzmp
1459                     	end
