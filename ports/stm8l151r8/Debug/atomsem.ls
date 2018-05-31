   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
 263                     ; 128 uint8_t atomSemCreate (ATOM_SEM *sem, uint8_t initial_count)
 263                     ; 129 {
 265                     .text:	section	.text,new
 266  0000               _atomSemCreate:
 268  0000 89            	pushw	x
 269  0001 88            	push	a
 270       00000001      OFST:	set	1
 273                     ; 133     if (sem == NULL)
 275  0002 a30000        	cpw	x,#0
 276  0005 2606          	jrne	L551
 277                     ; 136         status = ATOM_ERR_PARAM;
 279  0007 a6c9          	ld	a,#201
 280  0009 6b01          	ld	(OFST+0,sp),a
 283  000b 200d          	jra	L751
 284  000d               L551:
 285                     ; 141         sem->count = initial_count;
 287  000d 7b06          	ld	a,(OFST+5,sp)
 288  000f 1e02          	ldw	x,(OFST+1,sp)
 289  0011 e702          	ld	(2,x),a
 290                     ; 144         sem->suspQ = NULL;
 292  0013 1e02          	ldw	x,(OFST+1,sp)
 293  0015 905f          	clrw	y
 294  0017 ff            	ldw	(x),y
 295                     ; 147         status = ATOM_OK;
 297  0018 0f01          	clr	(OFST+0,sp)
 299  001a               L751:
 300                     ; 150     return (status);
 302  001a 7b01          	ld	a,(OFST+0,sp)
 305  001c 5b03          	addw	sp,#3
 306  001e 81            	ret
 383                     ; 174 uint8_t atomSemDelete (ATOM_SEM *sem)
 383                     ; 175 {
 384                     .text:	section	.text,new
 385  0000               _atomSemDelete:
 387  0000 89            	pushw	x
 388  0001 5205          	subw	sp,#5
 389       00000005      OFST:	set	5
 392                     ; 179     uint8_t woken_threads = FALSE;
 394  0003 0f01          	clr	(OFST-4,sp)
 396                     ; 182     if (sem == NULL)
 398  0005 a30000        	cpw	x,#0
 399  0008 2608          	jrne	L512
 400                     ; 185         status = ATOM_ERR_PARAM;
 402  000a a6c9          	ld	a,#201
 403  000c 6b02          	ld	(OFST-3,sp),a
 406  000e ac920092      	jpf	L712
 407  0012               L512:
 408                     ; 190         status = ATOM_OK;
 410  0012 0f02          	clr	(OFST-3,sp)
 412  0014               L122:
 413                     ; 196             CRITICAL_START ();
 415  0014 96            	ldw	x,sp
 416  0015 1c0003        	addw	x,#OFST-2
 418  0018 8a            push CC
 419  0019 84            pop a
 420  001a f7            ld (X),A
 421  001b 9b            sim
 423                     ; 199             tcb_ptr = tcbDequeueHead (&sem->suspQ);
 425  001c 1e06          	ldw	x,(OFST+1,sp)
 426  001e cd0000        	call	_tcbDequeueHead
 428  0021 1f04          	ldw	(OFST-1,sp),x
 430                     ; 202             if (tcb_ptr)
 432  0023 1e04          	ldw	x,(OFST-1,sp)
 433  0025 2752          	jreq	L522
 434                     ; 205                 tcb_ptr->suspend_wake_status = ATOM_ERR_DELETED;
 436  0027 1e04          	ldw	x,(OFST-1,sp)
 437  0029 a6ca          	ld	a,#202
 438  002b e70e          	ld	(14,x),a
 439                     ; 208                 if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 441  002d 1e04          	ldw	x,(OFST-1,sp)
 442  002f 89            	pushw	x
 443  0030 ae0000        	ldw	x,#_tcbReadyQ
 444  0033 cd0000        	call	_tcbEnqueuePriority
 446  0036 85            	popw	x
 447  0037 4d            	tnz	a
 448  0038 270d          	jreq	L722
 449                     ; 211                     CRITICAL_END ();
 451  003a 96            	ldw	x,sp
 452  003b 1c0003        	addw	x,#OFST-2
 454  003e f6            ld A,(X)
 455  003f 88            push A
 456  0040 86            pop CC
 458                     ; 214                     status = ATOM_ERR_QUEUE;
 460  0041 a6cc          	ld	a,#204
 461  0043 6b02          	ld	(OFST-3,sp),a
 463                     ; 215                     break;
 465  0045 2039          	jra	L322
 466  0047               L722:
 467                     ; 219                 if (tcb_ptr->suspend_timo_cb)
 469  0047 1e04          	ldw	x,(OFST-1,sp)
 470  0049 e610          	ld	a,(16,x)
 471  004b ea0f          	or	a,(15,x)
 472  004d 271d          	jreq	L132
 473                     ; 222                     if (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK)
 475  004f 1e04          	ldw	x,(OFST-1,sp)
 476  0051 ee0f          	ldw	x,(15,x)
 477  0053 cd0000        	call	_atomTimerCancel
 479  0056 4d            	tnz	a
 480  0057 270d          	jreq	L332
 481                     ; 225                         CRITICAL_END ();
 483  0059 96            	ldw	x,sp
 484  005a 1c0003        	addw	x,#OFST-2
 486  005d f6            ld A,(X)
 487  005e 88            push A
 488  005f 86            pop CC
 490                     ; 228                         status = ATOM_ERR_TIMER;
 492  0060 a6cd          	ld	a,#205
 493  0062 6b02          	ld	(OFST-3,sp),a
 495                     ; 229                         break;
 497  0064 201a          	jra	L322
 498  0066               L332:
 499                     ; 233                     tcb_ptr->suspend_timo_cb = NULL;
 501  0066 1e04          	ldw	x,(OFST-1,sp)
 502  0068 905f          	clrw	y
 503  006a ef0f          	ldw	(15,x),y
 504  006c               L132:
 505                     ; 238                 CRITICAL_END ();
 507  006c 96            	ldw	x,sp
 508  006d 1c0003        	addw	x,#OFST-2
 510  0070 f6            ld A,(X)
 511  0071 88            push A
 512  0072 86            pop CC
 514                     ; 241                 woken_threads = TRUE;
 516  0073 a601          	ld	a,#1
 517  0075 6b01          	ld	(OFST-4,sp),a
 520  0077 209b          	jra	L122
 521  0079               L522:
 522                     ; 248                 CRITICAL_END ();
 524  0079 96            	ldw	x,sp
 525  007a 1c0003        	addw	x,#OFST-2
 527  007d f6            ld A,(X)
 528  007e 88            push A
 529  007f 86            pop CC
 531                     ; 249                 break;
 532  0080               L322:
 533                     ; 254         if (woken_threads == TRUE)
 535  0080 7b01          	ld	a,(OFST-4,sp)
 536  0082 a101          	cp	a,#1
 537  0084 260c          	jrne	L712
 538                     ; 260             if (atomCurrentContext())
 540  0086 cd0000        	call	_atomCurrentContext
 542  0089 a30000        	cpw	x,#0
 543  008c 2704          	jreq	L712
 544                     ; 261                 atomSched (FALSE);
 546  008e 4f            	clr	a
 547  008f cd0000        	call	_atomSched
 549  0092               L712:
 550                     ; 265     return (status);
 552  0092 7b02          	ld	a,(OFST-3,sp)
 555  0094 5b07          	addw	sp,#7
 556  0096 81            	ret
 685                     ; 313 uint8_t atomSemGet (ATOM_SEM *sem, int32_t timeout)
 685                     ; 314 {
 686                     .text:	section	.text,new
 687  0000               _atomSemGet:
 689  0000 89            	pushw	x
 690  0001 5212          	subw	sp,#18
 691       00000012      OFST:	set	18
 694                     ; 322     if (sem == NULL)
 696  0003 a30000        	cpw	x,#0
 697  0006 2608          	jrne	L723
 698                     ; 325         status = ATOM_ERR_PARAM;
 700  0008 a6c9          	ld	a,#201
 701  000a 6b10          	ld	(OFST-2,sp),a
 704  000c aced00ed      	jpf	L133
 705  0010               L723:
 706                     ; 330         CRITICAL_START ();
 708  0010 96            	ldw	x,sp
 709  0011 1c000f        	addw	x,#OFST-3
 711  0014 8a            push CC
 712  0015 84            pop a
 713  0016 f7            ld (X),A
 714  0017 9b            sim
 716                     ; 333         if (sem->count == 0)
 718  0018 1e13          	ldw	x,(OFST+1,sp)
 719  001a 6d02          	tnz	(2,x)
 720  001c 2703          	jreq	L21
 721  001e cc00e0        	jp	L333
 722  0021               L21:
 723                     ; 336             if (timeout >= 0)
 725  0021 9c            	rvf
 726  0022 9c            	rvf
 727  0023 0d17          	tnz	(OFST+5,sp)
 728  0025 2e03          	jrsge	L41
 729  0027 cc00d3        	jp	L533
 730  002a               L41:
 731                     ; 341                 curr_tcb_ptr = atomCurrentContext();
 733  002a cd0000        	call	_atomCurrentContext
 735  002d 1f11          	ldw	(OFST-1,sp),x
 737                     ; 344                 if (curr_tcb_ptr)
 739  002f 1e11          	ldw	x,(OFST-1,sp)
 740  0031 2603          	jrne	L61
 741  0033 cc00c6        	jp	L733
 742  0036               L61:
 743                     ; 347                     if (tcbEnqueuePriority (&sem->suspQ, curr_tcb_ptr) != ATOM_OK)
 745  0036 1e11          	ldw	x,(OFST-1,sp)
 746  0038 89            	pushw	x
 747  0039 1e15          	ldw	x,(OFST+3,sp)
 748  003b cd0000        	call	_tcbEnqueuePriority
 750  003e 85            	popw	x
 751  003f 4d            	tnz	a
 752  0040 270f          	jreq	L143
 753                     ; 350                         CRITICAL_END ();
 755  0042 96            	ldw	x,sp
 756  0043 1c000f        	addw	x,#OFST-3
 758  0046 f6            ld A,(X)
 759  0047 88            push A
 760  0048 86            pop CC
 762                     ; 353                         status = ATOM_ERR_QUEUE;
 764  0049 a6cc          	ld	a,#204
 765  004b 6b10          	ld	(OFST-2,sp),a
 768  004d aced00ed      	jpf	L133
 769  0051               L143:
 770                     ; 358                         curr_tcb_ptr->suspended = TRUE;
 772  0051 1e11          	ldw	x,(OFST-1,sp)
 773  0053 a601          	ld	a,#1
 774  0055 e70d          	ld	(13,x),a
 775                     ; 361                         status = ATOM_OK;
 777  0057 0f10          	clr	(OFST-2,sp)
 779                     ; 364                         if (timeout)
 781  0059 96            	ldw	x,sp
 782  005a 1c0017        	addw	x,#OFST+5
 783  005d cd0000        	call	c_lzmp
 785  0060 2747          	jreq	L543
 786                     ; 367                             timer_data.tcb_ptr = curr_tcb_ptr;
 788  0062 1e11          	ldw	x,(OFST-1,sp)
 789  0064 1f01          	ldw	(OFST-17,sp),x
 791                     ; 368                             timer_data.sem_ptr = sem;
 793  0066 1e13          	ldw	x,(OFST+1,sp)
 794  0068 1f03          	ldw	(OFST-15,sp),x
 796                     ; 371                             timer_cb.cb_func = atomSemTimerCallback;
 798  006a ae0000        	ldw	x,#L3_atomSemTimerCallback
 799  006d 1f05          	ldw	(OFST-13,sp),x
 801                     ; 372                             timer_cb.cb_data = (POINTER)&timer_data;
 803  006f 96            	ldw	x,sp
 804  0070 1c0001        	addw	x,#OFST-17
 805  0073 1f07          	ldw	(OFST-11,sp),x
 807                     ; 373                             timer_cb.cb_ticks = timeout;
 809  0075 1e19          	ldw	x,(OFST+7,sp)
 810  0077 1f0b          	ldw	(OFST-7,sp),x
 811  0079 1e17          	ldw	x,(OFST+5,sp)
 812  007b 1f09          	ldw	(OFST-9,sp),x
 814                     ; 380                             curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 816  007d 96            	ldw	x,sp
 817  007e 1c0005        	addw	x,#OFST-13
 818  0081 1611          	ldw	y,(OFST-1,sp)
 819  0083 90ef0f        	ldw	(15,y),x
 820                     ; 383                             if (atomTimerRegister (&timer_cb) != ATOM_OK)
 822  0086 96            	ldw	x,sp
 823  0087 1c0005        	addw	x,#OFST-13
 824  008a cd0000        	call	_atomTimerRegister
 826  008d 4d            	tnz	a
 827  008e 271f          	jreq	L153
 828                     ; 386                                 status = ATOM_ERR_TIMER;
 830  0090 a6cd          	ld	a,#205
 831  0092 6b10          	ld	(OFST-2,sp),a
 833                     ; 389                                 (void)tcbDequeueEntry (&sem->suspQ, curr_tcb_ptr);
 835  0094 1e11          	ldw	x,(OFST-1,sp)
 836  0096 89            	pushw	x
 837  0097 1e15          	ldw	x,(OFST+3,sp)
 838  0099 cd0000        	call	_tcbDequeueEntry
 840  009c 85            	popw	x
 841                     ; 390                                 curr_tcb_ptr->suspended = FALSE;
 843  009d 1e11          	ldw	x,(OFST-1,sp)
 844  009f 6f0d          	clr	(13,x)
 845                     ; 391                                 curr_tcb_ptr->suspend_timo_cb = NULL;
 847  00a1 1e11          	ldw	x,(OFST-1,sp)
 848  00a3 905f          	clrw	y
 849  00a5 ef0f          	ldw	(15,x),y
 850  00a7 2006          	jra	L153
 851  00a9               L543:
 852                     ; 399                             curr_tcb_ptr->suspend_timo_cb = NULL;
 854  00a9 1e11          	ldw	x,(OFST-1,sp)
 855  00ab 905f          	clrw	y
 856  00ad ef0f          	ldw	(15,x),y
 857  00af               L153:
 858                     ; 403                         CRITICAL_END ();
 860  00af 96            	ldw	x,sp
 861  00b0 1c000f        	addw	x,#OFST-3
 863  00b3 f6            ld A,(X)
 864  00b4 88            push A
 865  00b5 86            pop CC
 867                     ; 406                         if (status == ATOM_OK)
 869  00b6 0d10          	tnz	(OFST-2,sp)
 870  00b8 2633          	jrne	L133
 871                     ; 413                             atomSched (FALSE);
 873  00ba 4f            	clr	a
 874  00bb cd0000        	call	_atomSched
 876                     ; 420                             status = curr_tcb_ptr->suspend_wake_status;
 878  00be 1e11          	ldw	x,(OFST-1,sp)
 879  00c0 e60e          	ld	a,(14,x)
 880  00c2 6b10          	ld	(OFST-2,sp),a
 882  00c4 2027          	jra	L133
 883  00c6               L733:
 884                     ; 445                     CRITICAL_END ();
 886  00c6 96            	ldw	x,sp
 887  00c7 1c000f        	addw	x,#OFST-3
 889  00ca f6            ld A,(X)
 890  00cb 88            push A
 891  00cc 86            pop CC
 893                     ; 448                     status = ATOM_ERR_CONTEXT;
 895  00cd a6c8          	ld	a,#200
 896  00cf 6b10          	ld	(OFST-2,sp),a
 898  00d1 201a          	jra	L133
 899  00d3               L533:
 900                     ; 454                 CRITICAL_END();
 902  00d3 96            	ldw	x,sp
 903  00d4 1c000f        	addw	x,#OFST-3
 905  00d7 f6            ld A,(X)
 906  00d8 88            push A
 907  00d9 86            pop CC
 909                     ; 455                 status = ATOM_WOULDBLOCK;
 911  00da a603          	ld	a,#3
 912  00dc 6b10          	ld	(OFST-2,sp),a
 914  00de 200d          	jra	L133
 915  00e0               L333:
 916                     ; 461             sem->count--;
 918  00e0 1e13          	ldw	x,(OFST+1,sp)
 919  00e2 6a02          	dec	(2,x)
 920                     ; 464             CRITICAL_END ();
 922  00e4 96            	ldw	x,sp
 923  00e5 1c000f        	addw	x,#OFST-3
 925  00e8 f6            ld A,(X)
 926  00e9 88            push A
 927  00ea 86            pop CC
 929                     ; 467             status = ATOM_OK;
 931  00eb 0f10          	clr	(OFST-2,sp)
 933  00ed               L133:
 934                     ; 471     return (status);
 936  00ed 7b10          	ld	a,(OFST-2,sp)
 939  00ef 5b14          	addw	sp,#20
 940  00f1 81            	ret
1010                     ; 497 uint8_t atomSemPut (ATOM_SEM * sem)
1010                     ; 498 {
1011                     .text:	section	.text,new
1012  0000               _atomSemPut:
1014  0000 89            	pushw	x
1015  0001 5204          	subw	sp,#4
1016       00000004      OFST:	set	4
1019                     ; 504     if (sem == NULL)
1021  0003 a30000        	cpw	x,#0
1022  0006 2608          	jrne	L514
1023                     ; 507         status = ATOM_ERR_PARAM;
1025  0008 a6c9          	ld	a,#201
1026  000a 6b04          	ld	(OFST+0,sp),a
1029  000c ac940094      	jpf	L714
1030  0010               L514:
1031                     ; 512         CRITICAL_START ();
1033  0010 96            	ldw	x,sp
1034  0011 1c0001        	addw	x,#OFST-3
1036  0014 8a            push CC
1037  0015 84            pop a
1038  0016 f7            ld (X),A
1039  0017 9b            sim
1041                     ; 515         if (sem->suspQ)
1043  0018 1e05          	ldw	x,(OFST+1,sp)
1044  001a e601          	ld	a,(1,x)
1045  001c fa            	or	a,(x)
1046  001d 275a          	jreq	L124
1047                     ; 522             tcb_ptr = tcbDequeueHead (&sem->suspQ);
1049  001f 1e05          	ldw	x,(OFST+1,sp)
1050  0021 cd0000        	call	_tcbDequeueHead
1052  0024 1f02          	ldw	(OFST-2,sp),x
1054                     ; 523             if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
1056  0026 1e02          	ldw	x,(OFST-2,sp)
1057  0028 89            	pushw	x
1058  0029 ae0000        	ldw	x,#_tcbReadyQ
1059  002c cd0000        	call	_tcbEnqueuePriority
1061  002f 85            	popw	x
1062  0030 4d            	tnz	a
1063  0031 270d          	jreq	L324
1064                     ; 526                 CRITICAL_END ();
1066  0033 96            	ldw	x,sp
1067  0034 1c0001        	addw	x,#OFST-3
1069  0037 f6            ld A,(X)
1070  0038 88            push A
1071  0039 86            pop CC
1073                     ; 529                 status = ATOM_ERR_QUEUE;
1075  003a a6cc          	ld	a,#204
1076  003c 6b04          	ld	(OFST+0,sp),a
1079  003e 2054          	jra	L714
1080  0040               L324:
1081                     ; 534                 tcb_ptr->suspend_wake_status = ATOM_OK;
1083  0040 1e02          	ldw	x,(OFST-2,sp)
1084  0042 6f0e          	clr	(14,x)
1085                     ; 537                 if ((tcb_ptr->suspend_timo_cb != NULL)
1085                     ; 538                     && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
1087  0044 1e02          	ldw	x,(OFST-2,sp)
1088  0046 e610          	ld	a,(16,x)
1089  0048 ea0f          	or	a,(15,x)
1090  004a 2710          	jreq	L724
1092  004c 1e02          	ldw	x,(OFST-2,sp)
1093  004e ee0f          	ldw	x,(15,x)
1094  0050 cd0000        	call	_atomTimerCancel
1096  0053 4d            	tnz	a
1097  0054 2706          	jreq	L724
1098                     ; 541                     status = ATOM_ERR_TIMER;
1100  0056 a6cd          	ld	a,#205
1101  0058 6b04          	ld	(OFST+0,sp),a
1104  005a 2008          	jra	L134
1105  005c               L724:
1106                     ; 546                     tcb_ptr->suspend_timo_cb = NULL;
1108  005c 1e02          	ldw	x,(OFST-2,sp)
1109  005e 905f          	clrw	y
1110  0060 ef0f          	ldw	(15,x),y
1111                     ; 549                     status = ATOM_OK;
1113  0062 0f04          	clr	(OFST+0,sp)
1115  0064               L134:
1116                     ; 553                 CRITICAL_END ();
1118  0064 96            	ldw	x,sp
1119  0065 1c0001        	addw	x,#OFST-3
1121  0068 f6            ld A,(X)
1122  0069 88            push A
1123  006a 86            pop CC
1125                     ; 560                 if (atomCurrentContext())
1127  006b cd0000        	call	_atomCurrentContext
1129  006e a30000        	cpw	x,#0
1130  0071 2721          	jreq	L714
1131                     ; 561                     atomSched (FALSE);
1133  0073 4f            	clr	a
1134  0074 cd0000        	call	_atomSched
1136  0077 201b          	jra	L714
1137  0079               L124:
1138                     ; 569             if (sem->count == 255)
1140  0079 1e05          	ldw	x,(OFST+1,sp)
1141  007b e602          	ld	a,(2,x)
1142  007d a1ff          	cp	a,#255
1143  007f 2606          	jrne	L734
1144                     ; 572                 status = ATOM_ERR_OVF;
1146  0081 a6cb          	ld	a,#203
1147  0083 6b04          	ld	(OFST+0,sp),a
1150  0085 2006          	jra	L144
1151  0087               L734:
1152                     ; 577                 sem->count++;
1154  0087 1e05          	ldw	x,(OFST+1,sp)
1155  0089 6c02          	inc	(2,x)
1156                     ; 578                 status = ATOM_OK;
1158  008b 0f04          	clr	(OFST+0,sp)
1160  008d               L144:
1161                     ; 582             CRITICAL_END ();
1163  008d 96            	ldw	x,sp
1164  008e 1c0001        	addw	x,#OFST-3
1166  0091 f6            ld A,(X)
1167  0092 88            push A
1168  0093 86            pop CC
1170  0094               L714:
1171                     ; 586     return (status);
1173  0094 7b04          	ld	a,(OFST+0,sp)
1176  0096 5b06          	addw	sp,#6
1177  0098 81            	ret
1228                     ; 607 uint8_t atomSemResetCount (ATOM_SEM *sem, uint8_t count)
1228                     ; 608 {
1229                     .text:	section	.text,new
1230  0000               _atomSemResetCount:
1232  0000 89            	pushw	x
1233  0001 88            	push	a
1234       00000001      OFST:	set	1
1237                     ; 612     if (sem == NULL)
1239  0002 a30000        	cpw	x,#0
1240  0005 2606          	jrne	L764
1241                     ; 615         status = ATOM_ERR_PARAM;
1243  0007 a6c9          	ld	a,#201
1244  0009 6b01          	ld	(OFST+0,sp),a
1247  000b 2008          	jra	L174
1248  000d               L764:
1249                     ; 620         sem->count = count;
1251  000d 7b06          	ld	a,(OFST+5,sp)
1252  000f 1e02          	ldw	x,(OFST+1,sp)
1253  0011 e702          	ld	(2,x),a
1254                     ; 623         status = ATOM_OK;
1256  0013 0f01          	clr	(OFST+0,sp)
1258  0015               L174:
1259                     ; 626     return (status);
1261  0015 7b01          	ld	a,(OFST+0,sp)
1264  0017 5b03          	addw	sp,#3
1265  0019 81            	ret
1323                     ; 643 static void atomSemTimerCallback (POINTER cb_data)
1323                     ; 644 {
1324                     .text:	section	.text,new
1325  0000               L3_atomSemTimerCallback:
1327  0000 5203          	subw	sp,#3
1328       00000003      OFST:	set	3
1331                     ; 649     timer_data_ptr = (SEM_TIMER *)cb_data;
1333  0002 1f02          	ldw	(OFST-1,sp),x
1335                     ; 652     if (timer_data_ptr)
1337  0004 1e02          	ldw	x,(OFST-1,sp)
1338  0006 2734          	jreq	L125
1339                     ; 655         CRITICAL_START ();
1341  0008 96            	ldw	x,sp
1342  0009 1c0001        	addw	x,#OFST-2
1344  000c 8a            push CC
1345  000d 84            pop a
1346  000e f7            ld (X),A
1347  000f 9b            sim
1349                     ; 658         timer_data_ptr->tcb_ptr->suspend_wake_status = ATOM_TIMEOUT;
1351  0010 1e02          	ldw	x,(OFST-1,sp)
1352  0012 fe            	ldw	x,(x)
1353  0013 a602          	ld	a,#2
1354  0015 e70e          	ld	(14,x),a
1355                     ; 661         timer_data_ptr->tcb_ptr->suspend_timo_cb = NULL;
1357  0017 1e02          	ldw	x,(OFST-1,sp)
1358  0019 fe            	ldw	x,(x)
1359  001a 905f          	clrw	y
1360  001c ef0f          	ldw	(15,x),y
1361                     ; 664         (void)tcbDequeueEntry (&timer_data_ptr->sem_ptr->suspQ, timer_data_ptr->tcb_ptr);
1363  001e 1e02          	ldw	x,(OFST-1,sp)
1364  0020 fe            	ldw	x,(x)
1365  0021 89            	pushw	x
1366  0022 1e04          	ldw	x,(OFST+1,sp)
1367  0024 ee02          	ldw	x,(2,x)
1368  0026 cd0000        	call	_tcbDequeueEntry
1370  0029 85            	popw	x
1371                     ; 667         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1373  002a 1e02          	ldw	x,(OFST-1,sp)
1374  002c fe            	ldw	x,(x)
1375  002d 89            	pushw	x
1376  002e ae0000        	ldw	x,#_tcbReadyQ
1377  0031 cd0000        	call	_tcbEnqueuePriority
1379  0034 85            	popw	x
1380                     ; 670         CRITICAL_END ();
1382  0035 96            	ldw	x,sp
1383  0036 1c0001        	addw	x,#OFST-2
1385  0039 f6            ld A,(X)
1386  003a 88            push A
1387  003b 86            pop CC
1389  003c               L125:
1390                     ; 677 }
1393  003c 5b03          	addw	sp,#3
1394  003e 81            	ret
1407                     	xdef	_atomSemResetCount
1408                     	xdef	_atomSemPut
1409                     	xdef	_atomSemGet
1410                     	xdef	_atomSemDelete
1411                     	xdef	_atomSemCreate
1412                     	xref	_atomCurrentContext
1413                     	xref	_tcbDequeueEntry
1414                     	xref	_tcbDequeueHead
1415                     	xref	_tcbEnqueuePriority
1416                     	xref	_atomSched
1417                     	xref	_tcbReadyQ
1418                     	xref	_atomTimerCancel
1419                     	xref	_atomTimerRegister
1438                     	xref	c_lzmp
1439                     	end
