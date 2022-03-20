                                      1 .module stm8s_gpio
                                      2 .optsdcc -mstm8
                                      3 .globl _GPIO_Init
                                      4 .globl _GPIO_WriteHigh
                                      5 .globl _GPIO_WriteLow
                                      6 .globl _GPIO_WriteReverse
                                      7 .globl _GPIO_ReadInputPin
                                      8 .area DATA
                                      9 .area INITIALIZED
                                     10 .area DABS (ABS)
                                     11 .area HOME
                                     12 .area GSINIT
                                     13 .area GSFINAL
                                     14 .area CONST
                                     15 .area INITIALIZER
                                     16 .area CODE
                                     17 .area HOME
                                     18 .area GSINIT
                                     19 .area GSFINAL
                                     20 .area GSINIT
                                     21 .area HOME
                                     22 .area HOME
                                     23 .area CODE
      008653                         24 _GPIO_Init:
      008653 52 05            [ 2]   25 sub	sp, #5
      008655 16 08            [ 2]   26 ldw	y, (0x08, sp)
      008657 93               [ 1]   27 ldw	x, y
      008658 1C 00 04         [ 2]   28 addw	x, #0x0004
      00865B 1F 01            [ 2]   29 ldw	(0x01, sp), x
      00865D 1E 01            [ 2]   30 ldw	x, (0x01, sp)
      00865F F6               [ 1]   31 ld	a, (x)
      008660 88               [ 1]   32 push	a
      008661 7B 0B            [ 1]   33 ld	a, (0x0b, sp)
      008663 43               [ 1]   34 cpl	a
      008664 6B 04            [ 1]   35 ld	(0x04, sp), a
      008666 84               [ 1]   36 pop	a
      008667 14 03            [ 1]   37 and	a, (0x03, sp)
      008669 1E 01            [ 2]   38 ldw	x, (0x01, sp)
      00866B F7               [ 1]   39 ld	(x), a
      00866C 93               [ 1]   40 ldw	x, y
      00866D 5C               [ 1]   41 incw	x
      00866E 5C               [ 1]   42 incw	x
      00866F 1F 04            [ 2]   43 ldw	(0x04, sp), x
      008671 0D 0B            [ 1]   44 tnz	(0x0b, sp)
      008673 2B 03            [ 1]   45 jrmi	00135$
      008675 CC 86 9B         [ 2]   46 jp	00105$
      008678                         47 00135$:
      008678 90 F6            [ 1]   48 ld	a, (y)
      00867A 88               [ 1]   49 push	a
      00867B 7B 0C            [ 1]   50 ld	a, (0x0c, sp)
      00867D A5 10            [ 1]   51 bcp	a, #0x10
      00867F 84               [ 1]   52 pop	a
      008680 26 03            [ 1]   53 jrne	00136$
      008682 CC 86 8C         [ 2]   54 jp	00102$
      008685                         55 00136$:
      008685 1A 0A            [ 1]   56 or	a, (0x0a, sp)
      008687 90 F7            [ 1]   57 ld	(y), a
      008689 CC 86 90         [ 2]   58 jp	00103$
      00868C                         59 00102$:
      00868C 14 03            [ 1]   60 and	a, (0x03, sp)
      00868E 90 F7            [ 1]   61 ld	(y), a
      008690                         62 00103$:
      008690 1E 04            [ 2]   63 ldw	x, (0x04, sp)
      008692 F6               [ 1]   64 ld	a, (x)
      008693 1A 0A            [ 1]   65 or	a, (0x0a, sp)
      008695 1E 04            [ 2]   66 ldw	x, (0x04, sp)
      008697 F7               [ 1]   67 ld	(x), a
      008698 CC 86 A3         [ 2]   68 jp	00106$
      00869B                         69 00105$:
      00869B 1E 04            [ 2]   70 ldw	x, (0x04, sp)
      00869D F6               [ 1]   71 ld	a, (x)
      00869E 14 03            [ 1]   72 and	a, (0x03, sp)
      0086A0 1E 04            [ 2]   73 ldw	x, (0x04, sp)
      0086A2 F7               [ 1]   74 ld	(x), a
      0086A3                         75 00106$:
      0086A3 93               [ 1]   76 ldw	x, y
      0086A4 1C 00 03         [ 2]   77 addw	x, #0x0003
      0086A7 F6               [ 1]   78 ld	a, (x)
      0086A8 88               [ 1]   79 push	a
      0086A9 7B 0C            [ 1]   80 ld	a, (0x0c, sp)
      0086AB A5 40            [ 1]   81 bcp	a, #0x40
      0086AD 84               [ 1]   82 pop	a
      0086AE 26 03            [ 1]   83 jrne	00137$
      0086B0 CC 86 B9         [ 2]   84 jp	00108$
      0086B3                         85 00137$:
      0086B3 1A 0A            [ 1]   86 or	a, (0x0a, sp)
      0086B5 F7               [ 1]   87 ld	(x), a
      0086B6 CC 86 BC         [ 2]   88 jp	00109$
      0086B9                         89 00108$:
      0086B9 14 03            [ 1]   90 and	a, (0x03, sp)
      0086BB F7               [ 1]   91 ld	(x), a
      0086BC                         92 00109$:
      0086BC 1E 01            [ 2]   93 ldw	x, (0x01, sp)
      0086BE F6               [ 1]   94 ld	a, (x)
      0086BF 88               [ 1]   95 push	a
      0086C0 7B 0C            [ 1]   96 ld	a, (0x0c, sp)
      0086C2 A5 20            [ 1]   97 bcp	a, #0x20
      0086C4 84               [ 1]   98 pop	a
      0086C5 26 03            [ 1]   99 jrne	00138$
      0086C7 CC 86 D2         [ 2]  100 jp	00111$
      0086CA                        101 00138$:
      0086CA 1A 0A            [ 1]  102 or	a, (0x0a, sp)
      0086CC 1E 01            [ 2]  103 ldw	x, (0x01, sp)
      0086CE F7               [ 1]  104 ld	(x), a
      0086CF CC 86 D7         [ 2]  105 jp	00113$
      0086D2                        106 00111$:
      0086D2 14 03            [ 1]  107 and	a, (0x03, sp)
      0086D4 1E 01            [ 2]  108 ldw	x, (0x01, sp)
      0086D6 F7               [ 1]  109 ld	(x), a
      0086D7                        110 00113$:
      0086D7 5B 05            [ 2]  111 addw	sp, #5
      0086D9 81               [ 4]  112 ret
      0086DA                        113 _GPIO_WriteHigh:
      0086DA 1E 03            [ 2]  114 ldw	x, (0x03, sp)
      0086DC F6               [ 1]  115 ld	a, (x)
      0086DD 1A 05            [ 1]  116 or	a, (0x05, sp)
      0086DF F7               [ 1]  117 ld	(x), a
      0086E0                        118 00101$:
      0086E0 81               [ 4]  119 ret
      0086E1                        120 _GPIO_WriteLow:
      0086E1 88               [ 1]  121 push	a
      0086E2 1E 04            [ 2]  122 ldw	x, (0x04, sp)
      0086E4 F6               [ 1]  123 ld	a, (x)
      0086E5 6B 01            [ 1]  124 ld	(0x01, sp), a
      0086E7 7B 06            [ 1]  125 ld	a, (0x06, sp)
      0086E9 43               [ 1]  126 cpl	a
      0086EA 14 01            [ 1]  127 and	a, (0x01, sp)
      0086EC F7               [ 1]  128 ld	(x), a
      0086ED                        129 00101$:
      0086ED 84               [ 1]  130 pop	a
      0086EE 81               [ 4]  131 ret
      0086EF                        132 _GPIO_WriteReverse:
      0086EF 1E 03            [ 2]  133 ldw	x, (0x03, sp)
      0086F1 F6               [ 1]  134 ld	a, (x)
      0086F2 18 05            [ 1]  135 xor	a, (0x05, sp)
      0086F4 F7               [ 1]  136 ld	(x), a
      0086F5                        137 00101$:
      0086F5 81               [ 4]  138 ret
      0086F6                        139 _GPIO_ReadInputPin:
      0086F6 1E 03            [ 2]  140 ldw	x, (0x03, sp)
      0086F8 E6 01            [ 1]  141 ld	a, (0x1, x)
      0086FA 14 05            [ 1]  142 and	a, (0x05, sp)
      0086FC                        143 00101$:
      0086FC 81               [ 4]  144 ret
                                    145 .area CODE
                                    146 .area CONST
                                    147 .area INITIALIZER
                                    148 .area CABS (ABS)
