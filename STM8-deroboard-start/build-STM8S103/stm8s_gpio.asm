.module stm8s_gpio
.optsdcc -mstm8
.globl _GPIO_Init
.globl _GPIO_WriteHigh
.globl _GPIO_WriteLow
.globl _GPIO_WriteReverse
.globl _GPIO_ReadInputPin
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
_GPIO_Init:
sub	sp, #5
ldw	y, (0x08, sp)
ldw	x, y
addw	x, #0x0004
ldw	(0x01, sp), x
ldw	x, (0x01, sp)
ld	a, (x)
push	a
ld	a, (0x0b, sp)
cpl	a
ld	(0x04, sp), a
pop	a
and	a, (0x03, sp)
ldw	x, (0x01, sp)
ld	(x), a
ldw	x, y
incw	x
incw	x
ldw	(0x04, sp), x
tnz	(0x0b, sp)
jrmi	00135$
jp	00105$
00135$:
ld	a, (y)
push	a
ld	a, (0x0c, sp)
bcp	a, #0x10
pop	a
jrne	00136$
jp	00102$
00136$:
or	a, (0x0a, sp)
ld	(y), a
jp	00103$
00102$:
and	a, (0x03, sp)
ld	(y), a
00103$:
ldw	x, (0x04, sp)
ld	a, (x)
or	a, (0x0a, sp)
ldw	x, (0x04, sp)
ld	(x), a
jp	00106$
00105$:
ldw	x, (0x04, sp)
ld	a, (x)
and	a, (0x03, sp)
ldw	x, (0x04, sp)
ld	(x), a
00106$:
ldw	x, y
addw	x, #0x0003
ld	a, (x)
push	a
ld	a, (0x0c, sp)
bcp	a, #0x40
pop	a
jrne	00137$
jp	00108$
00137$:
or	a, (0x0a, sp)
ld	(x), a
jp	00109$
00108$:
and	a, (0x03, sp)
ld	(x), a
00109$:
ldw	x, (0x01, sp)
ld	a, (x)
push	a
ld	a, (0x0c, sp)
bcp	a, #0x20
pop	a
jrne	00138$
jp	00111$
00138$:
or	a, (0x0a, sp)
ldw	x, (0x01, sp)
ld	(x), a
jp	00113$
00111$:
and	a, (0x03, sp)
ldw	x, (0x01, sp)
ld	(x), a
00113$:
addw	sp, #5
ret
_GPIO_WriteHigh:
ldw	x, (0x03, sp)
ld	a, (x)
or	a, (0x05, sp)
ld	(x), a
00101$:
ret
_GPIO_WriteLow:
push	a
ldw	x, (0x04, sp)
ld	a, (x)
ld	(0x01, sp), a
ld	a, (0x06, sp)
cpl	a
and	a, (0x01, sp)
ld	(x), a
00101$:
pop	a
ret
_GPIO_WriteReverse:
ldw	x, (0x03, sp)
ld	a, (x)
xor	a, (0x05, sp)
ld	(x), a
00101$:
ret
_GPIO_ReadInputPin:
ldw	x, (0x03, sp)
ld	a, (0x1, x)
and	a, (0x05, sp)
00101$:
ret
.area CODE
.area CONST
.area INITIALIZER
.area CABS (ABS)
