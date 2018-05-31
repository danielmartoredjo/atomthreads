   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  17                     	switch	.data
  18  0000               _tcbReadyQ:
  19  0000 0000          	dc.w	0
  20  0002               _atomOSStarted:
  21  0002 00            	dc.b	0
  22  0003               L3_curr_tcb:
  23  0003 0000          	dc.w	0
  24  0005               L7_atomIntCnt:
  25  0005 0000          	dc.w	0
 260                     ; 223 void atomSched (uint8_t timer_tick)
 260                     ; 224 {
 262                     .text:	section	.text,new
 263  0000               _atomSched:
 265  0000 88            	push	a
 266  0001 5203          	subw	sp,#3
 267       00000003      OFST:	set	3
 270                     ; 226     ATOM_TCB *new_tcb = NULL;
 272                     ; 234     if (atomOSStarted == FALSE)
 274  0003 725d0002      	tnz	_atomOSStarted
 275  0007 2733          	jreq	L6
 276                     ; 237         return;
 278                     ; 241     CRITICAL_START ();
 280  0009 96            	ldw	x,sp
 281  000a 1c0001        	addw	x,#OFST-2
 283  000d 8a            push CC
 284  000e 84            pop a
 285  000f f7            ld (X),A
 286  0010 9b            sim
 288                     ; 248     if ((curr_tcb->suspended == TRUE) || (curr_tcb->terminated == TRUE))
 290  0011 ce0003        	ldw	x,L3_curr_tcb
 291  0014 e60d          	ld	a,(13,x)
 292  0016 a101          	cp	a,#1
 293  0018 2709          	jreq	L751
 295  001a ce0003        	ldw	x,L3_curr_tcb
 296  001d e611          	ld	a,(17,x)
 297  001f a101          	cp	a,#1
 298  0021 261c          	jrne	L551
 299  0023               L751:
 300                     ; 256         new_tcb = tcbDequeueHead (&tcbReadyQ);
 302  0023 ae0000        	ldw	x,#_tcbReadyQ
 303  0026 cd0000        	call	_tcbDequeueHead
 305  0029 1f02          	ldw	(OFST-1,sp),x
 307                     ; 266         atomThreadSwitch (curr_tcb, new_tcb);
 309  002b 1e02          	ldw	x,(OFST-1,sp)
 310  002d 89            	pushw	x
 311  002e ce0003        	ldw	x,L3_curr_tcb
 312  0031 cd0000        	call	L11_atomThreadSwitch
 314  0034 85            	popw	x
 316  0035               L161:
 317                     ; 314     CRITICAL_END ();
 319  0035 96            	ldw	x,sp
 320  0036 1c0001        	addw	x,#OFST-2
 322  0039 f6            ld A,(X)
 323  003a 88            push A
 324  003b 86            pop CC
 326                     ; 315 }
 327  003c               L6:
 330  003c 5b04          	addw	sp,#4
 331  003e 81            	ret
 332  003f               L551:
 333                     ; 276         if (timer_tick == TRUE)
 335  003f 7b04          	ld	a,(OFST+1,sp)
 336  0041 a101          	cp	a,#1
 337  0043 260b          	jrne	L361
 338                     ; 279             lowest_pri = (int16_t)curr_tcb->priority;
 340  0045 ce0003        	ldw	x,L3_curr_tcb
 341  0048 e602          	ld	a,(2,x)
 342  004a 5f            	clrw	x
 343  004b 97            	ld	xl,a
 344  004c 1f02          	ldw	(OFST-1,sp),x
 347  004e 2018          	jra	L561
 348  0050               L361:
 349                     ; 281         else if (curr_tcb->priority > 0)
 351  0050 ce0003        	ldw	x,L3_curr_tcb
 352  0053 6d02          	tnz	(2,x)
 353  0055 270c          	jreq	L761
 354                     ; 284             lowest_pri = (int16_t)(curr_tcb->priority - 1);
 356  0057 ce0003        	ldw	x,L3_curr_tcb
 357  005a e602          	ld	a,(2,x)
 358  005c 5f            	clrw	x
 359  005d 97            	ld	xl,a
 360  005e 5a            	decw	x
 361  005f 1f02          	ldw	(OFST-1,sp),x
 364  0061 2005          	jra	L561
 365  0063               L761:
 366                     ; 292             lowest_pri = -1;
 368  0063 aeffff        	ldw	x,#65535
 369  0066 1f02          	ldw	(OFST-1,sp),x
 371  0068               L561:
 372                     ; 296         if (lowest_pri >= 0)
 374  0068 9c            	rvf
 375  0069 1e02          	ldw	x,(OFST-1,sp)
 376  006b 2fc8          	jrslt	L161
 377                     ; 299             new_tcb = tcbDequeuePriority (&tcbReadyQ, (uint8_t)lowest_pri);
 379  006d 7b03          	ld	a,(OFST+0,sp)
 380  006f 88            	push	a
 381  0070 ae0000        	ldw	x,#_tcbReadyQ
 382  0073 cd0000        	call	_tcbDequeuePriority
 384  0076 84            	pop	a
 385  0077 1f02          	ldw	(OFST-1,sp),x
 387                     ; 302             if (new_tcb)
 389  0079 1e02          	ldw	x,(OFST-1,sp)
 390  007b 27b8          	jreq	L161
 391                     ; 305                 (void)tcbEnqueuePriority (&tcbReadyQ, curr_tcb);
 393  007d ce0003        	ldw	x,L3_curr_tcb
 394  0080 89            	pushw	x
 395  0081 ae0000        	ldw	x,#_tcbReadyQ
 396  0084 cd0000        	call	_tcbEnqueuePriority
 398  0087 85            	popw	x
 399                     ; 308                 atomThreadSwitch (curr_tcb, new_tcb);
 401  0088 1e02          	ldw	x,(OFST-1,sp)
 402  008a 89            	pushw	x
 403  008b ce0003        	ldw	x,L3_curr_tcb
 404  008e cd0000        	call	L11_atomThreadSwitch
 406  0091 85            	popw	x
 407  0092 20a1          	jra	L161
 458                     ; 333 static void atomThreadSwitch(ATOM_TCB *old_tcb, ATOM_TCB *new_tcb)
 458                     ; 334 {
 459                     .text:	section	.text,new
 460  0000               L11_atomThreadSwitch:
 462  0000 89            	pushw	x
 463       00000000      OFST:	set	0
 466                     ; 340     new_tcb->suspended = FALSE;
 468  0001 1e05          	ldw	x,(OFST+5,sp)
 469  0003 6f0d          	clr	(13,x)
 470                     ; 348     if (old_tcb != new_tcb)
 472  0005 1e01          	ldw	x,(OFST+1,sp)
 473  0007 1305          	cpw	x,(OFST+5,sp)
 474  0009 270e          	jreq	L522
 475                     ; 351         curr_tcb = new_tcb;
 477  000b 1e05          	ldw	x,(OFST+5,sp)
 478  000d cf0003        	ldw	L3_curr_tcb,x
 479                     ; 354         archContextSwitch (old_tcb, new_tcb);
 481  0010 1e05          	ldw	x,(OFST+5,sp)
 482  0012 89            	pushw	x
 483  0013 1e03          	ldw	x,(OFST+3,sp)
 484  0015 cd0000        	call	_archContextSwitch
 486  0018 85            	popw	x
 487  0019               L522:
 488                     ; 356 }
 491  0019 85            	popw	x
 492  001a 81            	ret
 616                     ; 387 uint8_t atomThreadCreate (ATOM_TCB *tcb_ptr, uint8_t priority, void (*entry_point)(uint32_t), uint32_t entry_param, void *stack_bottom, uint32_t stack_size, uint8_t stack_check)
 616                     ; 388 {
 617                     .text:	section	.text,new
 618  0000               _atomThreadCreate:
 620  0000 89            	pushw	x
 621  0001 5208          	subw	sp,#8
 622       00000008      OFST:	set	8
 625                     ; 396     if ((tcb_ptr == NULL) || (entry_point == NULL) || (stack_bottom == NULL)
 625                     ; 397         || (stack_size == 0))
 627  0003 a30000        	cpw	x,#0
 628  0006 2711          	jreq	L303
 630  0008 1e0e          	ldw	x,(OFST+6,sp)
 631  000a 270d          	jreq	L303
 633  000c 1e14          	ldw	x,(OFST+12,sp)
 634  000e 2709          	jreq	L303
 636  0010 96            	ldw	x,sp
 637  0011 1c0016        	addw	x,#OFST+14
 638  0014 cd0000        	call	c_lzmp
 640  0017 2609          	jrne	L103
 641  0019               L303:
 642                     ; 400         status = ATOM_ERR_PARAM;
 644  0019 a6c9          	ld	a,#201
 645  001b 6b04          	ld	(OFST-4,sp),a
 648  001d               L113:
 649                     ; 500     return (status);
 651  001d 7b04          	ld	a,(OFST-4,sp)
 654  001f 5b0a          	addw	sp,#10
 655  0021 81            	ret
 656  0022               L103:
 657                     ; 406         tcb_ptr->suspended = FALSE;
 659  0022 1e09          	ldw	x,(OFST+1,sp)
 660  0024 6f0d          	clr	(13,x)
 661                     ; 407         tcb_ptr->terminated = FALSE;
 663  0026 1e09          	ldw	x,(OFST+1,sp)
 664  0028 6f11          	clr	(17,x)
 665                     ; 408         tcb_ptr->priority = priority;
 667  002a 7b0d          	ld	a,(OFST+5,sp)
 668  002c 1e09          	ldw	x,(OFST+1,sp)
 669  002e e702          	ld	(2,x),a
 670                     ; 409         tcb_ptr->prev_tcb = NULL;
 672  0030 1e09          	ldw	x,(OFST+1,sp)
 673  0032 905f          	clrw	y
 674  0034 ef09          	ldw	(9,x),y
 675                     ; 410         tcb_ptr->next_tcb = NULL;
 677  0036 1e09          	ldw	x,(OFST+1,sp)
 678  0038 905f          	clrw	y
 679  003a ef0b          	ldw	(11,x),y
 680                     ; 411         tcb_ptr->suspend_timo_cb = NULL;
 682  003c 1e09          	ldw	x,(OFST+1,sp)
 683  003e 905f          	clrw	y
 684  0040 ef0f          	ldw	(15,x),y
 685                     ; 418         tcb_ptr->entry_point = entry_point;
 687  0042 1e09          	ldw	x,(OFST+1,sp)
 688  0044 160e          	ldw	y,(OFST+6,sp)
 689  0046 ef03          	ldw	(3,x),y
 690                     ; 419         tcb_ptr->entry_param = entry_param;
 692  0048 1e09          	ldw	x,(OFST+1,sp)
 693  004a 7b13          	ld	a,(OFST+11,sp)
 694  004c e708          	ld	(8,x),a
 695  004e 7b12          	ld	a,(OFST+10,sp)
 696  0050 e707          	ld	(7,x),a
 697  0052 7b11          	ld	a,(OFST+9,sp)
 698  0054 e706          	ld	(6,x),a
 699  0056 7b10          	ld	a,(OFST+8,sp)
 700  0058 e705          	ld	(5,x),a
 701                     ; 426         stack_top = (uint8_t *)stack_bottom + (stack_size & ~(STACK_ALIGN_SIZE - 1)) - STACK_ALIGN_SIZE;
 703  005a 1e18          	ldw	x,(OFST+16,sp)
 704  005c 01            	rrwa	x,a
 705  005d a4ff          	and	a,#255
 706  005f 01            	rrwa	x,a
 707  0060 a4ff          	and	a,#255
 708  0062 01            	rrwa	x,a
 709  0063 72fb14        	addw	x,(OFST+12,sp)
 710  0066 5a            	decw	x
 711  0067 1f01          	ldw	(OFST-7,sp),x
 713                     ; 436         if (stack_check)
 715  0069 0d1a          	tnz	(OFST+18,sp)
 716  006b 273e          	jreq	L313
 717                     ; 439             tcb_ptr->stack_bottom = stack_bottom;
 719  006d 1e09          	ldw	x,(OFST+1,sp)
 720  006f 1614          	ldw	y,(OFST+12,sp)
 721  0071 ef12          	ldw	(18,x),y
 722                     ; 440             tcb_ptr->stack_size = stack_size;
 724  0073 1e09          	ldw	x,(OFST+1,sp)
 725  0075 7b19          	ld	a,(OFST+17,sp)
 726  0077 e717          	ld	(23,x),a
 727  0079 7b18          	ld	a,(OFST+16,sp)
 728  007b e716          	ld	(22,x),a
 729  007d 7b17          	ld	a,(OFST+15,sp)
 730  007f e715          	ld	(21,x),a
 731  0081 7b16          	ld	a,(OFST+14,sp)
 732  0083 e714          	ld	(20,x),a
 733                     ; 447 		    count = (int32_t)stack_size;
 733                     ; 448             while (count > 0)
 736  0085 1e18          	ldw	x,(OFST+16,sp)
 737  0087 1f07          	ldw	(OFST-1,sp),x
 738  0089 1e16          	ldw	x,(OFST+14,sp)
 739  008b 1f05          	ldw	(OFST-3,sp),x
 742  008d 2012          	jra	L123
 743  008f               L513:
 744                     ; 451                 *((uint8_t *)stack_bottom + (count - 1)) = STACK_CHECK_BYTE;
 746  008f 1e07          	ldw	x,(OFST-1,sp)
 747  0091 5a            	decw	x
 748  0092 72fb14        	addw	x,(OFST+12,sp)
 749  0095 a65a          	ld	a,#90
 750  0097 f7            	ld	(x),a
 751                     ; 452                 count--;
 753  0098 96            	ldw	x,sp
 754  0099 1c0005        	addw	x,#OFST-3
 755  009c a601          	ld	a,#1
 756  009e cd0000        	call	c_lgsbc
 759  00a1               L123:
 760                     ; 448             while (count > 0)
 760                     ; 449             {
 760                     ; 450                 /* Initialise all stack bytes from top down to 0x5A */
 760                     ; 451                 *((uint8_t *)stack_bottom + (count - 1)) = STACK_CHECK_BYTE;
 760                     ; 452                 count--;
 762  00a1 9c            	rvf
 763  00a2 96            	ldw	x,sp
 764  00a3 1c0005        	addw	x,#OFST-3
 765  00a6 cd0000        	call	c_lzmp
 767  00a9 2ce4          	jrsgt	L513
 768  00ab               L313:
 769                     ; 469         archThreadContextInit (tcb_ptr, stack_top, entry_point, entry_param);
 771  00ab 1e12          	ldw	x,(OFST+10,sp)
 772  00ad 89            	pushw	x
 773  00ae 1e12          	ldw	x,(OFST+10,sp)
 774  00b0 89            	pushw	x
 775  00b1 1e12          	ldw	x,(OFST+10,sp)
 776  00b3 89            	pushw	x
 777  00b4 1e07          	ldw	x,(OFST-1,sp)
 778  00b6 89            	pushw	x
 779  00b7 1e11          	ldw	x,(OFST+9,sp)
 780  00b9 cd0000        	call	_archThreadContextInit
 782  00bc 5b08          	addw	sp,#8
 783                     ; 472         CRITICAL_START ();
 785  00be 96            	ldw	x,sp
 786  00bf 1c0003        	addw	x,#OFST-5
 788  00c2 8a            push CC
 789  00c3 84            pop a
 790  00c4 f7            ld (X),A
 791  00c5 9b            sim
 793                     ; 475         if (tcbEnqueuePriority (&tcbReadyQ, tcb_ptr) != ATOM_OK)
 795  00c6 1e09          	ldw	x,(OFST+1,sp)
 796  00c8 89            	pushw	x
 797  00c9 ae0000        	ldw	x,#_tcbReadyQ
 798  00cc cd0000        	call	_tcbEnqueuePriority
 800  00cf 85            	popw	x
 801  00d0 4d            	tnz	a
 802  00d1 270f          	jreq	L523
 803                     ; 478             CRITICAL_END ();
 805  00d3 96            	ldw	x,sp
 806  00d4 1c0003        	addw	x,#OFST-5
 808  00d7 f6            ld A,(X)
 809  00d8 88            push A
 810  00d9 86            pop CC
 812                     ; 481             status = ATOM_ERR_QUEUE;
 814  00da a6cc          	ld	a,#204
 815  00dc 6b04          	ld	(OFST-4,sp),a
 818  00de ac1d001d      	jpf	L113
 819  00e2               L523:
 820                     ; 486             CRITICAL_END ();
 822  00e2 96            	ldw	x,sp
 823  00e3 1c0003        	addw	x,#OFST-5
 825  00e6 f6            ld A,(X)
 826  00e7 88            push A
 827  00e8 86            pop CC
 829                     ; 492             if ((atomOSStarted == TRUE) && atomCurrentContext())
 831  00e9 c60002        	ld	a,_atomOSStarted
 832  00ec a101          	cp	a,#1
 833  00ee 260c          	jrne	L133
 835  00f0 cd0000        	call	_atomCurrentContext
 837  00f3 a30000        	cpw	x,#0
 838  00f6 2704          	jreq	L133
 839                     ; 493                 atomSched (FALSE);
 841  00f8 4f            	clr	a
 842  00f9 cd0000        	call	_atomSched
 844  00fc               L133:
 845                     ; 496             status = ATOM_OK;
 847  00fc 0f04          	clr	(OFST-4,sp)
 849  00fe ac1d001d      	jpf	L113
 931                     ; 535 uint8_t atomThreadStackCheck (ATOM_TCB *tcb_ptr, uint32_t *used_bytes, uint32_t *free_bytes)
 931                     ; 536 {
 932                     .text:	section	.text,new
 933  0000               _atomThreadStackCheck:
 935  0000 89            	pushw	x
 936  0001 5209          	subw	sp,#9
 937       00000009      OFST:	set	9
 940                     ; 541     if ((tcb_ptr == NULL) || (used_bytes == NULL) || (free_bytes == NULL))
 942  0003 a30000        	cpw	x,#0
 943  0006 2708          	jreq	L573
 945  0008 1e0e          	ldw	x,(OFST+5,sp)
 946  000a 2704          	jreq	L573
 948  000c 1e10          	ldw	x,(OFST+7,sp)
 949  000e 2609          	jrne	L373
 950  0010               L573:
 951                     ; 544         status = ATOM_ERR_PARAM;
 953  0010 a6c9          	ld	a,#201
 954  0012 6b05          	ld	(OFST-4,sp),a
 957  0014               L104:
 958                     ; 574     return (status);
 960  0014 7b05          	ld	a,(OFST-4,sp)
 963  0016 5b0b          	addw	sp,#11
 964  0018 81            	ret
 965  0019               L373:
 966                     ; 552         stack_ptr = (uint8_t *)tcb_ptr->stack_bottom;
 968  0019 1e0a          	ldw	x,(OFST+1,sp)
 969  001b ee12          	ldw	x,(18,x)
 970  001d 1f06          	ldw	(OFST-3,sp),x
 972                     ; 553         for (i = 0; i < tcb_ptr->stack_size; i++)
 974  001f 5f            	clrw	x
 975  0020 1f08          	ldw	(OFST-1,sp),x
 978  0022 2036          	jra	L704
 979  0024               L304:
 980                     ; 556             if (*stack_ptr++ != STACK_CHECK_BYTE)
 982  0024 1e06          	ldw	x,(OFST-3,sp)
 983  0026 1c0001        	addw	x,#1
 984  0029 1f06          	ldw	(OFST-3,sp),x
 985  002b 1d0001        	subw	x,#1
 987  002e f6            	ld	a,(x)
 988  002f a15a          	cp	a,#90
 989  0031 2720          	jreq	L314
 990                     ; 559                 break;
 991  0033               L114:
 992                     ; 564         *free_bytes = (uint32_t)i;
 994  0033 1e08          	ldw	x,(OFST-1,sp)
 995  0035 cd0000        	call	c_itolx
 997  0038 1e10          	ldw	x,(OFST+7,sp)
 998  003a cd0000        	call	c_rtol
1000                     ; 567         *used_bytes = tcb_ptr->stack_size - *free_bytes;
1002  003d 1e0a          	ldw	x,(OFST+1,sp)
1003  003f 1c0014        	addw	x,#20
1004  0042 cd0000        	call	c_ltor
1006  0045 1e10          	ldw	x,(OFST+7,sp)
1007  0047 cd0000        	call	c_lsub
1009  004a 1e0e          	ldw	x,(OFST+5,sp)
1010  004c cd0000        	call	c_rtol
1012                     ; 570         status = ATOM_OK;
1014  004f 0f05          	clr	(OFST-4,sp)
1016  0051 20c1          	jra	L104
1017  0053               L314:
1018                     ; 553         for (i = 0; i < tcb_ptr->stack_size; i++)
1020  0053 1e08          	ldw	x,(OFST-1,sp)
1021  0055 1c0001        	addw	x,#1
1022  0058 1f08          	ldw	(OFST-1,sp),x
1024  005a               L704:
1027  005a 1e08          	ldw	x,(OFST-1,sp)
1028  005c cd0000        	call	c_itolx
1030  005f 96            	ldw	x,sp
1031  0060 1c0001        	addw	x,#OFST-8
1032  0063 cd0000        	call	c_rtol
1035  0066 1e0a          	ldw	x,(OFST+1,sp)
1036  0068 1c0014        	addw	x,#20
1037  006b cd0000        	call	c_ltor
1039  006e 96            	ldw	x,sp
1040  006f 1c0001        	addw	x,#OFST-8
1041  0072 cd0000        	call	c_lcmp
1043  0075 22ad          	jrugt	L304
1044  0077 20ba          	jra	L114
1068                     ; 590 void atomIntEnter (void)
1068                     ; 591 {
1069                     .text:	section	.text,new
1070  0000               _atomIntEnter:
1074                     ; 593     atomIntCnt++;
1076  0000 ce0005        	ldw	x,L7_atomIntCnt
1077  0003 1c0001        	addw	x,#1
1078  0006 cf0005        	ldw	L7_atomIntCnt,x
1079                     ; 594 }
1082  0009 81            	ret
1116                     ; 613 void atomIntExit (uint8_t timer_tick)
1116                     ; 614 {
1117                     .text:	section	.text,new
1118  0000               _atomIntExit:
1122                     ; 616     atomIntCnt--;
1124  0000 ce0005        	ldw	x,L7_atomIntCnt
1125  0003 1d0001        	subw	x,#1
1126  0006 cf0005        	ldw	L7_atomIntCnt,x
1127                     ; 619     atomSched (timer_tick);
1129  0009 cd0000        	call	_atomSched
1131                     ; 620 }
1134  000c 81            	ret
1162                     ; 633 ATOM_TCB *atomCurrentContext (void)
1162                     ; 634 {
1163                     .text:	section	.text,new
1164  0000               _atomCurrentContext:
1168                     ; 636     if (atomIntCnt == 0)
1170  0000 ce0005        	ldw	x,L7_atomIntCnt
1171  0003 2604          	jrne	L354
1172                     ; 637         return (curr_tcb);
1174  0005 ce0003        	ldw	x,L3_curr_tcb
1177  0008 81            	ret
1178  0009               L354:
1179                     ; 639         return (NULL);
1181  0009 5f            	clrw	x
1184  000a 81            	ret
1250                     ; 675 uint8_t atomOSInit (void *idle_thread_stack_bottom, uint32_t idle_thread_stack_size, uint8_t idle_thread_stack_check)
1250                     ; 676 {
1251                     .text:	section	.text,new
1252  0000               _atomOSInit:
1254  0000 89            	pushw	x
1255  0001 88            	push	a
1256       00000001      OFST:	set	1
1259                     ; 680     curr_tcb = NULL;
1261  0002 5f            	clrw	x
1262  0003 cf0003        	ldw	L3_curr_tcb,x
1263                     ; 681     tcbReadyQ = NULL;
1265  0006 5f            	clrw	x
1266  0007 cf0000        	ldw	_tcbReadyQ,x
1267                     ; 682     atomOSStarted = FALSE;
1269  000a 725f0002      	clr	_atomOSStarted
1270                     ; 685     status = atomThreadCreate(&idle_tcb,
1270                     ; 686                  IDLE_THREAD_PRIORITY,
1270                     ; 687                  atomIdleThread,
1270                     ; 688                  0,
1270                     ; 689                  idle_thread_stack_bottom,
1270                     ; 690                  idle_thread_stack_size,
1270                     ; 691 				 idle_thread_stack_check);
1272  000e 7b0a          	ld	a,(OFST+9,sp)
1273  0010 88            	push	a
1274  0011 1e09          	ldw	x,(OFST+8,sp)
1275  0013 89            	pushw	x
1276  0014 1e09          	ldw	x,(OFST+8,sp)
1277  0016 89            	pushw	x
1278  0017 1e07          	ldw	x,(OFST+6,sp)
1279  0019 89            	pushw	x
1280  001a ae0000        	ldw	x,#0
1281  001d 89            	pushw	x
1282  001e ae0000        	ldw	x,#0
1283  0021 89            	pushw	x
1284  0022 ae0000        	ldw	x,#L31_atomIdleThread
1285  0025 89            	pushw	x
1286  0026 4bff          	push	#255
1287  0028 ae0000        	ldw	x,#L5_idle_tcb
1288  002b cd0000        	call	_atomThreadCreate
1290  002e 5b0e          	addw	sp,#14
1291  0030 6b01          	ld	(OFST+0,sp),a
1293                     ; 694     return (status);
1295  0032 7b01          	ld	a,(OFST+0,sp)
1298  0034 5b03          	addw	sp,#3
1299  0036 81            	ret
1341                     ; 713 void atomOSStart (void)
1341                     ; 714 {
1342                     .text:	section	.text,new
1343  0000               _atomOSStart:
1345  0000 89            	pushw	x
1346       00000002      OFST:	set	2
1349                     ; 722     atomOSStarted = TRUE;
1351  0001 35010002      	mov	_atomOSStarted,#1
1352                     ; 731     new_tcb = tcbDequeuePriority (&tcbReadyQ, 255);
1354  0005 4bff          	push	#255
1355  0007 ae0000        	ldw	x,#_tcbReadyQ
1356  000a cd0000        	call	_tcbDequeuePriority
1358  000d 84            	pop	a
1359  000e 1f01          	ldw	(OFST-1,sp),x
1361                     ; 732     if (new_tcb)
1363  0010 1e01          	ldw	x,(OFST-1,sp)
1364  0012 270a          	jreq	L525
1365                     ; 735         curr_tcb = new_tcb;
1367  0014 1e01          	ldw	x,(OFST-1,sp)
1368  0016 cf0003        	ldw	L3_curr_tcb,x
1369                     ; 738         archFirstThreadRestore (new_tcb);
1371  0019 1e01          	ldw	x,(OFST-1,sp)
1372  001b cd0000        	call	_archFirstThreadRestore
1375  001e               L525:
1376                     ; 747 }
1379  001e 85            	popw	x
1380  001f 81            	ret
1412                     ; 763 static void atomIdleThread (uint32_t param)
1412                     ; 764 {
1413                     .text:	section	.text,new
1414  0000               L31_atomIdleThread:
1416       00000000      OFST:	set	0
1419                     ; 766     param = param;
1421  0000               L345:
1423  0000 20fe          	jra	L345
1504                     ; 799 uint8_t tcbEnqueuePriority (ATOM_TCB **tcb_queue_ptr, ATOM_TCB *tcb_ptr)
1504                     ; 800 {
1505                     .text:	section	.text,new
1506  0000               _tcbEnqueuePriority:
1508  0000 89            	pushw	x
1509  0001 5205          	subw	sp,#5
1510       00000005      OFST:	set	5
1513                     ; 805     if ((tcb_queue_ptr == NULL) || (tcb_ptr == NULL))
1515  0003 a30000        	cpw	x,#0
1516  0006 2704          	jreq	L516
1518  0008 1e0a          	ldw	x,(OFST+5,sp)
1519  000a 2609          	jrne	L316
1520  000c               L516:
1521                     ; 808         status = ATOM_ERR_PARAM;
1523  000c a6c9          	ld	a,#201
1524  000e 6b01          	ld	(OFST-4,sp),a
1527  0010               L716:
1528                     ; 858     return (status);
1530  0010 7b01          	ld	a,(OFST-4,sp)
1533  0012 5b07          	addw	sp,#7
1534  0014 81            	ret
1535  0015               L316:
1536                     ; 813         prev_ptr = next_ptr = *tcb_queue_ptr;
1538  0015 1e06          	ldw	x,(OFST+1,sp)
1539  0017 fe            	ldw	x,(x)
1540  0018 1f04          	ldw	(OFST-1,sp),x
1542  001a 1e04          	ldw	x,(OFST-1,sp)
1543  001c 1f02          	ldw	(OFST-3,sp),x
1545  001e               L126:
1546                     ; 820             if ((next_ptr == NULL) || (next_ptr->priority > tcb_ptr->priority))
1548  001e 1e04          	ldw	x,(OFST-1,sp)
1549  0020 270a          	jreq	L136
1551  0022 1e04          	ldw	x,(OFST-1,sp)
1552  0024 e602          	ld	a,(2,x)
1553  0026 1e0a          	ldw	x,(OFST+5,sp)
1554  0028 e102          	cp	a,(2,x)
1555  002a 2346          	jrule	L726
1556  002c               L136:
1557                     ; 823                 if (next_ptr == *tcb_queue_ptr)
1559  002c 1e06          	ldw	x,(OFST+1,sp)
1560  002e 9093          	ldw	y,x
1561  0030 51            	exgw	x,y
1562  0031 fe            	ldw	x,(x)
1563  0032 1304          	cpw	x,(OFST-1,sp)
1564  0034 51            	exgw	x,y
1565  0035 261d          	jrne	L336
1566                     ; 825                     *tcb_queue_ptr = tcb_ptr;
1568  0037 1e06          	ldw	x,(OFST+1,sp)
1569  0039 160a          	ldw	y,(OFST+5,sp)
1570  003b ff            	ldw	(x),y
1571                     ; 826                     tcb_ptr->prev_tcb = NULL;
1573  003c 1e0a          	ldw	x,(OFST+5,sp)
1574  003e 905f          	clrw	y
1575  0040 ef09          	ldw	(9,x),y
1576                     ; 827                     tcb_ptr->next_tcb = next_ptr;
1578  0042 1e0a          	ldw	x,(OFST+5,sp)
1579  0044 1604          	ldw	y,(OFST-1,sp)
1580  0046 ef0b          	ldw	(11,x),y
1581                     ; 828                     if (next_ptr)
1583  0048 1e04          	ldw	x,(OFST-1,sp)
1584  004a 2734          	jreq	L526
1585                     ; 829                         next_ptr->prev_tcb = tcb_ptr;
1587  004c 1e04          	ldw	x,(OFST-1,sp)
1588  004e 160a          	ldw	y,(OFST+5,sp)
1589  0050 ef09          	ldw	(9,x),y
1590  0052 202c          	jra	L526
1591  0054               L336:
1592                     ; 834                     tcb_ptr->prev_tcb = prev_ptr;
1594  0054 1e0a          	ldw	x,(OFST+5,sp)
1595  0056 1602          	ldw	y,(OFST-3,sp)
1596  0058 ef09          	ldw	(9,x),y
1597                     ; 835                     tcb_ptr->next_tcb = next_ptr;
1599  005a 1e0a          	ldw	x,(OFST+5,sp)
1600  005c 1604          	ldw	y,(OFST-1,sp)
1601  005e ef0b          	ldw	(11,x),y
1602                     ; 836                     prev_ptr->next_tcb = tcb_ptr;
1604  0060 1e02          	ldw	x,(OFST-3,sp)
1605  0062 160a          	ldw	y,(OFST+5,sp)
1606  0064 ef0b          	ldw	(11,x),y
1607                     ; 837                     if (next_ptr)
1609  0066 1e04          	ldw	x,(OFST-1,sp)
1610  0068 2716          	jreq	L526
1611                     ; 838                         next_ptr->prev_tcb = tcb_ptr;
1613  006a 1e04          	ldw	x,(OFST-1,sp)
1614  006c 160a          	ldw	y,(OFST+5,sp)
1615  006e ef09          	ldw	(9,x),y
1616  0070 200e          	jra	L526
1617  0072               L726:
1618                     ; 847                 prev_ptr = next_ptr;
1620  0072 1e04          	ldw	x,(OFST-1,sp)
1621  0074 1f02          	ldw	(OFST-3,sp),x
1623                     ; 848                 next_ptr = next_ptr->next_tcb;
1625  0076 1e04          	ldw	x,(OFST-1,sp)
1626  0078 ee0b          	ldw	x,(11,x)
1627  007a 1f04          	ldw	(OFST-1,sp),x
1629  007c               L326:
1630                     ; 852         while (prev_ptr != NULL);
1632  007c 1e02          	ldw	x,(OFST-3,sp)
1633  007e 269e          	jrne	L126
1634  0080               L526:
1635                     ; 855         status = ATOM_OK;
1637  0080 0f01          	clr	(OFST-4,sp)
1639  0082 208c          	jra	L716
1692                     ; 884 ATOM_TCB *tcbDequeueHead (ATOM_TCB **tcb_queue_ptr)
1692                     ; 885 {
1693                     .text:	section	.text,new
1694  0000               _tcbDequeueHead:
1696  0000 89            	pushw	x
1697  0001 89            	pushw	x
1698       00000002      OFST:	set	2
1701                     ; 889     if (tcb_queue_ptr == NULL)
1703  0002 a30000        	cpw	x,#0
1704  0005 2605          	jrne	L576
1705                     ; 892         ret_ptr = NULL;
1707  0007 5f            	clrw	x
1708  0008 1f01          	ldw	(OFST-1,sp),x
1711  000a 2038          	jra	L776
1712  000c               L576:
1713                     ; 895     else if (*tcb_queue_ptr == NULL)
1715  000c 1e03          	ldw	x,(OFST+1,sp)
1716  000e e601          	ld	a,(1,x)
1717  0010 fa            	or	a,(x)
1718  0011 2605          	jrne	L107
1719                     ; 898         ret_ptr = NULL;
1721  0013 5f            	clrw	x
1722  0014 1f01          	ldw	(OFST-1,sp),x
1725  0016 202c          	jra	L776
1726  0018               L107:
1727                     ; 903         ret_ptr = *tcb_queue_ptr;
1729  0018 1e03          	ldw	x,(OFST+1,sp)
1730  001a fe            	ldw	x,(x)
1731  001b 1f01          	ldw	(OFST-1,sp),x
1733                     ; 904         *tcb_queue_ptr = ret_ptr->next_tcb;
1735  001d 1e01          	ldw	x,(OFST-1,sp)
1736  001f 1603          	ldw	y,(OFST+1,sp)
1737  0021 89            	pushw	x
1738  0022 ee0b          	ldw	x,(11,x)
1739  0024 90ff          	ldw	(y),x
1740  0026 85            	popw	x
1741                     ; 905         if (*tcb_queue_ptr)
1743  0027 1e03          	ldw	x,(OFST+1,sp)
1744  0029 e601          	ld	a,(1,x)
1745  002b fa            	or	a,(x)
1746  002c 2707          	jreq	L507
1747                     ; 906             (*tcb_queue_ptr)->prev_tcb = NULL;
1749  002e 1e03          	ldw	x,(OFST+1,sp)
1750  0030 fe            	ldw	x,(x)
1751  0031 905f          	clrw	y
1752  0033 ef09          	ldw	(9,x),y
1753  0035               L507:
1754                     ; 907         ret_ptr->next_tcb = ret_ptr->prev_tcb = NULL;
1756  0035 1e01          	ldw	x,(OFST-1,sp)
1757  0037 905f          	clrw	y
1758  0039 ef09          	ldw	(9,x),y
1759  003b 1601          	ldw	y,(OFST-1,sp)
1760  003d 89            	pushw	x
1761  003e ee09          	ldw	x,(9,x)
1762  0040 90ef0b        	ldw	(11,y),x
1763  0043 85            	popw	x
1764  0044               L776:
1765                     ; 910     return (ret_ptr);
1767  0044 1e01          	ldw	x,(OFST-1,sp)
1770  0046 5b04          	addw	sp,#4
1771  0048 81            	ret
1860                     ; 935 ATOM_TCB *tcbDequeueEntry (ATOM_TCB **tcb_queue_ptr, ATOM_TCB *tcb_ptr)
1860                     ; 936 {
1861                     .text:	section	.text,new
1862  0000               _tcbDequeueEntry:
1864  0000 89            	pushw	x
1865  0001 5206          	subw	sp,#6
1866       00000006      OFST:	set	6
1869                     ; 940     if (tcb_queue_ptr == NULL)
1871  0003 a30000        	cpw	x,#0
1872  0006 2605          	jrne	L167
1873                     ; 943         ret_ptr = NULL;
1875  0008 5f            	clrw	x
1876  0009 1f03          	ldw	(OFST-3,sp),x
1879  000b 200a          	jra	L367
1880  000d               L167:
1881                     ; 946     else if (*tcb_queue_ptr == NULL)
1883  000d 1e07          	ldw	x,(OFST+1,sp)
1884  000f e601          	ld	a,(1,x)
1885  0011 fa            	or	a,(x)
1886  0012 2608          	jrne	L567
1887                     ; 949         ret_ptr = NULL;
1889  0014 5f            	clrw	x
1890  0015 1f03          	ldw	(OFST-3,sp),x
1893  0017               L367:
1894                     ; 986     return (ret_ptr);
1896  0017 1e03          	ldw	x,(OFST-3,sp)
1899  0019 5b08          	addw	sp,#8
1900  001b 81            	ret
1901  001c               L567:
1902                     ; 954         ret_ptr = NULL;
1904  001c 5f            	clrw	x
1905  001d 1f03          	ldw	(OFST-3,sp),x
1907                     ; 955         prev_ptr = next_ptr = *tcb_queue_ptr;
1909  001f 1e07          	ldw	x,(OFST+1,sp)
1910  0021 fe            	ldw	x,(x)
1911  0022 1f05          	ldw	(OFST-1,sp),x
1913  0024 1e05          	ldw	x,(OFST-1,sp)
1914  0026 1f01          	ldw	(OFST-5,sp),x
1917  0028 2065          	jra	L577
1918  002a               L177:
1919                     ; 959             if (next_ptr == tcb_ptr)
1921  002a 1e05          	ldw	x,(OFST-1,sp)
1922  002c 130b          	cpw	x,(OFST+5,sp)
1923  002e 2655          	jrne	L1001
1924                     ; 961                 if (next_ptr == *tcb_queue_ptr)
1926  0030 1e07          	ldw	x,(OFST+1,sp)
1927  0032 9093          	ldw	y,x
1928  0034 51            	exgw	x,y
1929  0035 fe            	ldw	x,(x)
1930  0036 1305          	cpw	x,(OFST-1,sp)
1931  0038 51            	exgw	x,y
1932  0039 261a          	jrne	L3001
1933                     ; 964                     *tcb_queue_ptr = next_ptr->next_tcb;
1935  003b 1e05          	ldw	x,(OFST-1,sp)
1936  003d 1607          	ldw	y,(OFST+1,sp)
1937  003f 89            	pushw	x
1938  0040 ee0b          	ldw	x,(11,x)
1939  0042 90ff          	ldw	(y),x
1940  0044 85            	popw	x
1941                     ; 965                     if (*tcb_queue_ptr)
1943  0045 1e07          	ldw	x,(OFST+1,sp)
1944  0047 e601          	ld	a,(1,x)
1945  0049 fa            	or	a,(x)
1946  004a 2724          	jreq	L7001
1947                     ; 966                         (*tcb_queue_ptr)->prev_tcb = NULL;
1949  004c 1e07          	ldw	x,(OFST+1,sp)
1950  004e fe            	ldw	x,(x)
1951  004f 905f          	clrw	y
1952  0051 ef09          	ldw	(9,x),y
1953  0053 201b          	jra	L7001
1954  0055               L3001:
1955                     ; 971                     prev_ptr->next_tcb = next_ptr->next_tcb;
1957  0055 1e05          	ldw	x,(OFST-1,sp)
1958  0057 1601          	ldw	y,(OFST-5,sp)
1959  0059 89            	pushw	x
1960  005a ee0b          	ldw	x,(11,x)
1961  005c 90ef0b        	ldw	(11,y),x
1962  005f 85            	popw	x
1963                     ; 972                     if (next_ptr->next_tcb)
1965  0060 1e05          	ldw	x,(OFST-1,sp)
1966  0062 e60c          	ld	a,(12,x)
1967  0064 ea0b          	or	a,(11,x)
1968  0066 2708          	jreq	L7001
1969                     ; 973                         next_ptr->next_tcb->prev_tcb = prev_ptr;
1971  0068 1e05          	ldw	x,(OFST-1,sp)
1972  006a ee0b          	ldw	x,(11,x)
1973  006c 1601          	ldw	y,(OFST-5,sp)
1974  006e ef09          	ldw	(9,x),y
1975  0070               L7001:
1976                     ; 975                 ret_ptr = next_ptr;
1978  0070 1e05          	ldw	x,(OFST-1,sp)
1979  0072 1f03          	ldw	(OFST-3,sp),x
1981                     ; 976                 ret_ptr->prev_tcb = ret_ptr->next_tcb = NULL;
1983  0074 1e03          	ldw	x,(OFST-3,sp)
1984  0076 905f          	clrw	y
1985  0078 ef0b          	ldw	(11,x),y
1986  007a 1603          	ldw	y,(OFST-3,sp)
1987  007c 89            	pushw	x
1988  007d ee0b          	ldw	x,(11,x)
1989  007f 90ef09        	ldw	(9,y),x
1990  0082 85            	popw	x
1991                     ; 977                 break;
1993  0083 2092          	jra	L367
1994  0085               L1001:
1995                     ; 981             prev_ptr = next_ptr;
1997  0085 1e05          	ldw	x,(OFST-1,sp)
1998  0087 1f01          	ldw	(OFST-5,sp),x
2000                     ; 982             next_ptr = next_ptr->next_tcb;
2002  0089 1e05          	ldw	x,(OFST-1,sp)
2003  008b ee0b          	ldw	x,(11,x)
2004  008d 1f05          	ldw	(OFST-1,sp),x
2006  008f               L577:
2007                     ; 956         while (next_ptr)
2009  008f 1e05          	ldw	x,(OFST-1,sp)
2010  0091 2697          	jrne	L177
2011  0093 2082          	jra	L367
2071                     ; 1016 ATOM_TCB *tcbDequeuePriority (ATOM_TCB **tcb_queue_ptr, uint8_t priority)
2071                     ; 1017 {
2072                     .text:	section	.text,new
2073  0000               _tcbDequeuePriority:
2075  0000 89            	pushw	x
2076  0001 89            	pushw	x
2077       00000002      OFST:	set	2
2080                     ; 1021     if (tcb_queue_ptr == NULL)
2082  0002 a30000        	cpw	x,#0
2083  0005 2605          	jrne	L5401
2084                     ; 1024         ret_ptr = NULL;
2086  0007 5f            	clrw	x
2087  0008 1f01          	ldw	(OFST-1,sp),x
2090  000a 203e          	jra	L7401
2091  000c               L5401:
2092                     ; 1027     else if (*tcb_queue_ptr == NULL)
2094  000c 1e03          	ldw	x,(OFST+1,sp)
2095  000e e601          	ld	a,(1,x)
2096  0010 fa            	or	a,(x)
2097  0011 2605          	jrne	L1501
2098                     ; 1030         ret_ptr = NULL;
2100  0013 5f            	clrw	x
2101  0014 1f01          	ldw	(OFST-1,sp),x
2104  0016 2032          	jra	L7401
2105  0018               L1501:
2106                     ; 1033     else if ((*tcb_queue_ptr)->priority <= priority)
2108  0018 1e03          	ldw	x,(OFST+1,sp)
2109  001a fe            	ldw	x,(x)
2110  001b e602          	ld	a,(2,x)
2111  001d 1107          	cp	a,(OFST+5,sp)
2112  001f 2226          	jrugt	L5501
2113                     ; 1036         ret_ptr = *tcb_queue_ptr;
2115  0021 1e03          	ldw	x,(OFST+1,sp)
2116  0023 fe            	ldw	x,(x)
2117  0024 1f01          	ldw	(OFST-1,sp),x
2119                     ; 1037         *tcb_queue_ptr = (*tcb_queue_ptr)->next_tcb;
2121  0026 1e03          	ldw	x,(OFST+1,sp)
2122  0028 fe            	ldw	x,(x)
2123  0029 1603          	ldw	y,(OFST+1,sp)
2124  002b 89            	pushw	x
2125  002c ee0b          	ldw	x,(11,x)
2126  002e 90ff          	ldw	(y),x
2127  0030 85            	popw	x
2128                     ; 1038         if (*tcb_queue_ptr)
2130  0031 1e03          	ldw	x,(OFST+1,sp)
2131  0033 e601          	ld	a,(1,x)
2132  0035 fa            	or	a,(x)
2133  0036 2712          	jreq	L7401
2134                     ; 1040             (*tcb_queue_ptr)->prev_tcb = NULL;
2136  0038 1e03          	ldw	x,(OFST+1,sp)
2137  003a fe            	ldw	x,(x)
2138  003b 905f          	clrw	y
2139  003d ef09          	ldw	(9,x),y
2140                     ; 1041             ret_ptr->next_tcb = NULL;
2142  003f 1e01          	ldw	x,(OFST-1,sp)
2143  0041 905f          	clrw	y
2144  0043 ef0b          	ldw	(11,x),y
2145  0045 2003          	jra	L7401
2146  0047               L5501:
2147                     ; 1047         ret_ptr = NULL;
2149  0047 5f            	clrw	x
2150  0048 1f01          	ldw	(OFST-1,sp),x
2152  004a               L7401:
2153                     ; 1050     return (ret_ptr);
2155  004a 1e01          	ldw	x,(OFST-1,sp)
2158  004c 5b04          	addw	sp,#4
2159  004e 81            	ret
2222                     	switch	.bss
2223  0000               L5_idle_tcb:
2224  0000 000000000000  	ds.b	24
2225                     	xref	_archFirstThreadRestore
2226                     	xref	_archThreadContextInit
2227                     	xref	_archContextSwitch
2228                     	xdef	_atomThreadStackCheck
2229                     	xdef	_atomThreadCreate
2230                     	xdef	_atomCurrentContext
2231                     	xdef	_tcbDequeuePriority
2232                     	xdef	_tcbDequeueEntry
2233                     	xdef	_tcbDequeueHead
2234                     	xdef	_tcbEnqueuePriority
2235                     	xdef	_atomIntExit
2236                     	xdef	_atomIntEnter
2237                     	xdef	_atomSched
2238                     	xdef	_atomOSStart
2239                     	xdef	_atomOSInit
2240                     	xdef	_atomOSStarted
2241                     	xdef	_tcbReadyQ
2261                     	xref	c_lsub
2262                     	xref	c_lcmp
2263                     	xref	c_rtol
2264                     	xref	c_itolx
2265                     	xref	c_ltor
2266                     	xref	c_lgsbc
2267                     	xref	c_lzmp
2268                     	end
