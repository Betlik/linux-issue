.module stm8s_tim4
.optsdcc -mstm8
.globl _TIM4_TimeBaseInit
.globl _TIM4_Cmd
.globl _TIM4_ITConfig
.globl _TIM4_ClearFlag
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
_TIM4_TimeBaseInit:
ldw	x, #0x5347
ld	a, (0x03, sp)
ld	(x), a
ldw	x, #0x5348
ld	a, (0x04, sp)
ld	(x), a
00101$:
ret
_TIM4_Cmd:
ld	a, 0x5340
tnz	(0x03, sp)
jrne	00111$
jp	00102$
00111$:
or	a, #0x01
ld	0x5340, a
jp	00104$
00102$:
and	a, #0xfe
ld	0x5340, a
00104$:
ret
_TIM4_ITConfig:
push	a
ld	a, 0x5343
tnz	(0x05, sp)
jrne	00111$
jp	00102$
00111$:
or	a, (0x04, sp)
ld	0x5343, a
jp	00104$
00102$:
push	a
ld	a, (0x05, sp)
cpl	a
ld	(0x02, sp), a
pop	a
and	a, (0x01, sp)
ld	0x5343, a
00104$:
pop	a
ret
_TIM4_ClearFlag:
ld	a, (0x03, sp)
cpl	a
ld	0x5344, a
00101$:
ret
.area CODE
.area CONST
.area INITIALIZER
.area CABS (ABS)
