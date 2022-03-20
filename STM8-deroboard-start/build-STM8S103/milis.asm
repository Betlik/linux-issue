.module milis
.optsdcc -mstm8
.globl _TIM4_ClearFlag
.globl _TIM4_ITConfig
.globl _TIM4_Cmd
.globl _TIM4_TimeBaseInit
.globl _ITC_SetSoftwarePriority
.globl _miliseconds
.globl _init_milis
.globl _TIM4_UPD_OVF_IRQHandler
.area DATA
.area INITIALIZED
_miliseconds::
.ds 4
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
_init_milis:
push	#0x7c
push	#0x07
call	_TIM4_TimeBaseInit
popw	x
push	#0x01
call	_TIM4_ClearFlag
pop	a
push	#0x01
push	#0x01
call	_TIM4_ITConfig
popw	x
push	#0x01
push	#0x17
call	_ITC_SetSoftwarePriority
popw	x
rim
push	#0x01
call	_TIM4_Cmd
pop	a
00101$:
ret
_TIM4_UPD_OVF_IRQHandler:
div	x, a
push	#0x01
call	_TIM4_ClearFlag
pop	a
ldw	x, _miliseconds+2
ldw	y, _miliseconds+0
incw	x
jrne	00103$
incw	y
00103$:
ldw	_miliseconds+2, x
ldw	_miliseconds+0, y
00101$:
iret
.area CODE
.area CONST
.area INITIALIZER
__xinit__miliseconds:
.byte #0x00, #0x00, #0x00, #0x00	; 0
.area CABS (ABS)
