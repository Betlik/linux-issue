.module main
.optsdcc -mstm8
.globl _main
.globl _setup
.globl _sprintf
.globl _lcd_puts
.globl _lcd_gotoxy
.globl _lcd_init
.globl _init_milis
.globl _GPIO_ReadInputPin
.globl _GPIO_WriteReverse
.globl _GPIO_Init
.globl _CLK_HSIPrescalerConfig
.area DATA
.area INITIALIZED
.area	SSEG
__start__stack:
.ds	1
.area DABS (ABS)
.area HOME
.area GSINIT
.area GSFINAL
.area CONST
.area INITIALIZER
.area CODE
.area HOME
__interrupt_vect:
int s_GSINIT ; reset
int _TRAP_IRQHandler ; trap
int _TLI_IRQHandler ; int0
int _AWU_IRQHandler ; int1
int _CLK_IRQHandler ; int2
int _EXTI_PORTA_IRQHandler ; int3
int _EXTI_PORTB_IRQHandler ; int4
int _EXTI_PORTC_IRQHandler ; int5
int _EXTI_PORTD_IRQHandler ; int6
int _EXTI_PORTE_IRQHandler ; int7
int 0x000000 ; int8
int 0x000000 ; int9
int _SPI_IRQHandler ; int10
int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
int _TIM1_CAP_COM_IRQHandler ; int12
int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
int _TIM2_CAP_COM_IRQHandler ; int14
int 0x000000 ; int15
int 0x000000 ; int16
int _UART1_TX_IRQHandler ; int17
int _UART1_RX_IRQHandler ; int18
int _I2C_IRQHandler ; int19
int 0x000000 ; int20
int 0x000000 ; int21
int _ADC1_IRQHandler ; int22
int _TIM4_UPD_OVF_IRQHandler ; int23
int _EEPROM_EEC_IRQHandler ; int24
.area HOME
.area GSINIT
.area GSFINAL
.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
ldw x, #l_DATA
jreq	00002$
00001$:
clr (s_DATA - 1, x)
decw x
jrne	00001$
00002$:
ldw	x, #l_INITIALIZER
jreq	00004$
00003$:
ld	a, (s_INITIALIZER - 1, x)
ld	(s_INITIALIZED - 1, x), a
decw	x
jrne	00003$
00004$:
.area GSFINAL
jp	__sdcc_program_startup
.area HOME
.area HOME
__sdcc_program_startup:
jp	_main
.area CODE
_setup:
push	#0x00
call	_CLK_HSIPrescalerConfig
pop	a
push	#0xc0
push	#0x10
push	#0x0f
push	#0x50
call	_GPIO_Init
addw	sp, #4
push	#0x40
push	#0x20
push	#0x05
push	#0x50
call	_GPIO_Init
addw	sp, #4
push	#0x40
push	#0x10
push	#0x05
push	#0x50
call	_GPIO_Init
addw	sp, #4
push	#0x40
push	#0x08
push	#0x0a
push	#0x50
call	_GPIO_Init
addw	sp, #4
push	#0x40
push	#0x08
push	#0x0f
push	#0x50
call	_GPIO_Init
addw	sp, #4
push	#0x40
push	#0x04
push	#0x0f
push	#0x50
call	_GPIO_Init
addw	sp, #4
call	_lcd_init
jp	_init_milis
00101$:
ret
_main:
sub	sp, #34
clr	(0x21, sp)
call	_setup
push	#0x00
push	#0x00
call	_lcd_gotoxy
popw	x
push	#<(___str_0 + 0)
push	#((___str_0 + 0) >> 8)
call	_lcd_puts
popw	x
00108$:
push	#0x20
push	#0x05
push	#0x50
call	_GPIO_ReadInputPin
addw	sp, #3
tnz	a
jreq	00132$
jp	00102$
00132$:
ld	a, #0x01
ld	(0x22, sp), a
jp	00103$
00102$:
clr	(0x22, sp)
00103$:
tnz	(0x21, sp)
jreq	00133$
jp	00105$
00133$:
tnz	(0x22, sp)
jrne	00134$
jp	00105$
00134$:
push	#0x10
push	#0x0f
push	#0x50
call	_GPIO_WriteReverse
addw	sp, #3
push	#0x01
push	#0x00
call	_lcd_gotoxy
popw	x
push	#<(___str_1 + 0)
push	#((___str_1 + 0) >> 8)
ldw	x, sp
addw	x, #3
pushw	x
call	_sprintf
addw	sp, #4
ldw	x, sp
incw	x
pushw	x
call	_lcd_puts
popw	x
00105$:
ld	a, (0x22, sp)
ld	(0x21, sp), a
jp	00108$
00110$:
addw	sp, #34
ret
.area CODE
.area CONST
.area CONST
___str_0:
.ascii "linux sucks pp"
.db 0x00
.area CODE
.area CONST
___str_1:
.ascii "stm8 vyber:"
.db 0x00
.area CODE
.area INITIALIZER
.area CABS (ABS)
