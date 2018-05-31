   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  17                     	switch	.data
  18  0000               L3_timer_queue:
  19  0000 0000          	dc.w	0
  20  0002               L5_system_ticks:
  21  0002 00000000      	dc.l	0
 126                     ; 125 uint8_t atomTimerRegister (ATOM_TIMER *timer_ptr)
 126                     ; 126 {
 128                     .text:	section	.text,new
 129  0000               _atomTimerRegister:
 131  0000 89            	pushw	x
 132  0001 89            	pushw	x
 133       00000002      OFST:	set	2
 136                     ; 131     if ((timer_ptr == NULL) || (timer_ptr->cb_func == NULL)
 136                     ; 132         || (timer_ptr->cb_ticks == 0))
 138  0002 a30000        	cpw	x,#0
 139  0005 270d          	jreq	L37
 141  0007 e601          	ld	a,(1,x)
 142  0009 fa            	or	a,(x)
 143  000a 2708          	jreq	L37
 145  000c 1c0004        	addw	x,#4
 146  000f cd0000        	call	c_lzmp
 148  0012 2609          	jrne	L17
 149  0014               L37:
 150                     ; 135         status = ATOM_ERR_PARAM;
 152  0014 a6c9          	ld	a,#201
 153  0016 6b02          	ld	(OFST+0,sp),a
 156  0018               L77:
 157                     ; 171     return (status);
 159  0018 7b02          	ld	a,(OFST+0,sp)
 162  001a 5b04          	addw	sp,#4
 163  001c 81            	ret
 164  001d               L17:
 165                     ; 140         CRITICAL_START ();
 167  001d 96            	ldw	x,sp
 168  001e 1c0001        	addw	x,#OFST-1
 170  0021 8a            push CC
 171  0022 84            pop a
 172  0023 f7            ld (X),A
 173  0024 9b            sim
 175                     ; 151         if (timer_queue == NULL)
 177  0025 ce0000        	ldw	x,L3_timer_queue
 178  0028 260d          	jrne	L101
 179                     ; 154             timer_ptr->next_timer = NULL;
 181  002a 1e03          	ldw	x,(OFST+1,sp)
 182  002c 905f          	clrw	y
 183  002e ef08          	ldw	(8,x),y
 184                     ; 155             timer_queue = timer_ptr;
 186  0030 1e03          	ldw	x,(OFST+1,sp)
 187  0032 cf0000        	ldw	L3_timer_queue,x
 189  0035 200d          	jra	L301
 190  0037               L101:
 191                     ; 160             timer_ptr->next_timer = timer_queue;
 193  0037 1e03          	ldw	x,(OFST+1,sp)
 194  0039 90ce0000      	ldw	y,L3_timer_queue
 195  003d ef08          	ldw	(8,x),y
 196                     ; 161             timer_queue = timer_ptr;
 198  003f 1e03          	ldw	x,(OFST+1,sp)
 199  0041 cf0000        	ldw	L3_timer_queue,x
 200  0044               L301:
 201                     ; 165         CRITICAL_END ();
 203  0044 96            	ldw	x,sp
 204  0045 1c0001        	addw	x,#OFST-1
 206  0048 f6            ld A,(X)
 207  0049 88            push A
 208  004a 86            pop CC
 210                     ; 168         status = ATOM_OK;
 212  004b 0f02          	clr	(OFST+0,sp)
 214  004d 20c9          	jra	L77
 290                     ; 190 uint8_t atomTimerCancel (ATOM_TIMER *timer_ptr)
 290                     ; 191 {
 291                     .text:	section	.text,new
 292  0000               _atomTimerCancel:
 294  0000 89            	pushw	x
 295  0001 5206          	subw	sp,#6
 296       00000006      OFST:	set	6
 299                     ; 192     uint8_t status = ATOM_ERR_NOT_FOUND;
 301  0003 a6ce          	ld	a,#206
 302  0005 6b02          	ld	(OFST-4,sp),a
 304                     ; 197     if (timer_ptr == NULL)
 306  0007 a30000        	cpw	x,#0
 307  000a 2609          	jrne	L541
 308                     ; 200         status = ATOM_ERR_PARAM;
 310  000c a6c9          	ld	a,#201
 311  000e 6b02          	ld	(OFST-4,sp),a
 314  0010               L741:
 315                     ; 240     return (status);
 317  0010 7b02          	ld	a,(OFST-4,sp)
 320  0012 5b08          	addw	sp,#8
 321  0014 81            	ret
 322  0015               L541:
 323                     ; 205         CRITICAL_START ();
 325  0015 96            	ldw	x,sp
 326  0016 1c0001        	addw	x,#OFST-5
 328  0019 8a            push CC
 329  001a 84            pop a
 330  001b f7            ld (X),A
 331  001c 9b            sim
 333                     ; 208         prev_ptr = next_ptr = timer_queue;
 335  001d ce0000        	ldw	x,L3_timer_queue
 336  0020 1f05          	ldw	(OFST-1,sp),x
 338  0022 1e05          	ldw	x,(OFST-1,sp)
 339  0024 1f03          	ldw	(OFST-3,sp),x
 342  0026 2036          	jra	L551
 343  0028               L151:
 344                     ; 212             if (next_ptr == timer_ptr)
 346  0028 1e05          	ldw	x,(OFST-1,sp)
 347  002a 1307          	cpw	x,(OFST+1,sp)
 348  002c 2626          	jrne	L161
 349                     ; 214                 if (next_ptr == timer_queue)
 351  002e 1e05          	ldw	x,(OFST-1,sp)
 352  0030 c30000        	cpw	x,L3_timer_queue
 353  0033 2609          	jrne	L361
 354                     ; 217                     timer_queue = next_ptr->next_timer;
 356  0035 1e05          	ldw	x,(OFST-1,sp)
 357  0037 ee08          	ldw	x,(8,x)
 358  0039 cf0000        	ldw	L3_timer_queue,x
 360  003c 200b          	jra	L561
 361  003e               L361:
 362                     ; 222                     prev_ptr->next_timer = next_ptr->next_timer;
 364  003e 1e05          	ldw	x,(OFST-1,sp)
 365  0040 1603          	ldw	y,(OFST-3,sp)
 366  0042 89            	pushw	x
 367  0043 ee08          	ldw	x,(8,x)
 368  0045 90ef08        	ldw	(8,y),x
 369  0048 85            	popw	x
 370  0049               L561:
 371                     ; 226                 status = ATOM_OK;
 373  0049 0f02          	clr	(OFST-4,sp)
 375                     ; 227                 break;
 376  004b               L751:
 377                     ; 237         CRITICAL_END ();
 379  004b 96            	ldw	x,sp
 380  004c 1c0001        	addw	x,#OFST-5
 382  004f f6            ld A,(X)
 383  0050 88            push A
 384  0051 86            pop CC
 386  0052 20bc          	jra	L741
 387  0054               L161:
 388                     ; 231             prev_ptr = next_ptr;
 390  0054 1e05          	ldw	x,(OFST-1,sp)
 391  0056 1f03          	ldw	(OFST-3,sp),x
 393                     ; 232             next_ptr = next_ptr->next_timer;
 395  0058 1e05          	ldw	x,(OFST-1,sp)
 396  005a ee08          	ldw	x,(8,x)
 397  005c 1f05          	ldw	(OFST-1,sp),x
 399  005e               L551:
 400                     ; 209         while (next_ptr)
 402  005e 1e05          	ldw	x,(OFST-1,sp)
 403  0060 26c6          	jrne	L151
 404  0062 20e7          	jra	L751
 428                     ; 254 uint32_t atomTimeGet(void)
 428                     ; 255 {
 429                     .text:	section	.text,new
 430  0000               _atomTimeGet:
 434                     ; 256     return (system_ticks);
 436  0000 ae0002        	ldw	x,#L5_system_ticks
 437  0003 cd0000        	call	c_ltor
 441  0006 81            	ret
 474                     ; 276 void atomTimeSet(uint32_t new_time)
 474                     ; 277 {
 475                     .text:	section	.text,new
 476  0000               _atomTimeSet:
 478       00000000      OFST:	set	0
 481                     ; 278     system_ticks = new_time;
 483  0000 1e05          	ldw	x,(OFST+5,sp)
 484  0002 cf0004        	ldw	L5_system_ticks+2,x
 485  0005 1e03          	ldw	x,(OFST+3,sp)
 486  0007 cf0002        	ldw	L5_system_ticks,x
 487                     ; 279 }
 490  000a 81            	ret
 516                     ; 295 void atomTimerTick (void)
 516                     ; 296 {
 517                     .text:	section	.text,new
 518  0000               _atomTimerTick:
 522                     ; 298     if (atomOSStarted)
 524  0000 725d0000      	tnz	_atomOSStarted
 525  0004 270b          	jreq	L322
 526                     ; 301         system_ticks++;
 528  0006 ae0002        	ldw	x,#L5_system_ticks
 529  0009 a601          	ld	a,#1
 530  000b cd0000        	call	c_lgadc
 532                     ; 304         atomTimerCallbacks ();
 534  000e cd0000        	call	L7_atomTimerCallbacks
 536  0011               L322:
 537                     ; 306 }
 540  0011 81            	ret
 760                     ; 327 uint8_t atomTimerDelay (uint32_t ticks)
 760                     ; 328 {
 761                     .text:	section	.text,new
 762  0000               _atomTimerDelay:
 764  0000 5210          	subw	sp,#16
 765       00000010      OFST:	set	16
 768                     ; 336     curr_tcb_ptr = atomCurrentContext();
 770  0002 cd0000        	call	_atomCurrentContext
 772  0005 1f04          	ldw	(OFST-12,sp),x
 774                     ; 339     if (ticks == 0)
 776  0007 96            	ldw	x,sp
 777  0008 1c0013        	addw	x,#OFST+3
 778  000b cd0000        	call	c_lzmp
 780  000e 2606          	jrne	L353
 781                     ; 342         status = ATOM_ERR_PARAM;
 783  0010 a6c9          	ld	a,#201
 784  0012 6b10          	ld	(OFST+0,sp),a
 787  0014 205c          	jra	L553
 788  0016               L353:
 789                     ; 346     else if (curr_tcb_ptr == NULL)
 791  0016 1e04          	ldw	x,(OFST-12,sp)
 792  0018 2606          	jrne	L753
 793                     ; 349         status = ATOM_ERR_CONTEXT;
 795  001a a6c8          	ld	a,#200
 796  001c 6b10          	ld	(OFST+0,sp),a
 799  001e 2052          	jra	L553
 800  0020               L753:
 801                     ; 356         CRITICAL_START ();
 803  0020 96            	ldw	x,sp
 804  0021 1c0003        	addw	x,#OFST-13
 806  0024 8a            push CC
 807  0025 84            pop a
 808  0026 f7            ld (X),A
 809  0027 9b            sim
 811                     ; 359         curr_tcb_ptr->suspended = TRUE;
 813  0028 1e04          	ldw	x,(OFST-12,sp)
 814  002a a601          	ld	a,#1
 815  002c e70d          	ld	(13,x),a
 816                     ; 364         timer_data.tcb_ptr = curr_tcb_ptr;
 818  002e 1e04          	ldw	x,(OFST-12,sp)
 819  0030 1f01          	ldw	(OFST-15,sp),x
 821                     ; 367         timer_cb.cb_func = atomTimerDelayCallback;
 823  0032 ae0000        	ldw	x,#L11_atomTimerDelayCallback
 824  0035 1f06          	ldw	(OFST-10,sp),x
 826                     ; 368         timer_cb.cb_data = (POINTER)&timer_data;
 828  0037 96            	ldw	x,sp
 829  0038 1c0001        	addw	x,#OFST-15
 830  003b 1f08          	ldw	(OFST-8,sp),x
 832                     ; 369         timer_cb.cb_ticks = ticks;
 834  003d 1e15          	ldw	x,(OFST+5,sp)
 835  003f 1f0c          	ldw	(OFST-4,sp),x
 836  0041 1e13          	ldw	x,(OFST+3,sp)
 837  0043 1f0a          	ldw	(OFST-6,sp),x
 839                     ; 372         curr_tcb_ptr->suspend_timo_cb = &timer_cb;
 841  0045 96            	ldw	x,sp
 842  0046 1c0006        	addw	x,#OFST-10
 843  0049 1604          	ldw	y,(OFST-12,sp)
 844  004b 90ef0f        	ldw	(15,y),x
 845                     ; 375         if (atomTimerRegister (&timer_cb) != ATOM_OK)
 847  004e 96            	ldw	x,sp
 848  004f 1c0006        	addw	x,#OFST-10
 849  0052 cd0000        	call	_atomTimerRegister
 851  0055 4d            	tnz	a
 852  0056 270d          	jreq	L363
 853                     ; 378             CRITICAL_END ();
 855  0058 96            	ldw	x,sp
 856  0059 1c0003        	addw	x,#OFST-13
 858  005c f6            ld A,(X)
 859  005d 88            push A
 860  005e 86            pop CC
 862                     ; 381             status = ATOM_ERR_TIMER;
 864  005f a6cd          	ld	a,#205
 865  0061 6b10          	ld	(OFST+0,sp),a
 868  0063 200d          	jra	L553
 869  0065               L363:
 870                     ; 386             CRITICAL_END ();
 872  0065 96            	ldw	x,sp
 873  0066 1c0003        	addw	x,#OFST-13
 875  0069 f6            ld A,(X)
 876  006a 88            push A
 877  006b 86            pop CC
 879                     ; 389             status = ATOM_OK;
 881  006c 0f10          	clr	(OFST+0,sp)
 883                     ; 392             atomSched (FALSE);
 885  006e 4f            	clr	a
 886  006f cd0000        	call	_atomSched
 888  0072               L553:
 889                     ; 396     return (status);
 891  0072 7b10          	ld	a,(OFST+0,sp)
 894  0074 5b10          	addw	sp,#16
 895  0076 81            	ret
 981                     ; 409 static void atomTimerCallbacks (void)
 981                     ; 410 {
 982                     .text:	section	.text,new
 983  0000               L7_atomTimerCallbacks:
 985  0000 520a          	subw	sp,#10
 986       0000000a      OFST:	set	10
 989                     ; 412     ATOM_TIMER *callback_list_tail = NULL, *callback_list_head = NULL;
 991  0002 5f            	clrw	x
 992  0003 1f07          	ldw	(OFST-3,sp),x
 996  0005 5f            	clrw	x
 997  0006 1f03          	ldw	(OFST-7,sp),x
 999                     ; 418     prev_ptr = next_ptr = timer_queue;
1001  0008 ce0000        	ldw	x,L3_timer_queue
1002  000b 1f09          	ldw	(OFST-1,sp),x
1004  000d 1e09          	ldw	x,(OFST-1,sp)
1005  000f 1f01          	ldw	(OFST-9,sp),x
1008  0011 205a          	jra	L344
1009  0013               L734:
1010                     ; 422         saved_next_ptr = next_ptr->next_timer;
1012  0013 1e09          	ldw	x,(OFST-1,sp)
1013  0015 ee08          	ldw	x,(8,x)
1014  0017 1f05          	ldw	(OFST-5,sp),x
1016                     ; 425         if (--(next_ptr->cb_ticks) == 0)
1018  0019 1e09          	ldw	x,(OFST-1,sp)
1019  001b 1c0004        	addw	x,#4
1020  001e a601          	ld	a,#1
1021  0020 cd0000        	call	c_lgsbc
1023  0023 cd0000        	call	c_lzmp
1025  0026 263d          	jrne	L744
1026                     ; 428             if (next_ptr == timer_queue)
1028  0028 1e09          	ldw	x,(OFST-1,sp)
1029  002a c30000        	cpw	x,L3_timer_queue
1030  002d 2609          	jrne	L154
1031                     ; 431                 timer_queue = next_ptr->next_timer;
1033  002f 1e09          	ldw	x,(OFST-1,sp)
1034  0031 ee08          	ldw	x,(8,x)
1035  0033 cf0000        	ldw	L3_timer_queue,x
1037  0036 200b          	jra	L354
1038  0038               L154:
1039                     ; 436                 prev_ptr->next_timer = next_ptr->next_timer;
1041  0038 1e09          	ldw	x,(OFST-1,sp)
1042  003a 1601          	ldw	y,(OFST-9,sp)
1043  003c 89            	pushw	x
1044  003d ee08          	ldw	x,(8,x)
1045  003f 90ef08        	ldw	(8,y),x
1046  0042 85            	popw	x
1047  0043               L354:
1048                     ; 448             if (callback_list_head == NULL)
1050  0043 1e03          	ldw	x,(OFST-7,sp)
1051  0045 260a          	jrne	L554
1052                     ; 451                 callback_list_head = callback_list_tail = next_ptr;
1054  0047 1e09          	ldw	x,(OFST-1,sp)
1055  0049 1f07          	ldw	(OFST-3,sp),x
1057  004b 1e07          	ldw	x,(OFST-3,sp)
1058  004d 1f03          	ldw	(OFST-7,sp),x
1061  004f 200c          	jra	L754
1062  0051               L554:
1063                     ; 456                 callback_list_tail->next_timer = next_ptr;
1065  0051 1e07          	ldw	x,(OFST-3,sp)
1066  0053 1609          	ldw	y,(OFST-1,sp)
1067  0055 ef08          	ldw	(8,x),y
1068                     ; 457                 callback_list_tail = callback_list_tail->next_timer;
1070  0057 1e07          	ldw	x,(OFST-3,sp)
1071  0059 ee08          	ldw	x,(8,x)
1072  005b 1f07          	ldw	(OFST-3,sp),x
1074  005d               L754:
1075                     ; 461             next_ptr->next_timer = NULL;
1077  005d 1e09          	ldw	x,(OFST-1,sp)
1078  005f 905f          	clrw	y
1079  0061 ef08          	ldw	(8,x),y
1081  0063 2004          	jra	L164
1082  0065               L744:
1083                     ; 474             prev_ptr = next_ptr;
1085  0065 1e09          	ldw	x,(OFST-1,sp)
1086  0067 1f01          	ldw	(OFST-9,sp),x
1088  0069               L164:
1089                     ; 478         next_ptr = saved_next_ptr;
1091  0069 1e05          	ldw	x,(OFST-5,sp)
1092  006b 1f09          	ldw	(OFST-1,sp),x
1094  006d               L344:
1095                     ; 419     while (next_ptr)
1097  006d 1e09          	ldw	x,(OFST-1,sp)
1098  006f 26a2          	jrne	L734
1099                     ; 485     if (callback_list_head)
1101  0071 1e03          	ldw	x,(OFST-7,sp)
1102  0073 2725          	jreq	L364
1103                     ; 488         next_ptr = callback_list_head;
1105  0075 1e03          	ldw	x,(OFST-7,sp)
1106  0077 1f09          	ldw	(OFST-1,sp),x
1109  0079 201b          	jra	L174
1110  007b               L564:
1111                     ; 495             saved_next_ptr = next_ptr->next_timer;
1113  007b 1e09          	ldw	x,(OFST-1,sp)
1114  007d ee08          	ldw	x,(8,x)
1115  007f 1f05          	ldw	(OFST-5,sp),x
1117                     ; 498             if (next_ptr->cb_func)
1119  0081 1e09          	ldw	x,(OFST-1,sp)
1120  0083 e601          	ld	a,(1,x)
1121  0085 fa            	or	a,(x)
1122  0086 270a          	jreq	L574
1123                     ; 500                 next_ptr->cb_func (next_ptr->cb_data);
1125  0088 1e09          	ldw	x,(OFST-1,sp)
1126  008a ee02          	ldw	x,(2,x)
1127  008c 1609          	ldw	y,(OFST-1,sp)
1128  008e 90fe          	ldw	y,(y)
1129  0090 90fd          	call	(y)
1131  0092               L574:
1132                     ; 504             next_ptr = saved_next_ptr;
1134  0092 1e05          	ldw	x,(OFST-5,sp)
1135  0094 1f09          	ldw	(OFST-1,sp),x
1137  0096               L174:
1138                     ; 489         while (next_ptr)
1140  0096 1e09          	ldw	x,(OFST-1,sp)
1141  0098 26e1          	jrne	L564
1142  009a               L364:
1143                     ; 508 }
1146  009a 5b0a          	addw	sp,#10
1147  009c 81            	ret
1204                     ; 522 static void atomTimerDelayCallback (POINTER cb_data)
1204                     ; 523 {
1205                     .text:	section	.text,new
1206  0000               L11_atomTimerDelayCallback:
1208  0000 5203          	subw	sp,#3
1209       00000003      OFST:	set	3
1212                     ; 528     timer_data_ptr = (DELAY_TIMER *)cb_data;
1214  0002 1f02          	ldw	(OFST-1,sp),x
1216                     ; 531     if (timer_data_ptr)
1218  0004 1e02          	ldw	x,(OFST-1,sp)
1219  0006 271a          	jreq	L525
1220                     ; 534         CRITICAL_START ();
1222  0008 96            	ldw	x,sp
1223  0009 1c0001        	addw	x,#OFST-2
1225  000c 8a            push CC
1226  000d 84            pop a
1227  000e f7            ld (X),A
1228  000f 9b            sim
1230                     ; 537         (void)tcbEnqueuePriority (&tcbReadyQ, timer_data_ptr->tcb_ptr);
1232  0010 1e02          	ldw	x,(OFST-1,sp)
1233  0012 fe            	ldw	x,(x)
1234  0013 89            	pushw	x
1235  0014 ae0000        	ldw	x,#_tcbReadyQ
1236  0017 cd0000        	call	_tcbEnqueuePriority
1238  001a 85            	popw	x
1239                     ; 540         CRITICAL_END ();
1241  001b 96            	ldw	x,sp
1242  001c 1c0001        	addw	x,#OFST-2
1244  001f f6            ld A,(X)
1245  0020 88            push A
1246  0021 86            pop CC
1248  0022               L525:
1249                     ; 548 }
1252  0022 5b03          	addw	sp,#3
1253  0024 81            	ret
1287                     	xdef	_atomTimerTick
1288                     	xref	_atomCurrentContext
1289                     	xref	_tcbEnqueuePriority
1290                     	xref	_atomSched
1291                     	xref	_atomOSStarted
1292                     	xref	_tcbReadyQ
1293                     	xdef	_atomTimeSet
1294                     	xdef	_atomTimeGet
1295                     	xdef	_atomTimerDelay
1296                     	xdef	_atomTimerCancel
1297                     	xdef	_atomTimerRegister
1316                     	xref	c_lgsbc
1317                     	xref	c_lgadc
1318                     	xref	c_ltor
1319                     	xref	c_lzmp
1320                     	end
