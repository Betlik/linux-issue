.module stm8_hd44780
.optsdcc -mstm8
.globl _GPIO_ReadInputPin
.globl _GPIO_WriteLow
.globl _GPIO_WriteHigh
.globl _GPIO_Init
.globl _lcd_puts
.globl _lcd_init
.globl _lcd_gotoxy
.globl _lcd_init_hw
.globl _lcd_bus_outputs
.globl _lcd_bus_inputs
.globl _lcd_bus_set
.globl _lcd_bus_read
.globl _lcd_e_tick
.globl _lcd_command
.globl _lcd_data
.globl _lcd_read
.globl _lcd_busy_wait
.area DATA
.area INITIALIZED
.area DABS (ABS)
.area HOME
.area GSINIT
.area GSFINAL
.area CONST
.area INITIALIZER
.area CODE
.area HOME
.area GSINIT
.area GSFINAL
.area GSINIT
.area HOME
.area HOME
.area CODE
__delay_cycl:
nop
nop
ldw	x, (0x03, sp)
00101$:
decw	x
tnzw	x
jreq	00117$
jp	00101$
00117$:
nop
00104$:
ret
__delay_us:
ldw	y, (0x03, sp)
clrw	x
pushw	y
pushw	x
push	#0x00
push	#0x24
push	#0xf4
push	#0x00
call	__mullong
addw	sp, #8
push	#0x40
push	#0x42
push	#0x0f
push	#0x00
pushw	x
pushw	y
call	__divulong
addw	sp, #8
srlw	y
rrcw	x
srlw	y
rrcw	x
srlw	y
rrcw	x
incw	x
exgw	x, y
nop
nop
00101$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00117$
jp	00101$
00117$:
nop
00105$:
ret
_lcd_puts:
ldw	x, (0x03, sp)
00101$:
ld	a, (x)
tnz	a
jrne	00117$
jp	00104$
00117$:
pushw	x
push	a
call	_lcd_data
pop	a
popw	x
incw	x
jp	00101$
00104$:
ret
_lcd_init:
call	_lcd_init_hw
call	_lcd_bus_outputs
ldw	y, #0x01d9
nop
nop
00101$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00163$
jp	00101$
00163$:
nop
push	#0x03
call	_lcd_bus_set
pop	a
call	_lcd_e_tick
ldw	y, #0x0093
nop
nop
00106$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00164$
jp	00106$
00164$:
nop
push	#0x03
call	_lcd_bus_set
pop	a
call	_lcd_e_tick
ldw	y, #0x00c9
nop
nop
00111$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00165$
jp	00111$
00165$:
nop
push	#0x03
call	_lcd_bus_set
pop	a
call	_lcd_e_tick
push	#0x02
call	_lcd_bus_set
pop	a
call	_lcd_e_tick
ldw	y, #0x0051
nop
nop
00116$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00166$
jp	00116$
00166$:
nop
push	#0x28
call	_lcd_command
pop	a
push	#0x06
call	_lcd_command
pop	a
push	#0x0c
call	_lcd_command
pop	a
push	#0x14
call	_lcd_command
pop	a
push	#0x01
call	_lcd_command
pop	a
push	#0x02
call	_lcd_command
pop	a
00121$:
ret
_lcd_gotoxy:
clrw	x
ld	a, (0x03, sp)
cp	a, #0x0f
jrugt	00125$
jp	00102$
00125$:
ld	a, #0x0f
ld	(0x03, sp), a
00102$:
tnz	(0x04, sp)
jreq	00126$
jp	00106$
00126$:
clrw	x
jp	00107$
00106$:
ld	a, (0x04, sp)
dec	a
jrne	00128$
jp	00129$
00128$:
jp	00107$
00129$:
ld	a, #0x40
ld	xl, a
00107$:
ld	a, xl
add	a, (0x03, sp)
or	a, #0x80
push	a
call	_lcd_command
pop	a
00108$:
ret
_lcd_init_hw:
push	#0xc0
push	#0x10
push	#0x0f
push	#0x50
call	_GPIO_Init
addw	sp, #4
push	#0xc0
push	#0x20
push	#0x0f
push	#0x50
call	_GPIO_Init
addw	sp, #4
push	#0xd0
push	#0x40
push	#0x0f
push	#0x50
call	_GPIO_Init
addw	sp, #4
jp	_lcd_bus_outputs
00101$:
ret
_lcd_bus_outputs:
push	#0xc0
push	#0x10
push	#0x0a
push	#0x50
call	_GPIO_Init
addw	sp, #4
push	#0xc0
push	#0x20
push	#0x0a
push	#0x50
call	_GPIO_Init
addw	sp, #4
push	#0xc0
push	#0x40
push	#0x0a
push	#0x50
call	_GPIO_Init
addw	sp, #4
push	#0xc0
push	#0x80
push	#0x0a
push	#0x50
call	_GPIO_Init
addw	sp, #4
00101$:
ret
_lcd_bus_inputs:
push	#0x00
push	#0x10
push	#0x0a
push	#0x50
call	_GPIO_Init
addw	sp, #4
push	#0x00
push	#0x20
push	#0x0a
push	#0x50
call	_GPIO_Init
addw	sp, #4
push	#0x00
push	#0x40
push	#0x0a
push	#0x50
call	_GPIO_Init
addw	sp, #4
push	#0x00
push	#0x80
push	#0x0a
push	#0x50
call	_GPIO_Init
addw	sp, #4
00101$:
ret
_lcd_bus_set:
ld	a, (0x03, sp)
srl	a
jrc	00135$
jp	00102$
00135$:
push	#0x10
push	#0x0a
push	#0x50
call	_GPIO_WriteHigh
addw	sp, #3
jp	00103$
00102$:
push	#0x10
push	#0x0a
push	#0x50
call	_GPIO_WriteLow
addw	sp, #3
00103$:
ld	a, (0x03, sp)
bcp	a, #0x02
jrne	00136$
jp	00105$
00136$:
push	#0x20
push	#0x0a
push	#0x50
call	_GPIO_WriteHigh
addw	sp, #3
jp	00106$
00105$:
push	#0x20
push	#0x0a
push	#0x50
call	_GPIO_WriteLow
addw	sp, #3
00106$:
ld	a, (0x03, sp)
bcp	a, #0x04
jrne	00137$
jp	00108$
00137$:
push	#0x40
push	#0x0a
push	#0x50
call	_GPIO_WriteHigh
addw	sp, #3
jp	00109$
00108$:
push	#0x40
push	#0x0a
push	#0x50
call	_GPIO_WriteLow
addw	sp, #3
00109$:
ld	a, (0x03, sp)
bcp	a, #0x08
jrne	00138$
jp	00111$
00138$:
push	#0x80
push	#0x0a
push	#0x50
call	_GPIO_WriteHigh
addw	sp, #3
jp	00113$
00111$:
push	#0x80
push	#0x0a
push	#0x50
call	_GPIO_WriteLow
addw	sp, #3
00113$:
ret
_lcd_bus_read:
push	a
clr	(0x01, sp)
push	#0x10
push	#0x0a
push	#0x50
call	_GPIO_ReadInputPin
addw	sp, #3
tnz	a
jrne	00131$
jp	00102$
00131$:
srl	(0x01, sp)
scf
rlc	(0x01, sp)
00102$:
push	#0x20
push	#0x0a
push	#0x50
call	_GPIO_ReadInputPin
addw	sp, #3
tnz	a
jrne	00132$
jp	00104$
00132$:
ld	a, (0x01, sp)
or	a, #0x02
ld	(0x01, sp), a
00104$:
push	#0x40
push	#0x0a
push	#0x50
call	_GPIO_ReadInputPin
addw	sp, #3
tnz	a
jrne	00133$
jp	00106$
00133$:
ld	a, (0x01, sp)
or	a, #0x04
ld	(0x01, sp), a
00106$:
push	#0x80
push	#0x0a
push	#0x50
call	_GPIO_ReadInputPin
addw	sp, #3
tnz	a
jrne	00134$
jp	00108$
00134$:
ld	a, (0x01, sp)
or	a, #0x08
ld	(0x01, sp), a
00108$:
ld	a, (0x01, sp)
00109$:
addw	sp, #1
ret
_lcd_e_tick:
push	#0x40
push	#0x0f
push	#0x50
call	_GPIO_WriteHigh
addw	sp, #3
ldw	y, #0x0003
nop
nop
00101$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00133$
jp	00101$
00133$:
nop
push	#0x40
push	#0x0f
push	#0x50
call	_GPIO_WriteLow
addw	sp, #3
ldw	y, #0x0003
nop
nop
00106$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00134$
jp	00106$
00134$:
nop
00111$:
ret
_lcd_command:
push	#0x10
push	#0x0f
push	#0x50
call	_GPIO_WriteLow
addw	sp, #3
ldw	y, #0x0003
nop
nop
00101$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00118$
jp	00101$
00118$:
nop
ld	a, (0x03, sp)
swap	a
and	a, #0x0f
and	a, #0x0f
push	a
call	_lcd_bus_set
pop	a
call	_lcd_e_tick
ld	a, (0x03, sp)
and	a, #0x0f
push	a
call	_lcd_bus_set
pop	a
call	_lcd_e_tick
jp	_lcd_busy_wait
00106$:
ret
_lcd_data:
push	#0x10
push	#0x0f
push	#0x50
call	_GPIO_WriteHigh
addw	sp, #3
ldw	y, #0x0003
nop
nop
00101$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00118$
jp	00101$
00118$:
nop
ld	a, (0x03, sp)
swap	a
and	a, #0x0f
and	a, #0x0f
push	a
call	_lcd_bus_set
pop	a
call	_lcd_e_tick
ld	a, (0x03, sp)
and	a, #0x0f
push	a
call	_lcd_bus_set
pop	a
call	_lcd_e_tick
jp	_lcd_busy_wait
00106$:
ret
_lcd_read:
push	a
push	#0x10
push	#0x0f
push	#0x50
call	_GPIO_WriteLow
addw	sp, #3
call	_lcd_bus_inputs
push	#0x20
push	#0x0f
push	#0x50
call	_GPIO_WriteHigh
addw	sp, #3
ldw	y, #0x0003
nop
nop
00101$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00178$
jp	00101$
00178$:
nop
push	#0x40
push	#0x0f
push	#0x50
call	_GPIO_WriteHigh
addw	sp, #3
ldw	y, #0x0003
nop
nop
00106$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00179$
jp	00106$
00179$:
nop
call	_lcd_bus_read
swap	a
and	a, #0xf0
ld	(0x01, sp), a
push	#0x40
push	#0x0f
push	#0x50
call	_GPIO_WriteLow
addw	sp, #3
ldw	y, #0x0003
nop
nop
00111$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00180$
jp	00111$
00180$:
nop
push	#0x40
push	#0x0f
push	#0x50
call	_GPIO_WriteHigh
addw	sp, #3
ldw	y, #0x0003
nop
nop
00116$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00181$
jp	00116$
00181$:
nop
call	_lcd_bus_read
or	a, (0x01, sp)
ld	(0x01, sp), a
push	#0x40
push	#0x0f
push	#0x50
call	_GPIO_WriteLow
addw	sp, #3
ldw	y, #0x0003
nop
nop
00121$:
ldw	x, y
decw	x
ldw	y, x
tnzw	x
jreq	00182$
jp	00121$
00182$:
nop
push	#0x20
push	#0x0f
push	#0x50
call	_GPIO_WriteLow
addw	sp, #3
call	_lcd_bus_outputs
ld	a, (0x01, sp)
00126$:
addw	sp, #1
ret
_lcd_busy_wait:
ldw	x, #0x01f4
00102$:
tnzw	x
jrne	00131$
jp	00114$
00131$:
pushw	x
call	_lcd_read
popw	x
tnz	a
jrmi	00132$
jp	00114$
00132$:
decw	x
jp	00102$
00114$:
tnzw	x
jreq	00133$
jp	00106$
00133$:
ld	a, #0x01
jp	00108$
00106$:
clr	a
00108$:
ret
.area CODE
.area CONST
.area INITIALIZER
.area CABS (ABS)
