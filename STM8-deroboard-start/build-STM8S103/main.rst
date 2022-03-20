                                      1 .module main
                                      2 .optsdcc -mstm8
                                      3 .globl _main
                                      4 .globl _setup
                                      5 .globl _sprintf
                                      6 .globl _lcd_puts
                                      7 .globl _lcd_gotoxy
                                      8 .globl _lcd_init
                                      9 .globl _init_milis
                                     10 .globl _GPIO_ReadInputPin
                                     11 .globl _GPIO_WriteReverse
                                     12 .globl _GPIO_Init
                                     13 .globl _CLK_HSIPrescalerConfig
                                     14 .area DATA
                                     15 .area INITIALIZED
                                     16 .area	SSEG
      FFFFFF                         17 __start__stack:
      FFFFFF                         18 .ds	1
                                     19 .area DABS (ABS)
                                     20 .area HOME
                                     21 .area GSINIT
                                     22 .area GSFINAL
                                     23 .area CONST
                                     24 .area INITIALIZER
                                     25 .area CODE
                                     26 .area HOME
      008000                         27 __interrupt_vect:
      008000 82 00 80 6F             28 int s_GSINIT ; reset
      008004 82 00 86 40             29 int _TRAP_IRQHandler ; trap
      008008 82 00 86 41             30 int _TLI_IRQHandler ; int0
      00800C 82 00 86 42             31 int _AWU_IRQHandler ; int1
      008010 82 00 86 43             32 int _CLK_IRQHandler ; int2
      008014 82 00 86 44             33 int _EXTI_PORTA_IRQHandler ; int3
      008018 82 00 86 45             34 int _EXTI_PORTB_IRQHandler ; int4
      00801C 82 00 86 46             35 int _EXTI_PORTC_IRQHandler ; int5
      008020 82 00 86 47             36 int _EXTI_PORTD_IRQHandler ; int6
      008024 82 00 86 48             37 int _EXTI_PORTE_IRQHandler ; int7
      008028 82 00 00 00             38 int 0x000000 ; int8
      00802C 82 00 00 00             39 int 0x000000 ; int9
      008030 82 00 86 49             40 int _SPI_IRQHandler ; int10
      008034 82 00 86 4A             41 int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
      008038 82 00 86 4B             42 int _TIM1_CAP_COM_IRQHandler ; int12
      00803C 82 00 86 4C             43 int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
      008040 82 00 86 4D             44 int _TIM2_CAP_COM_IRQHandler ; int14
      008044 82 00 00 00             45 int 0x000000 ; int15
      008048 82 00 00 00             46 int 0x000000 ; int16
      00804C 82 00 86 4E             47 int _UART1_TX_IRQHandler ; int17
      008050 82 00 86 4F             48 int _UART1_RX_IRQHandler ; int18
      008054 82 00 86 50             49 int _I2C_IRQHandler ; int19
      008058 82 00 00 00             50 int 0x000000 ; int20
      00805C 82 00 00 00             51 int 0x000000 ; int21
      008060 82 00 86 51             52 int _ADC1_IRQHandler ; int22
      008064 82 00 81 F1             53 int _TIM4_UPD_OVF_IRQHandler ; int23
      008068 82 00 86 52             54 int _EEPROM_EEC_IRQHandler ; int24
                                     55 .area HOME
                                     56 .area GSINIT
                                     57 .area GSFINAL
                                     58 .area GSINIT
      00806F                         59 __sdcc_gs_init_startup:
      00806F                         60 __sdcc_init_data:
      00806F AE 00 00         [ 2]   61 ldw x, #l_DATA
      008072 27 07            [ 1]   62 jreq	00002$
      008074                         63 00001$:
      008074 72 4F 00 00      [ 1]   64 clr (s_DATA - 1, x)
      008078 5A               [ 2]   65 decw x
      008079 26 F9            [ 1]   66 jrne	00001$
      00807B                         67 00002$:
      00807B AE 00 04         [ 2]   68 ldw	x, #l_INITIALIZER
      00807E 27 09            [ 1]   69 jreq	00004$
      008080                         70 00003$:
      008080 D6 80 B1         [ 1]   71 ld	a, (s_INITIALIZER - 1, x)
      008083 D7 00 00         [ 1]   72 ld	(s_INITIALIZED - 1, x), a
      008086 5A               [ 2]   73 decw	x
      008087 26 F7            [ 1]   74 jrne	00003$
      008089                         75 00004$:
                                     76 .area GSFINAL
      008089 CC 80 6C         [ 2]   77 jp	__sdcc_program_startup
                                     78 .area HOME
                                     79 .area HOME
      00806C                         80 __sdcc_program_startup:
      00806C CC 81 5A         [ 2]   81 jp	_main
                                     82 .area CODE
      0080FF                         83 _setup:
      0080FF 4B 00            [ 1]   84 push	#0x00
      008101 CD 86 FD         [ 4]   85 call	_CLK_HSIPrescalerConfig
      008104 84               [ 1]   86 pop	a
      008105 4B C0            [ 1]   87 push	#0xc0
      008107 4B 10            [ 1]   88 push	#0x10
      008109 4B 0F            [ 1]   89 push	#0x0f
      00810B 4B 50            [ 1]   90 push	#0x50
      00810D CD 86 53         [ 4]   91 call	_GPIO_Init
      008110 5B 04            [ 2]   92 addw	sp, #4
      008112 4B 40            [ 1]   93 push	#0x40
      008114 4B 20            [ 1]   94 push	#0x20
      008116 4B 05            [ 1]   95 push	#0x05
      008118 4B 50            [ 1]   96 push	#0x50
      00811A CD 86 53         [ 4]   97 call	_GPIO_Init
      00811D 5B 04            [ 2]   98 addw	sp, #4
      00811F 4B 40            [ 1]   99 push	#0x40
      008121 4B 10            [ 1]  100 push	#0x10
      008123 4B 05            [ 1]  101 push	#0x05
      008125 4B 50            [ 1]  102 push	#0x50
      008127 CD 86 53         [ 4]  103 call	_GPIO_Init
      00812A 5B 04            [ 2]  104 addw	sp, #4
      00812C 4B 40            [ 1]  105 push	#0x40
      00812E 4B 08            [ 1]  106 push	#0x08
      008130 4B 0A            [ 1]  107 push	#0x0a
      008132 4B 50            [ 1]  108 push	#0x50
      008134 CD 86 53         [ 4]  109 call	_GPIO_Init
      008137 5B 04            [ 2]  110 addw	sp, #4
      008139 4B 40            [ 1]  111 push	#0x40
      00813B 4B 08            [ 1]  112 push	#0x08
      00813D 4B 0F            [ 1]  113 push	#0x0f
      00813F 4B 50            [ 1]  114 push	#0x50
      008141 CD 86 53         [ 4]  115 call	_GPIO_Init
      008144 5B 04            [ 2]  116 addw	sp, #4
      008146 4B 40            [ 1]  117 push	#0x40
      008148 4B 04            [ 1]  118 push	#0x04
      00814A 4B 0F            [ 1]  119 push	#0x0f
      00814C 4B 50            [ 1]  120 push	#0x50
      00814E CD 86 53         [ 4]  121 call	_GPIO_Init
      008151 5B 04            [ 2]  122 addw	sp, #4
      008153 CD 82 6A         [ 4]  123 call	_lcd_init
      008156 CC 81 CB         [ 2]  124 jp	_init_milis
      008159                        125 00101$:
      008159 81               [ 4]  126 ret
      00815A                        127 _main:
      00815A 52 22            [ 2]  128 sub	sp, #34
      00815C 0F 21            [ 1]  129 clr	(0x21, sp)
      00815E CD 80 FF         [ 4]  130 call	_setup
      008161 4B 00            [ 1]  131 push	#0x00
      008163 4B 00            [ 1]  132 push	#0x00
      008165 CD 82 FD         [ 4]  133 call	_lcd_gotoxy
      008168 85               [ 2]  134 popw	x
      008169 4B 8C            [ 1]  135 push	#<(___str_0 + 0)
      00816B 4B 80            [ 1]  136 push	#((___str_0 + 0) >> 8)
      00816D CD 82 55         [ 4]  137 call	_lcd_puts
      008170 85               [ 2]  138 popw	x
      008171                        139 00108$:
      008171 4B 20            [ 1]  140 push	#0x20
      008173 4B 05            [ 1]  141 push	#0x05
      008175 4B 50            [ 1]  142 push	#0x50
      008177 CD 86 F6         [ 4]  143 call	_GPIO_ReadInputPin
      00817A 5B 03            [ 2]  144 addw	sp, #3
      00817C 4D               [ 1]  145 tnz	a
      00817D 27 03            [ 1]  146 jreq	00132$
      00817F CC 81 89         [ 2]  147 jp	00102$
      008182                        148 00132$:
      008182 A6 01            [ 1]  149 ld	a, #0x01
      008184 6B 22            [ 1]  150 ld	(0x22, sp), a
      008186 CC 81 8B         [ 2]  151 jp	00103$
      008189                        152 00102$:
      008189 0F 22            [ 1]  153 clr	(0x22, sp)
      00818B                        154 00103$:
      00818B 0D 21            [ 1]  155 tnz	(0x21, sp)
      00818D 27 03            [ 1]  156 jreq	00133$
      00818F CC 81 C1         [ 2]  157 jp	00105$
      008192                        158 00133$:
      008192 0D 22            [ 1]  159 tnz	(0x22, sp)
      008194 26 03            [ 1]  160 jrne	00134$
      008196 CC 81 C1         [ 2]  161 jp	00105$
      008199                        162 00134$:
      008199 4B 10            [ 1]  163 push	#0x10
      00819B 4B 0F            [ 1]  164 push	#0x0f
      00819D 4B 50            [ 1]  165 push	#0x50
      00819F CD 86 EF         [ 4]  166 call	_GPIO_WriteReverse
      0081A2 5B 03            [ 2]  167 addw	sp, #3
      0081A4 4B 01            [ 1]  168 push	#0x01
      0081A6 4B 00            [ 1]  169 push	#0x00
      0081A8 CD 82 FD         [ 4]  170 call	_lcd_gotoxy
      0081AB 85               [ 2]  171 popw	x
      0081AC 4B 9B            [ 1]  172 push	#<(___str_1 + 0)
      0081AE 4B 80            [ 1]  173 push	#((___str_1 + 0) >> 8)
      0081B0 96               [ 1]  174 ldw	x, sp
      0081B1 1C 00 03         [ 2]  175 addw	x, #3
      0081B4 89               [ 2]  176 pushw	x
      0081B5 CD 88 77         [ 4]  177 call	_sprintf
      0081B8 5B 04            [ 2]  178 addw	sp, #4
      0081BA 96               [ 1]  179 ldw	x, sp
      0081BB 5C               [ 1]  180 incw	x
      0081BC 89               [ 2]  181 pushw	x
      0081BD CD 82 55         [ 4]  182 call	_lcd_puts
      0081C0 85               [ 2]  183 popw	x
      0081C1                        184 00105$:
      0081C1 7B 22            [ 1]  185 ld	a, (0x22, sp)
      0081C3 6B 21            [ 1]  186 ld	(0x21, sp), a
      0081C5 CC 81 71         [ 2]  187 jp	00108$
      0081C8                        188 00110$:
      0081C8 5B 22            [ 2]  189 addw	sp, #34
      0081CA 81               [ 4]  190 ret
                                    191 .area CODE
                                    192 .area CONST
                                    193 .area CONST
      00808C                        194 ___str_0:
      00808C 6C 69 6E 75 78 20 73   195 .ascii "linux sucks pp"
             75 63 6B 73 20 70 70
      00809A 00                     196 .db 0x00
                                    197 .area CODE
                                    198 .area CONST
      00809B                        199 ___str_1:
      00809B 73 74 6D 38 20 76 79   200 .ascii "stm8 vyber:"
             62 65 72 3A
      0080A6 00                     201 .db 0x00
                                    202 .area CODE
                                    203 .area INITIALIZER
                                    204 .area CABS (ABS)
