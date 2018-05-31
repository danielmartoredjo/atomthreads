   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.9 - 08 Feb 2017
   3                     ; Generator (Limited) V4.4.6 - 08 Feb 2017
  68                     ; 19 int uart_init(uint32_t baudrate)
  68                     ; 20 {
  70                     .text:	section	.text,new
  71  0000               _uart_init:
  73  0000 89            	pushw	x
  74       00000002      OFST:	set	2
  77                     ; 23   CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
  79  0001 ae0501        	ldw	x,#1281
  80  0004 cd0000        	call	_CLK_PeripheralClockConfig
  82                     ; 29   USART_DeInit(USART1);
  84  0007 ae5230        	ldw	x,#21040
  85  000a cd0000        	call	_USART_DeInit
  87                     ; 32   GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_Out_PP_Low_Fast);
  89  000d 4be0          	push	#224
  90  000f 4b08          	push	#8
  91  0011 ae500a        	ldw	x,#20490
  92  0014 cd0000        	call	_GPIO_Init
  94  0017 85            	popw	x
  95                     ; 34   GPIO_Init(GPIOC, GPIO_Pin_2, GPIO_Mode_In_FL_No_IT);
  97  0018 4b00          	push	#0
  98  001a 4b04          	push	#4
  99  001c ae500a        	ldw	x,#20490
 100  001f cd0000        	call	_GPIO_Init
 102  0022 85            	popw	x
 103                     ; 36   USART_Init(USART1, baudrate, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, 
 103                     ; 37              (/*USART_Mode_Rx |*/ USART_Mode_Tx) );
 105  0023 4b08          	push	#8
 106  0025 4b00          	push	#0
 107  0027 4b00          	push	#0
 108  0029 4b00          	push	#0
 109  002b 1e0b          	ldw	x,(OFST+9,sp)
 110  002d 89            	pushw	x
 111  002e 1e0b          	ldw	x,(OFST+9,sp)
 112  0030 89            	pushw	x
 113  0031 ae5230        	ldw	x,#21040
 114  0034 cd0000        	call	_USART_Init
 116  0037 5b08          	addw	sp,#8
 117                     ; 38   USART_Cmd(USART1, ENABLE);
 119  0039 4b01          	push	#1
 120  003b ae5230        	ldw	x,#21040
 121  003e cd0000        	call	_USART_Cmd
 123  0041 84            	pop	a
 124                     ; 41   if (atomMutexCreate (&uart_mutex) != ATOM_OK)
 126  0042 ae0000        	ldw	x,#L3_uart_mutex
 127  0045 cd0000        	call	_atomMutexCreate
 129  0048 4d            	tnz	a
 130  0049 2707          	jreq	L13
 131                     ; 43     status = -1;
 133  004b aeffff        	ldw	x,#65535
 134  004e 1f01          	ldw	(OFST-1,sp),x
 137  0050 2003          	jra	L33
 138  0052               L13:
 139                     ; 47     status = 0;
 141  0052 5f            	clrw	x
 142  0053 1f01          	ldw	(OFST-1,sp),x
 144  0055               L33:
 145                     ; 51   return (status);
 147  0055 1e01          	ldw	x,(OFST-1,sp)
 150  0057 5b02          	addw	sp,#2
 151  0059 81            	ret
 189                     ; 64 char uart_putchar (char c)
 189                     ; 65 {
 190                     .text:	section	.text,new
 191  0000               _uart_putchar:
 193  0000 88            	push	a
 194       00000000      OFST:	set	0
 197                     ; 67     if (atomMutexGet(&uart_mutex, 0) == ATOM_OK)
 199  0001 ae0000        	ldw	x,#0
 200  0004 89            	pushw	x
 201  0005 ae0000        	ldw	x,#0
 202  0008 89            	pushw	x
 203  0009 ae0000        	ldw	x,#L3_uart_mutex
 204  000c cd0000        	call	_atomMutexGet
 206  000f 5b04          	addw	sp,#4
 207  0011 4d            	tnz	a
 208  0012 2629          	jrne	L15
 209                     ; 70         if (c == '\n')
 211  0014 7b01          	ld	a,(OFST+1,sp)
 212  0016 a10a          	cp	a,#10
 213  0018 2605          	jrne	L35
 214                     ; 71             putchar('\r');
 216  001a a60d          	ld	a,#13
 217  001c cd0000        	call	_putchar
 219  001f               L35:
 220                     ; 74         USART_SendData8(USART1, c);
 222  001f 7b01          	ld	a,(OFST+1,sp)
 223  0021 88            	push	a
 224  0022 ae5230        	ldw	x,#21040
 225  0025 cd0000        	call	_USART_SendData8
 227  0028 84            	pop	a
 229  0029               L75:
 230                     ; 77         while (USART_GetFlagStatus(USART1, USART_FLAG_TXE) == RESET)
 232  0029 ae0080        	ldw	x,#128
 233  002c 89            	pushw	x
 234  002d ae5230        	ldw	x,#21040
 235  0030 cd0000        	call	_USART_GetFlagStatus
 237  0033 85            	popw	x
 238  0034 4d            	tnz	a
 239  0035 27f2          	jreq	L75
 240                     ; 81         atomMutexPut(&uart_mutex);
 242  0037 ae0000        	ldw	x,#L3_uart_mutex
 243  003a cd0000        	call	_atomMutexPut
 245  003d               L15:
 246                     ; 85     return (c);
 248  003d 7b01          	ld	a,(OFST+1,sp)
 251  003f 5b01          	addw	sp,#1
 252  0041 81            	ret
 285                     ; 100 char putchar (char c)
 285                     ; 101 {
 286                     .text:	section	.text,new
 287  0000               _putchar:
 291                     ; 102     return (uart_putchar(c));
 293  0000 cd0000        	call	_uart_putchar
 297  0003 81            	ret
 524                     	xdef	_uart_putchar
 525                     	switch	.bss
 526  0000               L3_uart_mutex:
 527  0000 0000000000    	ds.b	5
 528                     	xdef	_uart_init
 529                     	xref	_atomMutexPut
 530                     	xref	_atomMutexGet
 531                     	xref	_atomMutexCreate
 532                     	xref	_USART_GetFlagStatus
 533                     	xref	_USART_SendData8
 534                     	xref	_USART_Cmd
 535                     	xref	_USART_Init
 536                     	xref	_USART_DeInit
 537                     	xref	_GPIO_Init
 538                     	xref	_CLK_PeripheralClockConfig
 539                     	xdef	_putchar
 559                     	end
