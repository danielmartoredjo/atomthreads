   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
 330                     ; 145 uint8_t atomQueueCreate (ATOM_QUEUE *qptr, uint8_t *buff_ptr, uint32_t unit_size, uint32_t max_num_msgs)
 330                     ; 146 {
 332                     .text:	section	.text,new
 333  0000               _atomQueueCreate:
 335  0000 89            	pushw	x
 336  0001 88            	push	a
 337       00000001      OFST:	set	1
 340                     ; 150     if ((qptr == NULL) || (buff_ptr == NULL))
 342  0002 a30000        	cpw	x,#0
 343  0005 2704          	jreq	L312
 345  0007 1e06          	ldw	x,(OFST+5,sp)
 346  0009 2609          	jrne	L112
 347  000b               L312:
 348                     ; 153         status = ATOM_ERR_PARAM;
 350  000b a6c9          	ld	a,#201
 351  000d 6b01          	ld	(OFST+0,sp),a
 354  000f               L512:
 355                     ; 180     return (status);
 357  000f 7b01          	ld	a,(OFST+0,sp)
 360  0011 5b03          	addw	sp,#3
 361  0013 81            	ret
 362  0014               L112:
 363                     ; 155     else if ((unit_size == 0) || (max_num_msgs == 0))
 365  0014 96            	ldw	x,sp
 366  0015 1c0008        	addw	x,#OFST+7
 367  0018 cd0000        	call	c_lzmp
 369  001b 2709          	jreq	L122
 371  001d 96            	ldw	x,sp
 372  001e 1c000c        	addw	x,#OFST+11
 373  0021 cd0000        	call	c_lzmp
 375  0024 2606          	jrne	L712
 376  0026               L122:
 377                     ; 158         status = ATOM_ERR_PARAM;
 379  0026 a6c9          	ld	a,#201
 380  0028 6b01          	ld	(OFST+0,sp),a
 383  002a 20e3          	jra	L512
 384  002c               L712:
 385                     ; 163         qptr->buff_ptr = buff_ptr;
 387  002c 1e02          	ldw	x,(OFST+1,sp)
 388  002e 1606          	ldw	y,(OFST+5,sp)
 389  0030 ef04          	ldw	(4,x),y
 390                     ; 164         qptr->unit_size = unit_size;
 392  0032 1e02          	ldw	x,(OFST+1,sp)
 393  0034 7b0b          	ld	a,(OFST+10,sp)
 394  0036 e709          	ld	(9,x),a
 395  0038 7b0a          	ld	a,(OFST+9,sp)
 396  003a e708          	ld	(8,x),a
 397  003c 7b09          	ld	a,(OFST+8,sp)
 398  003e e707          	ld	(7,x),a
 399  0040 7b08          	ld	a,(OFST+7,sp)
 400  0042 e706          	ld	(6,x),a
 401                     ; 165         qptr->max_num_msgs = max_num_msgs;
 403  0044 1e02          	ldw	x,(OFST+1,sp)
 404  0046 7b0f          	ld	a,(OFST+14,sp)
 405  0048 e70d          	ld	(13,x),a
 406  004a 7b0e          	ld	a,(OFST+13,sp)
 407  004c e70c          	ld	(12,x),a
 408  004e 7b0d          	ld	a,(OFST+12,sp)
 409  0050 e70b          	ld	(11,x),a
 410  0052 7b0c          	ld	a,(OFST+11,sp)
 411  0054 e70a          	ld	(10,x),a
 412                     ; 168         qptr->putSuspQ = NULL;
 414  0056 1e02          	ldw	x,(OFST+1,sp)
 415  0058 905f          	clrw	y
 416  005a ff            	ldw	(x),y
 417                     ; 169         qptr->getSuspQ = NULL;
 419  005b 1e02          	ldw	x,(OFST+1,sp)
 420  005d 905f          	clrw	y
 421  005f ef02          	ldw	(2,x),y
 422                     ; 172         qptr->insert_index = 0;
 424  0061 1e02          	ldw	x,(OFST+1,sp)
 425  0063 a600          	ld	a,#0
 426  0065 e711          	ld	(17,x),a
 427  0067 a600          	ld	a,#0
 428  0069 e710          	ld	(16,x),a
 429  006b a600          	ld	a,#0
 430  006d e70f          	ld	(15,x),a
 431  006f a600          	ld	a,#0
 432  0071 e70e          	ld	(14,x),a
 433                     ; 173         qptr->remove_index = 0;
 435  0073 1e02          	ldw	x,(OFST+1,sp)
 436  0075 a600          	ld	a,#0
 437  0077 e715          	ld	(21,x),a
 438  0079 a600          	ld	a,#0
 439  007b e714          	ld	(20,x),a
 440  007d a600          	ld	a,#0
 441  007f e713          	ld	(19,x),a
 442  0081 a600          	ld	a,#0
 443  0083 e712          	ld	(18,x),a
 444                     ; 174         qptr->num_msgs_stored = 0;
 446  0085 1e02          	ldw	x,(OFST+1,sp)
 447  0087 a600          	ld	a,#0
 448  0089 e719          	ld	(25,x),a
 449  008b a600          	ld	a,#0
 450  008d e718          	ld	(24,x),a
 451  008f a600          	ld	a,#0
 452  0091 e717          	ld	(23,x),a
 453  0093 a600          	ld	a,#0
 454  0095 e716          	ld	(22,x),a
 455                     ; 177         status = ATOM_OK;
 457  0097 0f01          	clr	(OFST+0,sp)
 459  0099 cc000f        	jra	L512
 536                     ; 204 uint8_t atomQueueDelete (ATOM_QUEUE *qptr)
 536                     ; 205 {
 537                     .text:	section	.text,new
 538  0000               _atomQueueDelete:
 540  0000 89            	pushw	x
 541  0001 5205          	subw	sp,#5
 542       00000005      OFST:	set	5
 545                     ; 209     uint8_t woken_threads = FALSE;
 547  0003 0f01          	clr	(OFST-4,sp)
 549                     ; 212     if (qptr == NULL)
 551  0005 a30000        	cpw	x,#0
 552  0008 2608          	jrne	L162
 553                     ; 215         status = ATOM_ERR_PARAM;
 555  000a a6c9          	ld	a,#201
 556  000c 6b02          	ld	(OFST-3,sp),a
 559  000e aca300a3      	jpf	L362
 560  0012               L162:
 561                     ; 220         status = ATOM_OK;
 563  0012 0f02          	clr	(OFST-3,sp)
 565  0014               L562:
 566                     ; 226             CRITICAL_START ();
 568  0014 96            	ldw	x,sp
 569  0015 1c0003        	addw	x,#OFST-2
 571  0018 8a            push CC
 572  0019 84            pop a
 573  001a f7            ld (X),A
 574  001b 9b            sim
 576                     ; 229             if (((tcb_ptr = tcbDequeueHead (&qptr->getSuspQ)) != NULL)
 576                     ; 230                 || ((tcb_ptr = tcbDequeueHead (&qptr->putSuspQ)) != NULL))
 578  001c 1e06          	ldw	x,(OFST+1,sp)
 579  001e 5c            	incw	x
 580  001f 5c            	incw	x
 581  0020 cd0000        	call	_tcbDequeueHead
 583  0023 1f04          	ldw	(OFST-1,sp),x
 585  0025 1e04          	ldw	x,(OFST-1,sp)
 586  0027 260b          	jrne	L372
 588  0029 1e06          	ldw	x,(OFST+1,sp)
 589  002b cd0000        	call	_tcbDequeueHead
 591  002e 1f04          	ldw	(OFST-1,sp),x
 593  0030 1e04          	ldw	x,(OFST-1,sp)
 594  0032 2766          	jreq	L172
 595  0034               L372:
 596                     ; 235                 tcb_ptr->suspend_wake_status = ATOM_ERR_DELETED;
 598  0034 1e04          	ldw	x,(OFST-1,sp)
 599  0036 a6ca          	ld	a,#202
 600  0038 e70e          	ld	(14,x),a
 601                     ; 238                 if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 603  003a 1e04          	ldw	x,(OFST-1,sp)
 604  003c 89            	pushw	x
 605  003d ae0000        	ldw	x,#_tcbReadyQ
 606  0040 cd0000        	call	_tcbEnqueuePriority
 608  0043 85            	popw	x
 609  0044 4d            	tnz	a
 610  0045 270d          	jreq	L572
 611                     ; 241                     CRITICAL_END ();
 613  0047 96            	ldw	x,sp
 614  0048 1c0003        	addw	x,#OFST-2
 616  004b f6            ld A,(X)
 617  004c 88            push A
 618  004d 86            pop CC
 620                     ; 244                     status = ATOM_ERR_QUEUE;
 622  004e a6cc          	ld	a,#204
 623  0050 6b02          	ld	(OFST-3,sp),a
 625                     ; 245                     break;
 627  0052 201d          	jra	L762
 628  0054               L572:
 629                     ; 249                 if (tcb_ptr->suspend_timo_cb)
 631  0054 1e04          	ldw	x,(OFST-1,sp)
 632  0056 e610          	ld	a,(16,x)
 633  0058 ea0f          	or	a,(15,x)
 634  005a 272f          	jreq	L772
 635                     ; 252                     if (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK)
 637  005c 1e04          	ldw	x,(OFST-1,sp)
 638  005e ee0f          	ldw	x,(15,x)
 639  0060 cd0000        	call	_atomTimerCancel
 641  0063 4d            	tnz	a
 642  0064 271f          	jreq	L103
 643                     ; 255                         CRITICAL_END ();
 645  0066 96            	ldw	x,sp
 646  0067 1c0003        	addw	x,#OFST-2
 648  006a f6            ld A,(X)
 649  006b 88            push A
 650  006c 86            pop CC
 652                     ; 258                         status = ATOM_ERR_TIMER;
 654  006d a6cd          	ld	a,#205
 655  006f 6b02          	ld	(OFST-3,sp),a
 657                     ; 259                         break;
 658  0071               L762:
 659                     ; 284         if (woken_threads == TRUE)
 661  0071 7b01          	ld	a,(OFST-4,sp)
 662  0073 a101          	cp	a,#1
 663  0075 262c          	jrne	L362
 664                     ; 290             if (atomCurrentContext())
 666  0077 cd0000        	call	_atomCurrentContext
 668  007a a30000        	cpw	x,#0
 669  007d 2724          	jreq	L362
 670                     ; 291                 atomSched (FALSE);
 672  007f 4f            	clr	a
 673  0080 cd0000        	call	_atomSched
 675  0083 201e          	jra	L362
 676  0085               L103:
 677                     ; 263                     tcb_ptr->suspend_timo_cb = NULL;
 679  0085 1e04          	ldw	x,(OFST-1,sp)
 680  0087 905f          	clrw	y
 681  0089 ef0f          	ldw	(15,x),y
 682  008b               L772:
 683                     ; 268                 CRITICAL_END ();
 685  008b 96            	ldw	x,sp
 686  008c 1c0003        	addw	x,#OFST-2
 688  008f f6            ld A,(X)
 689  0090 88            push A
 690  0091 86            pop CC
 692                     ; 271                 woken_threads = TRUE;
 694  0092 a601          	ld	a,#1
 695  0094 6b01          	ld	(OFST-4,sp),a
 698  0096 ac140014      	jpf	L562
 699  009a               L172:
 700                     ; 278                 CRITICAL_END ();
 702  009a 96            	ldw	x,sp
 703  009b 1c0003        	addw	x,#OFST-2
 705  009e f6            ld A,(X)
 706  009f 88            push A
 707  00a0 86            pop CC
 709                     ; 279                 break;
 711  00a1 20ce          	jra	L762
 712  00a3               L362:
 713                     ; 295     return (status);
 715  00a3 7b02          	ld	a,(OFST-3,sp)
 718  00a5 5b07          	addw	sp,#7
 719  00a7 81            	ret
 872                     ; 336 uint8_t atomQueueGet (ATOM_QUEUE *qptr, int32_t timeout, uint8_t *msgptr)
 872                     ; 337 {
 873                     .text:	section	.text,new
 874  0000               _atomQueueGet:
 876  0000 89            	pushw	x
 877  0001 5214          	subw	sp,#20
 878       00000014      OFST:	set	20
 881                     ; 345     if ((qptr == NULL) || (msgptr == NULL))
 883  0003 a30000        	cpw	x,#0
 884  0006 2704          	jreq	L114
 886  0008 1e1d          	ldw	x,(OFST+9,sp)
 887  000a 2609          	jrne	L704
 888  000c               L114:
 889                     ; 348         status = ATOM_ERR_PARAM;
 891  000c a6c9          	ld	a,#201
 892  000e 6b14          	ld	(OFST+0,sp),a
 895  0010               L314:
 896                     ; 501     return (status);
 898  0010 7b14          	ld	a,(OFST+0,sp)
 901  0012 5b16          	addw	sp,#22
 902  0014 81            	ret
 903  0015               L704:
 904                     ; 353         CRITICAL_START ();
 906  0015 96            	ldw	x,sp
 907  0016 1c0011        	addw	x,#OFST-3
 909  0019 8a            push CC
 910  001a 84            pop a
 911  001b f7            ld (X),A
 912  001c 9b            sim
 914                     ; 356         if (qptr->num_msgs_stored == 0)
 916  001d 1e15          	ldw	x,(OFST+1,sp)
 917  001f 1c0016        	addw	x,#22
 918  0022 cd0000        	call	c_lzmp
 920  0025 2703          	jreq	L21
 921  0027 cc0120        	jp	L514
 922  002a               L21:
 923                     ; 359             if (timeout >= 0)
 925  002a 9c            	rvf
 926  002b 9c            	rvf
 927  002c 0d19          	tnz	(OFST+5,sp)
 928  002e 2e03          	jrsge	L41
 929  0030 cc0111        	jp	L714
 930  0033               L41:
 931                     ; 364                 curr_tcb_ptr = atomCurrentContext();
 933  0033 cd0000        	call	_atomCurrentContext
 935  0036 1f12          	ldw	(OFST-2,sp),x
 937                     ; 367                 if (curr_tcb_ptr)
 939  0038 1e12          	ldw	x,(OFST-2,sp)
 940  003a 2603          	jrne	L61
 941  003c cc0102        	jp	L124
 942  003f               L61:
 943                     ; 370                     if (tcbEnqueuePriority (&qptr->getSuspQ, curr_tcb_ptr) == ATOM_OK)
 945  003f 1e12          	ldw	x,(OFST-2,sp)
 946  0041 89            	pushw	x
 947  0042 1e17          	ldw	x,(OFST+3,sp)
 948  0044 5c            	incw	x
 949  0045 5c            	incw	x
 950  0046 cd0000        	call	_tcbEnqueuePriority
 952  0049 85            	popw	x
 953  004a 4d            	tnz	a
 954  004b 2703          	jreq	L02
 955  004d cc00f3        	jp	L324
 956  0050               L02:
 957                     ; 373                         curr_tcb_ptr->suspended = TRUE;
 959  0050 1e12          	ldw	x,(OFST-2,sp)
 960  0052 a601          	ld	a,#1
 961  0054 e70d          	ld	(13,x),a
 962                     ; 376                         status = ATOM_OK;
 964  0056 0f14          	clr	(OFST+0,sp)
 966                     ; 379                         if (timeout)
 968  0058 96            	ldw	x,sp
 969  0059 1c0019        	addw	x,#OFST+5
 970  005c cd0000        	call	c_lzmp
 972  005f 274f          	jreq	L524
 973                     ; 385                             timer_data.tcb_ptr = curr_tcb_ptr;
 975  0061 1e12          	ldw	x,(OFST-2,sp)
 976  0063 1f01          	ldw	(OFST-19,sp),x
 978                     ; 386                             timer_data.queue_ptr = qptr;
 980  0065 1e15          	ldw	x,(OFST+1,sp)
 981  0067 1f03          	ldw	(OFST-17,sp),x
 983                     ; 387                             timer_data.suspQ = &qptr->getSuspQ;
 985  0069 1e15          	ldw	x,(OFST+1,sp)
 986  006b 5c            	incw	x
 987  006c 5c            	incw	x
 988  006d 1f05          	ldw	(OFST-15,sp),x
 990                     ; 390                             timer_cb.cb_func = atomQueueTimerCallback;
 992  006f ae0000        	ldw	x,#L7_atomQueueTimerCallback
 993  0072 1f07          	ldw	(OFST-13,sp),x
 995                     ; 391                             timer_cb.cb_data = (POINTER)&timer_data;
 997  0074 96            	ldw	x,sp
 998  0075 1c0001        	addw	x,#OFST-19
 999  0078 1f09          	ldw	(OFST-11,sp),x
1001                     ; 392                             timer_cb.cb_ticks = timeout;
1003  007a 1e1b          	ldw	x,(OFST+7,sp)
1004  007c 1f0d          	ldw	(OFST-7,sp),x
1005  007e 1e19          	ldw	x,(OFST+5,sp)
1006  0080 1f0b          	ldw	(OFST-9,sp),x
1008                     ; 399                             curr_tcb_ptr->suspend_timo_cb = &timer_cb;
1010  0082 96            	ldw	x,sp
1011  0083 1c0007        	addw	x,#OFST-13
1012  0086 1612          	ldw	y,(OFST-2,sp)
1013  0088 90ef0f        	ldw	(15,y),x
1014                     ; 402                             if (atomTimerRegister (&timer_cb) != ATOM_OK)
1016  008b 96            	ldw	x,sp
1017  008c 1c0007        	addw	x,#OFST-13
1018  008f cd0000        	call	_atomTimerRegister
1020  0092 4d            	tnz	a
1021  0093 2721          	jreq	L134
1022                     ; 405                                 status = ATOM_ERR_TIMER;
1024  0095 a6cd          	ld	a,#205
1025  0097 6b14          	ld	(OFST+0,sp),a
1027                     ; 408                                 (void)tcbDequeueEntry (&qptr->getSuspQ, curr_tcb_ptr);
1029  0099 1e12          	ldw	x,(OFST-2,sp)
1030  009b 89            	pushw	x
1031  009c 1e17          	ldw	x,(OFST+3,sp)
1032  009e 5c            	incw	x
1033  009f 5c            	incw	x
1034  00a0 cd0000        	call	_tcbDequeueEntry
1036  00a3 85            	popw	x
1037                     ; 409                                 curr_tcb_ptr->suspended = FALSE;
1039  00a4 1e12          	ldw	x,(OFST-2,sp)
1040  00a6 6f0d          	clr	(13,x)
1041                     ; 410                                 curr_tcb_ptr->suspend_timo_cb = NULL;
1043  00a8 1e12          	ldw	x,(OFST-2,sp)
1044  00aa 905f          	clrw	y
1045  00ac ef0f          	ldw	(15,x),y
1046  00ae 2006          	jra	L134
1047  00b0               L524:
1048                     ; 418                             curr_tcb_ptr->suspend_timo_cb = NULL;
1050  00b0 1e12          	ldw	x,(OFST-2,sp)
1051  00b2 905f          	clrw	y
1052  00b4 ef0f          	ldw	(15,x),y
1053  00b6               L134:
1054                     ; 422                         CRITICAL_END ();
1056  00b6 96            	ldw	x,sp
1057  00b7 1c0011        	addw	x,#OFST-3
1059  00ba f6            ld A,(X)
1060  00bb 88            push A
1061  00bc 86            pop CC
1063                     ; 425                         if (status == ATOM_OK)
1065  00bd 0d14          	tnz	(OFST+0,sp)
1066  00bf 2703          	jreq	L22
1067  00c1 cc0010        	jp	L314
1068  00c4               L22:
1069                     ; 432                             atomSched (FALSE);
1071  00c4 4f            	clr	a
1072  00c5 cd0000        	call	_atomSched
1074                     ; 439                             status = curr_tcb_ptr->suspend_wake_status;
1076  00c8 1e12          	ldw	x,(OFST-2,sp)
1077  00ca e60e          	ld	a,(14,x)
1078  00cc 6b14          	ld	(OFST+0,sp),a
1080                     ; 449                             if (status == ATOM_OK)
1082  00ce 0d14          	tnz	(OFST+0,sp)
1083  00d0 2703          	jreq	L42
1084  00d2 cc0010        	jp	L314
1085  00d5               L42:
1086                     ; 452                                 CRITICAL_START();
1088  00d5 96            	ldw	x,sp
1089  00d6 1c0011        	addw	x,#OFST-3
1091  00d9 8a            push CC
1092  00da 84            pop a
1093  00db f7            ld (X),A
1094  00dc 9b            sim
1096                     ; 455                                 status = queue_remove (qptr, msgptr);
1098  00dd 1e1d          	ldw	x,(OFST+9,sp)
1099  00df 89            	pushw	x
1100  00e0 1e17          	ldw	x,(OFST+3,sp)
1101  00e2 cd0000        	call	L3_queue_remove
1103  00e5 85            	popw	x
1104  00e6 6b14          	ld	(OFST+0,sp),a
1106                     ; 458                                 CRITICAL_END();
1108  00e8 96            	ldw	x,sp
1109  00e9 1c0011        	addw	x,#OFST-3
1111  00ec f6            ld A,(X)
1112  00ed 88            push A
1113  00ee 86            pop CC
1115  00ef ac100010      	jpf	L314
1116  00f3               L324:
1117                     ; 465                         CRITICAL_END ();
1119  00f3 96            	ldw	x,sp
1120  00f4 1c0011        	addw	x,#OFST-3
1122  00f7 f6            ld A,(X)
1123  00f8 88            push A
1124  00f9 86            pop CC
1126                     ; 466                         status = ATOM_ERR_QUEUE;
1128  00fa a6cc          	ld	a,#204
1129  00fc 6b14          	ld	(OFST+0,sp),a
1131  00fe ac100010      	jpf	L314
1132  0102               L124:
1133                     ; 472                     CRITICAL_END ();
1135  0102 96            	ldw	x,sp
1136  0103 1c0011        	addw	x,#OFST-3
1138  0106 f6            ld A,(X)
1139  0107 88            push A
1140  0108 86            pop CC
1142                     ; 473                     status = ATOM_ERR_CONTEXT;
1144  0109 a6c8          	ld	a,#200
1145  010b 6b14          	ld	(OFST+0,sp),a
1147  010d ac100010      	jpf	L314
1148  0111               L714:
1149                     ; 479                 CRITICAL_END();
1151  0111 96            	ldw	x,sp
1152  0112 1c0011        	addw	x,#OFST-3
1154  0115 f6            ld A,(X)
1155  0116 88            push A
1156  0117 86            pop CC
1158                     ; 480                 status = ATOM_WOULDBLOCK;
1160  0118 a603          	ld	a,#3
1161  011a 6b14          	ld	(OFST+0,sp),a
1163  011c ac100010      	jpf	L314
1164  0120               L514:
1165                     ; 486             status = queue_remove (qptr, msgptr);
1167  0120 1e1d          	ldw	x,(OFST+9,sp)
1168  0122 89            	pushw	x
1169  0123 1e17          	ldw	x,(OFST+3,sp)
1170  0125 cd0000        	call	L3_queue_remove
1172  0128 85            	popw	x
1173  0129 6b14          	ld	(OFST+0,sp),a
1175                     ; 489             CRITICAL_END ();
1177  012b 96            	ldw	x,sp
1178  012c 1c0011        	addw	x,#OFST-3
1180  012f f6            ld A,(X)
1181  0130 88            push A
1182  0131 86            pop CC
1184                     ; 496             if (atomCurrentContext())
1186  0132 cd0000        	call	_atomCurrentContext
1188  0135 a30000        	cpw	x,#0
1189  0138 2603          	jrne	L62
1190  013a cc0010        	jp	L314
1191  013d               L62:
1192                     ; 497                 atomSched (FALSE);
1194  013d 4f            	clr	a
1195  013e cd0000        	call	_atomSched
1197  0141 ac100010      	jpf	L314
1306                     ; 542 uint8_t atomQueuePut (ATOM_QUEUE *qptr, int32_t timeout, uint8_t *msgptr)
1306                     ; 543 {
1307                     .text:	section	.text,new
1308  0000               _atomQueuePut:
1310  0000 89            	pushw	x
1311  0001 5214          	subw	sp,#20
1312       00000014      OFST:	set	20
1315                     ; 551     if ((qptr == NULL) || (msgptr == NULL))
1317  0003 a30000        	cpw	x,#0
1318  0006 2704          	jreq	L325
1320  0008 1e1d          	ldw	x,(OFST+9,sp)
1321  000a 2609          	jrne	L125
1322  000c               L325:
1323                     ; 554         status = ATOM_ERR_PARAM;
1325  000c a6c9          	ld	a,#201
1326  000e 6b14          	ld	(OFST+0,sp),a
1329  0010               L525:
1330                     ; 709     return (status);
1332  0010 7b14          	ld	a,(OFST+0,sp)
1335  0012 5b16          	addw	sp,#22
1336  0014 81            	ret
1337  0015               L125:
1338                     ; 559         CRITICAL_START ();
1340  0015 96            	ldw	x,sp
1341  0016 1c0011        	addw	x,#OFST-3
1343  0019 8a            push CC
1344  001a 84            pop a
1345  001b f7            ld (X),A
1346  001c 9b            sim
1348                     ; 562         if (qptr->num_msgs_stored == qptr->max_num_msgs)
1350  001d 1e15          	ldw	x,(OFST+1,sp)
1351  001f 1c0016        	addw	x,#22
1352  0022 cd0000        	call	c_ltor
1354  0025 1e15          	ldw	x,(OFST+1,sp)
1355  0027 1c000a        	addw	x,#10
1356  002a cd0000        	call	c_lcmp
1358  002d 2703          	jreq	L23
1359  002f cc0122        	jp	L725
1360  0032               L23:
1361                     ; 565             if (timeout >= 0)
1363  0032 9c            	rvf
1364  0033 9c            	rvf
1365  0034 0d19          	tnz	(OFST+5,sp)
1366  0036 2e03          	jrsge	L43
1367  0038 cc0113        	jp	L135
1368  003b               L43:
1369                     ; 570                 curr_tcb_ptr = atomCurrentContext();
1371  003b cd0000        	call	_atomCurrentContext
1373  003e 1f12          	ldw	(OFST-2,sp),x
1375                     ; 573                 if (curr_tcb_ptr)
1377  0040 1e12          	ldw	x,(OFST-2,sp)
1378  0042 2603          	jrne	L63
1379  0044 cc0104        	jp	L335
1380  0047               L63:
1381                     ; 576                     if (tcbEnqueuePriority (&qptr->putSuspQ, curr_tcb_ptr) == ATOM_OK)
1383  0047 1e12          	ldw	x,(OFST-2,sp)
1384  0049 89            	pushw	x
1385  004a 1e17          	ldw	x,(OFST+3,sp)
1386  004c cd0000        	call	_tcbEnqueuePriority
1388  004f 85            	popw	x
1389  0050 4d            	tnz	a
1390  0051 2703          	jreq	L04
1391  0053 cc00f5        	jp	L535
1392  0056               L04:
1393                     ; 579                         curr_tcb_ptr->suspended = TRUE;
1395  0056 1e12          	ldw	x,(OFST-2,sp)
1396  0058 a601          	ld	a,#1
1397  005a e70d          	ld	(13,x),a
1398                     ; 582                         status = ATOM_OK;
1400  005c 0f14          	clr	(OFST+0,sp)
1402                     ; 585                         if (timeout)
1404  005e 96            	ldw	x,sp
1405  005f 1c0019        	addw	x,#OFST+5
1406  0062 cd0000        	call	c_lzmp
1408  0065 274b          	jreq	L735
1409                     ; 591                             timer_data.tcb_ptr = curr_tcb_ptr;
1411  0067 1e12          	ldw	x,(OFST-2,sp)
1412  0069 1f01          	ldw	(OFST-19,sp),x
1414                     ; 592                             timer_data.queue_ptr = qptr;
1416  006b 1e15          	ldw	x,(OFST+1,sp)
1417  006d 1f03          	ldw	(OFST-17,sp),x
1419                     ; 593                             timer_data.suspQ = &qptr->putSuspQ;
1421  006f 1e15          	ldw	x,(OFST+1,sp)
1422  0071 1f05          	ldw	(OFST-15,sp),x
1424                     ; 597                             timer_cb.cb_func = atomQueueTimerCallback;
1426  0073 ae0000        	ldw	x,#L7_atomQueueTimerCallback
1427  0076 1f07          	ldw	(OFST-13,sp),x
1429                     ; 598                             timer_cb.cb_data = (POINTER)&timer_data;
1431  0078 96            	ldw	x,sp
1432  0079 1c0001        	addw	x,#OFST-19
1433  007c 1f09          	ldw	(OFST-11,sp),x
1435                     ; 599                             timer_cb.cb_ticks = timeout;
1437  007e 1e1b          	ldw	x,(OFST+7,sp)
1438  0080 1f0d          	ldw	(OFST-7,sp),x
1439  0082 1e19          	ldw	x,(OFST+5,sp)
1440  0084 1f0b          	ldw	(OFST-9,sp),x
1442                     ; 607                             curr_tcb_ptr->suspend_timo_cb = &timer_cb;
1444  0086 96            	ldw	x,sp
1445  0087 1c0007        	addw	x,#OFST-13
1446  008a 1612          	ldw	y,(OFST-2,sp)
1447  008c 90ef0f        	ldw	(15,y),x
1448                     ; 610                             if (atomTimerRegister (&timer_cb) != ATOM_OK)
1450  008f 96            	ldw	x,sp
1451  0090 1c0007        	addw	x,#OFST-13
1452  0093 cd0000        	call	_atomTimerRegister
1454  0096 4d            	tnz	a
1455  0097 271f          	jreq	L345
1456                     ; 613                                 status = ATOM_ERR_TIMER;
1458  0099 a6cd          	ld	a,#205
1459  009b 6b14          	ld	(OFST+0,sp),a
1461                     ; 616                                 (void)tcbDequeueEntry (&qptr->putSuspQ, curr_tcb_ptr);
1463  009d 1e12          	ldw	x,(OFST-2,sp)
1464  009f 89            	pushw	x
1465  00a0 1e17          	ldw	x,(OFST+3,sp)
1466  00a2 cd0000        	call	_tcbDequeueEntry
1468  00a5 85            	popw	x
1469                     ; 617                                 curr_tcb_ptr->suspended = FALSE;
1471  00a6 1e12          	ldw	x,(OFST-2,sp)
1472  00a8 6f0d          	clr	(13,x)
1473                     ; 618                                 curr_tcb_ptr->suspend_timo_cb = NULL;
1475  00aa 1e12          	ldw	x,(OFST-2,sp)
1476  00ac 905f          	clrw	y
1477  00ae ef0f          	ldw	(15,x),y
1478  00b0 2006          	jra	L345
1479  00b2               L735:
1480                     ; 626                             curr_tcb_ptr->suspend_timo_cb = NULL;
1482  00b2 1e12          	ldw	x,(OFST-2,sp)
1483  00b4 905f          	clrw	y
1484  00b6 ef0f          	ldw	(15,x),y
1485  00b8               L345:
1486                     ; 630                         CRITICAL_END ();
1488  00b8 96            	ldw	x,sp
1489  00b9 1c0011        	addw	x,#OFST-3
1491  00bc f6            ld A,(X)
1492  00bd 88            push A
1493  00be 86            pop CC
1495                     ; 633                         if (status == ATOM_OK)
1497  00bf 0d14          	tnz	(OFST+0,sp)
1498  00c1 2703          	jreq	L24
1499  00c3 cc0010        	jp	L525
1500  00c6               L24:
1501                     ; 640                             atomSched (FALSE);
1503  00c6 4f            	clr	a
1504  00c7 cd0000        	call	_atomSched
1506                     ; 647                             status = curr_tcb_ptr->suspend_wake_status;
1508  00ca 1e12          	ldw	x,(OFST-2,sp)
1509  00cc e60e          	ld	a,(14,x)
1510  00ce 6b14          	ld	(OFST+0,sp),a
1512                     ; 657                             if (status == ATOM_OK)
1514  00d0 0d14          	tnz	(OFST+0,sp)
1515  00d2 2703          	jreq	L44
1516  00d4 cc0010        	jp	L525
1517  00d7               L44:
1518                     ; 660                                 CRITICAL_START();
1520  00d7 96            	ldw	x,sp
1521  00d8 1c0011        	addw	x,#OFST-3
1523  00db 8a            push CC
1524  00dc 84            pop a
1525  00dd f7            ld (X),A
1526  00de 9b            sim
1528                     ; 663                                 status = queue_insert (qptr, msgptr);
1530  00df 1e1d          	ldw	x,(OFST+9,sp)
1531  00e1 89            	pushw	x
1532  00e2 1e17          	ldw	x,(OFST+3,sp)
1533  00e4 cd0000        	call	L5_queue_insert
1535  00e7 85            	popw	x
1536  00e8 6b14          	ld	(OFST+0,sp),a
1538                     ; 666                                 CRITICAL_END();
1540  00ea 96            	ldw	x,sp
1541  00eb 1c0011        	addw	x,#OFST-3
1543  00ee f6            ld A,(X)
1544  00ef 88            push A
1545  00f0 86            pop CC
1547  00f1 ac100010      	jpf	L525
1548  00f5               L535:
1549                     ; 673                         CRITICAL_END ();
1551  00f5 96            	ldw	x,sp
1552  00f6 1c0011        	addw	x,#OFST-3
1554  00f9 f6            ld A,(X)
1555  00fa 88            push A
1556  00fb 86            pop CC
1558                     ; 674                         status = ATOM_ERR_QUEUE;
1560  00fc a6cc          	ld	a,#204
1561  00fe 6b14          	ld	(OFST+0,sp),a
1563  0100 ac100010      	jpf	L525
1564  0104               L335:
1565                     ; 680                     CRITICAL_END ();
1567  0104 96            	ldw	x,sp
1568  0105 1c0011        	addw	x,#OFST-3
1570  0108 f6            ld A,(X)
1571  0109 88            push A
1572  010a 86            pop CC
1574                     ; 681                     status = ATOM_ERR_CONTEXT;
1576  010b a6c8          	ld	a,#200
1577  010d 6b14          	ld	(OFST+0,sp),a
1579  010f ac100010      	jpf	L525
1580  0113               L135:
1581                     ; 687                 CRITICAL_END();
1583  0113 96            	ldw	x,sp
1584  0114 1c0011        	addw	x,#OFST-3
1586  0117 f6            ld A,(X)
1587  0118 88            push A
1588  0119 86            pop CC
1590                     ; 688                 status = ATOM_WOULDBLOCK;
1592  011a a603          	ld	a,#3
1593  011c 6b14          	ld	(OFST+0,sp),a
1595  011e ac100010      	jpf	L525
1596  0122               L725:
1597                     ; 694             status = queue_insert (qptr, msgptr);
1599  0122 1e1d          	ldw	x,(OFST+9,sp)
1600  0124 89            	pushw	x
1601  0125 1e17          	ldw	x,(OFST+3,sp)
1602  0127 cd0000        	call	L5_queue_insert
1604  012a 85            	popw	x
1605  012b 6b14          	ld	(OFST+0,sp),a
1607                     ; 697             CRITICAL_END ();
1609  012d 96            	ldw	x,sp
1610  012e 1c0011        	addw	x,#OFST-3
1612  0131 f6            ld A,(X)
1613  0132 88            push A
1614  0133 86            pop CC
1616                     ; 704             if (atomCurrentContext())
1618  0134 cd0000        	call	_atomCurrentContext
1620  0137 a30000        	cpw	x,#0
1621  013a 2603          	jrne	L64
1622  013c cc0010        	jp	L525
1623  013f               L64:
1624                     ; 705                 atomSched (FALSE);
1626  013f 4f            	clr	a
1627  0140 cd0000        	call	_atomSched
1629  0143 ac100010      	jpf	L525
1687                     ; 725 static void atomQueueTimerCallback (POINTER cb_data)
1687                     ; 726 {
1688                     .text:	section	.text,new
1689  0000               L7_atomQueueTimerCallback:
1691  0000 5203          	subw	sp,#3
1692       00000003      OFST:	set	3
1695                     ; 731     timer_data_ptr = (QUEUE_TIMER *)cb_data;
1697  0002 1f02          	ldw	(OFST-1,sp),x
1699                     ; 734     if (timer_data_ptr)
1701  0004 1e02          	ldw	x,(OFST-1,sp)
1702  0006 2734          	jreq	L116
1703                     ; 737         CRITICAL_START ();
1705  0008 96            	ldw	x,sp
1706  0009 1c0001        	addw	x,#OFST-2
1708  000c 8a            push CC
1709  000d 84            pop a
1710  000e f7            ld (X),A
1711  000f 9b            sim
1713                     ; 740         timer_data_ptr->tcb_ptr->suspend_wake_status = ATOM_TIMEOUT;
1715  0010 1e02          	ldw	x,(OFST-1,sp)
1716  0012 fe            	ldw	x,(x)
1717  0013 a602          	ld	a,#2
1718  0015 e70e          	ld	(14,x),a
1719                     ; 743         timer_data_ptr->tcb_ptr->suspend_timo_cb = NULL;
1721  0017 1e02          	ldw	x,(OFST-1,sp)
1722  0019 fe            	ldw	x,(x)
1723  001a 905f          	clrw	y
1724  001c ef0f          	ldw	(15,x),y
1725                     ; 749         (void)tcbDequeueEntry (timer_data_ptr->suspQ, timer_data_ptr->tcb_ptr);
1727  001e 1e02          	ldw	x,(OFST-1,sp)
1728  0020 fe            	ldw	x,(x)
1729  0021 89            	pushw	x
1730  0022 1e04          	ldw	x,(OFST+1,sp)
1731  0024 ee04          	ldw	x,(4,x)
1732  0026 cd0000        	call	_tcbDequeueEntry
1734  0029 85            	popw	x
1735                     ; 752         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1737  002a 1e02          	ldw	x,(OFST-1,sp)
1738  002c fe            	ldw	x,(x)
1739  002d 89            	pushw	x
1740  002e ae0000        	ldw	x,#_tcbReadyQ
1741  0031 cd0000        	call	_tcbEnqueuePriority
1743  0034 85            	popw	x
1744                     ; 755         CRITICAL_END ();
1746  0035 96            	ldw	x,sp
1747  0036 1c0001        	addw	x,#OFST-2
1749  0039 f6            ld A,(X)
1750  003a 88            push A
1751  003b 86            pop CC
1753  003c               L116:
1754                     ; 762 }
1757  003c 5b03          	addw	sp,#3
1758  003e 81            	ret
1829                     ; 787 static uint8_t queue_remove (ATOM_QUEUE *qptr, uint8_t* msgptr)
1829                     ; 788 {
1830                     .text:	section	.text,new
1831  0000               L3_queue_remove:
1833  0000 89            	pushw	x
1834  0001 5207          	subw	sp,#7
1835       00000007      OFST:	set	7
1838                     ; 793     if ((qptr == NULL) || (msgptr == NULL))
1840  0003 a30000        	cpw	x,#0
1841  0006 2704          	jreq	L156
1843  0008 1e0c          	ldw	x,(OFST+5,sp)
1844  000a 2609          	jrne	L746
1845  000c               L156:
1846                     ; 796         status = ATOM_ERR_PARAM;
1848  000c a6c9          	ld	a,#201
1849  000e 6b05          	ld	(OFST-2,sp),a
1852  0010               L356:
1853                     ; 855     return (status);
1855  0010 7b05          	ld	a,(OFST-2,sp)
1858  0012 5b09          	addw	sp,#9
1859  0014 81            	ret
1860  0015               L746:
1861                     ; 801         memcpy (msgptr, (qptr->buff_ptr + qptr->remove_index), qptr->unit_size);
1863  0015 1e08          	ldw	x,(OFST+1,sp)
1864  0017 ee08          	ldw	x,(8,x)
1865  0019 89            	pushw	x
1866  001a 1e0a          	ldw	x,(OFST+3,sp)
1867  001c ee14          	ldw	x,(20,x)
1868  001e 160a          	ldw	y,(OFST+3,sp)
1869  0020 01            	rrwa	x,a
1870  0021 90eb05        	add	a,(5,y)
1871  0024 01            	rrwa	x,a
1872  0025 90e904        	adc	a,(4,y)
1873  0028 01            	rrwa	x,a
1874  0029 89            	pushw	x
1875  002a 1e10          	ldw	x,(OFST+9,sp)
1876  002c cd0000        	call	_memcpy
1878  002f 5b04          	addw	sp,#4
1879                     ; 802         qptr->remove_index += qptr->unit_size;
1881  0031 1e08          	ldw	x,(OFST+1,sp)
1882  0033 1608          	ldw	y,(OFST+1,sp)
1883  0035 90e609        	ld	a,(9,y)
1884  0038 b703          	ld	c_lreg+3,a
1885  003a 90e608        	ld	a,(8,y)
1886  003d b702          	ld	c_lreg+2,a
1887  003f 90e607        	ld	a,(7,y)
1888  0042 b701          	ld	c_lreg+1,a
1889  0044 90e606        	ld	a,(6,y)
1890  0047 b700          	ld	c_lreg,a
1891  0049 1c0012        	addw	x,#18
1892  004c cd0000        	call	c_lgadd
1894                     ; 803         qptr->num_msgs_stored--;
1896  004f 1e08          	ldw	x,(OFST+1,sp)
1897  0051 1c0016        	addw	x,#22
1898  0054 a601          	ld	a,#1
1899  0056 cd0000        	call	c_lgsbc
1901                     ; 806         if (qptr->remove_index >= (qptr->unit_size * qptr->max_num_msgs))
1903  0059 1e08          	ldw	x,(OFST+1,sp)
1904  005b 1c0006        	addw	x,#6
1905  005e cd0000        	call	c_ltor
1907  0061 1e08          	ldw	x,(OFST+1,sp)
1908  0063 1c000a        	addw	x,#10
1909  0066 cd0000        	call	c_lmul
1911  0069 96            	ldw	x,sp
1912  006a 1c0001        	addw	x,#OFST-6
1913  006d cd0000        	call	c_rtol
1916  0070 1e08          	ldw	x,(OFST+1,sp)
1917  0072 1c0012        	addw	x,#18
1918  0075 cd0000        	call	c_ltor
1920  0078 96            	ldw	x,sp
1921  0079 1c0001        	addw	x,#OFST-6
1922  007c cd0000        	call	c_lcmp
1924  007f 2512          	jrult	L556
1925                     ; 807             qptr->remove_index = 0;
1927  0081 1e08          	ldw	x,(OFST+1,sp)
1928  0083 a600          	ld	a,#0
1929  0085 e715          	ld	(21,x),a
1930  0087 a600          	ld	a,#0
1931  0089 e714          	ld	(20,x),a
1932  008b a600          	ld	a,#0
1933  008d e713          	ld	(19,x),a
1934  008f a600          	ld	a,#0
1935  0091 e712          	ld	(18,x),a
1936  0093               L556:
1937                     ; 814         tcb_ptr = tcbDequeueHead (&qptr->putSuspQ);
1939  0093 1e08          	ldw	x,(OFST+1,sp)
1940  0095 cd0000        	call	_tcbDequeueHead
1942  0098 1f06          	ldw	(OFST-1,sp),x
1944                     ; 815         if (tcb_ptr)
1946  009a 1e06          	ldw	x,(OFST-1,sp)
1947  009c 273f          	jreq	L756
1948                     ; 818             if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) == ATOM_OK)
1950  009e 1e06          	ldw	x,(OFST-1,sp)
1951  00a0 89            	pushw	x
1952  00a1 ae0000        	ldw	x,#_tcbReadyQ
1953  00a4 cd0000        	call	_tcbEnqueuePriority
1955  00a7 85            	popw	x
1956  00a8 4d            	tnz	a
1957  00a9 262a          	jrne	L166
1958                     ; 821                 tcb_ptr->suspend_wake_status = ATOM_OK;
1960  00ab 1e06          	ldw	x,(OFST-1,sp)
1961  00ad 6f0e          	clr	(14,x)
1962                     ; 824                 if ((tcb_ptr->suspend_timo_cb != NULL)
1962                     ; 825                     && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
1964  00af 1e06          	ldw	x,(OFST-1,sp)
1965  00b1 e610          	ld	a,(16,x)
1966  00b3 ea0f          	or	a,(15,x)
1967  00b5 2712          	jreq	L366
1969  00b7 1e06          	ldw	x,(OFST-1,sp)
1970  00b9 ee0f          	ldw	x,(15,x)
1971  00bb cd0000        	call	_atomTimerCancel
1973  00be 4d            	tnz	a
1974  00bf 2708          	jreq	L366
1975                     ; 828                     status = ATOM_ERR_TIMER;
1977  00c1 a6cd          	ld	a,#205
1978  00c3 6b05          	ld	(OFST-2,sp),a
1981  00c5 ac100010      	jpf	L356
1982  00c9               L366:
1983                     ; 833                     tcb_ptr->suspend_timo_cb = NULL;
1985  00c9 1e06          	ldw	x,(OFST-1,sp)
1986  00cb 905f          	clrw	y
1987  00cd ef0f          	ldw	(15,x),y
1988                     ; 836                     status = ATOM_OK;
1990  00cf 0f05          	clr	(OFST-2,sp)
1992  00d1 ac100010      	jpf	L356
1993  00d5               L166:
1994                     ; 845                 status = ATOM_ERR_QUEUE;
1996  00d5 a6cc          	ld	a,#204
1997  00d7 6b05          	ld	(OFST-2,sp),a
1999  00d9 ac100010      	jpf	L356
2000  00dd               L756:
2001                     ; 851             status = ATOM_OK;
2003  00dd 0f05          	clr	(OFST-2,sp)
2005  00df ac100010      	jpf	L356
2076                     ; 881 static uint8_t queue_insert (ATOM_QUEUE *qptr, uint8_t* msgptr)
2076                     ; 882 {
2077                     .text:	section	.text,new
2078  0000               L5_queue_insert:
2080  0000 89            	pushw	x
2081  0001 5207          	subw	sp,#7
2082       00000007      OFST:	set	7
2085                     ; 887     if ((qptr == NULL) || (msgptr == NULL))
2087  0003 a30000        	cpw	x,#0
2088  0006 2704          	jreq	L137
2090  0008 1e0c          	ldw	x,(OFST+5,sp)
2091  000a 2609          	jrne	L727
2092  000c               L137:
2093                     ; 890         status = ATOM_ERR_PARAM;
2095  000c a6c9          	ld	a,#201
2096  000e 6b05          	ld	(OFST-2,sp),a
2099  0010               L337:
2100                     ; 949     return (status);
2102  0010 7b05          	ld	a,(OFST-2,sp)
2105  0012 5b09          	addw	sp,#9
2106  0014 81            	ret
2107  0015               L727:
2108                     ; 895         memcpy ((qptr->buff_ptr + qptr->insert_index), msgptr, qptr->unit_size);
2110  0015 1e08          	ldw	x,(OFST+1,sp)
2111  0017 ee10          	ldw	x,(16,x)
2112  0019 1608          	ldw	y,(OFST+1,sp)
2113  001b 01            	rrwa	x,a
2114  001c 90eb05        	add	a,(5,y)
2115  001f 01            	rrwa	x,a
2116  0020 90e904        	adc	a,(4,y)
2117  0023 01            	rrwa	x,a
2118  0024 bf00          	ldw	c_x,x
2119  0026 160c          	ldw	y,(OFST+5,sp)
2120  0028 90bf00        	ldw	c_y,y
2121  002b 1e08          	ldw	x,(OFST+1,sp)
2122  002d ee08          	ldw	x,(8,x)
2123  002f 5d            	tnzw	x
2124  0030 270a          	jreq	L65
2125  0032               L06:
2126  0032 5a            	decw	x
2127  0033 92d600        	ld	a,([c_y.w],x)
2128  0036 92d700        	ld	([c_x.w],x),a
2129  0039 5d            	tnzw	x
2130  003a 26f6          	jrne	L06
2131  003c               L65:
2132                     ; 896         qptr->insert_index += qptr->unit_size;
2134  003c 1e08          	ldw	x,(OFST+1,sp)
2135  003e 1608          	ldw	y,(OFST+1,sp)
2136  0040 90e609        	ld	a,(9,y)
2137  0043 b703          	ld	c_lreg+3,a
2138  0045 90e608        	ld	a,(8,y)
2139  0048 b702          	ld	c_lreg+2,a
2140  004a 90e607        	ld	a,(7,y)
2141  004d b701          	ld	c_lreg+1,a
2142  004f 90e606        	ld	a,(6,y)
2143  0052 b700          	ld	c_lreg,a
2144  0054 1c000e        	addw	x,#14
2145  0057 cd0000        	call	c_lgadd
2147                     ; 897         qptr->num_msgs_stored++;
2149  005a 1e08          	ldw	x,(OFST+1,sp)
2150  005c 1c0016        	addw	x,#22
2151  005f a601          	ld	a,#1
2152  0061 cd0000        	call	c_lgadc
2154                     ; 900         if (qptr->insert_index >= (qptr->unit_size * qptr->max_num_msgs))
2156  0064 1e08          	ldw	x,(OFST+1,sp)
2157  0066 1c0006        	addw	x,#6
2158  0069 cd0000        	call	c_ltor
2160  006c 1e08          	ldw	x,(OFST+1,sp)
2161  006e 1c000a        	addw	x,#10
2162  0071 cd0000        	call	c_lmul
2164  0074 96            	ldw	x,sp
2165  0075 1c0001        	addw	x,#OFST-6
2166  0078 cd0000        	call	c_rtol
2169  007b 1e08          	ldw	x,(OFST+1,sp)
2170  007d 1c000e        	addw	x,#14
2171  0080 cd0000        	call	c_ltor
2173  0083 96            	ldw	x,sp
2174  0084 1c0001        	addw	x,#OFST-6
2175  0087 cd0000        	call	c_lcmp
2177  008a 2512          	jrult	L537
2178                     ; 901             qptr->insert_index = 0;
2180  008c 1e08          	ldw	x,(OFST+1,sp)
2181  008e a600          	ld	a,#0
2182  0090 e711          	ld	(17,x),a
2183  0092 a600          	ld	a,#0
2184  0094 e710          	ld	(16,x),a
2185  0096 a600          	ld	a,#0
2186  0098 e70f          	ld	(15,x),a
2187  009a a600          	ld	a,#0
2188  009c e70e          	ld	(14,x),a
2189  009e               L537:
2190                     ; 908         tcb_ptr = tcbDequeueHead (&qptr->getSuspQ);
2192  009e 1e08          	ldw	x,(OFST+1,sp)
2193  00a0 5c            	incw	x
2194  00a1 5c            	incw	x
2195  00a2 cd0000        	call	_tcbDequeueHead
2197  00a5 1f06          	ldw	(OFST-1,sp),x
2199                     ; 909         if (tcb_ptr)
2201  00a7 1e06          	ldw	x,(OFST-1,sp)
2202  00a9 273f          	jreq	L737
2203                     ; 912             if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) == ATOM_OK)
2205  00ab 1e06          	ldw	x,(OFST-1,sp)
2206  00ad 89            	pushw	x
2207  00ae ae0000        	ldw	x,#_tcbReadyQ
2208  00b1 cd0000        	call	_tcbEnqueuePriority
2210  00b4 85            	popw	x
2211  00b5 4d            	tnz	a
2212  00b6 262a          	jrne	L147
2213                     ; 915                 tcb_ptr->suspend_wake_status = ATOM_OK;
2215  00b8 1e06          	ldw	x,(OFST-1,sp)
2216  00ba 6f0e          	clr	(14,x)
2217                     ; 918                 if ((tcb_ptr->suspend_timo_cb != NULL)
2217                     ; 919                     && (atomTimerCancel (tcb_ptr->suspend_timo_cb) != ATOM_OK))
2219  00bc 1e06          	ldw	x,(OFST-1,sp)
2220  00be e610          	ld	a,(16,x)
2221  00c0 ea0f          	or	a,(15,x)
2222  00c2 2712          	jreq	L347
2224  00c4 1e06          	ldw	x,(OFST-1,sp)
2225  00c6 ee0f          	ldw	x,(15,x)
2226  00c8 cd0000        	call	_atomTimerCancel
2228  00cb 4d            	tnz	a
2229  00cc 2708          	jreq	L347
2230                     ; 922                     status = ATOM_ERR_TIMER;
2232  00ce a6cd          	ld	a,#205
2233  00d0 6b05          	ld	(OFST-2,sp),a
2236  00d2 ac100010      	jpf	L337
2237  00d6               L347:
2238                     ; 927                     tcb_ptr->suspend_timo_cb = NULL;
2240  00d6 1e06          	ldw	x,(OFST-1,sp)
2241  00d8 905f          	clrw	y
2242  00da ef0f          	ldw	(15,x),y
2243                     ; 930                     status = ATOM_OK;
2245  00dc 0f05          	clr	(OFST-2,sp)
2247  00de ac100010      	jpf	L337
2248  00e2               L147:
2249                     ; 939                 status = ATOM_ERR_QUEUE;
2251  00e2 a6cc          	ld	a,#204
2252  00e4 6b05          	ld	(OFST-2,sp),a
2254  00e6 ac100010      	jpf	L337
2255  00ea               L737:
2256                     ; 945             status = ATOM_OK;
2258  00ea 0f05          	clr	(OFST-2,sp)
2260  00ec ac100010      	jpf	L337
2273                     	xdef	_atomQueuePut
2274                     	xdef	_atomQueueGet
2275                     	xdef	_atomQueueDelete
2276                     	xdef	_atomQueueCreate
2277                     	xref	_atomCurrentContext
2278                     	xref	_tcbDequeueEntry
2279                     	xref	_tcbDequeueHead
2280                     	xref	_tcbEnqueuePriority
2281                     	xref	_atomSched
2282                     	xref	_tcbReadyQ
2283                     	xref	_atomTimerCancel
2284                     	xref	_atomTimerRegister
2285                     	xref	_memcpy
2286                     	xref.b	c_lreg
2287                     	xref.b	c_x
2288                     	xref.b	c_y
2307                     	xref	c_lgadc
2308                     	xref	c_rtol
2309                     	xref	c_lmul
2310                     	xref	c_lgsbc
2311                     	xref	c_lgadd
2312                     	xref	c_lcmp
2313                     	xref	c_ltor
2314                     	xref	c_lzmp
2315                     	end
