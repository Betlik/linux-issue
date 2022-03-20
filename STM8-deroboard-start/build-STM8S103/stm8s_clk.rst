                                      1 .module stm8s_clk
                                      2 .optsdcc -mstm8
                                      3 .globl _CLK_HSIPrescalerConfig
                                      4 .area DATA
                                      5 .area INITIALIZED
                                      6 .area DABS (ABS)
                                      7 .area HOME
                                      8 .area GSINIT
                                      9 .area GSFINAL
                                     10 .area CONST
                                     11 .area INITIALIZER
                                     12 .area CODE
                                     13 .area HOME
                                     14 .area GSINIT
                                     15 .area GSFINAL
                                     16 .area GSINIT
                                     17 .area HOME
                                     18 .area HOME
                                     19 .area CODE
      0086FD                         20 _CLK_HSIPrescalerConfig:
      0086FD C6 50 C6         [ 1]   21 ld	a, 0x50c6
      008700 A4 E7            [ 1]   22 and	a, #0xe7
      008702 C7 50 C6         [ 1]   23 ld	0x50c6, a
      008705 C6 50 C6         [ 1]   24 ld	a, 0x50c6
      008708 1A 03            [ 1]   25 or	a, (0x03, sp)
      00870A C7 50 C6         [ 1]   26 ld	0x50c6, a
      00870D                         27 00101$:
      00870D 81               [ 4]   28 ret
                                     29 .area CODE
                                     30 .area CONST
                                     31 .area INITIALIZER
                                     32 .area CABS (ABS)
