   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  98                     ; 76 uint32_t test_start (void)
  98                     ; 77 {
 100                     .text:	section	.text,new
 101  0000               _test_start:
 103  0000 520b          	subw	sp,#11
 104       0000000b      OFST:	set	11
 107                     ; 82     g_failures = 0;
 109  0002 5f            	clrw	x
 110  0003 cf0000        	ldw	L31_g_failures,x
 111                     ; 85     if (atomSemCreate (&sem1, 2) != ATOM_OK)
 113  0006 4b02          	push	#2
 114  0008 ae0365        	ldw	x,#L3_sem1
 115  000b cd0000        	call	_atomSemCreate
 117  000e 5b01          	addw	sp,#1
 118  0010 4d            	tnz	a
 119  0011 2713          	jreq	L15
 120                     ; 87         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 122  0013 ae006e        	ldw	x,#L35
 123  0016 cd0000        	call	_printf
 125                     ; 88         g_failures++;
 127  0019 ce0000        	ldw	x,L31_g_failures
 128  001c 1c0001        	addw	x,#1
 129  001f cf0000        	ldw	L31_g_failures,x
 131  0022 accc01cc      	jpf	L55
 132  0026               L15:
 133                     ; 91     else if (atomSemCreate (&sem2, 0) != ATOM_OK)
 135  0026 4b00          	push	#0
 136  0028 ae0362        	ldw	x,#L5_sem2
 137  002b cd0000        	call	_atomSemCreate
 139  002e 5b01          	addw	sp,#1
 140  0030 4d            	tnz	a
 141  0031 2713          	jreq	L75
 142                     ; 93         ATOMLOG (_STR("Error creating test semaphore 1\n"));
 144  0033 ae006e        	ldw	x,#L35
 145  0036 cd0000        	call	_printf
 147                     ; 94         g_failures++;
 149  0039 ce0000        	ldw	x,L31_g_failures
 150  003c 1c0001        	addw	x,#1
 151  003f cf0000        	ldw	L31_g_failures,x
 153  0042 accc01cc      	jpf	L55
 154  0046               L75:
 155                     ; 99         if (atomThreadCreate(&tcb[0], TEST_THREAD_PRIO, test_thread_func, 1,
 155                     ; 100               &test_thread_stack[0][0],
 155                     ; 101               TEST_THREAD_STACK_SIZE, TRUE) != ATOM_OK)
 157  0046 4b01          	push	#1
 158  0048 ae00c0        	ldw	x,#192
 159  004b 89            	pushw	x
 160  004c ae0000        	ldw	x,#0
 161  004f 89            	pushw	x
 162  0050 ae0002        	ldw	x,#L11_test_thread_stack
 163  0053 89            	pushw	x
 164  0054 ae0001        	ldw	x,#1
 165  0057 89            	pushw	x
 166  0058 ae0000        	ldw	x,#0
 167  005b 89            	pushw	x
 168  005c ae0000        	ldw	x,#L51_test_thread_func
 169  005f 89            	pushw	x
 170  0060 4b10          	push	#16
 171  0062 ae0302        	ldw	x,#L7_tcb
 172  0065 cd0000        	call	_atomThreadCreate
 174  0068 5b0e          	addw	sp,#14
 175  006a 4d            	tnz	a
 176  006b 271e          	jreq	L36
 177                     ; 104             ATOMLOG (_STR("Error creating test thread\n"));
 179  006d ae0052        	ldw	x,#L56
 180  0070 cd0000        	call	_printf
 182                     ; 105             CRITICAL_START ();
 184  0073 96            	ldw	x,sp
 185  0074 1c0009        	addw	x,#OFST-2
 187  0077 8a            push CC
 188  0078 84            pop a
 189  0079 f7            ld (X),A
 190  007a 9b            sim
 192                     ; 106             g_failures++;
 194  007b ce0000        	ldw	x,L31_g_failures
 195  007e 1c0001        	addw	x,#1
 196  0081 cf0000        	ldw	L31_g_failures,x
 197                     ; 107             CRITICAL_END ();
 199  0084 96            	ldw	x,sp
 200  0085 1c0009        	addw	x,#OFST-2
 202  0088 f6            ld A,(X)
 203  0089 88            push A
 204  008a 86            pop CC
 206  008b               L36:
 207                     ; 111         if (atomThreadCreate(&tcb[1], TEST_THREAD_PRIO, test_thread_func, 2,
 207                     ; 112               &test_thread_stack[1][0],
 207                     ; 113               TEST_THREAD_STACK_SIZE, TRUE) != ATOM_OK)
 209  008b 4b01          	push	#1
 210  008d ae00c0        	ldw	x,#192
 211  0090 89            	pushw	x
 212  0091 ae0000        	ldw	x,#0
 213  0094 89            	pushw	x
 214  0095 ae00c2        	ldw	x,#L11_test_thread_stack+192
 215  0098 89            	pushw	x
 216  0099 ae0002        	ldw	x,#2
 217  009c 89            	pushw	x
 218  009d ae0000        	ldw	x,#0
 219  00a0 89            	pushw	x
 220  00a1 ae0000        	ldw	x,#L51_test_thread_func
 221  00a4 89            	pushw	x
 222  00a5 4b10          	push	#16
 223  00a7 ae031a        	ldw	x,#L7_tcb+24
 224  00aa cd0000        	call	_atomThreadCreate
 226  00ad 5b0e          	addw	sp,#14
 227  00af 4d            	tnz	a
 228  00b0 271e          	jreq	L76
 229                     ; 116             ATOMLOG (_STR("Error creating test thread\n"));
 231  00b2 ae0052        	ldw	x,#L56
 232  00b5 cd0000        	call	_printf
 234                     ; 117             CRITICAL_START ();
 236  00b8 96            	ldw	x,sp
 237  00b9 1c0009        	addw	x,#OFST-2
 239  00bc 8a            push CC
 240  00bd 84            pop a
 241  00be f7            ld (X),A
 242  00bf 9b            sim
 244                     ; 118             g_failures++;
 246  00c0 ce0000        	ldw	x,L31_g_failures
 247  00c3 1c0001        	addw	x,#1
 248  00c6 cf0000        	ldw	L31_g_failures,x
 249                     ; 119             CRITICAL_END ();
 251  00c9 96            	ldw	x,sp
 252  00ca 1c0009        	addw	x,#OFST-2
 254  00cd f6            ld A,(X)
 255  00ce 88            push A
 256  00cf 86            pop CC
 258  00d0               L76:
 259                     ; 123         if (atomThreadCreate(&tcb[2], TEST_THREAD_PRIO, test_thread_func, 3,
 259                     ; 124               &test_thread_stack[2][0],
 259                     ; 125               TEST_THREAD_STACK_SIZE, TRUE) != ATOM_OK)
 261  00d0 4b01          	push	#1
 262  00d2 ae00c0        	ldw	x,#192
 263  00d5 89            	pushw	x
 264  00d6 ae0000        	ldw	x,#0
 265  00d9 89            	pushw	x
 266  00da ae0182        	ldw	x,#L11_test_thread_stack+384
 267  00dd 89            	pushw	x
 268  00de ae0003        	ldw	x,#3
 269  00e1 89            	pushw	x
 270  00e2 ae0000        	ldw	x,#0
 271  00e5 89            	pushw	x
 272  00e6 ae0000        	ldw	x,#L51_test_thread_func
 273  00e9 89            	pushw	x
 274  00ea 4b10          	push	#16
 275  00ec ae0332        	ldw	x,#L7_tcb+48
 276  00ef cd0000        	call	_atomThreadCreate
 278  00f2 5b0e          	addw	sp,#14
 279  00f4 4d            	tnz	a
 280  00f5 271e          	jreq	L17
 281                     ; 128             ATOMLOG (_STR("Error creating test thread\n"));
 283  00f7 ae0052        	ldw	x,#L56
 284  00fa cd0000        	call	_printf
 286                     ; 129             CRITICAL_START ();
 288  00fd 96            	ldw	x,sp
 289  00fe 1c0009        	addw	x,#OFST-2
 291  0101 8a            push CC
 292  0102 84            pop a
 293  0103 f7            ld (X),A
 294  0104 9b            sim
 296                     ; 130             g_failures++;
 298  0105 ce0000        	ldw	x,L31_g_failures
 299  0108 1c0001        	addw	x,#1
 300  010b cf0000        	ldw	L31_g_failures,x
 301                     ; 131             CRITICAL_END ();
 303  010e 96            	ldw	x,sp
 304  010f 1c0009        	addw	x,#OFST-2
 306  0112 f6            ld A,(X)
 307  0113 88            push A
 308  0114 86            pop CC
 310  0115               L17:
 311                     ; 135         if (atomThreadCreate(&tcb[3], TEST_THREAD_PRIO, test_thread_func, 4,
 311                     ; 136               &test_thread_stack[3][0],
 311                     ; 137               TEST_THREAD_STACK_SIZE, TRUE) != ATOM_OK)
 313  0115 4b01          	push	#1
 314  0117 ae00c0        	ldw	x,#192
 315  011a 89            	pushw	x
 316  011b ae0000        	ldw	x,#0
 317  011e 89            	pushw	x
 318  011f ae0242        	ldw	x,#L11_test_thread_stack+576
 319  0122 89            	pushw	x
 320  0123 ae0004        	ldw	x,#4
 321  0126 89            	pushw	x
 322  0127 ae0000        	ldw	x,#0
 323  012a 89            	pushw	x
 324  012b ae0000        	ldw	x,#L51_test_thread_func
 325  012e 89            	pushw	x
 326  012f 4b10          	push	#16
 327  0131 ae034a        	ldw	x,#L7_tcb+72
 328  0134 cd0000        	call	_atomThreadCreate
 330  0137 5b0e          	addw	sp,#14
 331  0139 4d            	tnz	a
 332  013a 271e          	jreq	L37
 333                     ; 140             ATOMLOG (_STR("Error creating test thread\n"));
 335  013c ae0052        	ldw	x,#L56
 336  013f cd0000        	call	_printf
 338                     ; 141             CRITICAL_START ();
 340  0142 96            	ldw	x,sp
 341  0143 1c0009        	addw	x,#OFST-2
 343  0146 8a            push CC
 344  0147 84            pop a
 345  0148 f7            ld (X),A
 346  0149 9b            sim
 348                     ; 142             g_failures++;
 350  014a ce0000        	ldw	x,L31_g_failures
 351  014d 1c0001        	addw	x,#1
 352  0150 cf0000        	ldw	L31_g_failures,x
 353                     ; 143             CRITICAL_END ();
 355  0153 96            	ldw	x,sp
 356  0154 1c0009        	addw	x,#OFST-2
 358  0157 f6            ld A,(X)
 359  0158 88            push A
 360  0159 86            pop CC
 362  015a               L37:
 363                     ; 151         finish_cnt = 0;
 365  015a 5f            	clrw	x
 366  015b 1f0a          	ldw	(OFST-1,sp),x
 368  015d               L57:
 369                     ; 159             if (atomSemGet (&sem2, 0) == ATOM_OK)
 371  015d ae0000        	ldw	x,#0
 372  0160 89            	pushw	x
 373  0161 ae0000        	ldw	x,#0
 374  0164 89            	pushw	x
 375  0165 ae0362        	ldw	x,#L5_sem2
 376  0168 cd0000        	call	_atomSemGet
 378  016b 5b04          	addw	sp,#4
 379  016d 4d            	tnz	a
 380  016e 26ed          	jrne	L57
 381                     ; 162                 finish_cnt++;
 383  0170 1e0a          	ldw	x,(OFST-1,sp)
 384  0172 1c0001        	addw	x,#1
 385  0175 1f0a          	ldw	(OFST-1,sp),x
 387                     ; 165                 if (finish_cnt == 4)
 389  0177 1e0a          	ldw	x,(OFST-1,sp)
 390  0179 a30004        	cpw	x,#4
 391  017c 26df          	jrne	L57
 392                     ; 167                     break;
 393                     ; 173         if (atomSemDelete (&sem1) != ATOM_OK)
 395  017e ae0365        	ldw	x,#L3_sem1
 396  0181 cd0000        	call	_atomSemDelete
 398  0184 4d            	tnz	a
 399  0185 271e          	jreq	L501
 400                     ; 175             ATOMLOG (_STR("Delete failed\n"));
 402  0187 ae0043        	ldw	x,#L701
 403  018a cd0000        	call	_printf
 405                     ; 176             CRITICAL_START ();
 407  018d 96            	ldw	x,sp
 408  018e 1c0009        	addw	x,#OFST-2
 410  0191 8a            push CC
 411  0192 84            pop a
 412  0193 f7            ld (X),A
 413  0194 9b            sim
 415                     ; 177             g_failures++;
 417  0195 ce0000        	ldw	x,L31_g_failures
 418  0198 1c0001        	addw	x,#1
 419  019b cf0000        	ldw	L31_g_failures,x
 420                     ; 178             CRITICAL_END ();
 422  019e 96            	ldw	x,sp
 423  019f 1c0009        	addw	x,#OFST-2
 425  01a2 f6            ld A,(X)
 426  01a3 88            push A
 427  01a4 86            pop CC
 429  01a5               L501:
 430                     ; 180         if (atomSemDelete (&sem2) != ATOM_OK)
 432  01a5 ae0362        	ldw	x,#L5_sem2
 433  01a8 cd0000        	call	_atomSemDelete
 435  01ab 4d            	tnz	a
 436  01ac 271e          	jreq	L55
 437                     ; 182             ATOMLOG (_STR("Delete failed\n"));
 439  01ae ae0043        	ldw	x,#L701
 440  01b1 cd0000        	call	_printf
 442                     ; 183             CRITICAL_START ();
 444  01b4 96            	ldw	x,sp
 445  01b5 1c0009        	addw	x,#OFST-2
 447  01b8 8a            push CC
 448  01b9 84            pop a
 449  01ba f7            ld (X),A
 450  01bb 9b            sim
 452                     ; 184             g_failures++;
 454  01bc ce0000        	ldw	x,L31_g_failures
 455  01bf 1c0001        	addw	x,#1
 456  01c2 cf0000        	ldw	L31_g_failures,x
 457                     ; 185             CRITICAL_END ();
 459  01c5 96            	ldw	x,sp
 460  01c6 1c0009        	addw	x,#OFST-2
 462  01c9 f6            ld A,(X)
 463  01ca 88            push A
 464  01cb 86            pop CC
 466  01cc               L55:
 467                     ; 196         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 469  01cc 5f            	clrw	x
 470  01cd 1f0a          	ldw	(OFST-1,sp),x
 472  01cf               L311:
 473                     ; 199             if (atomThreadStackCheck (&tcb[thread], &used_bytes, &free_bytes) != ATOM_OK)
 475  01cf 96            	ldw	x,sp
 476  01d0 1c0005        	addw	x,#OFST-6
 477  01d3 89            	pushw	x
 478  01d4 96            	ldw	x,sp
 479  01d5 1c0003        	addw	x,#OFST-8
 480  01d8 89            	pushw	x
 481  01d9 1e0e          	ldw	x,(OFST+3,sp)
 482  01db 90ae0018      	ldw	y,#24
 483  01df cd0000        	call	c_imul
 485  01e2 1c0302        	addw	x,#L7_tcb
 486  01e5 cd0000        	call	_atomThreadStackCheck
 488  01e8 5b04          	addw	sp,#4
 489  01ea 4d            	tnz	a
 490  01eb 2711          	jreq	L121
 491                     ; 201                 ATOMLOG (_STR("StackCheck\n"));
 493  01ed ae0037        	ldw	x,#L321
 494  01f0 cd0000        	call	_printf
 496                     ; 202                 g_failures++;
 498  01f3 ce0000        	ldw	x,L31_g_failures
 499  01f6 1c0001        	addw	x,#1
 500  01f9 cf0000        	ldw	L31_g_failures,x
 502  01fc 2026          	jra	L521
 503  01fe               L121:
 504                     ; 207                 if (free_bytes == 0)
 506  01fe 96            	ldw	x,sp
 507  01ff 1c0005        	addw	x,#OFST-6
 508  0202 cd0000        	call	c_lzmp
 510  0205 2613          	jrne	L721
 511                     ; 209                     ATOMLOG (_STR("StackOverflow %d\n"), thread);
 513  0207 1e0a          	ldw	x,(OFST-1,sp)
 514  0209 89            	pushw	x
 515  020a ae0025        	ldw	x,#L131
 516  020d cd0000        	call	_printf
 518  0210 85            	popw	x
 519                     ; 210                     g_failures++;
 521  0211 ce0000        	ldw	x,L31_g_failures
 522  0214 1c0001        	addw	x,#1
 523  0217 cf0000        	ldw	L31_g_failures,x
 524  021a               L721:
 525                     ; 215                 ATOMLOG (_STR("StackUse:%d\n"), (int)used_bytes);
 527  021a 1e03          	ldw	x,(OFST-8,sp)
 528  021c 89            	pushw	x
 529  021d ae0018        	ldw	x,#L331
 530  0220 cd0000        	call	_printf
 532  0223 85            	popw	x
 533  0224               L521:
 534                     ; 196         for (thread = 0; thread < NUM_TEST_THREADS; thread++)
 536  0224 1e0a          	ldw	x,(OFST-1,sp)
 537  0226 1c0001        	addw	x,#1
 538  0229 1f0a          	ldw	(OFST-1,sp),x
 542  022b 9c            	rvf
 543  022c 1e0a          	ldw	x,(OFST-1,sp)
 544  022e a30004        	cpw	x,#4
 545  0231 2f9c          	jrslt	L311
 546                     ; 223     return g_failures;
 548  0233 ce0000        	ldw	x,L31_g_failures
 549  0236 cd0000        	call	c_itolx
 553  0239 5b0b          	addw	sp,#11
 554  023b 81            	ret
 614                     ; 238 static void test_thread_func (uint32_t param)
 614                     ; 239 {
 615                     .text:	section	.text,new
 616  0000               L51_test_thread_func:
 618  0000 5206          	subw	sp,#6
 619       00000006      OFST:	set	6
 622                     ; 245     param = param;
 624                     ; 248     loop_cnt = NUM_TEST_LOOPS;
 626  0002 ae2710        	ldw	x,#10000
 627  0005 1f03          	ldw	(OFST-3,sp),x
 628  0007 ae0000        	ldw	x,#0
 629  000a 1f01          	ldw	(OFST-5,sp),x
 632  000c ac9d009d      	jpf	L361
 633  0010               L751:
 634                     ; 251         if ((status = atomSemGet (&sem1, 0)) != ATOM_OK)
 636  0010 ae0000        	ldw	x,#0
 637  0013 89            	pushw	x
 638  0014 ae0000        	ldw	x,#0
 639  0017 89            	pushw	x
 640  0018 ae0365        	ldw	x,#L3_sem1
 641  001b cd0000        	call	_atomSemGet
 643  001e 5b04          	addw	sp,#4
 644  0020 6b05          	ld	(OFST-1,sp),a
 646  0022 2724          	jreq	L761
 647                     ; 254             ATOMLOG (_STR("G%d\n"), status);
 649  0024 7b05          	ld	a,(OFST-1,sp)
 650  0026 88            	push	a
 651  0027 ae0013        	ldw	x,#L171
 652  002a cd0000        	call	_printf
 654  002d 84            	pop	a
 655                     ; 255             CRITICAL_START ();
 657  002e 96            	ldw	x,sp
 658  002f 1c0006        	addw	x,#OFST+0
 660  0032 8a            push CC
 661  0033 84            pop a
 662  0034 f7            ld (X),A
 663  0035 9b            sim
 665                     ; 256             g_failures++;
 667  0036 ce0000        	ldw	x,L31_g_failures
 668  0039 1c0001        	addw	x,#1
 669  003c cf0000        	ldw	L31_g_failures,x
 670                     ; 257             CRITICAL_END ();
 672  003f 96            	ldw	x,sp
 673  0040 1c0006        	addw	x,#OFST+0
 675  0043 f6            ld A,(X)
 676  0044 88            push A
 677  0045 86            pop CC
 679                     ; 258             break;
 681  0046 202c          	jra	L561
 682  0048               L761:
 683                     ; 260         else if ((status = atomSemPut (&sem1)) != ATOM_OK)
 685  0048 ae0365        	ldw	x,#L3_sem1
 686  004b cd0000        	call	_atomSemPut
 688  004e 6b05          	ld	(OFST-1,sp),a
 690  0050 274b          	jreq	L361
 691                     ; 263             ATOMLOG (_STR("P%d\n"), status);
 693  0052 7b05          	ld	a,(OFST-1,sp)
 694  0054 88            	push	a
 695  0055 ae000e        	ldw	x,#L771
 696  0058 cd0000        	call	_printf
 698  005b 84            	pop	a
 699                     ; 264             CRITICAL_START ();
 701  005c 96            	ldw	x,sp
 702  005d 1c0006        	addw	x,#OFST+0
 704  0060 8a            push CC
 705  0061 84            pop a
 706  0062 f7            ld (X),A
 707  0063 9b            sim
 709                     ; 265             g_failures++;
 711  0064 ce0000        	ldw	x,L31_g_failures
 712  0067 1c0001        	addw	x,#1
 713  006a cf0000        	ldw	L31_g_failures,x
 714                     ; 266             CRITICAL_END ();
 716  006d 96            	ldw	x,sp
 717  006e 1c0006        	addw	x,#OFST+0
 719  0071 f6            ld A,(X)
 720  0072 88            push A
 721  0073 86            pop CC
 723                     ; 267             break;
 724  0074               L561:
 725                     ; 272     if (atomSemPut (&sem2) != ATOM_OK)
 727  0074 ae0362        	ldw	x,#L5_sem2
 728  0077 cd0000        	call	_atomSemPut
 730  007a 4d            	tnz	a
 731  007b 273a          	jreq	L502
 732                     ; 274         ATOMLOG (_STR("Sem2 putfail\n"));
 734  007d ae0000        	ldw	x,#L302
 735  0080 cd0000        	call	_printf
 737                     ; 275         CRITICAL_START ();
 739  0083 96            	ldw	x,sp
 740  0084 1c0006        	addw	x,#OFST+0
 742  0087 8a            push CC
 743  0088 84            pop a
 744  0089 f7            ld (X),A
 745  008a 9b            sim
 747                     ; 276         g_failures++;
 749  008b ce0000        	ldw	x,L31_g_failures
 750  008e 1c0001        	addw	x,#1
 751  0091 cf0000        	ldw	L31_g_failures,x
 752                     ; 277         CRITICAL_END ();
 754  0094 96            	ldw	x,sp
 755  0095 1c0006        	addw	x,#OFST+0
 757  0098 f6            ld A,(X)
 758  0099 88            push A
 759  009a 86            pop CC
 761  009b 201a          	jra	L502
 762  009d               L361:
 763                     ; 249     while (loop_cnt--)
 765  009d 96            	ldw	x,sp
 766  009e 1c0001        	addw	x,#OFST-5
 767  00a1 cd0000        	call	c_ltor
 769  00a4 96            	ldw	x,sp
 770  00a5 1c0001        	addw	x,#OFST-5
 771  00a8 a601          	ld	a,#1
 772  00aa cd0000        	call	c_lgsbc
 775  00ad cd0000        	call	c_lrzmp
 777  00b0 2703          	jreq	L01
 778  00b2 cc0010        	jp	L751
 779  00b5               L01:
 780  00b5 20bd          	jra	L561
 781  00b7               L502:
 782                     ; 283         atomTimerDelay (SYSTEM_TICKS_PER_SEC);
 784  00b7 ae0064        	ldw	x,#100
 785  00ba 89            	pushw	x
 786  00bb ae0000        	ldw	x,#0
 787  00be 89            	pushw	x
 788  00bf cd0000        	call	_atomTimerDelay
 790  00c2 5b04          	addw	sp,#4
 792  00c4 20f1          	jra	L502
1049                     	switch	.bss
1050  0000               L31_g_failures:
1051  0000 0000          	ds.b	2
1052  0002               L11_test_thread_stack:
1053  0002 000000000000  	ds.b	768
1054  0302               L7_tcb:
1055  0302 000000000000  	ds.b	96
1056  0362               L5_sem2:
1057  0362 000000        	ds.b	3
1058  0365               L3_sem1:
1059  0365 000000        	ds.b	3
1060                     	xref	_atomSemPut
1061                     	xref	_atomSemGet
1062                     	xref	_atomSemDelete
1063                     	xref	_atomSemCreate
1064                     	xdef	_test_start
1065                     	xref	_printf
1066                     	xref	_atomThreadStackCheck
1067                     	xref	_atomThreadCreate
1068                     	xref	_atomTimerDelay
1069                     .const:	section	.text
1070  0000               L302:
1071  0000 53656d322070  	dc.b	"Sem2 putfail",10,0
1072  000e               L771:
1073  000e 5025640a00    	dc.b	"P%d",10,0
1074  0013               L171:
1075  0013 4725640a00    	dc.b	"G%d",10,0
1076  0018               L331:
1077  0018 537461636b55  	dc.b	"StackUse:%d",10,0
1078  0025               L131:
1079  0025 537461636b4f  	dc.b	"StackOverflow %d",10,0
1080  0037               L321:
1081  0037 537461636b43  	dc.b	"StackCheck",10,0
1082  0043               L701:
1083  0043 44656c657465  	dc.b	"Delete failed",10,0
1084  0052               L56:
1085  0052 4572726f7220  	dc.b	"Error creating tes"
1086  0064 742074687265  	dc.b	"t thread",10,0
1087  006e               L35:
1088  006e 4572726f7220  	dc.b	"Error creating tes"
1089  0080 742073656d61  	dc.b	"t semaphore 1",10,0
1090                     	xref.b	c_x
1110                     	xref	c_lrzmp
1111                     	xref	c_lgsbc
1112                     	xref	c_ltor
1113                     	xref	c_itolx
1114                     	xref	c_lzmp
1115                     	xref	c_imul
1116                     	end
