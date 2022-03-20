.module delay
.optsdcc -mstm8
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
.area CODE
.area CONST
.area INITIALIZER
.area CABS (ABS)
