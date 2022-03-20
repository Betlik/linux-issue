.module stm8s_itc
.optsdcc -mstm8
.globl _ITC_SetSoftwarePriority
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
_ITC_SetSoftwarePriority:
pushw	x
ld	a, (0x05, sp)
clrw	x
and	a, #0x03
ld	xl, a
clr	a
sllw	x
ld	a, #0x03
push	a
ld	a, xl
tnz	a
jreq	00132$
00131$:
sll	(1, sp)
dec	a
jrne	00131$
00132$:
pop	a
cpl	a
ld	(0x01, sp), a
ld	a, (0x06, sp)
push	a
ld	a, xl
tnz	a
jreq	00134$
00133$:
sll	(1, sp)
dec	a
jrne	00133$
00134$:
pop	a
ld	(0x02, sp), a
ld	a, (0x05, sp)
cp	a, #0x18
jrule	00135$
jp	00124$
00135$:
clrw	x
ld	a, (0x05, sp)
ld	xl, a
sllw	x
ldw	x, (#00136$, x)
jp	(x)
00136$:
.dw	#00104$
.dw	#00104$
.dw	#00104$
.dw	#00104$
.dw	#00108$
.dw	#00108$
.dw	#00108$
.dw	#00108$
.dw	#00124$
.dw	#00124$
.dw	#00110$
.dw	#00110$
.dw	#00114$
.dw	#00114$
.dw	#00114$
.dw	#00114$
.dw	#00118$
.dw	#00118$
.dw	#00118$
.dw	#00118$
.dw	#00124$
.dw	#00124$
.dw	#00120$
.dw	#00120$
.dw	#00121$
00104$:
ld	a, 0x7f70
and	a, (0x01, sp)
ld	0x7f70, a
ld	a, 0x7f70
or	a, (0x02, sp)
ld	0x7f70, a
jp	00124$
00108$:
ld	a, 0x7f71
and	a, (0x01, sp)
ld	0x7f71, a
ld	a, 0x7f71
or	a, (0x02, sp)
ld	0x7f71, a
jp	00124$
00110$:
ld	a, 0x7f72
and	a, (0x01, sp)
ld	0x7f72, a
ld	a, 0x7f72
or	a, (0x02, sp)
ld	0x7f72, a
jp	00124$
00114$:
ld	a, 0x7f73
and	a, (0x01, sp)
ld	0x7f73, a
ld	a, 0x7f73
or	a, (0x02, sp)
ld	0x7f73, a
jp	00124$
00118$:
ld	a, 0x7f74
and	a, (0x01, sp)
ld	0x7f74, a
ld	a, 0x7f74
or	a, (0x02, sp)
ld	0x7f74, a
jp	00124$
00120$:
ld	a, 0x7f75
and	a, (0x01, sp)
ld	0x7f75, a
ld	a, 0x7f75
or	a, (0x02, sp)
ld	0x7f75, a
jp	00124$
00121$:
ld	a, 0x7f76
and	a, (0x01, sp)
ld	0x7f76, a
ld	a, 0x7f76
or	a, (0x02, sp)
ld	0x7f76, a
00124$:
popw	x
ret
.area CODE
.area CONST
.area INITIALIZER
.area CABS (ABS)
