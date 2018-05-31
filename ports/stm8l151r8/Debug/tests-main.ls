   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  65                     ; 130 NO_REG_SAVE void main ( void )
  65                     ; 131 {
  67                     .text:	section	.text,new
  68  0000               _main:
  70  0000 88            	push	a
  71       00000001      OFST:	set	1
  74                     ; 143     CLK_DeInit();
  76  0001 cd0000        	call	_CLK_DeInit
  78                     ; 146     CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
  80  0004 4f            	clr	a
  81  0005 cd0000        	call	_CLK_SYSCLKDivConfig
  83                     ; 149     status = atomOSInit(&idle_thread_stack[0], IDLE_STACK_SIZE_BYTES, TRUE);
  85  0008 4b01          	push	#1
  86  000a ae0080        	ldw	x,#128
  87  000d 89            	pushw	x
  88  000e ae0000        	ldw	x,#0
  89  0011 89            	pushw	x
  90  0012 ae0000        	ldw	x,#L7_idle_thread_stack
  91  0015 cd0000        	call	_atomOSInit
  93  0018 5b05          	addw	sp,#5
  94  001a 6b01          	ld	(OFST+0,sp),a
  96                     ; 150     if (status == ATOM_OK)
  98  001c 0d01          	tnz	(OFST+0,sp)
  99  001e 2630          	jrne	L14
 100                     ; 153         archInitSystemTickTimer();
 102  0020 cd0000        	call	_archInitSystemTickTimer
 104                     ; 156         status = atomThreadCreate(&main_tcb,
 104                     ; 157                      TEST_THREAD_PRIO, main_thread_func, 0,
 104                     ; 158                      &main_thread_stack[0],
 104                     ; 159                      MAIN_STACK_SIZE_BYTES,
 104                     ; 160                      TRUE);
 106  0023 4b01          	push	#1
 107  0025 ae0180        	ldw	x,#384
 108  0028 89            	pushw	x
 109  0029 ae0000        	ldw	x,#0
 110  002c 89            	pushw	x
 111  002d ae0080        	ldw	x,#L5_main_thread_stack
 112  0030 89            	pushw	x
 113  0031 ae0000        	ldw	x,#0
 114  0034 89            	pushw	x
 115  0035 ae0000        	ldw	x,#0
 116  0038 89            	pushw	x
 117  0039 ae0000        	ldw	x,#L11_main_thread_func
 118  003c 89            	pushw	x
 119  003d 4b10          	push	#16
 120  003f ae0200        	ldw	x,#L3_main_tcb
 121  0042 cd0000        	call	_atomThreadCreate
 123  0045 5b0e          	addw	sp,#14
 124  0047 6b01          	ld	(OFST+0,sp),a
 126                     ; 161         if (status == ATOM_OK)
 128  0049 0d01          	tnz	(OFST+0,sp)
 129  004b 2603          	jrne	L14
 130                     ; 173             atomOSStart();
 132  004d cd0000        	call	_atomOSStart
 134  0050               L14:
 136  0050 20fe          	jra	L14
 205                     ; 196 static void main_thread_func (uint32_t param)
 205                     ; 197 {
 206                     .text:	section	.text,new
 207  0000               L11_main_thread_func:
 209  0000 520e          	subw	sp,#14
 210       0000000e      OFST:	set	14
 213                     ; 202     param = param;
 215                     ; 211     if (uart_init(115107) != 0)
 217  0002 aec1a3        	ldw	x,#49571
 218  0005 89            	pushw	x
 219  0006 ae0001        	ldw	x,#1
 220  0009 89            	pushw	x
 221  000a cd0000        	call	_uart_init
 223  000d 5b04          	addw	sp,#4
 224  000f a30000        	cpw	x,#0
 225                     ; 217     printf ("Go\n");
 227  0012 ae0031        	ldw	x,#L37
 228  0015 cd0000        	call	_printf
 230                     ; 220     test_status = test_start();
 232  0018 cd0000        	call	_test_start
 234  001b 96            	ldw	x,sp
 235  001c 1c000b        	addw	x,#OFST-3
 236  001f cd0000        	call	c_rtol
 239                     ; 224     if (test_status == 0)
 241  0022 96            	ldw	x,sp
 242  0023 1c000b        	addw	x,#OFST-3
 243  0026 cd0000        	call	c_lzmp
 245  0029 2637          	jrne	L57
 246                     ; 229         if (atomThreadStackCheck (&main_tcb, &used_bytes, &free_bytes) == ATOM_OK)
 248  002b 96            	ldw	x,sp
 249  002c 1c0005        	addw	x,#OFST-9
 250  002f 89            	pushw	x
 251  0030 96            	ldw	x,sp
 252  0031 1c0003        	addw	x,#OFST-11
 253  0034 89            	pushw	x
 254  0035 ae0200        	ldw	x,#L3_main_tcb
 255  0038 cd0000        	call	_atomThreadStackCheck
 257  003b 5b04          	addw	sp,#4
 258  003d 4d            	tnz	a
 259  003e 2622          	jrne	L57
 260                     ; 232             if (free_bytes == 0)
 262  0040 96            	ldw	x,sp
 263  0041 1c0005        	addw	x,#OFST-9
 264  0044 cd0000        	call	c_lzmp
 266  0047 260f          	jrne	L101
 267                     ; 234                 printf ("Main stack overflow\n");
 269  0049 ae001c        	ldw	x,#L301
 270  004c cd0000        	call	_printf
 272                     ; 235                 test_status++;
 274  004f 96            	ldw	x,sp
 275  0050 1c000b        	addw	x,#OFST-3
 276  0053 a601          	ld	a,#1
 277  0055 cd0000        	call	c_lgadc
 280  0058               L101:
 281                     ; 240             printf ("MainUse:%d\n", (int)used_bytes);
 283  0058 1e03          	ldw	x,(OFST-11,sp)
 284  005a 89            	pushw	x
 285  005b ae0010        	ldw	x,#L501
 286  005e cd0000        	call	_printf
 288  0061 85            	popw	x
 289  0062               L57:
 290                     ; 248     if (test_status == 0)
 292  0062 96            	ldw	x,sp
 293  0063 1c000b        	addw	x,#OFST-3
 294  0066 cd0000        	call	c_lzmp
 296  0069 2608          	jrne	L701
 297                     ; 250         printf ("Pass\n");
 299  006b ae000a        	ldw	x,#L111
 300  006e cd0000        	call	_printf
 303  0071 200a          	jra	L311
 304  0073               L701:
 305                     ; 254         printf ("Fail(%d)\n", (int)test_status);
 307  0073 1e0d          	ldw	x,(OFST-1,sp)
 308  0075 89            	pushw	x
 309  0076 ae0000        	ldw	x,#L511
 310  0079 cd0000        	call	_printf
 312  007c 85            	popw	x
 313  007d               L311:
 314                     ; 258     sleep_ticks = (test_status == 0) ? SYSTEM_TICKS_PER_SEC : (SYSTEM_TICKS_PER_SEC/8);
 316  007d 96            	ldw	x,sp
 317  007e 1c000b        	addw	x,#OFST-3
 318  0081 cd0000        	call	c_lzmp
 320  0084 2605          	jrne	L01
 321  0086 ae0064        	ldw	x,#100
 322  0089 2003          	jra	L21
 323  008b               L01:
 324  008b ae000c        	ldw	x,#12
 325  008e               L21:
 326  008e 1f09          	ldw	(OFST-5,sp),x
 328                     ; 261     GPIO_DeInit(GPIOE);
 330  0090 ae5014        	ldw	x,#20500
 331  0093 cd0000        	call	_GPIO_DeInit
 333                     ; 262     GPIO_Init(GPIOE, GPIO_Pin_7, GPIO_Mode_Out_PP_Low_Fast);    
 335  0096 4be0          	push	#224
 336  0098 4b80          	push	#128
 337  009a ae5014        	ldw	x,#20500
 338  009d cd0000        	call	_GPIO_Init
 340  00a0 85            	popw	x
 341  00a1               L711:
 342                     ; 269         GPIO_ToggleBits(GPIOE, GPIO_Pin_7);
 344  00a1 4b80          	push	#128
 345  00a3 ae5014        	ldw	x,#20500
 346  00a6 cd0000        	call	_GPIO_ToggleBits
 348  00a9 84            	pop	a
 349                     ; 272         atomTimerDelay (sleep_ticks);
 351  00aa 1e09          	ldw	x,(OFST-5,sp)
 352  00ac cd0000        	call	c_itolx
 354  00af be02          	ldw	x,c_lreg+2
 355  00b1 89            	pushw	x
 356  00b2 be00          	ldw	x,c_lreg
 357  00b4 89            	pushw	x
 358  00b5 cd0000        	call	_atomTimerDelay
 360  00b8 5b04          	addw	sp,#4
 362  00ba 20e5          	jra	L711
 571                     	xdef	_main
 572                     	switch	.bss
 573  0000               L7_idle_thread_stack:
 574  0000 000000000000  	ds.b	128
 575  0080               L5_main_thread_stack:
 576  0080 000000000000  	ds.b	384
 577  0200               L3_main_tcb:
 578  0200 000000000000  	ds.b	24
 579                     	xref	_uart_init
 580                     	xref	_test_start
 581                     	xref	_archInitSystemTickTimer
 582                     	xref	_atomThreadStackCheck
 583                     	xref	_atomThreadCreate
 584                     	xref	_atomOSStart
 585                     	xref	_atomOSInit
 586                     	xref	_atomTimerDelay
 587                     	xref	_GPIO_ToggleBits
 588                     	xref	_GPIO_Init
 589                     	xref	_GPIO_DeInit
 590                     	xref	_CLK_SYSCLKDivConfig
 591                     	xref	_CLK_DeInit
 592                     	xref	_printf
 593                     .const:	section	.text
 594  0000               L511:
 595  0000 4661696c2825  	dc.b	"Fail(%d)",10,0
 596  000a               L111:
 597  000a 506173730a00  	dc.b	"Pass",10,0
 598  0010               L501:
 599  0010 4d61696e5573  	dc.b	"MainUse:%d",10,0
 600  001c               L301:
 601  001c 4d61696e2073  	dc.b	"Main stack overflo"
 602  002e 770a00        	dc.b	"w",10,0
 603  0031               L37:
 604  0031 476f0a00      	dc.b	"Go",10,0
 605                     	xref.b	c_lreg
 625                     	xref	c_itolx
 626                     	xref	c_lgadc
 627                     	xref	c_lzmp
 628                     	xref	c_rtol
 629                     	end
