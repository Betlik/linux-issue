                                      1 .module delay
                                      2 .optsdcc -mstm8
                                      3 .area DATA
                                      4 .area INITIALIZED
                                      5 .area DABS (ABS)
                                      6 .area HOME
                                      7 .area GSINIT
                                      8 .area GSFINAL
                                      9 .area CONST
                                     10 .area INITIALIZER
                                     11 .area CODE
                                     12 .area HOME
                                     13 .area GSINIT
                                     14 .area GSFINAL
                                     15 .area GSINIT
                                     16 .area HOME
                                     17 .area HOME
                                     18 .area CODE
      0080B6                         19 __delay_cycl:
      0080B6 9D               [ 1]   20 nop
      0080B7 9D               [ 1]   21 nop
      0080B8 1E 03            [ 2]   22 ldw	x, (0x03, sp)
      0080BA                         23 00101$:
      0080BA 5A               [ 2]   24 decw	x
      0080BB 5D               [ 2]   25 tnzw	x
      0080BC 27 03            [ 1]   26 jreq	00117$
      0080BE CC 80 BA         [ 2]   27 jp	00101$
      0080C1                         28 00117$:
      0080C1 9D               [ 1]   29 nop
      0080C2                         30 00104$:
      0080C2 81               [ 4]   31 ret
      0080C3                         32 __delay_us:
      0080C3 16 03            [ 2]   33 ldw	y, (0x03, sp)
      0080C5 5F               [ 1]   34 clrw	x
      0080C6 90 89            [ 2]   35 pushw	y
      0080C8 89               [ 2]   36 pushw	x
      0080C9 4B 00            [ 1]   37 push	#0x00
      0080CB 4B 24            [ 1]   38 push	#0x24
      0080CD 4B F4            [ 1]   39 push	#0xf4
      0080CF 4B 00            [ 1]   40 push	#0x00
      0080D1 CD 88 EC         [ 4]   41 call	__mullong
      0080D4 5B 08            [ 2]   42 addw	sp, #8
      0080D6 4B 40            [ 1]   43 push	#0x40
      0080D8 4B 42            [ 1]   44 push	#0x42
      0080DA 4B 0F            [ 1]   45 push	#0x0f
      0080DC 4B 00            [ 1]   46 push	#0x00
      0080DE 89               [ 2]   47 pushw	x
      0080DF 90 89            [ 2]   48 pushw	y
      0080E1 CD 88 92         [ 4]   49 call	__divulong
      0080E4 5B 08            [ 2]   50 addw	sp, #8
      0080E6 90 54            [ 2]   51 srlw	y
      0080E8 56               [ 2]   52 rrcw	x
      0080E9 90 54            [ 2]   53 srlw	y
      0080EB 56               [ 2]   54 rrcw	x
      0080EC 90 54            [ 2]   55 srlw	y
      0080EE 56               [ 2]   56 rrcw	x
      0080EF 5C               [ 1]   57 incw	x
      0080F0 51               [ 1]   58 exgw	x, y
      0080F1 9D               [ 1]   59 nop
      0080F2 9D               [ 1]   60 nop
      0080F3                         61 00101$:
      0080F3 93               [ 1]   62 ldw	x, y
      0080F4 5A               [ 2]   63 decw	x
      0080F5 90 93            [ 1]   64 ldw	y, x
      0080F7 5D               [ 2]   65 tnzw	x
      0080F8 27 03            [ 1]   66 jreq	00117$
      0080FA CC 80 F3         [ 2]   67 jp	00101$
      0080FD                         68 00117$:
      0080FD 9D               [ 1]   69 nop
      0080FE                         70 00105$:
      0080FE 81               [ 4]   71 ret
                                     72 .area CODE
                                     73 .area CONST
                                     74 .area INITIALIZER
                                     75 .area CABS (ABS)
