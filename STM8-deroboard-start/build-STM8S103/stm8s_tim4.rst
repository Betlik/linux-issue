                                      1 .module stm8s_tim4
                                      2 .optsdcc -mstm8
                                      3 .globl _TIM4_TimeBaseInit
                                      4 .globl _TIM4_Cmd
                                      5 .globl _TIM4_ITConfig
                                      6 .globl _TIM4_ClearFlag
                                      7 .area DATA
                                      8 .area INITIALIZED
                                      9 .area DABS (ABS)
                                     10 .area HOME
                                     11 .area GSINIT
                                     12 .area GSFINAL
                                     13 .area CONST
                                     14 .area INITIALIZER
                                     15 .area CODE
                                     16 .area HOME
                                     17 .area GSINIT
                                     18 .area GSFINAL
                                     19 .area GSINIT
                                     20 .area HOME
                                     21 .area HOME
                                     22 .area CODE
      00870E                         23 _TIM4_TimeBaseInit:
      00870E AE 53 47         [ 2]   24 ldw	x, #0x5347
      008711 7B 03            [ 1]   25 ld	a, (0x03, sp)
      008713 F7               [ 1]   26 ld	(x), a
      008714 AE 53 48         [ 2]   27 ldw	x, #0x5348
      008717 7B 04            [ 1]   28 ld	a, (0x04, sp)
      008719 F7               [ 1]   29 ld	(x), a
      00871A                         30 00101$:
      00871A 81               [ 4]   31 ret
      00871B                         32 _TIM4_Cmd:
      00871B C6 53 40         [ 1]   33 ld	a, 0x5340
      00871E 0D 03            [ 1]   34 tnz	(0x03, sp)
      008720 26 03            [ 1]   35 jrne	00111$
      008722 CC 87 2D         [ 2]   36 jp	00102$
      008725                         37 00111$:
      008725 AA 01            [ 1]   38 or	a, #0x01
      008727 C7 53 40         [ 1]   39 ld	0x5340, a
      00872A CC 87 32         [ 2]   40 jp	00104$
      00872D                         41 00102$:
      00872D A4 FE            [ 1]   42 and	a, #0xfe
      00872F C7 53 40         [ 1]   43 ld	0x5340, a
      008732                         44 00104$:
      008732 81               [ 4]   45 ret
      008733                         46 _TIM4_ITConfig:
      008733 88               [ 1]   47 push	a
      008734 C6 53 43         [ 1]   48 ld	a, 0x5343
      008737 0D 05            [ 1]   49 tnz	(0x05, sp)
      008739 26 03            [ 1]   50 jrne	00111$
      00873B CC 87 46         [ 2]   51 jp	00102$
      00873E                         52 00111$:
      00873E 1A 04            [ 1]   53 or	a, (0x04, sp)
      008740 C7 53 43         [ 1]   54 ld	0x5343, a
      008743 CC 87 52         [ 2]   55 jp	00104$
      008746                         56 00102$:
      008746 88               [ 1]   57 push	a
      008747 7B 05            [ 1]   58 ld	a, (0x05, sp)
      008749 43               [ 1]   59 cpl	a
      00874A 6B 02            [ 1]   60 ld	(0x02, sp), a
      00874C 84               [ 1]   61 pop	a
      00874D 14 01            [ 1]   62 and	a, (0x01, sp)
      00874F C7 53 43         [ 1]   63 ld	0x5343, a
      008752                         64 00104$:
      008752 84               [ 1]   65 pop	a
      008753 81               [ 4]   66 ret
      008754                         67 _TIM4_ClearFlag:
      008754 7B 03            [ 1]   68 ld	a, (0x03, sp)
      008756 43               [ 1]   69 cpl	a
      008757 C7 53 44         [ 1]   70 ld	0x5344, a
      00875A                         71 00101$:
      00875A 81               [ 4]   72 ret
                                     73 .area CODE
                                     74 .area CONST
                                     75 .area INITIALIZER
                                     76 .area CABS (ABS)
