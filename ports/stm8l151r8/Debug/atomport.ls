   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
 225                     ; 81 static NO_REG_SAVE void thread_shell (void)
 225                     ; 82 {
 227                     .text:	section	.text,new
 228  0000               L3_thread_shell:
 230  0000 89            	pushw	x
 231       00000002      OFST:	set	2
 234                     ; 86     curr_tcb = atomCurrentContext();
 236  0001 cd0000        	call	_atomCurrentContext
 238  0004 1f01          	ldw	(OFST-1,sp),x
 240                     ; 93     _asm("rim");
 243  0006 9a            rim
 245                     ; 103     if (curr_tcb && curr_tcb->entry_point)
 247  0007 1e01          	ldw	x,(OFST-1,sp)
 248  0009 271a          	jreq	L531
 250  000b 1e01          	ldw	x,(OFST-1,sp)
 251  000d e604          	ld	a,(4,x)
 252  000f ea03          	or	a,(3,x)
 253  0011 2712          	jreq	L531
 254                     ; 105         curr_tcb->entry_point(curr_tcb->entry_param);
 256  0013 1e01          	ldw	x,(OFST-1,sp)
 257  0015 9093          	ldw	y,x
 258  0017 ee07          	ldw	x,(7,x)
 259  0019 89            	pushw	x
 260  001a 93            	ldw	x,y
 261  001b ee05          	ldw	x,(5,x)
 262  001d 89            	pushw	x
 263  001e 1e05          	ldw	x,(OFST+3,sp)
 264  0020 ee03          	ldw	x,(3,x)
 265  0022 fd            	call	(x)
 267  0023 5b04          	addw	sp,#4
 268  0025               L531:
 269                     ; 110 }
 272  0025 85            	popw	x
 273  0026 81            	ret
 334                     ; 168 void archThreadContextInit (ATOM_TCB *tcb_ptr, void *stack_top, void (*entry_point)(uint32_t), uint32_t entry_param)
 334                     ; 169 {
 335                     .text:	section	.text,new
 336  0000               _archThreadContextInit:
 338  0000 89            	pushw	x
 339  0001 89            	pushw	x
 340       00000002      OFST:	set	2
 343                     ; 173     stack_ptr = (uint8_t *)stack_top;
 345  0002 1e07          	ldw	x,(OFST+5,sp)
 346  0004 1f01          	ldw	(OFST-1,sp),x
 348                     ; 190     *stack_ptr-- = (uint8_t)((uint16_t)thread_shell & 0xFF);
 350  0006 a600          	ld	a,#low(L3_thread_shell)
 351  0008 a4ff          	and	a,#255
 352  000a 1e01          	ldw	x,(OFST-1,sp)
 353  000c 1d0001        	subw	x,#1
 354  000f 1f01          	ldw	(OFST-1,sp),x
 355  0011 1c0001        	addw	x,#1
 357  0014 f7            	ld	(x),a
 358                     ; 191     *stack_ptr-- = (uint8_t)(((uint16_t)thread_shell >> 8) & 0xFF);
 360  0015 ae0000        	ldw	x,#L3_thread_shell
 361  0018 4f            	clr	a
 362  0019 01            	rrwa	x,a
 363  001a 9f            	ld	a,xl
 364  001b 1e01          	ldw	x,(OFST-1,sp)
 365  001d 1d0001        	subw	x,#1
 366  0020 1f01          	ldw	(OFST-1,sp),x
 367  0022 1c0001        	addw	x,#1
 369  0025 f7            	ld	(x),a
 370                     ; 227     tcb_ptr->sp_save_ptr = stack_ptr;
 372  0026 1e03          	ldw	x,(OFST+1,sp)
 373  0028 1601          	ldw	y,(OFST-1,sp)
 374  002a ff            	ldw	(x),y
 375                     ; 229 }
 378  002b 5b04          	addw	sp,#4
 379  002d 81            	ret
 408                     ; 239 void archInitSystemTickTimer ( void )
 408                     ; 240 {
 409                     .text:	section	.text,new
 410  0000               _archInitSystemTickTimer:
 414                     ; 242     CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
 416  0000 ae1101        	ldw	x,#4353
 417  0003 cd0000        	call	_CLK_PeripheralClockConfig
 419                     ; 245     TIM1_DeInit();
 421  0006 cd0000        	call	_TIM1_DeInit
 423                     ; 249     TIM1_TimeBaseInit(5000, TIM1_CounterMode_Up, 16, 0);
 425  0009 4b00          	push	#0
 426  000b ae0010        	ldw	x,#16
 427  000e 89            	pushw	x
 428  000f 4b00          	push	#0
 429  0011 ae1388        	ldw	x,#5000
 430  0014 cd0000        	call	_TIM1_TimeBaseInit
 432  0017 5b04          	addw	sp,#4
 433                     ; 252     TIM1_ITConfig(TIM1_IT_Update, ENABLE);
 435  0019 ae0101        	ldw	x,#257
 436  001c cd0000        	call	_TIM1_ITConfig
 438                     ; 255     TIM1_Cmd(ENABLE);
 440  001f a601          	ld	a,#1
 441  0021 cd0000        	call	_TIM1_Cmd
 443                     ; 257 }
 446  0024 81            	ret
 472                     ; 299 INTERRUPT void TIM1_SystemTickISR (void)
 472                     ; 300 #if defined(__RCSTM8__)
 472                     ; 301 interrupt 23
 472                     ; 302 
 472                     ; 303 #elif defined(__SDCC_stm8)
 472                     ; 304 __interrupt(23)
 472                     ; 305 #endif
 472                     ; 306 {
 474                     .text:	section	.text,new
 475  0000               f_TIM1_SystemTickISR:
 477  0000 8a            	push	cc
 478  0001 84            	pop	a
 479  0002 a4bf          	and	a,#191
 480  0004 88            	push	a
 481  0005 86            	pop	cc
 482  0006 3b0002        	push	c_x+2
 483  0009 be00          	ldw	x,c_x
 484  000b 89            	pushw	x
 485  000c 3b0002        	push	c_y+2
 486  000f be00          	ldw	x,c_y
 487  0011 89            	pushw	x
 488  0012 be02          	ldw	x,c_lreg+2
 489  0014 89            	pushw	x
 490  0015 be00          	ldw	x,c_lreg
 491  0017 89            	pushw	x
 494                     ; 308     atomIntEnter();
 496  0018 cd0000        	call	_atomIntEnter
 498                     ; 311     atomTimerTick();
 500  001b cd0000        	call	_atomTimerTick
 502                     ; 314     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT_Update);
 504  001e 35fe52b6      	mov	21174,#254
 505                     ; 317     atomIntExit(TRUE);
 507  0022 a601          	ld	a,#1
 508  0024 cd0000        	call	_atomIntExit
 510                     ; 318 }
 513  0027 85            	popw	x
 514  0028 bf00          	ldw	c_lreg,x
 515  002a 85            	popw	x
 516  002b bf02          	ldw	c_lreg+2,x
 517  002d 85            	popw	x
 518  002e bf00          	ldw	c_y,x
 519  0030 320002        	pop	c_y+2
 520  0033 85            	popw	x
 521  0034 bf00          	ldw	c_x,x
 522  0036 320002        	pop	c_x+2
 523  0039 80            	iret
 535                     	xref	_TIM1_ITConfig
 536                     	xref	_TIM1_Cmd
 537                     	xref	_TIM1_TimeBaseInit
 538                     	xref	_TIM1_DeInit
 539                     	xdef	f_TIM1_SystemTickISR
 540                     	xdef	_archInitSystemTickTimer
 541                     	xref	_atomTimerTick
 542                     	xdef	_archThreadContextInit
 543                     	xref	_atomCurrentContext
 544                     	xref	_atomIntExit
 545                     	xref	_atomIntEnter
 546                     	xref	_CLK_PeripheralClockConfig
 547                     	xref.b	c_lreg
 548                     	xref.b	c_x
 549                     	xref.b	c_y
 568                     	end
