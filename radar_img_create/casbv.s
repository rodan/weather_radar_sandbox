GAS LISTING /tmp/ccpwE1Qr.s 			page 1


   1              		.file	"casbv.c"
   2              		.text
   3              	.Ltext0:
   4              		.file 0 "/home/prodan/_work/linux/radar/radar_img_create" "casbv.c"
   5              		.globl	heatmap_cs_casbv_mixed_exp
   6              		.section	.data.rel.local,"aw"
   7              		.align 8
   8              		.type	heatmap_cs_casbv_mixed_exp, @object
   9              		.size	heatmap_cs_casbv_mixed_exp, 8
  10              	heatmap_cs_casbv_mixed_exp:
  11 0000 00000000 		.quad	mixed_exp
  11      00000000 
  12              		.section	.data.rel.ro.local,"aw"
  13              		.align 16
  14              		.type	mixed_exp, @object
  15              		.size	mixed_exp, 24
  16              	mixed_exp:
  17 0000 00000000 		.quad	discrete_data
  17      00000000 
  18 0008 09000000 		.quad	9
  18      00000000 
  19 0010 06000000 		.long	6
  20 0014 08000000 		.long	8
  21              		.globl	heatmap_cs_casbv_mixed
  22              		.section	.data.rel.local
  23              		.align 8
  24              		.type	heatmap_cs_casbv_mixed, @object
  25              		.size	heatmap_cs_casbv_mixed, 8
  26              	heatmap_cs_casbv_mixed:
  27 0008 00000000 		.quad	mixed
  27      00000000 
  28              		.section	.data.rel.ro.local
  29 0018 00000000 		.align 16
  29      00000000 
  30              		.type	mixed, @object
  31              		.size	mixed, 24
  32              	mixed:
  33 0020 00000000 		.quad	discrete_data
  33      00000000 
  34 0028 09000000 		.quad	9
  34      00000000 
  35 0030 06000000 		.long	6
  36 0034 08000000 		.long	8
  37              		.globl	heatmap_cs_casbv_soft
  38              		.section	.data.rel.local
  39              		.align 8
  40              		.type	heatmap_cs_casbv_soft, @object
  41              		.size	heatmap_cs_casbv_soft, 8
  42              	heatmap_cs_casbv_soft:
  43 0010 00000000 		.quad	soft
  43      00000000 
  44              		.section	.data.rel.ro.local
  45 0038 00000000 		.align 16
  45      00000000 
  46              		.type	soft, @object
  47              		.size	soft, 24
  48              	soft:
GAS LISTING /tmp/ccpwE1Qr.s 			page 2


  49 0040 00000000 		.quad	discrete_data
  49      00000000 
  50 0048 09000000 		.quad	9
  50      00000000 
  51 0050 06000000 		.long	6
  52 0054 08000000 		.long	8
  53              		.globl	heatmap_cs_casbv_discrete
  54              		.section	.data.rel.local
  55              		.align 8
  56              		.type	heatmap_cs_casbv_discrete, @object
  57              		.size	heatmap_cs_casbv_discrete, 8
  58              	heatmap_cs_casbv_discrete:
  59 0018 00000000 		.quad	discrete
  59      00000000 
  60              		.section	.data.rel.ro.local
  61 0058 00000000 		.align 16
  61      00000000 
  62              		.type	discrete, @object
  63              		.size	discrete, 24
  64              	discrete:
  65 0060 00000000 		.quad	discrete_data
  65      00000000 
  66 0068 09000000 		.quad	9
  66      00000000 
  67 0070 06000000 		.long	6
  68 0074 08000000 		.long	8
  69              		.section	.rodata
  70              		.align 32
  71              		.type	discrete_data, @object
  72              		.size	discrete_data, 36
  73              	discrete_data:
  74 0000 00       		.string	""
  75 0001 00       		.string	""
  76 0002 00       		.string	""
  77 0003 00       		.string	""
  78 0004 99FF99FF 		.string	"\231\377\231\3773\3773\377"
  78      33FF33FF 
  78      00
  79 000d 9900     		.string	"\231"
  80 000f FF00     		.string	"\377"
  81 0011 6600     		.string	"f"
  82 0013 FFFF66CC 		.string	"\377\377f\314\377\2313\314\377f"
  82      FF9933CC 
  82      FF6600
  83 001e 99FF3300 		.string	"\231\3773"
  84 0022 66FF     		.ascii	"f\377"
  85              		.text
  86              	.Letext0:
  87              		.file 1 "libheatmap/heatmap.h"
  88              		.file 2 "/usr/lib/gcc/x86_64-pc-linux-gnu/12/include/stddef.h"
  89              		.file 3 "casbv.h"
  90              		.file 4 "casbv.c"
  91              		.section	.debug_info,"",@progbits
  92              	.Ldebug_info0:
  93 0000 A0010000 		.long	0x1a0
  94 0004 0500     		.value	0x5
  95 0006 01       		.byte	0x1
GAS LISTING /tmp/ccpwE1Qr.s 			page 3


  96 0007 08       		.byte	0x8
  97 0008 00000000 		.long	.Ldebug_abbrev0
  98 000c 09       		.uleb128 0x9
  99 000d 00000000 		.long	.LASF23
 100 0011 1D       		.byte	0x1d
 101 0012 00000000 		.long	.LASF0
 102 0016 00000000 		.long	.LASF1
 103 001a 00000000 		.long	.Ldebug_line0
 104 001e 01       		.uleb128 0x1
 105 001f 08       		.byte	0x8
 106 0020 05       		.byte	0x5
 107 0021 00000000 		.long	.LASF2
 108 0025 07       		.uleb128 0x7
 109 0026 00000000 		.long	.LASF12
 110 002a 02       		.byte	0x2
 111 002b D6       		.byte	0xd6
 112 002c 17       		.byte	0x17
 113 002d 31000000 		.long	0x31
 114 0031 01       		.uleb128 0x1
 115 0032 08       		.byte	0x8
 116 0033 07       		.byte	0x7
 117 0034 00000000 		.long	.LASF3
 118 0038 0A       		.uleb128 0xa
 119 0039 04       		.byte	0x4
 120 003a 05       		.byte	0x5
 121 003b 696E7400 		.string	"int"
 122 003f 01       		.uleb128 0x1
 123 0040 08       		.byte	0x8
 124 0041 05       		.byte	0x5
 125 0042 00000000 		.long	.LASF4
 126 0046 01       		.uleb128 0x1
 127 0047 10       		.byte	0x10
 128 0048 04       		.byte	0x4
 129 0049 00000000 		.long	.LASF5
 130 004d 01       		.uleb128 0x1
 131 004e 04       		.byte	0x4
 132 004f 04       		.byte	0x4
 133 0050 00000000 		.long	.LASF6
 134 0054 01       		.uleb128 0x1
 135 0055 04       		.byte	0x4
 136 0056 07       		.byte	0x7
 137 0057 00000000 		.long	.LASF7
 138 005b 0B       		.uleb128 0xb
 139 005c 18       		.byte	0x18
 140 005d 01       		.byte	0x1
 141 005e 45       		.byte	0x45
 142 005f 09       		.byte	0x9
 143 0060 96000000 		.long	0x96
 144 0064 05       		.uleb128 0x5
 145 0065 00000000 		.long	.LASF8
 146 0069 46       		.byte	0x46
 147 006a 1A       		.byte	0x1a
 148 006b 96000000 		.long	0x96
 149 006f 00       		.byte	0
 150 0070 05       		.uleb128 0x5
 151 0071 00000000 		.long	.LASF9
 152 0075 47       		.byte	0x47
GAS LISTING /tmp/ccpwE1Qr.s 			page 4


 153 0076 0C       		.byte	0xc
 154 0077 25000000 		.long	0x25
 155 007b 08       		.byte	0x8
 156 007c 05       		.uleb128 0x5
 157 007d 00000000 		.long	.LASF10
 158 0081 48       		.byte	0x48
 159 0082 0E       		.byte	0xe
 160 0083 54000000 		.long	0x54
 161 0087 10       		.byte	0x10
 162 0088 0C       		.uleb128 0xc
 163 0089 62707000 		.string	"bpp"
 164 008d 01       		.byte	0x1
 165 008e 49       		.byte	0x49
 166 008f 0E       		.byte	0xe
 167 0090 54000000 		.long	0x54
 168 0094 14       		.byte	0x14
 169 0095 00       		.byte	0
 170 0096 08       		.uleb128 0x8
 171 0097 A2000000 		.long	0xa2
 172 009b 01       		.uleb128 0x1
 173 009c 01       		.byte	0x1
 174 009d 08       		.byte	0x8
 175 009e 00000000 		.long	.LASF11
 176 00a2 06       		.uleb128 0x6
 177 00a3 9B000000 		.long	0x9b
 178 00a7 07       		.uleb128 0x7
 179 00a8 00000000 		.long	.LASF13
 180 00ac 01       		.byte	0x1
 181 00ad 4A       		.byte	0x4a
 182 00ae 03       		.byte	0x3
 183 00af 5B000000 		.long	0x5b
 184 00b3 06       		.uleb128 0x6
 185 00b4 A7000000 		.long	0xa7
 186 00b8 08       		.uleb128 0x8
 187 00b9 B3000000 		.long	0xb3
 188 00bd 03       		.uleb128 0x3
 189 00be 00000000 		.long	.LASF14
 190 00c2 0A       		.byte	0xa
 191 00c3 B8000000 		.long	0xb8
 192 00c7 03       		.uleb128 0x3
 193 00c8 00000000 		.long	.LASF15
 194 00cc 0C       		.byte	0xc
 195 00cd B8000000 		.long	0xb8
 196 00d1 03       		.uleb128 0x3
 197 00d2 00000000 		.long	.LASF16
 198 00d6 0E       		.byte	0xe
 199 00d7 B8000000 		.long	0xb8
 200 00db 03       		.uleb128 0x3
 201 00dc 00000000 		.long	.LASF17
 202 00e0 11       		.byte	0x11
 203 00e1 B8000000 		.long	0xb8
 204 00e5 0D       		.uleb128 0xd
 205 00e6 A2000000 		.long	0xa2
 206 00ea F5000000 		.long	0xf5
 207 00ee 0E       		.uleb128 0xe
 208 00ef 31000000 		.long	0x31
 209 00f3 23       		.byte	0x23
GAS LISTING /tmp/ccpwE1Qr.s 			page 5


 210 00f4 00       		.byte	0
 211 00f5 06       		.uleb128 0x6
 212 00f6 E5000000 		.long	0xe5
 213 00fa 02       		.uleb128 0x2
 214 00fb 00000000 		.long	.LASF18
 215 00ff 0B       		.byte	0xb
 216 0100 1C       		.byte	0x1c
 217 0101 F5000000 		.long	0xf5
 218 0105 09       		.uleb128 0x9
 219 0106 03       		.byte	0x3
 220 0107 00000000 		.quad	discrete_data
 220      00000000 
 221 010f 02       		.uleb128 0x2
 222 0110 00000000 		.long	.LASF19
 223 0114 0E       		.byte	0xe
 224 0115 24       		.byte	0x24
 225 0116 B3000000 		.long	0xb3
 226 011a 09       		.uleb128 0x9
 227 011b 03       		.byte	0x3
 228 011c 00000000 		.quad	discrete
 228      00000000 
 229 0124 04       		.uleb128 0x4
 230 0125 BD000000 		.long	0xbd
 231 0129 0F       		.byte	0xf
 232 012a 09       		.uleb128 0x9
 233 012b 03       		.byte	0x3
 234 012c 00000000 		.quad	heatmap_cs_casbv_discrete
 234      00000000 
 235 0134 02       		.uleb128 0x2
 236 0135 00000000 		.long	.LASF20
 237 0139 11       		.byte	0x11
 238 013a 24       		.byte	0x24
 239 013b B3000000 		.long	0xb3
 240 013f 09       		.uleb128 0x9
 241 0140 03       		.byte	0x3
 242 0141 00000000 		.quad	soft
 242      00000000 
 243 0149 04       		.uleb128 0x4
 244 014a C7000000 		.long	0xc7
 245 014e 12       		.byte	0x12
 246 014f 09       		.uleb128 0x9
 247 0150 03       		.byte	0x3
 248 0151 00000000 		.quad	heatmap_cs_casbv_soft
 248      00000000 
 249 0159 02       		.uleb128 0x2
 250 015a 00000000 		.long	.LASF21
 251 015e 14       		.byte	0x14
 252 015f 24       		.byte	0x24
 253 0160 B3000000 		.long	0xb3
 254 0164 09       		.uleb128 0x9
 255 0165 03       		.byte	0x3
 256 0166 00000000 		.quad	mixed
 256      00000000 
 257 016e 04       		.uleb128 0x4
 258 016f D1000000 		.long	0xd1
 259 0173 15       		.byte	0x15
 260 0174 09       		.uleb128 0x9
GAS LISTING /tmp/ccpwE1Qr.s 			page 6


 261 0175 03       		.byte	0x3
 262 0176 00000000 		.quad	heatmap_cs_casbv_mixed
 262      00000000 
 263 017e 02       		.uleb128 0x2
 264 017f 00000000 		.long	.LASF22
 265 0183 17       		.byte	0x17
 266 0184 24       		.byte	0x24
 267 0185 B3000000 		.long	0xb3
 268 0189 09       		.uleb128 0x9
 269 018a 03       		.byte	0x3
 270 018b 00000000 		.quad	mixed_exp
 270      00000000 
 271 0193 04       		.uleb128 0x4
 272 0194 DB000000 		.long	0xdb
 273 0198 18       		.byte	0x18
 274 0199 09       		.uleb128 0x9
 275 019a 03       		.byte	0x3
 276 019b 00000000 		.quad	heatmap_cs_casbv_mixed_exp
 276      00000000 
 277 01a3 00       		.byte	0
 278              		.section	.debug_abbrev,"",@progbits
 279              	.Ldebug_abbrev0:
 280 0000 01       		.uleb128 0x1
 281 0001 24       		.uleb128 0x24
 282 0002 00       		.byte	0
 283 0003 0B       		.uleb128 0xb
 284 0004 0B       		.uleb128 0xb
 285 0005 3E       		.uleb128 0x3e
 286 0006 0B       		.uleb128 0xb
 287 0007 03       		.uleb128 0x3
 288 0008 0E       		.uleb128 0xe
 289 0009 00       		.byte	0
 290 000a 00       		.byte	0
 291 000b 02       		.uleb128 0x2
 292 000c 34       		.uleb128 0x34
 293 000d 00       		.byte	0
 294 000e 03       		.uleb128 0x3
 295 000f 0E       		.uleb128 0xe
 296 0010 3A       		.uleb128 0x3a
 297 0011 21       		.uleb128 0x21
 298 0012 04       		.sleb128 4
 299 0013 3B       		.uleb128 0x3b
 300 0014 0B       		.uleb128 0xb
 301 0015 39       		.uleb128 0x39
 302 0016 0B       		.uleb128 0xb
 303 0017 49       		.uleb128 0x49
 304 0018 13       		.uleb128 0x13
 305 0019 02       		.uleb128 0x2
 306 001a 18       		.uleb128 0x18
 307 001b 00       		.byte	0
 308 001c 00       		.byte	0
 309 001d 03       		.uleb128 0x3
 310 001e 34       		.uleb128 0x34
 311 001f 00       		.byte	0
 312 0020 03       		.uleb128 0x3
 313 0021 0E       		.uleb128 0xe
 314 0022 3A       		.uleb128 0x3a
GAS LISTING /tmp/ccpwE1Qr.s 			page 7


 315 0023 21       		.uleb128 0x21
 316 0024 03       		.sleb128 3
 317 0025 3B       		.uleb128 0x3b
 318 0026 0B       		.uleb128 0xb
 319 0027 39       		.uleb128 0x39
 320 0028 21       		.uleb128 0x21
 321 0029 25       		.sleb128 37
 322 002a 49       		.uleb128 0x49
 323 002b 13       		.uleb128 0x13
 324 002c 3F       		.uleb128 0x3f
 325 002d 19       		.uleb128 0x19
 326 002e 3C       		.uleb128 0x3c
 327 002f 19       		.uleb128 0x19
 328 0030 00       		.byte	0
 329 0031 00       		.byte	0
 330 0032 04       		.uleb128 0x4
 331 0033 34       		.uleb128 0x34
 332 0034 00       		.byte	0
 333 0035 47       		.uleb128 0x47
 334 0036 13       		.uleb128 0x13
 335 0037 3A       		.uleb128 0x3a
 336 0038 21       		.uleb128 0x21
 337 0039 04       		.sleb128 4
 338 003a 3B       		.uleb128 0x3b
 339 003b 0B       		.uleb128 0xb
 340 003c 39       		.uleb128 0x39
 341 003d 21       		.uleb128 0x21
 342 003e 1E       		.sleb128 30
 343 003f 02       		.uleb128 0x2
 344 0040 18       		.uleb128 0x18
 345 0041 00       		.byte	0
 346 0042 00       		.byte	0
 347 0043 05       		.uleb128 0x5
 348 0044 0D       		.uleb128 0xd
 349 0045 00       		.byte	0
 350 0046 03       		.uleb128 0x3
 351 0047 0E       		.uleb128 0xe
 352 0048 3A       		.uleb128 0x3a
 353 0049 21       		.uleb128 0x21
 354 004a 01       		.sleb128 1
 355 004b 3B       		.uleb128 0x3b
 356 004c 0B       		.uleb128 0xb
 357 004d 39       		.uleb128 0x39
 358 004e 0B       		.uleb128 0xb
 359 004f 49       		.uleb128 0x49
 360 0050 13       		.uleb128 0x13
 361 0051 38       		.uleb128 0x38
 362 0052 0B       		.uleb128 0xb
 363 0053 00       		.byte	0
 364 0054 00       		.byte	0
 365 0055 06       		.uleb128 0x6
 366 0056 26       		.uleb128 0x26
 367 0057 00       		.byte	0
 368 0058 49       		.uleb128 0x49
 369 0059 13       		.uleb128 0x13
 370 005a 00       		.byte	0
 371 005b 00       		.byte	0
GAS LISTING /tmp/ccpwE1Qr.s 			page 8


 372 005c 07       		.uleb128 0x7
 373 005d 16       		.uleb128 0x16
 374 005e 00       		.byte	0
 375 005f 03       		.uleb128 0x3
 376 0060 0E       		.uleb128 0xe
 377 0061 3A       		.uleb128 0x3a
 378 0062 0B       		.uleb128 0xb
 379 0063 3B       		.uleb128 0x3b
 380 0064 0B       		.uleb128 0xb
 381 0065 39       		.uleb128 0x39
 382 0066 0B       		.uleb128 0xb
 383 0067 49       		.uleb128 0x49
 384 0068 13       		.uleb128 0x13
 385 0069 00       		.byte	0
 386 006a 00       		.byte	0
 387 006b 08       		.uleb128 0x8
 388 006c 0F       		.uleb128 0xf
 389 006d 00       		.byte	0
 390 006e 0B       		.uleb128 0xb
 391 006f 21       		.uleb128 0x21
 392 0070 08       		.sleb128 8
 393 0071 49       		.uleb128 0x49
 394 0072 13       		.uleb128 0x13
 395 0073 00       		.byte	0
 396 0074 00       		.byte	0
 397 0075 09       		.uleb128 0x9
 398 0076 11       		.uleb128 0x11
 399 0077 01       		.byte	0x1
 400 0078 25       		.uleb128 0x25
 401 0079 0E       		.uleb128 0xe
 402 007a 13       		.uleb128 0x13
 403 007b 0B       		.uleb128 0xb
 404 007c 03       		.uleb128 0x3
 405 007d 1F       		.uleb128 0x1f
 406 007e 1B       		.uleb128 0x1b
 407 007f 1F       		.uleb128 0x1f
 408 0080 10       		.uleb128 0x10
 409 0081 17       		.uleb128 0x17
 410 0082 00       		.byte	0
 411 0083 00       		.byte	0
 412 0084 0A       		.uleb128 0xa
 413 0085 24       		.uleb128 0x24
 414 0086 00       		.byte	0
 415 0087 0B       		.uleb128 0xb
 416 0088 0B       		.uleb128 0xb
 417 0089 3E       		.uleb128 0x3e
 418 008a 0B       		.uleb128 0xb
 419 008b 03       		.uleb128 0x3
 420 008c 08       		.uleb128 0x8
 421 008d 00       		.byte	0
 422 008e 00       		.byte	0
 423 008f 0B       		.uleb128 0xb
 424 0090 13       		.uleb128 0x13
 425 0091 01       		.byte	0x1
 426 0092 0B       		.uleb128 0xb
 427 0093 0B       		.uleb128 0xb
 428 0094 3A       		.uleb128 0x3a
GAS LISTING /tmp/ccpwE1Qr.s 			page 9


 429 0095 0B       		.uleb128 0xb
 430 0096 3B       		.uleb128 0x3b
 431 0097 0B       		.uleb128 0xb
 432 0098 39       		.uleb128 0x39
 433 0099 0B       		.uleb128 0xb
 434 009a 01       		.uleb128 0x1
 435 009b 13       		.uleb128 0x13
 436 009c 00       		.byte	0
 437 009d 00       		.byte	0
 438 009e 0C       		.uleb128 0xc
 439 009f 0D       		.uleb128 0xd
 440 00a0 00       		.byte	0
 441 00a1 03       		.uleb128 0x3
 442 00a2 08       		.uleb128 0x8
 443 00a3 3A       		.uleb128 0x3a
 444 00a4 0B       		.uleb128 0xb
 445 00a5 3B       		.uleb128 0x3b
 446 00a6 0B       		.uleb128 0xb
 447 00a7 39       		.uleb128 0x39
 448 00a8 0B       		.uleb128 0xb
 449 00a9 49       		.uleb128 0x49
 450 00aa 13       		.uleb128 0x13
 451 00ab 38       		.uleb128 0x38
 452 00ac 0B       		.uleb128 0xb
 453 00ad 00       		.byte	0
 454 00ae 00       		.byte	0
 455 00af 0D       		.uleb128 0xd
 456 00b0 01       		.uleb128 0x1
 457 00b1 01       		.byte	0x1
 458 00b2 49       		.uleb128 0x49
 459 00b3 13       		.uleb128 0x13
 460 00b4 01       		.uleb128 0x1
 461 00b5 13       		.uleb128 0x13
 462 00b6 00       		.byte	0
 463 00b7 00       		.byte	0
 464 00b8 0E       		.uleb128 0xe
 465 00b9 21       		.uleb128 0x21
 466 00ba 00       		.byte	0
 467 00bb 49       		.uleb128 0x49
 468 00bc 13       		.uleb128 0x13
 469 00bd 2F       		.uleb128 0x2f
 470 00be 0B       		.uleb128 0xb
 471 00bf 00       		.byte	0
 472 00c0 00       		.byte	0
 473 00c1 00       		.byte	0
 474              		.section	.debug_aranges,"",@progbits
 475 0000 1C000000 		.long	0x1c
 476 0004 0200     		.value	0x2
 477 0006 00000000 		.long	.Ldebug_info0
 478 000a 08       		.byte	0x8
 479 000b 00       		.byte	0
 480 000c 0000     		.value	0
 481 000e 0000     		.value	0
 482 0010 00000000 		.quad	0
 482      00000000 
 483 0018 00000000 		.quad	0
 483      00000000 
GAS LISTING /tmp/ccpwE1Qr.s 			page 10


 484              		.section	.debug_line,"",@progbits
 485              	.Ldebug_line0:
 486 0000 49000000 		.section	.debug_str,"MS",@progbits,1
 486      05000800 
 486      41000000 
 486      010101FB 
 486      0E0D0001 
 487              	.LASF4:
 488 0000 6C6F6E67 		.string	"long long int"
 488      206C6F6E 
 488      6720696E 
 488      7400
 489              	.LASF12:
 490 000e 73697A65 		.string	"size_t"
 490      5F7400
 491              	.LASF9:
 492 0015 6E636F6C 		.string	"ncolors"
 492      6F727300 
 493              	.LASF17:
 494 001d 68656174 		.string	"heatmap_cs_casbv_mixed_exp"
 494      6D61705F 
 494      63735F63 
 494      61736276 
 494      5F6D6978 
 495              	.LASF18:
 496 0038 64697363 		.string	"discrete_data"
 496      72657465 
 496      5F646174 
 496      6100
 497              	.LASF3:
 498 0046 6C6F6E67 		.string	"long unsigned int"
 498      20756E73 
 498      69676E65 
 498      6420696E 
 498      7400
 499              	.LASF6:
 500 0058 666C6F61 		.string	"float"
 500      7400
 501              	.LASF21:
 502 005e 6D697865 		.string	"mixed"
 502      6400
 503              	.LASF10:
 504 0064 636F6C6F 		.string	"color_type"
 504      725F7479 
 504      706500
 505              	.LASF11:
 506 006f 756E7369 		.string	"unsigned char"
 506      676E6564 
 506      20636861 
 506      7200
 507              	.LASF15:
 508 007d 68656174 		.string	"heatmap_cs_casbv_soft"
 508      6D61705F 
 508      63735F63 
 508      61736276 
 508      5F736F66 
 509              	.LASF2:
GAS LISTING /tmp/ccpwE1Qr.s 			page 11


 510 0093 6C6F6E67 		.string	"long int"
 510      20696E74 
 510      00
 511              	.LASF16:
 512 009c 68656174 		.string	"heatmap_cs_casbv_mixed"
 512      6D61705F 
 512      63735F63 
 512      61736276 
 512      5F6D6978 
 513              	.LASF23:
 514 00b3 474E5520 		.string	"GNU C17 12.2.1 20230121 -mtune=generic -march=x86-64 -ggdb -O1 -fopenmp"
 514      43313720 
 514      31322E32 
 514      2E312032 
 514      30323330 
 515              	.LASF22:
 516 00fb 6D697865 		.string	"mixed_exp"
 516      645F6578 
 516      7000
 517              	.LASF8:
 518 0105 636F6C6F 		.string	"colors"
 518      727300
 519              	.LASF19:
 520 010c 64697363 		.string	"discrete"
 520      72657465 
 520      00
 521              	.LASF5:
 522 0115 6C6F6E67 		.string	"long double"
 522      20646F75 
 522      626C6500 
 523              	.LASF13:
 524 0121 68656174 		.string	"heatmap_colorscheme_t"
 524      6D61705F 
 524      636F6C6F 
 524      72736368 
 524      656D655F 
 525              	.LASF20:
 526 0137 736F6674 		.string	"soft"
 526      00
 527              	.LASF7:
 528 013c 756E7369 		.string	"unsigned int"
 528      676E6564 
 528      20696E74 
 528      00
 529              	.LASF14:
 530 0149 68656174 		.string	"heatmap_cs_casbv_discrete"
 530      6D61705F 
 530      63735F63 
 530      61736276 
 530      5F646973 
 531              		.section	.debug_line_str,"MS",@progbits,1
 532              	.LASF1:
 533 0000 2F686F6D 		.string	"/home/prodan/_work/linux/radar/radar_img_create"
 533      652F7072 
 533      6F64616E 
 533      2F5F776F 
 533      726B2F6C 
GAS LISTING /tmp/ccpwE1Qr.s 			page 12


 534              	.LASF0:
 535 0030 63617362 		.string	"casbv.c"
 535      762E6300 
 536              		.ident	"GCC: (Gentoo Hardened 12.2.1_p20230121-r1 p10) 12.2.1 20230121"
 537 0038 2F686F6D 		.section	.note.GNU-stack,"",@progbits
 537      652F7072 
 537      6F64616E 
 537      2F5F776F 
 537      726B2F6C 
