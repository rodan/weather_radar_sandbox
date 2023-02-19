GAS LISTING /tmp/cceaV4lG.s 			page 1


   1              		.file	"lib_convert.cpp"
   2              		.text
   3              	.Ltext0:
   4              		.file 0 "/home/prodan/_work/linux/radar/radar_img_create" "lib_convert.cpp"
   5              		.type	_ZL10_uint32toaPcj, @function
   6              	_ZL10_uint32toaPcj:
   7              	.LVL0:
   8              	.LFB66:
   9              		.file 1 "lib_convert.cpp"
   1:lib_convert.cpp **** 
   2:lib_convert.cpp **** #include <inttypes.h>
   3:lib_convert.cpp **** #include <string.h>
   4:lib_convert.cpp **** #include <stdlib.h>
   5:lib_convert.cpp **** #include <time.h>
   6:lib_convert.cpp **** #include "lib_convert.h"
   7:lib_convert.cpp **** 
   8:lib_convert.cpp **** // ###############################################
   9:lib_convert.cpp **** // #
  10:lib_convert.cpp **** // #  string functions
  11:lib_convert.cpp **** // #
  12:lib_convert.cpp **** 
  13:lib_convert.cpp **** uint8_t str_to_uint8(char *str, uint8_t * out, const uint8_t seek,
  14:lib_convert.cpp ****                      const uint8_t len, const uint8_t min, const uint8_t max)
  15:lib_convert.cpp **** {
  16:lib_convert.cpp ****     uint32_t val = 0, pow = 1;
  17:lib_convert.cpp ****     uint8_t i;
  18:lib_convert.cpp **** 
  19:lib_convert.cpp ****     // pow() is missing in msp gcc, so we improvise
  20:lib_convert.cpp ****     for (i = 0; i < len - 1; i++) {
  21:lib_convert.cpp ****         pow *= 10;
  22:lib_convert.cpp ****     }
  23:lib_convert.cpp ****     for (i = 0; i < len; i++) {
  24:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
  25:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
  26:lib_convert.cpp ****         }
  27:lib_convert.cpp ****         pow /= 10;
  28:lib_convert.cpp ****     }
  29:lib_convert.cpp ****     if ((val >= min) && (val <= max)) {
  30:lib_convert.cpp ****         *out = val;
  31:lib_convert.cpp ****         return EXIT_SUCCESS;
  32:lib_convert.cpp ****     } else {
  33:lib_convert.cpp ****         return EXIT_FAILURE;
  34:lib_convert.cpp ****     }
  35:lib_convert.cpp **** }
  36:lib_convert.cpp **** 
  37:lib_convert.cpp **** uint8_t str_to_uint16(char *str, uint16_t * out, const uint8_t seek,
  38:lib_convert.cpp ****                       const uint8_t len, const uint16_t min, const uint16_t max)
  39:lib_convert.cpp **** {
  40:lib_convert.cpp ****     uint16_t val = 0;
  41:lib_convert.cpp ****     uint32_t pow = 1;
  42:lib_convert.cpp ****     uint8_t i, c;
  43:lib_convert.cpp **** 
  44:lib_convert.cpp ****     for (i = len + 1; i > seek; i--) {
  45:lib_convert.cpp ****         c = str[i - 1] - 48;
  46:lib_convert.cpp ****         if (c < 10) {
  47:lib_convert.cpp ****             val += c * pow;
  48:lib_convert.cpp ****             pow *= 10;
GAS LISTING /tmp/cceaV4lG.s 			page 2


  49:lib_convert.cpp ****         } else {
  50:lib_convert.cpp ****             if (val) {
  51:lib_convert.cpp ****                 // if we already have a number and this char is unexpected
  52:lib_convert.cpp ****                 break;
  53:lib_convert.cpp ****             }
  54:lib_convert.cpp ****         }
  55:lib_convert.cpp ****     }
  56:lib_convert.cpp **** 
  57:lib_convert.cpp ****     if ((val >= min) && (val <= max)) {
  58:lib_convert.cpp ****         *out = val;
  59:lib_convert.cpp ****     } else {
  60:lib_convert.cpp ****         return EXIT_FAILURE;
  61:lib_convert.cpp ****     }
  62:lib_convert.cpp **** 
  63:lib_convert.cpp ****     return EXIT_SUCCESS;
  64:lib_convert.cpp **** }
  65:lib_convert.cpp **** 
  66:lib_convert.cpp **** uint8_t str_to_uint32(char *str, uint32_t * out, const uint8_t seek,
  67:lib_convert.cpp ****                       const uint8_t len, const uint32_t min, const uint32_t max)
  68:lib_convert.cpp **** {
  69:lib_convert.cpp ****     uint32_t val = 0, pow = 1;
  70:lib_convert.cpp ****     uint8_t i;
  71:lib_convert.cpp **** 
  72:lib_convert.cpp ****     // pow() is missing in msp gcc, so we improvise
  73:lib_convert.cpp ****     for (i = 0; i < len - 1; i++) {
  74:lib_convert.cpp ****         pow *= 10;
  75:lib_convert.cpp ****     }
  76:lib_convert.cpp ****     for (i = 0; i < len; i++) {
  77:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
  78:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
  79:lib_convert.cpp ****         } else {
  80:lib_convert.cpp ****             val /= 10;
  81:lib_convert.cpp ****         }
  82:lib_convert.cpp ****         pow /= 10;
  83:lib_convert.cpp ****     }
  84:lib_convert.cpp ****     if ((val >= min) && (val <= max)) {
  85:lib_convert.cpp ****         *out = val;
  86:lib_convert.cpp ****         return EXIT_SUCCESS;
  87:lib_convert.cpp ****     } else {
  88:lib_convert.cpp ****         return EXIT_FAILURE;
  89:lib_convert.cpp ****     }
  90:lib_convert.cpp **** }
  91:lib_convert.cpp **** 
  92:lib_convert.cpp **** uint8_t str_to_int32(char *str, int32_t * out, const uint8_t seek,
  93:lib_convert.cpp ****                      const uint8_t len, const int32_t min, const int32_t max)
  94:lib_convert.cpp **** {
  95:lib_convert.cpp ****     int32_t val = 0;
  96:lib_convert.cpp ****     uint32_t pow = 1;
  97:lib_convert.cpp ****     uint8_t i;
  98:lib_convert.cpp ****     int8_t sign = 1;
  99:lib_convert.cpp **** 
 100:lib_convert.cpp ****     // pow() is missing in msp gcc, so we improvise
 101:lib_convert.cpp ****     for (i = 0; i < len - 1; i++) {
 102:lib_convert.cpp ****         pow *= 10;
 103:lib_convert.cpp ****     }
 104:lib_convert.cpp ****     for (i = 0; i < len; i++) {
 105:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
GAS LISTING /tmp/cceaV4lG.s 			page 3


 106:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
 107:lib_convert.cpp ****         } else if (str[seek + i] == 45) {
 108:lib_convert.cpp ****             sign = -1;
 109:lib_convert.cpp ****         } else {
 110:lib_convert.cpp ****             val /= 10;
 111:lib_convert.cpp ****         }
 112:lib_convert.cpp ****         pow /= 10;
 113:lib_convert.cpp ****     }
 114:lib_convert.cpp ****     if ((val >= min) && (val <= max)) {
 115:lib_convert.cpp ****         *out = val * sign;
 116:lib_convert.cpp ****         return EXIT_SUCCESS;
 117:lib_convert.cpp ****     } else {
 118:lib_convert.cpp ****         return EXIT_FAILURE;
 119:lib_convert.cpp ****     }
 120:lib_convert.cpp **** }
 121:lib_convert.cpp **** 
 122:lib_convert.cpp **** uint8_t hstr_to_uint8(char *str, uint8_t * out, const uint8_t seek,
 123:lib_convert.cpp ****                       const uint8_t len, const uint8_t min, const uint16_t max)
 124:lib_convert.cpp **** {
 125:lib_convert.cpp ****     uint8_t val = 0;
 126:lib_convert.cpp ****     uint32_t pow = 1;
 127:lib_convert.cpp ****     uint8_t i;
 128:lib_convert.cpp **** 
 129:lib_convert.cpp ****     // pow() is missing in msp gcc, so we improvise
 130:lib_convert.cpp ****     for (i = seek; i < len; i++) {
 131:lib_convert.cpp ****         pow *= 16;
 132:lib_convert.cpp ****     }
 133:lib_convert.cpp **** 
 134:lib_convert.cpp ****     for (i = seek; i < len + 1; i++) {
 135:lib_convert.cpp ****         if ((str[i] > 47) && (str[i] < 58)) {
 136:lib_convert.cpp ****             // 0 - 9
 137:lib_convert.cpp ****             val += (str[i] - 48) * pow;
 138:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 139:lib_convert.cpp ****             // a - f
 140:lib_convert.cpp ****             val += (str[i] - 87) * pow;
 141:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 142:lib_convert.cpp ****             // A - F
 143:lib_convert.cpp ****             val += (str[i] - 55) * pow;
 144:lib_convert.cpp ****         }
 145:lib_convert.cpp ****         pow /= 16;
 146:lib_convert.cpp ****     }
 147:lib_convert.cpp **** 
 148:lib_convert.cpp ****     if ((val >= min) && (val <= max)) {
 149:lib_convert.cpp ****         *out = val;
 150:lib_convert.cpp ****         return EXIT_SUCCESS;
 151:lib_convert.cpp ****     } else {
 152:lib_convert.cpp ****         return EXIT_FAILURE;
 153:lib_convert.cpp ****     }
 154:lib_convert.cpp **** }
 155:lib_convert.cpp **** 
 156:lib_convert.cpp **** uint8_t hstr_to_uint16(char *str, uint16_t * out, const uint8_t seek,
 157:lib_convert.cpp ****                        const uint8_t len, const uint16_t min, const uint16_t max)
 158:lib_convert.cpp **** {
 159:lib_convert.cpp ****     uint16_t val = 0;
 160:lib_convert.cpp ****     uint32_t pow = 1;
 161:lib_convert.cpp ****     uint8_t i;
 162:lib_convert.cpp **** 
GAS LISTING /tmp/cceaV4lG.s 			page 4


 163:lib_convert.cpp ****     // pow() is missing in msp gcc, so we improvise
 164:lib_convert.cpp ****     for (i = seek; i < len; i++) {
 165:lib_convert.cpp ****         pow *= 16;
 166:lib_convert.cpp ****     }
 167:lib_convert.cpp **** 
 168:lib_convert.cpp ****     for (i = seek; i < len + 1; i++) {
 169:lib_convert.cpp ****         if ((str[i] > 47) && (str[i] < 58)) {
 170:lib_convert.cpp ****             // 0 - 9
 171:lib_convert.cpp ****             val += (str[i] - 48) * pow;
 172:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 173:lib_convert.cpp ****             // a - f
 174:lib_convert.cpp ****             val += (str[i] - 87) * pow;
 175:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 176:lib_convert.cpp ****             // A - F
 177:lib_convert.cpp ****             val += (str[i] - 55) * pow;
 178:lib_convert.cpp ****         }
 179:lib_convert.cpp ****         pow /= 16;
 180:lib_convert.cpp ****     }
 181:lib_convert.cpp **** 
 182:lib_convert.cpp ****     if ((val >= min) && (val <= max)) {
 183:lib_convert.cpp ****         *out = val;
 184:lib_convert.cpp ****         return EXIT_SUCCESS;
 185:lib_convert.cpp ****     } else {
 186:lib_convert.cpp ****         return EXIT_FAILURE;
 187:lib_convert.cpp ****     }
 188:lib_convert.cpp **** }
 189:lib_convert.cpp **** 
 190:lib_convert.cpp **** uint8_t hstr_to_uint32(char *str, uint32_t * out, const uint8_t seek,
 191:lib_convert.cpp ****                        const uint8_t len, const uint32_t min, const uint32_t max)
 192:lib_convert.cpp **** {
 193:lib_convert.cpp ****     uint32_t val = 0;
 194:lib_convert.cpp ****     uint32_t pow = 1;
 195:lib_convert.cpp ****     uint8_t i;
 196:lib_convert.cpp **** 
 197:lib_convert.cpp ****     // pow() is missing in msp gcc, so we improvise
 198:lib_convert.cpp ****     for (i = seek; i < len; i++) {
 199:lib_convert.cpp ****         pow *= 16;
 200:lib_convert.cpp ****     }
 201:lib_convert.cpp **** 
 202:lib_convert.cpp ****     for (i = seek; i < len + 1; i++) {
 203:lib_convert.cpp ****         if ((str[i] > 47) && (str[i] < 58)) {
 204:lib_convert.cpp ****             // 0 - 9
 205:lib_convert.cpp ****             val += (str[i] - 48) * pow;
 206:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 207:lib_convert.cpp ****             // a - f
 208:lib_convert.cpp ****             val += (str[i] - 87) * pow;
 209:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 210:lib_convert.cpp ****             // A - F
 211:lib_convert.cpp ****             val += (str[i] - 55) * pow;
 212:lib_convert.cpp ****         }
 213:lib_convert.cpp ****         pow /= 16;
 214:lib_convert.cpp ****     }
 215:lib_convert.cpp **** 
 216:lib_convert.cpp ****     if ((val >= min) && (val <= max)) {
 217:lib_convert.cpp ****         *out = val;
 218:lib_convert.cpp ****         return EXIT_SUCCESS;
 219:lib_convert.cpp ****     } else {
GAS LISTING /tmp/cceaV4lG.s 			page 5


 220:lib_convert.cpp ****         return EXIT_FAILURE;
 221:lib_convert.cpp ****     }
 222:lib_convert.cpp **** }
 223:lib_convert.cpp **** 
 224:lib_convert.cpp **** static uint16_t const hex_ascii[16] =
 225:lib_convert.cpp ****     { 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x61, 0x62, 0x63, 0x64, 0x65,
 226:lib_convert.cpp ****     0x66
 227:lib_convert.cpp **** };
 228:lib_convert.cpp **** 
 229:lib_convert.cpp **** char *_utoh(char *buf, const uint32_t val)
 230:lib_convert.cpp **** {
 231:lib_convert.cpp ****     char *p = buf + (CONV_BASE_16_BUF_SZ - 1);   // the very end of the buffer
 232:lib_convert.cpp ****     uint32_t m = val;
 233:lib_convert.cpp ****     uint8_t i = 0;
 234:lib_convert.cpp **** 
 235:lib_convert.cpp ****     *p = '\0';
 236:lib_convert.cpp **** 
 237:lib_convert.cpp ****     if (val == 0) {
 238:lib_convert.cpp ****         p -= 1;
 239:lib_convert.cpp ****         memcpy(p, &hex_ascii[0], sizeof(uint8_t));
 240:lib_convert.cpp ****     }
 241:lib_convert.cpp ****     // groups of 8 bits
 242:lib_convert.cpp ****     while (m > 0 || (i & 1)) {
 243:lib_convert.cpp ****         p -= 1;
 244:lib_convert.cpp ****         memcpy(p, &hex_ascii[m & 0xf], sizeof(uint8_t));
 245:lib_convert.cpp ****         m >>= 4;
 246:lib_convert.cpp ****         i++;
 247:lib_convert.cpp ****     }
 248:lib_convert.cpp **** 
 249:lib_convert.cpp ****     p -= 2;
 250:lib_convert.cpp ****     memcpy(p, "0x", sizeof(uint16_t));
 251:lib_convert.cpp **** 
 252:lib_convert.cpp ****     return p;
 253:lib_convert.cpp **** }
 254:lib_convert.cpp **** 
 255:lib_convert.cpp **** char *_utoh8(char *buf, const uint32_t val)
 256:lib_convert.cpp **** {
 257:lib_convert.cpp ****     char *p = buf + (CONV_BASE_16_BUF_SZ - 1);   // the very end of the buffer
 258:lib_convert.cpp ****     uint32_t m = val;
 259:lib_convert.cpp ****     uint8_t i = 0;
 260:lib_convert.cpp **** 
 261:lib_convert.cpp ****     *p = '\0';
 262:lib_convert.cpp **** 
 263:lib_convert.cpp ****     if (val == 0) {
 264:lib_convert.cpp ****         p -= 2;
 265:lib_convert.cpp ****         memcpy(p, &hex_ascii[0], sizeof(uint8_t));
 266:lib_convert.cpp ****         memcpy(p + 1, &hex_ascii[0], sizeof(uint8_t));
 267:lib_convert.cpp ****     }
 268:lib_convert.cpp ****     // groups of 8 bits
 269:lib_convert.cpp ****     while (m > 0 || (i & 1)) {
 270:lib_convert.cpp ****         p -= 1;
 271:lib_convert.cpp ****         memcpy(p, &hex_ascii[m & 0xf], sizeof(uint8_t));
 272:lib_convert.cpp ****         m >>= 4;
 273:lib_convert.cpp ****         i++;
 274:lib_convert.cpp ****     }
 275:lib_convert.cpp **** 
 276:lib_convert.cpp ****     return p;
GAS LISTING /tmp/cceaV4lG.s 			page 6


 277:lib_convert.cpp **** }
 278:lib_convert.cpp **** 
 279:lib_convert.cpp **** char *_utoh16(char *buf, const uint32_t val)
 280:lib_convert.cpp **** {
 281:lib_convert.cpp ****     char *p = buf + (CONV_BASE_16_BUF_SZ - 1);   // the very end of the buffer
 282:lib_convert.cpp ****     uint32_t m = val;
 283:lib_convert.cpp ****     uint8_t i = 0;
 284:lib_convert.cpp **** 
 285:lib_convert.cpp ****     *p = '\0';
 286:lib_convert.cpp **** 
 287:lib_convert.cpp ****     if (val == 0) {
 288:lib_convert.cpp ****         p -= 4;
 289:lib_convert.cpp ****         memcpy(p, &hex_ascii[0], sizeof(uint8_t));
 290:lib_convert.cpp ****         memcpy(p + 1, &hex_ascii[0], sizeof(uint8_t));
 291:lib_convert.cpp ****         memcpy(p + 2, &hex_ascii[0], sizeof(uint8_t));
 292:lib_convert.cpp ****         memcpy(p + 3, &hex_ascii[0], sizeof(uint8_t));
 293:lib_convert.cpp ****         return p;
 294:lib_convert.cpp ****     }
 295:lib_convert.cpp ****     // groups of 8 bits
 296:lib_convert.cpp ****     while (m > 0 || (i & 1)) {
 297:lib_convert.cpp ****         p -= 1;
 298:lib_convert.cpp ****         memcpy(p, &hex_ascii[m & 0xf], sizeof(uint8_t));
 299:lib_convert.cpp ****         m >>= 4;
 300:lib_convert.cpp ****         i++;
 301:lib_convert.cpp ****     }
 302:lib_convert.cpp **** 
 303:lib_convert.cpp ****     if (val < 0x100) {
 304:lib_convert.cpp ****         p -= 2;
 305:lib_convert.cpp ****         memcpy(p, &hex_ascii[0], sizeof(uint8_t));
 306:lib_convert.cpp ****         memcpy(p + 1, &hex_ascii[0], sizeof(uint8_t));
 307:lib_convert.cpp ****     }
 308:lib_convert.cpp **** 
 309:lib_convert.cpp ****     return p;
 310:lib_convert.cpp **** }
 311:lib_convert.cpp **** 
 312:lib_convert.cpp **** char *_utoh32(char *buf, const uint32_t val)
 313:lib_convert.cpp **** {
 314:lib_convert.cpp ****     char *p = buf + (CONV_BASE_16_BUF_SZ - 1);     // the very end of the buffer
 315:lib_convert.cpp ****     uint32_t m = val;
 316:lib_convert.cpp ****     uint8_t i = 0;
 317:lib_convert.cpp **** 
 318:lib_convert.cpp ****     *p = '\0';
 319:lib_convert.cpp **** 
 320:lib_convert.cpp ****     p -= 8;
 321:lib_convert.cpp ****     for (i=0;i<8;i++) {
 322:lib_convert.cpp ****         *(p + i) = 0x30;
 323:lib_convert.cpp ****     }
 324:lib_convert.cpp **** 
 325:lib_convert.cpp ****     p += 8;
 326:lib_convert.cpp ****     // groups of 8 bits
 327:lib_convert.cpp ****     while (m > 0 || (i & 1)) {
 328:lib_convert.cpp ****         p -= 1;
 329:lib_convert.cpp ****         memcpy(p, &hex_ascii[m & 0xf], sizeof(uint8_t));
 330:lib_convert.cpp ****         m >>= 4;
 331:lib_convert.cpp ****         i++;
 332:lib_convert.cpp ****     }
 333:lib_convert.cpp **** 
GAS LISTING /tmp/cceaV4lG.s 			page 7


 334:lib_convert.cpp ****     return buf + 3;
 335:lib_convert.cpp **** }
 336:lib_convert.cpp **** 
 337:lib_convert.cpp **** static uint16_t const caps_hex_ascii[16] =
 338:lib_convert.cpp ****     { 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x41, 0x42, 0x43, 0x44, 0x45,
 339:lib_convert.cpp ****     0x46
 340:lib_convert.cpp **** };
 341:lib_convert.cpp **** 
 342:lib_convert.cpp **** char *_utorh(char *buf, const uint32_t val, const uint8_t pad_size)
 343:lib_convert.cpp **** {
 344:lib_convert.cpp ****     char *p = &buf[11];
 345:lib_convert.cpp ****     uint32_t m = val;
 346:lib_convert.cpp ****     uint8_t i = 0;
 347:lib_convert.cpp ****     uint8_t pc = 0;
 348:lib_convert.cpp **** 
 349:lib_convert.cpp ****     *p = '\0';
 350:lib_convert.cpp **** 
 351:lib_convert.cpp ****     if (val == 0) {
 352:lib_convert.cpp ****         for (pc = 0; pc < pad_size; pc++) {
 353:lib_convert.cpp ****             memcpy(p - (pc + 1), &caps_hex_ascii[0], sizeof(uint8_t));
 354:lib_convert.cpp ****         }
 355:lib_convert.cpp ****         p -= pad_size;
 356:lib_convert.cpp ****         return p;
 357:lib_convert.cpp ****     }
 358:lib_convert.cpp ****     // groups of 8 bits
 359:lib_convert.cpp ****     //while (m > 0 || (i & 1))
 360:lib_convert.cpp ****     while (m > 0 || (i < pad_size)) {
 361:lib_convert.cpp ****         p -= 1;
 362:lib_convert.cpp ****         memcpy(p, &caps_hex_ascii[m & 0xf], sizeof(uint8_t));
 363:lib_convert.cpp ****         m >>= 4;
 364:lib_convert.cpp ****         i++;
 365:lib_convert.cpp ****     }
 366:lib_convert.cpp **** 
 367:lib_convert.cpp ****     return p;
 368:lib_convert.cpp **** }
 369:lib_convert.cpp **** 
 370:lib_convert.cpp **** #ifdef USE_ITOA_LUT
 371:lib_convert.cpp **** 
 372:lib_convert.cpp **** static uint16_t const dec_ascii[10] =
 373:lib_convert.cpp ****     { 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39 };
 374:lib_convert.cpp **** static uint16_t const bin_ascii[2] = { 0x30, 0x31 };
 375:lib_convert.cpp **** 
 376:lib_convert.cpp **** char *_uint32toa(char *buf, const uint32_t val)
 377:lib_convert.cpp **** {
 378:lib_convert.cpp ****     char *p = buf + (CONV_BASE_10_BUF_SZ - 1);  // the very end of the buffer
 379:lib_convert.cpp ****     uint32_t m = val;
 380:lib_convert.cpp **** 
 381:lib_convert.cpp ****     *p = '\0';
 382:lib_convert.cpp **** 
 383:lib_convert.cpp ****     while (m >= 10) {
 384:lib_convert.cpp ****         uint32_t const old = m;
 385:lib_convert.cpp **** 
 386:lib_convert.cpp ****         p -= 1;
 387:lib_convert.cpp ****         m /= 10;
 388:lib_convert.cpp ****         memcpy(p, &dec_ascii[old - (m * 10)], sizeof(uint8_t));
 389:lib_convert.cpp ****     }
 390:lib_convert.cpp **** 
GAS LISTING /tmp/cceaV4lG.s 			page 8


 391:lib_convert.cpp ****     p -= 1;
 392:lib_convert.cpp ****     memcpy(p, &dec_ascii[m], sizeof(uint8_t));
 393:lib_convert.cpp **** 
 394:lib_convert.cpp ****     return p;
 395:lib_convert.cpp **** }
 396:lib_convert.cpp **** 
 397:lib_convert.cpp **** char *_uint16toa(char *buf, const uint16_t val)
 398:lib_convert.cpp **** {
 399:lib_convert.cpp ****     char *p = buf + (CONV_BASE_10_BUF_SZ - 1);  // the very end of the buffer
 400:lib_convert.cpp ****     uint16_t m = val;
 401:lib_convert.cpp **** 
 402:lib_convert.cpp ****     *p = '\0';
 403:lib_convert.cpp **** 
 404:lib_convert.cpp ****     while (m >= 10) {
 405:lib_convert.cpp ****         uint32_t const old = m;
 406:lib_convert.cpp **** 
 407:lib_convert.cpp ****         p -= 1;
 408:lib_convert.cpp ****         m /= 10;
 409:lib_convert.cpp ****         memcpy(p, &dec_ascii[old - (m * 10)], sizeof(uint8_t));
 410:lib_convert.cpp ****     }
 411:lib_convert.cpp **** 
 412:lib_convert.cpp ****     p -= 1;
 413:lib_convert.cpp ****     memcpy(p, &dec_ascii[m], sizeof(uint8_t));
 414:lib_convert.cpp **** 
 415:lib_convert.cpp ****     return p;
 416:lib_convert.cpp **** }
 417:lib_convert.cpp **** 
 418:lib_convert.cpp **** char *_utob(char *buf, const uint16_t val)
 419:lib_convert.cpp **** {
 420:lib_convert.cpp ****     char *p = buf + (CONV_BASE_2_BUF_SZ - 1);   // the very end of the buffer
 421:lib_convert.cpp ****     uint16_t m = val;
 422:lib_convert.cpp ****     uint8_t i = 0;
 423:lib_convert.cpp **** 
 424:lib_convert.cpp ****     *p = '\0';
 425:lib_convert.cpp **** 
 426:lib_convert.cpp ****     if (val == 0) {
 427:lib_convert.cpp ****         p -= 1;
 428:lib_convert.cpp ****         memcpy(p, &bin_ascii[0], sizeof(uint8_t));
 429:lib_convert.cpp ****     }
 430:lib_convert.cpp ****     // groups of 8bits
 431:lib_convert.cpp ****     while (m > 0 || (i & 7)) {
 432:lib_convert.cpp ****         if (m > 0 && !(i & 7)) {
 433:lib_convert.cpp ****             p -= 1;
 434:lib_convert.cpp ****             *p = ' ';
 435:lib_convert.cpp ****         }
 436:lib_convert.cpp ****         p -= 1;
 437:lib_convert.cpp ****         memcpy(p, &bin_ascii[m & 0x1], sizeof(uint8_t));
 438:lib_convert.cpp ****         m >>= 1;
 439:lib_convert.cpp ****         i++;
 440:lib_convert.cpp ****     }
 441:lib_convert.cpp **** 
 442:lib_convert.cpp ****     return p;
 443:lib_convert.cpp **** }
 444:lib_convert.cpp **** #else
 445:lib_convert.cpp **** 
 446:lib_convert.cpp **** static char *_uint32toa(char *buf, const uint32_t val)
 447:lib_convert.cpp **** {
GAS LISTING /tmp/cceaV4lG.s 			page 9


  10              		.loc 1 447 1 view -0
  11              		.cfi_startproc
 448:lib_convert.cpp ****     char *p = buf + (CONV_BASE_10_BUF_SZ - 1);  // the very end of the buffer
  12              		.loc 1 448 5 view .LVU1
 449:lib_convert.cpp ****     uint32_t m = val;
  13              		.loc 1 449 5 view .LVU2
 450:lib_convert.cpp **** 
 451:lib_convert.cpp ****     *p = '\0';
  14              		.loc 1 451 5 view .LVU3
  15              		.loc 1 451 8 is_stmt 0 view .LVU4
  16 0000 C6470B00 		movb	$0, 11(%rdi)
 452:lib_convert.cpp **** 
 453:lib_convert.cpp ****     if (val == 0) {
  17              		.loc 1 453 5 is_stmt 1 view .LVU5
  18 0004 85F6     		testl	%esi, %esi
  19 0006 750A     		jne	.L2
 454:lib_convert.cpp ****         p -= 1;
  20              		.loc 1 454 9 view .LVU6
  21              		.loc 1 454 11 is_stmt 0 view .LVU7
  22 0008 4C8D470A 		leaq	10(%rdi), %r8
  23              	.LVL1:
 455:lib_convert.cpp ****         *p = '0';
  24              		.loc 1 455 9 is_stmt 1 view .LVU8
  25              		.loc 1 455 12 is_stmt 0 view .LVU9
  26 000c C6470A30 		movb	$48, 10(%rdi)
  27              	.LVL2:
 456:lib_convert.cpp ****     }
 457:lib_convert.cpp **** 
 458:lib_convert.cpp ****     while (m > 0) {
  28              		.loc 1 458 14 is_stmt 1 view .LVU10
  29 0010 EB2F     		jmp	.L1
  30              	.LVL3:
  31              	.L2:
 448:lib_convert.cpp ****     uint32_t m = val;
  32              		.loc 1 448 11 is_stmt 0 view .LVU11
  33 0012 4C8D470B 		leaq	11(%rdi), %r8
 459:lib_convert.cpp ****         p -= 1;
 460:lib_convert.cpp ****         *p = (m % 10) + '0';
  34              		.loc 1 460 17 view .LVU12
  35 0016 BFCDCCCC 		movl	$3435973837, %edi
  35      CC
  36              	.LVL4:
  37              	.L4:
 459:lib_convert.cpp ****         p -= 1;
  38              		.loc 1 459 9 is_stmt 1 view .LVU13
 459:lib_convert.cpp ****         p -= 1;
  39              		.loc 1 459 11 is_stmt 0 view .LVU14
  40 001b 4983E801 		subq	$1, %r8
  41              	.LVL5:
  42              		.loc 1 460 9 is_stmt 1 view .LVU15
  43              		.loc 1 460 17 is_stmt 0 view .LVU16
  44 001f 89F0     		movl	%esi, %eax
  45 0021 480FAFC7 		imulq	%rdi, %rax
  46 0025 48C1E823 		shrq	$35, %rax
  47 0029 8D0C80   		leal	(%rax,%rax,4), %ecx
  48 002c 01C9     		addl	%ecx, %ecx
  49 002e 89F2     		movl	%esi, %edx
GAS LISTING /tmp/cceaV4lG.s 			page 10


  50 0030 29CA     		subl	%ecx, %edx
  51              		.loc 1 460 23 view .LVU17
  52 0032 83C230   		addl	$48, %edx
  53 0035 418810   		movb	%dl, (%r8)
 461:lib_convert.cpp ****         m /= 10;
  54              		.loc 1 461 9 is_stmt 1 view .LVU18
  55 0038 89F2     		movl	%esi, %edx
  56              		.loc 1 461 11 is_stmt 0 view .LVU19
  57 003a 89C6     		movl	%eax, %esi
  58              	.LVL6:
 458:lib_convert.cpp ****         p -= 1;
  59              		.loc 1 458 14 is_stmt 1 view .LVU20
  60 003c 83FA09   		cmpl	$9, %edx
  61 003f 77DA     		ja	.L4
  62              	.LVL7:
  63              	.L1:
 462:lib_convert.cpp ****     }
 463:lib_convert.cpp **** 
 464:lib_convert.cpp ****     return p;
 465:lib_convert.cpp **** }
  64              		.loc 1 465 1 is_stmt 0 view .LVU21
  65 0041 4C89C0   		movq	%r8, %rax
  66 0044 C3       		ret
  67              		.cfi_endproc
  68              	.LFE66:
  69              		.size	_ZL10_uint32toaPcj, .-_ZL10_uint32toaPcj
  70              		.globl	str_to_uint8
  71              		.type	str_to_uint8, @function
  72              	str_to_uint8:
  73              	.LVL8:
  74              	.LFB54:
  15:lib_convert.cpp ****     uint32_t val = 0, pow = 1;
  75              		.loc 1 15 1 is_stmt 1 view -0
  76              		.cfi_startproc
  15:lib_convert.cpp ****     uint32_t val = 0, pow = 1;
  77              		.loc 1 15 1 is_stmt 0 view .LVU23
  78 0045 55       		pushq	%rbp
  79              		.cfi_def_cfa_offset 16
  80              		.cfi_offset 6, -16
  81 0046 53       		pushq	%rbx
  82              		.cfi_def_cfa_offset 24
  83              		.cfi_offset 3, -24
  84 0047 4889FB   		movq	%rdi, %rbx
  85 004a 4889F7   		movq	%rsi, %rdi
  86              	.LVL9:
  15:lib_convert.cpp ****     uint32_t val = 0, pow = 1;
  87              		.loc 1 15 1 view .LVU24
  88 004d 89D5     		movl	%edx, %ebp
  89 004f 4189CA   		movl	%ecx, %r10d
  16:lib_convert.cpp ****     uint8_t i;
  90              		.loc 1 16 5 is_stmt 1 view .LVU25
  91              	.LVL10:
  17:lib_convert.cpp **** 
  92              		.loc 1 17 5 view .LVU26
  20:lib_convert.cpp ****         pow *= 10;
  93              		.loc 1 20 5 view .LVU27
  20:lib_convert.cpp ****         pow *= 10;
GAS LISTING /tmp/cceaV4lG.s 			page 11


  94              		.loc 1 20 19 view .LVU28
  20:lib_convert.cpp ****         pow *= 10;
  95              		.loc 1 20 21 is_stmt 0 view .LVU29
  96 0052 440FB6D9 		movzbl	%cl, %r11d
  20:lib_convert.cpp ****         pow *= 10;
  97              		.loc 1 20 25 view .LVU30
  98 0056 4183EB01 		subl	$1, %r11d
  20:lib_convert.cpp ****         pow *= 10;
  99              		.loc 1 20 19 view .LVU31
 100 005a 80F901   		cmpb	$1, %cl
 101 005d 7635     		jbe	.L7
  20:lib_convert.cpp ****         pow *= 10;
 102              		.loc 1 20 12 view .LVU32
 103 005f BA000000 		movl	$0, %edx
 103      00
 104              	.LVL11:
  16:lib_convert.cpp ****     uint8_t i;
 105              		.loc 1 16 23 view .LVU33
 106 0064 B8010000 		movl	$1, %eax
 106      00
 107              	.LVL12:
 108              	.L8:
  21:lib_convert.cpp ****     }
 109              		.loc 1 21 9 is_stmt 1 discriminator 3 view .LVU34
  21:lib_convert.cpp ****     }
 110              		.loc 1 21 13 is_stmt 0 discriminator 3 view .LVU35
 111 0069 8D0480   		leal	(%rax,%rax,4), %eax
 112              	.LVL13:
  21:lib_convert.cpp ****     }
 113              		.loc 1 21 13 discriminator 3 view .LVU36
 114 006c 01C0     		addl	%eax, %eax
 115              	.LVL14:
  20:lib_convert.cpp ****         pow *= 10;
 116              		.loc 1 20 5 is_stmt 1 discriminator 3 view .LVU37
 117 006e 83C201   		addl	$1, %edx
 118              	.LVL15:
  20:lib_convert.cpp ****         pow *= 10;
 119              		.loc 1 20 19 discriminator 3 view .LVU38
  20:lib_convert.cpp ****         pow *= 10;
 120              		.loc 1 20 17 is_stmt 0 discriminator 3 view .LVU39
 121 0071 0FB6F2   		movzbl	%dl, %esi
  20:lib_convert.cpp ****         pow *= 10;
 122              		.loc 1 20 19 discriminator 3 view .LVU40
 123 0074 4439DE   		cmpl	%r11d, %esi
 124 0077 7CF0     		jl	.L8
 125              	.LVL16:
 126              	.L9:
  20:lib_convert.cpp ****         pow *= 10;
 127              		.loc 1 20 19 discriminator 3 view .LVU41
 128 0079 400FB6CD 		movzbl	%bpl, %ecx
 129              	.LVL17:
  20:lib_convert.cpp ****         pow *= 10;
 130              		.loc 1 20 19 discriminator 3 view .LVU42
 131 007d 4801D9   		addq	%rbx, %rcx
 132 0080 450FB6D2 		movzbl	%r10b, %r10d
 133 0084 4901CA   		addq	%rcx, %r10
  16:lib_convert.cpp ****     uint8_t i;
GAS LISTING /tmp/cceaV4lG.s 			page 12


 134              		.loc 1 16 14 view .LVU43
 135 0087 41BB0000 		movl	$0, %r11d
 135      0000
 136              	.LVL18:
  27:lib_convert.cpp ****     }
 137              		.loc 1 27 13 view .LVU44
 138 008d BBCDCCCC 		movl	$3435973837, %ebx
 138      CC
 139              	.LVL19:
  27:lib_convert.cpp ****     }
 140              		.loc 1 27 13 view .LVU45
 141 0092 EB33     		jmp	.L12
 142              	.LVL20:
 143              	.L7:
  23:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
 144              		.loc 1 23 19 is_stmt 1 view .LVU46
 145 0094 84C9     		testb	%cl, %cl
 146 0096 7515     		jne	.L21
  29:lib_convert.cpp ****         *out = val;
 147              		.loc 1 29 5 view .LVU47
  16:lib_convert.cpp ****     uint8_t i;
 148              		.loc 1 16 14 is_stmt 0 view .LVU48
 149 0098 41BB0000 		movl	$0, %r11d
 149      0000
  29:lib_convert.cpp ****         *out = val;
 150              		.loc 1 29 5 view .LVU49
 151 009e 4584C0   		testb	%r8b, %r8b
 152 00a1 7558     		jne	.L22
 153              	.LVL21:
 154              	.L14:
  30:lib_convert.cpp ****         return EXIT_SUCCESS;
 155              		.loc 1 30 9 is_stmt 1 view .LVU50
  30:lib_convert.cpp ****         return EXIT_SUCCESS;
 156              		.loc 1 30 14 is_stmt 0 view .LVU51
 157 00a3 44881F   		movb	%r11b, (%rdi)
  31:lib_convert.cpp ****     } else {
 158              		.loc 1 31 9 is_stmt 1 view .LVU52
  31:lib_convert.cpp ****     } else {
 159              		.loc 1 31 16 is_stmt 0 view .LVU53
 160 00a6 B8000000 		movl	$0, %eax
 160      00
 161 00ab EB4B     		jmp	.L6
 162              	.LVL22:
 163              	.L21:
  16:lib_convert.cpp ****     uint8_t i;
 164              		.loc 1 16 23 view .LVU54
 165 00ad B8010000 		movl	$1, %eax
 165      00
 166 00b2 EBC5     		jmp	.L9
 167              	.LVL23:
 168              	.L11:
  27:lib_convert.cpp ****     }
 169              		.loc 1 27 9 is_stmt 1 discriminator 2 view .LVU55
  27:lib_convert.cpp ****     }
 170              		.loc 1 27 13 is_stmt 0 discriminator 2 view .LVU56
 171 00b4 89C0     		movl	%eax, %eax
  27:lib_convert.cpp ****     }
GAS LISTING /tmp/cceaV4lG.s 			page 13


 172              		.loc 1 27 13 discriminator 2 view .LVU57
 173 00b6 480FAFC3 		imulq	%rbx, %rax
 174              	.LVL24:
  27:lib_convert.cpp ****     }
 175              		.loc 1 27 13 discriminator 2 view .LVU58
 176 00ba 48C1E823 		shrq	$35, %rax
  23:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
 177              		.loc 1 23 5 is_stmt 1 discriminator 2 view .LVU59
 178              	.LVL25:
  23:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
 179              		.loc 1 23 19 discriminator 2 view .LVU60
 180 00be 4883C101 		addq	$1, %rcx
 181              	.LVL26:
  23:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
 182              		.loc 1 23 19 is_stmt 0 discriminator 2 view .LVU61
 183 00c2 4C39D1   		cmpq	%r10, %rcx
 184 00c5 741A     		je	.L23
 185              	.LVL27:
 186              	.L12:
  24:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
 187              		.loc 1 24 9 is_stmt 1 view .LVU62
  24:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
 188              		.loc 1 24 26 is_stmt 0 view .LVU63
 189 00c7 0FB611   		movzbl	(%rcx), %edx
  24:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
 190              		.loc 1 24 34 view .LVU64
 191 00ca 8D72D0   		leal	-48(%rdx), %esi
  24:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
 192              		.loc 1 24 9 view .LVU65
 193 00cd 4080FE09 		cmpb	$9, %sil
 194 00d1 77E1     		ja	.L11
  25:lib_convert.cpp ****         }
 195              		.loc 1 25 13 is_stmt 1 view .LVU66
  25:lib_convert.cpp ****         }
 196              		.loc 1 25 33 is_stmt 0 view .LVU67
 197 00d3 0FBED2   		movsbl	%dl, %edx
  25:lib_convert.cpp ****         }
 198              		.loc 1 25 35 view .LVU68
 199 00d6 83EA30   		subl	$48, %edx
  25:lib_convert.cpp ****         }
 200              		.loc 1 25 41 view .LVU69
 201 00d9 0FAFD0   		imull	%eax, %edx
  25:lib_convert.cpp ****         }
 202              		.loc 1 25 17 view .LVU70
 203 00dc 4101D3   		addl	%edx, %r11d
 204              	.LVL28:
  25:lib_convert.cpp ****         }
 205              		.loc 1 25 17 view .LVU71
 206 00df EBD3     		jmp	.L11
 207              	.LVL29:
 208              	.L23:
  29:lib_convert.cpp ****         *out = val;
 209              		.loc 1 29 5 is_stmt 1 view .LVU72
  29:lib_convert.cpp ****         *out = val;
 210              		.loc 1 29 17 is_stmt 0 view .LVU73
 211 00e1 450FB6C0 		movzbl	%r8b, %r8d
  33:lib_convert.cpp ****     }
GAS LISTING /tmp/cceaV4lG.s 			page 14


 212              		.loc 1 33 16 view .LVU74
 213 00e5 B8010000 		movl	$1, %eax
 213      00
  29:lib_convert.cpp ****         *out = val;
 214              		.loc 1 29 5 view .LVU75
 215 00ea 4539C3   		cmpl	%r8d, %r11d
 216 00ed 7209     		jb	.L6
  29:lib_convert.cpp ****         *out = val;
 217              		.loc 1 29 33 discriminator 1 view .LVU76
 218 00ef 450FB6C9 		movzbl	%r9b, %r9d
  29:lib_convert.cpp ****         *out = val;
 219              		.loc 1 29 22 discriminator 1 view .LVU77
 220 00f3 4539D9   		cmpl	%r11d, %r9d
 221 00f6 73AB     		jnb	.L14
 222              	.LVL30:
 223              	.L6:
  35:lib_convert.cpp **** 
 224              		.loc 1 35 1 view .LVU78
 225 00f8 5B       		popq	%rbx
 226              		.cfi_remember_state
 227              		.cfi_def_cfa_offset 16
 228 00f9 5D       		popq	%rbp
 229              		.cfi_def_cfa_offset 8
 230 00fa C3       		ret
 231              	.LVL31:
 232              	.L22:
 233              		.cfi_restore_state
  33:lib_convert.cpp ****     }
 234              		.loc 1 33 16 view .LVU79
 235 00fb B8010000 		movl	$1, %eax
 235      00
 236 0100 EBF6     		jmp	.L6
 237              		.cfi_endproc
 238              	.LFE54:
 239              		.size	str_to_uint8, .-str_to_uint8
 240              		.globl	str_to_uint16
 241              		.type	str_to_uint16, @function
 242              	str_to_uint16:
 243              	.LVL32:
 244              	.LFB55:
  39:lib_convert.cpp ****     uint16_t val = 0;
 245              		.loc 1 39 1 is_stmt 1 view -0
 246              		.cfi_startproc
  39:lib_convert.cpp ****     uint16_t val = 0;
 247              		.loc 1 39 1 is_stmt 0 view .LVU81
 248 0102 4989F2   		movq	%rsi, %r10
 249 0105 89D6     		movl	%edx, %esi
 250              	.LVL33:
  40:lib_convert.cpp ****     uint32_t pow = 1;
 251              		.loc 1 40 5 is_stmt 1 view .LVU82
  41:lib_convert.cpp ****     uint8_t i, c;
 252              		.loc 1 41 5 view .LVU83
  42:lib_convert.cpp **** 
 253              		.loc 1 42 5 view .LVU84
  44:lib_convert.cpp ****         c = str[i - 1] - 48;
 254              		.loc 1 44 5 view .LVU85
  44:lib_convert.cpp ****         c = str[i - 1] - 48;
GAS LISTING /tmp/cceaV4lG.s 			page 15


 255              		.loc 1 44 12 is_stmt 0 view .LVU86
 256 0107 8D4101   		leal	1(%rcx), %eax
 257              	.LVL34:
  44:lib_convert.cpp ****         c = str[i - 1] - 48;
 258              		.loc 1 44 25 is_stmt 1 view .LVU87
 259 010a 38C2     		cmpb	%al, %dl
 260 010c 7348     		jnb	.L30
 261 010e 0FB6C0   		movzbl	%al, %eax
  44:lib_convert.cpp ****         c = str[i - 1] - 48;
 262              		.loc 1 44 25 is_stmt 0 view .LVU88
 263 0111 488D5407 		leaq	-1(%rdi,%rax), %rdx
 263      FF
 264              	.LVL35:
  44:lib_convert.cpp ****         c = str[i - 1] - 48;
 265              		.loc 1 44 25 view .LVU89
 266 0116 488D7C07 		leaq	-2(%rdi,%rax), %rdi
 266      FE
 267              	.LVL36:
  44:lib_convert.cpp ****         c = str[i - 1] - 48;
 268              		.loc 1 44 25 view .LVU90
 269 011b 29F1     		subl	%esi, %ecx
 270              	.LVL37:
  44:lib_convert.cpp ****         c = str[i - 1] - 48;
 271              		.loc 1 44 25 view .LVU91
 272 011d 0FB6C9   		movzbl	%cl, %ecx
 273 0120 4829CF   		subq	%rcx, %rdi
  41:lib_convert.cpp ****     uint8_t i, c;
 274              		.loc 1 41 14 view .LVU92
 275 0123 B9010000 		movl	$1, %ecx
 275      00
  40:lib_convert.cpp ****     uint32_t pow = 1;
 276              		.loc 1 40 14 view .LVU93
 277 0128 BE000000 		movl	$0, %esi
 277      00
 278 012d EB0E     		jmp	.L28
 279              	.LVL38:
 280              	.L26:
  50:lib_convert.cpp ****                 // if we already have a number and this char is unexpected
 281              		.loc 1 50 13 is_stmt 1 view .LVU94
 282 012f 6685F6   		testw	%si, %si
 283 0132 7527     		jne	.L25
 284              	.LVL39:
 285              	.L27:
  44:lib_convert.cpp ****         c = str[i - 1] - 48;
 286              		.loc 1 44 5 discriminator 2 view .LVU95
  44:lib_convert.cpp ****         c = str[i - 1] - 48;
 287              		.loc 1 44 25 discriminator 2 view .LVU96
 288 0134 4883EA01 		subq	$1, %rdx
 289              	.LVL40:
  44:lib_convert.cpp ****         c = str[i - 1] - 48;
 290              		.loc 1 44 25 is_stmt 0 discriminator 2 view .LVU97
 291 0138 4839FA   		cmpq	%rdi, %rdx
 292 013b 741E     		je	.L25
 293              	.LVL41:
 294              	.L28:
  45:lib_convert.cpp ****         if (c < 10) {
 295              		.loc 1 45 9 is_stmt 1 view .LVU98
GAS LISTING /tmp/cceaV4lG.s 			page 16


  45:lib_convert.cpp ****         if (c < 10) {
 296              		.loc 1 45 11 is_stmt 0 view .LVU99
 297 013d 0FB602   		movzbl	(%rdx), %eax
 298 0140 83E830   		subl	$48, %eax
 299              	.LVL42:
  46:lib_convert.cpp ****             val += c * pow;
 300              		.loc 1 46 9 is_stmt 1 view .LVU100
 301 0143 3C09     		cmpb	$9, %al
 302 0145 77E8     		ja	.L26
  47:lib_convert.cpp ****             pow *= 10;
 303              		.loc 1 47 13 view .LVU101
  47:lib_convert.cpp ****             pow *= 10;
 304              		.loc 1 47 17 is_stmt 0 view .LVU102
 305 0147 0FB6C0   		movzbl	%al, %eax
  47:lib_convert.cpp ****             pow *= 10;
 306              		.loc 1 47 17 view .LVU103
 307 014a 0FAFC1   		imull	%ecx, %eax
 308              	.LVL43:
  47:lib_convert.cpp ****             pow *= 10;
 309              		.loc 1 47 17 view .LVU104
 310 014d 01C6     		addl	%eax, %esi
 311              	.LVL44:
  48:lib_convert.cpp ****         } else {
 312              		.loc 1 48 13 is_stmt 1 view .LVU105
  48:lib_convert.cpp ****         } else {
 313              		.loc 1 48 17 is_stmt 0 view .LVU106
 314 014f 8D0C89   		leal	(%rcx,%rcx,4), %ecx
 315              	.LVL45:
  48:lib_convert.cpp ****         } else {
 316              		.loc 1 48 17 view .LVU107
 317 0152 01C9     		addl	%ecx, %ecx
 318              	.LVL46:
  48:lib_convert.cpp ****         } else {
 319              		.loc 1 48 17 view .LVU108
 320 0154 EBDE     		jmp	.L27
 321              	.LVL47:
 322              	.L30:
  40:lib_convert.cpp ****     uint32_t pow = 1;
 323              		.loc 1 40 14 view .LVU109
 324 0156 BE000000 		movl	$0, %esi
 324      00
 325              	.LVL48:
 326              	.L25:
  57:lib_convert.cpp ****         *out = val;
 327              		.loc 1 57 5 is_stmt 1 view .LVU110
 328 015b 664439C6 		cmpw	%r8w, %si
 329 015f 7210     		jb	.L31
 330 0161 664439CE 		cmpw	%r9w, %si
 331 0165 770A     		ja	.L31
  58:lib_convert.cpp ****     } else {
 332              		.loc 1 58 9 view .LVU111
  58:lib_convert.cpp ****     } else {
 333              		.loc 1 58 14 is_stmt 0 view .LVU112
 334 0167 66418932 		movw	%si, (%r10)
  63:lib_convert.cpp **** }
 335              		.loc 1 63 5 is_stmt 1 view .LVU113
  63:lib_convert.cpp **** }
GAS LISTING /tmp/cceaV4lG.s 			page 17


 336              		.loc 1 63 12 is_stmt 0 view .LVU114
 337 016b B8000000 		movl	$0, %eax
 337      00
 338 0170 C3       		ret
 339              	.L31:
  60:lib_convert.cpp ****     }
 340              		.loc 1 60 16 view .LVU115
 341 0171 B8010000 		movl	$1, %eax
 341      00
  64:lib_convert.cpp **** 
 342              		.loc 1 64 1 view .LVU116
 343 0176 C3       		ret
 344              		.cfi_endproc
 345              	.LFE55:
 346              		.size	str_to_uint16, .-str_to_uint16
 347              		.globl	str_to_uint32
 348              		.type	str_to_uint32, @function
 349              	str_to_uint32:
 350              	.LVL49:
 351              	.LFB56:
  68:lib_convert.cpp ****     uint32_t val = 0, pow = 1;
 352              		.loc 1 68 1 is_stmt 1 view -0
 353              		.cfi_startproc
  68:lib_convert.cpp ****     uint32_t val = 0, pow = 1;
 354              		.loc 1 68 1 is_stmt 0 view .LVU118
 355 0177 53       		pushq	%rbx
 356              		.cfi_def_cfa_offset 16
 357              		.cfi_offset 3, -16
 358 0178 4889FB   		movq	%rdi, %rbx
 359 017b 4889F7   		movq	%rsi, %rdi
 360              	.LVL50:
  68:lib_convert.cpp ****     uint32_t val = 0, pow = 1;
 361              		.loc 1 68 1 view .LVU119
 362 017e 89D6     		movl	%edx, %esi
 363              	.LVL51:
  68:lib_convert.cpp ****     uint32_t val = 0, pow = 1;
 364              		.loc 1 68 1 view .LVU120
 365 0180 4189CA   		movl	%ecx, %r10d
  69:lib_convert.cpp ****     uint8_t i;
 366              		.loc 1 69 5 is_stmt 1 view .LVU121
 367              	.LVL52:
  70:lib_convert.cpp **** 
 368              		.loc 1 70 5 view .LVU122
  73:lib_convert.cpp ****         pow *= 10;
 369              		.loc 1 73 5 view .LVU123
  73:lib_convert.cpp ****         pow *= 10;
 370              		.loc 1 73 19 view .LVU124
  73:lib_convert.cpp ****         pow *= 10;
 371              		.loc 1 73 21 is_stmt 0 view .LVU125
 372 0183 440FB6D9 		movzbl	%cl, %r11d
  73:lib_convert.cpp ****         pow *= 10;
 373              		.loc 1 73 25 view .LVU126
 374 0187 4183EB01 		subl	$1, %r11d
  73:lib_convert.cpp ****         pow *= 10;
 375              		.loc 1 73 19 view .LVU127
 376 018b 80F901   		cmpb	$1, %cl
 377 018e 7635     		jbe	.L34
GAS LISTING /tmp/cceaV4lG.s 			page 18


  73:lib_convert.cpp ****         pow *= 10;
 378              		.loc 1 73 12 view .LVU128
 379 0190 BA000000 		movl	$0, %edx
 379      00
 380              	.LVL53:
  69:lib_convert.cpp ****     uint8_t i;
 381              		.loc 1 69 23 view .LVU129
 382 0195 B8010000 		movl	$1, %eax
 382      00
 383              	.LVL54:
 384              	.L35:
  74:lib_convert.cpp ****     }
 385              		.loc 1 74 9 is_stmt 1 discriminator 3 view .LVU130
  74:lib_convert.cpp ****     }
 386              		.loc 1 74 13 is_stmt 0 discriminator 3 view .LVU131
 387 019a 8D0480   		leal	(%rax,%rax,4), %eax
 388              	.LVL55:
  74:lib_convert.cpp ****     }
 389              		.loc 1 74 13 discriminator 3 view .LVU132
 390 019d 01C0     		addl	%eax, %eax
 391              	.LVL56:
  73:lib_convert.cpp ****         pow *= 10;
 392              		.loc 1 73 5 is_stmt 1 discriminator 3 view .LVU133
 393 019f 83C201   		addl	$1, %edx
 394              	.LVL57:
  73:lib_convert.cpp ****         pow *= 10;
 395              		.loc 1 73 19 discriminator 3 view .LVU134
  73:lib_convert.cpp ****         pow *= 10;
 396              		.loc 1 73 17 is_stmt 0 discriminator 3 view .LVU135
 397 01a2 0FB6CA   		movzbl	%dl, %ecx
  73:lib_convert.cpp ****         pow *= 10;
 398              		.loc 1 73 19 discriminator 3 view .LVU136
 399 01a5 4439D9   		cmpl	%r11d, %ecx
 400 01a8 7CF0     		jl	.L35
 401              	.LVL58:
 402              	.L36:
  73:lib_convert.cpp ****         pow *= 10;
 403              		.loc 1 73 19 discriminator 3 view .LVU137
 404 01aa 400FB6F6 		movzbl	%sil, %esi
 405 01ae 4801DE   		addq	%rbx, %rsi
 406 01b1 450FB6D2 		movzbl	%r10b, %r10d
 407 01b5 4901F2   		addq	%rsi, %r10
  69:lib_convert.cpp ****     uint8_t i;
 408              		.loc 1 69 14 view .LVU138
 409 01b8 B9000000 		movl	$0, %ecx
 409      00
  80:lib_convert.cpp ****         }
 410              		.loc 1 80 17 view .LVU139
 411 01bd 41BBCDCC 		movl	$3435973837, %r11d
 411      CCCC
 412              	.LVL59:
  80:lib_convert.cpp ****         }
 413              		.loc 1 80 17 view .LVU140
 414 01c3 EB40     		jmp	.L40
 415              	.LVL60:
 416              	.L34:
  76:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
GAS LISTING /tmp/cceaV4lG.s 			page 19


 417              		.loc 1 76 19 is_stmt 1 view .LVU141
 418 01c5 84C9     		testb	%cl, %cl
 419 01c7 7518     		jne	.L47
  69:lib_convert.cpp ****     uint8_t i;
 420              		.loc 1 69 14 is_stmt 0 view .LVU142
 421 01c9 B9000000 		movl	$0, %ecx
 421      00
 422              	.LVL61:
 423              	.L37:
  84:lib_convert.cpp ****         *out = val;
 424              		.loc 1 84 5 is_stmt 1 view .LVU143
 425 01ce 4439C1   		cmpl	%r8d, %ecx
 426 01d1 724A     		jb	.L43
 427 01d3 4139C9   		cmpl	%ecx, %r9d
 428 01d6 7245     		jb	.L43
  85:lib_convert.cpp ****         return EXIT_SUCCESS;
 429              		.loc 1 85 9 view .LVU144
  85:lib_convert.cpp ****         return EXIT_SUCCESS;
 430              		.loc 1 85 14 is_stmt 0 view .LVU145
 431 01d8 890F     		movl	%ecx, (%rdi)
  86:lib_convert.cpp ****     } else {
 432              		.loc 1 86 9 is_stmt 1 view .LVU146
  86:lib_convert.cpp ****     } else {
 433              		.loc 1 86 16 is_stmt 0 view .LVU147
 434 01da B8000000 		movl	$0, %eax
 434      00
 435              	.L33:
  90:lib_convert.cpp **** 
 436              		.loc 1 90 1 view .LVU148
 437 01df 5B       		popq	%rbx
 438              		.cfi_remember_state
 439              		.cfi_def_cfa_offset 8
 440 01e0 C3       		ret
 441              	.LVL62:
 442              	.L47:
 443              		.cfi_restore_state
  69:lib_convert.cpp ****     uint8_t i;
 444              		.loc 1 69 23 view .LVU149
 445 01e1 B8010000 		movl	$1, %eax
 445      00
 446 01e6 EBC2     		jmp	.L36
 447              	.LVL63:
 448              	.L38:
  80:lib_convert.cpp ****         }
 449              		.loc 1 80 13 is_stmt 1 view .LVU150
  80:lib_convert.cpp ****         }
 450              		.loc 1 80 17 is_stmt 0 view .LVU151
 451 01e8 89C9     		movl	%ecx, %ecx
  80:lib_convert.cpp ****         }
 452              		.loc 1 80 17 view .LVU152
 453 01ea 490FAFCB 		imulq	%r11, %rcx
 454              	.LVL64:
  80:lib_convert.cpp ****         }
 455              		.loc 1 80 17 view .LVU153
 456 01ee 48C1E923 		shrq	$35, %rcx
 457              	.LVL65:
 458              	.L39:
GAS LISTING /tmp/cceaV4lG.s 			page 20


  82:lib_convert.cpp ****     }
 459              		.loc 1 82 9 is_stmt 1 discriminator 2 view .LVU154
  82:lib_convert.cpp ****     }
 460              		.loc 1 82 13 is_stmt 0 discriminator 2 view .LVU155
 461 01f2 89C0     		movl	%eax, %eax
  82:lib_convert.cpp ****     }
 462              		.loc 1 82 13 discriminator 2 view .LVU156
 463 01f4 490FAFC3 		imulq	%r11, %rax
 464              	.LVL66:
  82:lib_convert.cpp ****     }
 465              		.loc 1 82 13 discriminator 2 view .LVU157
 466 01f8 48C1E823 		shrq	$35, %rax
  76:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
 467              		.loc 1 76 5 is_stmt 1 discriminator 2 view .LVU158
  76:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
 468              		.loc 1 76 19 discriminator 2 view .LVU159
 469 01fc 4883C601 		addq	$1, %rsi
  76:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
 470              		.loc 1 76 19 is_stmt 0 discriminator 2 view .LVU160
 471 0200 4C39D6   		cmpq	%r10, %rsi
 472 0203 74C9     		je	.L37
 473              	.LVL67:
 474              	.L40:
  77:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
 475              		.loc 1 77 9 is_stmt 1 view .LVU161
  77:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
 476              		.loc 1 77 26 is_stmt 0 view .LVU162
 477 0205 0FB616   		movzbl	(%rsi), %edx
  77:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
 478              		.loc 1 77 34 view .LVU163
 479 0208 8D5AD0   		leal	-48(%rdx), %ebx
  77:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
 480              		.loc 1 77 9 view .LVU164
 481 020b 80FB09   		cmpb	$9, %bl
 482 020e 77D8     		ja	.L38
  78:lib_convert.cpp ****         } else {
 483              		.loc 1 78 13 is_stmt 1 view .LVU165
  78:lib_convert.cpp ****         } else {
 484              		.loc 1 78 33 is_stmt 0 view .LVU166
 485 0210 0FBED2   		movsbl	%dl, %edx
  78:lib_convert.cpp ****         } else {
 486              		.loc 1 78 35 view .LVU167
 487 0213 83EA30   		subl	$48, %edx
  78:lib_convert.cpp ****         } else {
 488              		.loc 1 78 41 view .LVU168
 489 0216 0FAFD0   		imull	%eax, %edx
  78:lib_convert.cpp ****         } else {
 490              		.loc 1 78 17 view .LVU169
 491 0219 01D1     		addl	%edx, %ecx
 492              	.LVL68:
  78:lib_convert.cpp ****         } else {
 493              		.loc 1 78 17 view .LVU170
 494 021b EBD5     		jmp	.L39
 495              	.LVL69:
 496              	.L43:
  88:lib_convert.cpp ****     }
 497              		.loc 1 88 16 view .LVU171
GAS LISTING /tmp/cceaV4lG.s 			page 21


 498 021d B8010000 		movl	$1, %eax
 498      00
 499 0222 EBBB     		jmp	.L33
 500              		.cfi_endproc
 501              	.LFE56:
 502              		.size	str_to_uint32, .-str_to_uint32
 503              		.globl	str_to_int32
 504              		.type	str_to_int32, @function
 505              	str_to_int32:
 506              	.LVL70:
 507              	.LFB57:
  94:lib_convert.cpp ****     int32_t val = 0;
 508              		.loc 1 94 1 is_stmt 1 view -0
 509              		.cfi_startproc
  94:lib_convert.cpp ****     int32_t val = 0;
 510              		.loc 1 94 1 is_stmt 0 view .LVU173
 511 0224 4154     		pushq	%r12
 512              		.cfi_def_cfa_offset 16
 513              		.cfi_offset 12, -16
 514 0226 55       		pushq	%rbp
 515              		.cfi_def_cfa_offset 24
 516              		.cfi_offset 6, -24
 517 0227 53       		pushq	%rbx
 518              		.cfi_def_cfa_offset 32
 519              		.cfi_offset 3, -32
 520 0228 4889FB   		movq	%rdi, %rbx
 521 022b 4989F3   		movq	%rsi, %r11
 522 022e 89D5     		movl	%edx, %ebp
 523 0230 89CF     		movl	%ecx, %edi
 524              	.LVL71:
  95:lib_convert.cpp ****     uint32_t pow = 1;
 525              		.loc 1 95 5 is_stmt 1 view .LVU174
  96:lib_convert.cpp ****     uint8_t i;
 526              		.loc 1 96 5 view .LVU175
  97:lib_convert.cpp ****     int8_t sign = 1;
 527              		.loc 1 97 5 view .LVU176
  98:lib_convert.cpp **** 
 528              		.loc 1 98 5 view .LVU177
 101:lib_convert.cpp ****         pow *= 10;
 529              		.loc 1 101 5 view .LVU178
 101:lib_convert.cpp ****         pow *= 10;
 530              		.loc 1 101 19 view .LVU179
 101:lib_convert.cpp ****         pow *= 10;
 531              		.loc 1 101 21 is_stmt 0 view .LVU180
 532 0232 440FB6D1 		movzbl	%cl, %r10d
 101:lib_convert.cpp ****         pow *= 10;
 533              		.loc 1 101 25 view .LVU181
 534 0236 4183EA01 		subl	$1, %r10d
 101:lib_convert.cpp ****         pow *= 10;
 535              		.loc 1 101 19 view .LVU182
 536 023a 80F901   		cmpb	$1, %cl
 537 023d 7640     		jbe	.L49
 101:lib_convert.cpp ****         pow *= 10;
 538              		.loc 1 101 12 view .LVU183
 539 023f BA000000 		movl	$0, %edx
 539      00
 540              	.LVL72:
GAS LISTING /tmp/cceaV4lG.s 			page 22


  96:lib_convert.cpp ****     uint8_t i;
 541              		.loc 1 96 14 view .LVU184
 542 0244 B8010000 		movl	$1, %eax
 542      00
 543              	.LVL73:
 544              	.L50:
 102:lib_convert.cpp ****     }
 545              		.loc 1 102 9 is_stmt 1 discriminator 3 view .LVU185
 102:lib_convert.cpp ****     }
 546              		.loc 1 102 13 is_stmt 0 discriminator 3 view .LVU186
 547 0249 8D0480   		leal	(%rax,%rax,4), %eax
 548              	.LVL74:
 102:lib_convert.cpp ****     }
 549              		.loc 1 102 13 discriminator 3 view .LVU187
 550 024c 01C0     		addl	%eax, %eax
 551              	.LVL75:
 101:lib_convert.cpp ****         pow *= 10;
 552              		.loc 1 101 5 is_stmt 1 discriminator 3 view .LVU188
 553 024e 83C201   		addl	$1, %edx
 554              	.LVL76:
 101:lib_convert.cpp ****         pow *= 10;
 555              		.loc 1 101 19 discriminator 3 view .LVU189
 101:lib_convert.cpp ****         pow *= 10;
 556              		.loc 1 101 17 is_stmt 0 discriminator 3 view .LVU190
 557 0251 0FB6F2   		movzbl	%dl, %esi
 101:lib_convert.cpp ****         pow *= 10;
 558              		.loc 1 101 19 discriminator 3 view .LVU191
 559 0254 4439D6   		cmpl	%r10d, %esi
 560 0257 7CF0     		jl	.L50
 561              	.LVL77:
 562              	.L51:
 101:lib_convert.cpp ****         pow *= 10;
 563              		.loc 1 101 19 discriminator 3 view .LVU192
 564 0259 400FB6ED 		movzbl	%bpl, %ebp
 565 025d 488D0C2B 		leaq	(%rbx,%rbp), %rcx
 566              	.LVL78:
 101:lib_convert.cpp ****         pow *= 10;
 567              		.loc 1 101 19 discriminator 3 view .LVU193
 568 0261 400FB6FF 		movzbl	%dil, %edi
 569 0265 4801CF   		addq	%rcx, %rdi
  98:lib_convert.cpp **** 
 570              		.loc 1 98 12 view .LVU194
 571 0268 BB010000 		movl	$1, %ebx
 571      00
 572              	.LVL79:
  95:lib_convert.cpp ****     uint32_t pow = 1;
 573              		.loc 1 95 13 view .LVU195
 574 026d BE000000 		movl	$0, %esi
 574      00
 108:lib_convert.cpp ****         } else {
 575              		.loc 1 108 18 view .LVU196
 576 0272 BDFFFFFF 		movl	$-1, %ebp
 576      FF
 112:lib_convert.cpp ****     }
 577              		.loc 1 112 13 view .LVU197
 578 0277 41BACDCC 		movl	$3435973837, %r10d
 578      CCCC
GAS LISTING /tmp/cceaV4lG.s 			page 23


 579              	.LVL80:
 112:lib_convert.cpp ****     }
 580              		.loc 1 112 13 view .LVU198
 581 027d EB63     		jmp	.L55
 582              	.LVL81:
 583              	.L49:
 104:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
 584              		.loc 1 104 19 is_stmt 1 view .LVU199
 585 027f 84C9     		testb	%cl, %cl
 586 0281 7527     		jne	.L63
  98:lib_convert.cpp **** 
 587              		.loc 1 98 12 is_stmt 0 view .LVU200
 588 0283 BB010000 		movl	$1, %ebx
 588      00
 589              	.LVL82:
  95:lib_convert.cpp ****     uint32_t pow = 1;
 590              		.loc 1 95 13 view .LVU201
 591 0288 BE000000 		movl	$0, %esi
 591      00
 592              	.LVL83:
 593              	.L52:
 114:lib_convert.cpp ****         *out = val * sign;
 594              		.loc 1 114 5 is_stmt 1 view .LVU202
 595 028d 4139F0   		cmpl	%esi, %r8d
 596 0290 7F6E     		jg	.L59
 597 0292 4139F1   		cmpl	%esi, %r9d
 598 0295 7C69     		jl	.L59
 115:lib_convert.cpp ****         return EXIT_SUCCESS;
 599              		.loc 1 115 9 view .LVU203
 115:lib_convert.cpp ****         return EXIT_SUCCESS;
 600              		.loc 1 115 22 is_stmt 0 view .LVU204
 601 0297 0FBEDB   		movsbl	%bl, %ebx
 115:lib_convert.cpp ****         return EXIT_SUCCESS;
 602              		.loc 1 115 20 view .LVU205
 603 029a 0FAFDE   		imull	%esi, %ebx
 115:lib_convert.cpp ****         return EXIT_SUCCESS;
 604              		.loc 1 115 14 view .LVU206
 605 029d 41891B   		movl	%ebx, (%r11)
 116:lib_convert.cpp ****     } else {
 606              		.loc 1 116 9 is_stmt 1 view .LVU207
 116:lib_convert.cpp ****     } else {
 607              		.loc 1 116 16 is_stmt 0 view .LVU208
 608 02a0 B8000000 		movl	$0, %eax
 608      00
 609              	.L48:
 120:lib_convert.cpp **** 
 610              		.loc 1 120 1 view .LVU209
 611 02a5 5B       		popq	%rbx
 612              		.cfi_remember_state
 613              		.cfi_def_cfa_offset 24
 614 02a6 5D       		popq	%rbp
 615              		.cfi_def_cfa_offset 16
 616 02a7 415C     		popq	%r12
 617              		.cfi_def_cfa_offset 8
 618 02a9 C3       		ret
 619              	.LVL84:
 620              	.L63:
GAS LISTING /tmp/cceaV4lG.s 			page 24


 621              		.cfi_restore_state
  96:lib_convert.cpp ****     uint8_t i;
 622              		.loc 1 96 14 view .LVU210
 623 02aa B8010000 		movl	$1, %eax
 623      00
 624 02af EBA8     		jmp	.L51
 625              	.LVL85:
 626              	.L53:
 107:lib_convert.cpp ****             sign = -1;
 627              		.loc 1 107 16 is_stmt 1 view .LVU211
 628 02b1 80FA2D   		cmpb	$45, %dl
 629 02b4 7446     		je	.L58
 110:lib_convert.cpp ****         }
 630              		.loc 1 110 13 view .LVU212
 110:lib_convert.cpp ****         }
 631              		.loc 1 110 17 is_stmt 0 view .LVU213
 632 02b6 4863D6   		movslq	%esi, %rdx
 633 02b9 4869D267 		imulq	$1717986919, %rdx, %rdx
 633      666666
 634 02c0 48C1FA22 		sarq	$34, %rdx
 635 02c4 C1FE1F   		sarl	$31, %esi
 636              	.LVL86:
 110:lib_convert.cpp ****         }
 637              		.loc 1 110 17 view .LVU214
 638 02c7 4189F4   		movl	%esi, %r12d
 639 02ca 89D6     		movl	%edx, %esi
 640 02cc 4429E6   		subl	%r12d, %esi
 641              	.LVL87:
 642              	.L54:
 112:lib_convert.cpp ****     }
 643              		.loc 1 112 9 is_stmt 1 discriminator 2 view .LVU215
 112:lib_convert.cpp ****     }
 644              		.loc 1 112 13 is_stmt 0 discriminator 2 view .LVU216
 645 02cf 89C0     		movl	%eax, %eax
 112:lib_convert.cpp ****     }
 646              		.loc 1 112 13 discriminator 2 view .LVU217
 647 02d1 490FAFC2 		imulq	%r10, %rax
 648              	.LVL88:
 112:lib_convert.cpp ****     }
 649              		.loc 1 112 13 discriminator 2 view .LVU218
 650 02d5 48C1E823 		shrq	$35, %rax
 104:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
 651              		.loc 1 104 5 is_stmt 1 discriminator 2 view .LVU219
 104:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
 652              		.loc 1 104 19 discriminator 2 view .LVU220
 653 02d9 4883C101 		addq	$1, %rcx
 104:lib_convert.cpp ****         if ((str[seek + i] > 47) && (str[seek + i] < 58)) {
 654              		.loc 1 104 19 is_stmt 0 discriminator 2 view .LVU221
 655 02dd 4839F9   		cmpq	%rdi, %rcx
 656 02e0 74AB     		je	.L52
 657              	.LVL89:
 658              	.L55:
 105:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
 659              		.loc 1 105 9 is_stmt 1 view .LVU222
 105:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
 660              		.loc 1 105 26 is_stmt 0 view .LVU223
 661 02e2 0FB611   		movzbl	(%rcx), %edx
GAS LISTING /tmp/cceaV4lG.s 			page 25


 105:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
 662              		.loc 1 105 34 view .LVU224
 663 02e5 448D62D0 		leal	-48(%rdx), %r12d
 105:lib_convert.cpp ****             val += (str[seek + i] - 48) * pow;
 664              		.loc 1 105 9 view .LVU225
 665 02e9 4180FC09 		cmpb	$9, %r12b
 666 02ed 77C2     		ja	.L53
 106:lib_convert.cpp ****         } else if (str[seek + i] == 45) {
 667              		.loc 1 106 13 is_stmt 1 view .LVU226
 106:lib_convert.cpp ****         } else if (str[seek + i] == 45) {
 668              		.loc 1 106 33 is_stmt 0 view .LVU227
 669 02ef 0FBED2   		movsbl	%dl, %edx
 106:lib_convert.cpp ****         } else if (str[seek + i] == 45) {
 670              		.loc 1 106 35 view .LVU228
 671 02f2 83EA30   		subl	$48, %edx
 106:lib_convert.cpp ****         } else if (str[seek + i] == 45) {
 672              		.loc 1 106 41 view .LVU229
 673 02f5 0FAFD0   		imull	%eax, %edx
 106:lib_convert.cpp ****         } else if (str[seek + i] == 45) {
 674              		.loc 1 106 17 view .LVU230
 675 02f8 01D6     		addl	%edx, %esi
 676              	.LVL90:
 106:lib_convert.cpp ****         } else if (str[seek + i] == 45) {
 677              		.loc 1 106 17 view .LVU231
 678 02fa EBD3     		jmp	.L54
 679              	.L58:
 108:lib_convert.cpp ****         } else {
 680              		.loc 1 108 18 view .LVU232
 681 02fc 89EB     		movl	%ebp, %ebx
 682              	.LVL91:
 108:lib_convert.cpp ****         } else {
 683              		.loc 1 108 18 view .LVU233
 684 02fe EBCF     		jmp	.L54
 685              	.LVL92:
 686              	.L59:
 118:lib_convert.cpp ****     }
 687              		.loc 1 118 16 view .LVU234
 688 0300 B8010000 		movl	$1, %eax
 688      00
 689 0305 EB9E     		jmp	.L48
 690              		.cfi_endproc
 691              	.LFE57:
 692              		.size	str_to_int32, .-str_to_int32
 693              		.globl	hstr_to_uint8
 694              		.type	hstr_to_uint8, @function
 695              	hstr_to_uint8:
 696              	.LVL93:
 697              	.LFB58:
 124:lib_convert.cpp ****     uint8_t val = 0;
 698              		.loc 1 124 1 is_stmt 1 view -0
 699              		.cfi_startproc
 124:lib_convert.cpp ****     uint8_t val = 0;
 700              		.loc 1 124 1 is_stmt 0 view .LVU236
 701 0307 53       		pushq	%rbx
 702              		.cfi_def_cfa_offset 16
 703              		.cfi_offset 3, -16
 704 0308 4989F2   		movq	%rsi, %r10
GAS LISTING /tmp/cceaV4lG.s 			page 26


 705 030b 89D3     		movl	%edx, %ebx
 706 030d 89D6     		movl	%edx, %esi
 707              	.LVL94:
 124:lib_convert.cpp ****     uint8_t val = 0;
 708              		.loc 1 124 1 view .LVU237
 709 030f 4189CB   		movl	%ecx, %r11d
 125:lib_convert.cpp ****     uint32_t pow = 1;
 710              		.loc 1 125 5 is_stmt 1 view .LVU238
 711              	.LVL95:
 126:lib_convert.cpp ****     uint8_t i;
 712              		.loc 1 126 5 view .LVU239
 127:lib_convert.cpp **** 
 713              		.loc 1 127 5 view .LVU240
 130:lib_convert.cpp ****         pow *= 16;
 714              		.loc 1 130 5 view .LVU241
 130:lib_convert.cpp ****         pow *= 16;
 715              		.loc 1 130 22 view .LVU242
 716 0312 38CA     		cmpb	%cl, %dl
 717 0314 731D     		jnb	.L74
 130:lib_convert.cpp ****         pow *= 16;
 718              		.loc 1 130 12 is_stmt 0 view .LVU243
 719 0316 89D0     		movl	%edx, %eax
 126:lib_convert.cpp ****     uint8_t i;
 720              		.loc 1 126 14 view .LVU244
 721 0318 BA010000 		movl	$1, %edx
 721      00
 722              	.LVL96:
 723              	.L66:
 131:lib_convert.cpp ****     }
 724              		.loc 1 131 9 is_stmt 1 discriminator 3 view .LVU245
 131:lib_convert.cpp ****     }
 725              		.loc 1 131 13 is_stmt 0 discriminator 3 view .LVU246
 726 031d C1E204   		sall	$4, %edx
 727              	.LVL97:
 130:lib_convert.cpp ****         pow *= 16;
 728              		.loc 1 130 5 is_stmt 1 discriminator 3 view .LVU247
 729 0320 83C001   		addl	$1, %eax
 730              	.LVL98:
 130:lib_convert.cpp ****         pow *= 16;
 731              		.loc 1 130 22 discriminator 3 view .LVU248
 732 0323 4138C3   		cmpb	%al, %r11b
 733 0326 75F5     		jne	.L66
 734              	.LVL99:
 735              	.L65:
 134:lib_convert.cpp ****         if ((str[i] > 47) && (str[i] < 58)) {
 736              		.loc 1 134 22 view .LVU249
 737 0328 38D9     		cmpb	%bl, %cl
 738 032a 726C     		jb	.L67
 125:lib_convert.cpp ****     uint32_t pow = 1;
 739              		.loc 1 125 13 is_stmt 0 view .LVU250
 740 032c B9000000 		movl	$0, %ecx
 740      00
 741              	.LVL100:
 125:lib_convert.cpp ****     uint32_t pow = 1;
 742              		.loc 1 125 13 view .LVU251
 743 0331 EB22     		jmp	.L71
 744              	.LVL101:
GAS LISTING /tmp/cceaV4lG.s 			page 27


 745              	.L74:
 126:lib_convert.cpp ****     uint8_t i;
 746              		.loc 1 126 14 view .LVU252
 747 0333 BA010000 		movl	$1, %edx
 747      00
 748              	.LVL102:
 126:lib_convert.cpp ****     uint8_t i;
 749              		.loc 1 126 14 view .LVU253
 750 0338 EBEE     		jmp	.L65
 751              	.LVL103:
 752              	.L68:
 138:lib_convert.cpp ****             // a - f
 753              		.loc 1 138 16 is_stmt 1 view .LVU254
 138:lib_convert.cpp ****             // a - f
 754              		.loc 1 138 34 is_stmt 0 view .LVU255
 755 033a 8D589F   		leal	-97(%rax), %ebx
 138:lib_convert.cpp ****             // a - f
 756              		.loc 1 138 16 view .LVU256
 757 033d 80FB05   		cmpb	$5, %bl
 758 0340 772C     		ja	.L70
 140:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 759              		.loc 1 140 13 is_stmt 1 view .LVU257
 140:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 760              		.loc 1 140 28 is_stmt 0 view .LVU258
 761 0342 83E857   		subl	$87, %eax
 140:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 762              		.loc 1 140 17 view .LVU259
 763 0345 0FAFC2   		imull	%edx, %eax
 764 0348 01C1     		addl	%eax, %ecx
 765              	.LVL104:
 766              	.L69:
 145:lib_convert.cpp ****     }
 767              		.loc 1 145 9 is_stmt 1 discriminator 2 view .LVU260
 145:lib_convert.cpp ****     }
 768              		.loc 1 145 13 is_stmt 0 discriminator 2 view .LVU261
 769 034a C1EA04   		shrl	$4, %edx
 770              	.LVL105:
 134:lib_convert.cpp ****         if ((str[i] > 47) && (str[i] < 58)) {
 771              		.loc 1 134 5 is_stmt 1 discriminator 2 view .LVU262
 772 034d 83C601   		addl	$1, %esi
 773              	.LVL106:
 134:lib_convert.cpp ****         if ((str[i] > 47) && (str[i] < 58)) {
 774              		.loc 1 134 22 discriminator 2 view .LVU263
 775 0350 4138F3   		cmpb	%sil, %r11b
 776 0353 722B     		jb	.L81
 777              	.LVL107:
 778              	.L71:
 135:lib_convert.cpp ****             // 0 - 9
 779              		.loc 1 135 9 view .LVU264
 135:lib_convert.cpp ****             // 0 - 9
 780              		.loc 1 135 18 is_stmt 0 view .LVU265
 781 0355 400FB6C6 		movzbl	%sil, %eax
 135:lib_convert.cpp ****             // 0 - 9
 782              		.loc 1 135 19 view .LVU266
 783 0359 0FB60407 		movzbl	(%rdi,%rax), %eax
 135:lib_convert.cpp ****             // 0 - 9
 784              		.loc 1 135 27 view .LVU267
GAS LISTING /tmp/cceaV4lG.s 			page 28


 785 035d 8D58D0   		leal	-48(%rax), %ebx
 135:lib_convert.cpp ****             // 0 - 9
 786              		.loc 1 135 9 view .LVU268
 787 0360 80FB09   		cmpb	$9, %bl
 788 0363 77D5     		ja	.L68
 137:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 789              		.loc 1 137 13 is_stmt 1 view .LVU269
 137:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 790              		.loc 1 137 28 is_stmt 0 view .LVU270
 791 0365 89D8     		movl	%ebx, %eax
 137:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 792              		.loc 1 137 17 view .LVU271
 793 0367 0FAFC2   		imull	%edx, %eax
 794 036a 01C1     		addl	%eax, %ecx
 795              	.LVL108:
 137:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 796              		.loc 1 137 17 view .LVU272
 797 036c EBDC     		jmp	.L69
 798              	.L70:
 141:lib_convert.cpp ****             // A - F
 799              		.loc 1 141 16 is_stmt 1 view .LVU273
 141:lib_convert.cpp ****             // A - F
 800              		.loc 1 141 34 is_stmt 0 view .LVU274
 801 036e 8D58BF   		leal	-65(%rax), %ebx
 141:lib_convert.cpp ****             // A - F
 802              		.loc 1 141 16 view .LVU275
 803 0371 80FB05   		cmpb	$5, %bl
 804 0374 77D4     		ja	.L69
 143:lib_convert.cpp ****         }
 805              		.loc 1 143 13 is_stmt 1 view .LVU276
 143:lib_convert.cpp ****         }
 806              		.loc 1 143 28 is_stmt 0 view .LVU277
 807 0376 83E837   		subl	$55, %eax
 143:lib_convert.cpp ****         }
 808              		.loc 1 143 17 view .LVU278
 809 0379 0FAFC2   		imull	%edx, %eax
 810 037c 01C1     		addl	%eax, %ecx
 811              	.LVL109:
 143:lib_convert.cpp ****         }
 812              		.loc 1 143 17 view .LVU279
 813 037e EBCA     		jmp	.L69
 814              	.L81:
 148:lib_convert.cpp ****         *out = val;
 815              		.loc 1 148 5 is_stmt 1 view .LVU280
 152:lib_convert.cpp ****     }
 816              		.loc 1 152 16 is_stmt 0 view .LVU281
 817 0380 B8010000 		movl	$1, %eax
 817      00
 148:lib_convert.cpp ****         *out = val;
 818              		.loc 1 148 5 view .LVU282
 819 0385 4438C1   		cmpb	%r8b, %cl
 820 0388 720C     		jb	.L64
 148:lib_convert.cpp ****         *out = val;
 821              		.loc 1 148 26 discriminator 1 view .LVU283
 822 038a 0FB6D1   		movzbl	%cl, %edx
 823              	.LVL110:
 148:lib_convert.cpp ****         *out = val;
GAS LISTING /tmp/cceaV4lG.s 			page 29


 824              		.loc 1 148 33 discriminator 1 view .LVU284
 825 038d 450FB7C9 		movzwl	%r9w, %r9d
 148:lib_convert.cpp ****         *out = val;
 826              		.loc 1 148 22 discriminator 1 view .LVU285
 827 0391 4439CA   		cmpl	%r9d, %edx
 828 0394 7E0A     		jle	.L73
 829              	.LVL111:
 830              	.L64:
 154:lib_convert.cpp **** 
 831              		.loc 1 154 1 view .LVU286
 832 0396 5B       		popq	%rbx
 833              		.cfi_remember_state
 834              		.cfi_def_cfa_offset 8
 835 0397 C3       		ret
 836              	.LVL112:
 837              	.L67:
 838              		.cfi_restore_state
 148:lib_convert.cpp ****         *out = val;
 839              		.loc 1 148 5 is_stmt 1 view .LVU287
 125:lib_convert.cpp ****     uint32_t pow = 1;
 840              		.loc 1 125 13 is_stmt 0 view .LVU288
 841 0398 4489C1   		movl	%r8d, %ecx
 842              	.LVL113:
 148:lib_convert.cpp ****         *out = val;
 843              		.loc 1 148 5 view .LVU289
 844 039b 4584C0   		testb	%r8b, %r8b
 845 039e 750A     		jne	.L82
 846              	.LVL114:
 847              	.L73:
 149:lib_convert.cpp ****         return EXIT_SUCCESS;
 848              		.loc 1 149 9 is_stmt 1 view .LVU290
 149:lib_convert.cpp ****         return EXIT_SUCCESS;
 849              		.loc 1 149 14 is_stmt 0 view .LVU291
 850 03a0 41880A   		movb	%cl, (%r10)
 150:lib_convert.cpp ****     } else {
 851              		.loc 1 150 9 is_stmt 1 view .LVU292
 150:lib_convert.cpp ****     } else {
 852              		.loc 1 150 16 is_stmt 0 view .LVU293
 853 03a3 B8000000 		movl	$0, %eax
 853      00
 854 03a8 EBEC     		jmp	.L64
 855              	.LVL115:
 856              	.L82:
 152:lib_convert.cpp ****     }
 857              		.loc 1 152 16 view .LVU294
 858 03aa B8010000 		movl	$1, %eax
 858      00
 859 03af EBE5     		jmp	.L64
 860              		.cfi_endproc
 861              	.LFE58:
 862              		.size	hstr_to_uint8, .-hstr_to_uint8
 863              		.globl	hstr_to_uint16
 864              		.type	hstr_to_uint16, @function
 865              	hstr_to_uint16:
 866              	.LVL116:
 867              	.LFB59:
 158:lib_convert.cpp ****     uint16_t val = 0;
GAS LISTING /tmp/cceaV4lG.s 			page 30


 868              		.loc 1 158 1 is_stmt 1 view -0
 869              		.cfi_startproc
 158:lib_convert.cpp ****     uint16_t val = 0;
 870              		.loc 1 158 1 is_stmt 0 view .LVU296
 871 03b1 53       		pushq	%rbx
 872              		.cfi_def_cfa_offset 16
 873              		.cfi_offset 3, -16
 874 03b2 4989F2   		movq	%rsi, %r10
 875 03b5 89D3     		movl	%edx, %ebx
 876 03b7 89D6     		movl	%edx, %esi
 877              	.LVL117:
 158:lib_convert.cpp ****     uint16_t val = 0;
 878              		.loc 1 158 1 view .LVU297
 879 03b9 4189CB   		movl	%ecx, %r11d
 159:lib_convert.cpp ****     uint32_t pow = 1;
 880              		.loc 1 159 5 is_stmt 1 view .LVU298
 881              	.LVL118:
 160:lib_convert.cpp ****     uint8_t i;
 882              		.loc 1 160 5 view .LVU299
 161:lib_convert.cpp **** 
 883              		.loc 1 161 5 view .LVU300
 164:lib_convert.cpp ****         pow *= 16;
 884              		.loc 1 164 5 view .LVU301
 164:lib_convert.cpp ****         pow *= 16;
 885              		.loc 1 164 22 view .LVU302
 886 03bc 38CA     		cmpb	%cl, %dl
 887 03be 731D     		jnb	.L92
 164:lib_convert.cpp ****         pow *= 16;
 888              		.loc 1 164 12 is_stmt 0 view .LVU303
 889 03c0 89D0     		movl	%edx, %eax
 160:lib_convert.cpp ****     uint8_t i;
 890              		.loc 1 160 14 view .LVU304
 891 03c2 BA010000 		movl	$1, %edx
 891      00
 892              	.LVL119:
 893              	.L85:
 165:lib_convert.cpp ****     }
 894              		.loc 1 165 9 is_stmt 1 discriminator 3 view .LVU305
 165:lib_convert.cpp ****     }
 895              		.loc 1 165 13 is_stmt 0 discriminator 3 view .LVU306
 896 03c7 C1E204   		sall	$4, %edx
 897              	.LVL120:
 164:lib_convert.cpp ****         pow *= 16;
 898              		.loc 1 164 5 is_stmt 1 discriminator 3 view .LVU307
 899 03ca 83C001   		addl	$1, %eax
 900              	.LVL121:
 164:lib_convert.cpp ****         pow *= 16;
 901              		.loc 1 164 22 discriminator 3 view .LVU308
 902 03cd 4138C3   		cmpb	%al, %r11b
 903 03d0 75F5     		jne	.L85
 904              	.LVL122:
 905              	.L84:
 168:lib_convert.cpp ****         if ((str[i] > 47) && (str[i] < 58)) {
 906              		.loc 1 168 22 view .LVU309
 907 03d2 38D9     		cmpb	%bl, %cl
 908 03d4 725E     		jb	.L93
 159:lib_convert.cpp ****     uint32_t pow = 1;
GAS LISTING /tmp/cceaV4lG.s 			page 31


 909              		.loc 1 159 14 is_stmt 0 view .LVU310
 910 03d6 B9000000 		movl	$0, %ecx
 910      00
 911              	.LVL123:
 159:lib_convert.cpp ****     uint32_t pow = 1;
 912              		.loc 1 159 14 view .LVU311
 913 03db EB25     		jmp	.L90
 914              	.LVL124:
 915              	.L92:
 160:lib_convert.cpp ****     uint8_t i;
 916              		.loc 1 160 14 view .LVU312
 917 03dd BA010000 		movl	$1, %edx
 917      00
 918              	.LVL125:
 160:lib_convert.cpp ****     uint8_t i;
 919              		.loc 1 160 14 view .LVU313
 920 03e2 EBEE     		jmp	.L84
 921              	.LVL126:
 922              	.L87:
 172:lib_convert.cpp ****             // a - f
 923              		.loc 1 172 16 is_stmt 1 view .LVU314
 172:lib_convert.cpp ****             // a - f
 924              		.loc 1 172 34 is_stmt 0 view .LVU315
 925 03e4 8D589F   		leal	-97(%rax), %ebx
 172:lib_convert.cpp ****             // a - f
 926              		.loc 1 172 16 view .LVU316
 927 03e7 80FB05   		cmpb	$5, %bl
 928 03ea 7733     		ja	.L89
 174:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 929              		.loc 1 174 13 is_stmt 1 view .LVU317
 174:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 930              		.loc 1 174 26 is_stmt 0 view .LVU318
 931 03ec 0FBEC0   		movsbl	%al, %eax
 174:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 932              		.loc 1 174 28 view .LVU319
 933 03ef 83E857   		subl	$87, %eax
 174:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 934              		.loc 1 174 17 view .LVU320
 935 03f2 0FAFC2   		imull	%edx, %eax
 936 03f5 01C1     		addl	%eax, %ecx
 937              	.LVL127:
 938              	.L88:
 179:lib_convert.cpp ****     }
 939              		.loc 1 179 9 is_stmt 1 discriminator 2 view .LVU321
 179:lib_convert.cpp ****     }
 940              		.loc 1 179 13 is_stmt 0 discriminator 2 view .LVU322
 941 03f7 C1EA04   		shrl	$4, %edx
 942              	.LVL128:
 168:lib_convert.cpp ****         if ((str[i] > 47) && (str[i] < 58)) {
 943              		.loc 1 168 5 is_stmt 1 discriminator 2 view .LVU323
 944 03fa 83C601   		addl	$1, %esi
 945              	.LVL129:
 168:lib_convert.cpp ****         if ((str[i] > 47) && (str[i] < 58)) {
 946              		.loc 1 168 22 discriminator 2 view .LVU324
 947 03fd 4138F3   		cmpb	%sil, %r11b
 948 0400 7237     		jb	.L86
 949              	.LVL130:
GAS LISTING /tmp/cceaV4lG.s 			page 32


 950              	.L90:
 169:lib_convert.cpp ****             // 0 - 9
 951              		.loc 1 169 9 view .LVU325
 169:lib_convert.cpp ****             // 0 - 9
 952              		.loc 1 169 18 is_stmt 0 view .LVU326
 953 0402 400FB6C6 		movzbl	%sil, %eax
 169:lib_convert.cpp ****             // 0 - 9
 954              		.loc 1 169 19 view .LVU327
 955 0406 0FB60407 		movzbl	(%rdi,%rax), %eax
 169:lib_convert.cpp ****             // 0 - 9
 956              		.loc 1 169 27 view .LVU328
 957 040a 8D58D0   		leal	-48(%rax), %ebx
 169:lib_convert.cpp ****             // 0 - 9
 958              		.loc 1 169 9 view .LVU329
 959 040d 80FB09   		cmpb	$9, %bl
 960 0410 77D2     		ja	.L87
 171:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 961              		.loc 1 171 13 is_stmt 1 view .LVU330
 171:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 962              		.loc 1 171 26 is_stmt 0 view .LVU331
 963 0412 0FBEC0   		movsbl	%al, %eax
 171:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 964              		.loc 1 171 28 view .LVU332
 965 0415 83E830   		subl	$48, %eax
 171:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 966              		.loc 1 171 17 view .LVU333
 967 0418 0FAFC2   		imull	%edx, %eax
 968 041b 01C1     		addl	%eax, %ecx
 969              	.LVL131:
 171:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 970              		.loc 1 171 17 view .LVU334
 971 041d EBD8     		jmp	.L88
 972              	.L89:
 175:lib_convert.cpp ****             // A - F
 973              		.loc 1 175 16 is_stmt 1 view .LVU335
 175:lib_convert.cpp ****             // A - F
 974              		.loc 1 175 34 is_stmt 0 view .LVU336
 975 041f 8D58BF   		leal	-65(%rax), %ebx
 175:lib_convert.cpp ****             // A - F
 976              		.loc 1 175 16 view .LVU337
 977 0422 80FB05   		cmpb	$5, %bl
 978 0425 77D0     		ja	.L88
 177:lib_convert.cpp ****         }
 979              		.loc 1 177 13 is_stmt 1 view .LVU338
 177:lib_convert.cpp ****         }
 980              		.loc 1 177 26 is_stmt 0 view .LVU339
 981 0427 0FBEC0   		movsbl	%al, %eax
 177:lib_convert.cpp ****         }
 982              		.loc 1 177 28 view .LVU340
 983 042a 83E837   		subl	$55, %eax
 177:lib_convert.cpp ****         }
 984              		.loc 1 177 17 view .LVU341
 985 042d 0FAFC2   		imull	%edx, %eax
 986 0430 01C1     		addl	%eax, %ecx
 987              	.LVL132:
 177:lib_convert.cpp ****         }
 988              		.loc 1 177 17 view .LVU342
GAS LISTING /tmp/cceaV4lG.s 			page 33


 989 0432 EBC3     		jmp	.L88
 990              	.LVL133:
 991              	.L93:
 159:lib_convert.cpp ****     uint32_t pow = 1;
 992              		.loc 1 159 14 view .LVU343
 993 0434 B9000000 		movl	$0, %ecx
 993      00
 994              	.LVL134:
 995              	.L86:
 182:lib_convert.cpp ****         *out = val;
 996              		.loc 1 182 5 is_stmt 1 view .LVU344
 997 0439 664439C1 		cmpw	%r8w, %cx
 998 043d 7211     		jb	.L94
 999 043f 664439C9 		cmpw	%r9w, %cx
 1000 0443 770B     		ja	.L94
 183:lib_convert.cpp ****         return EXIT_SUCCESS;
 1001              		.loc 1 183 9 view .LVU345
 183:lib_convert.cpp ****         return EXIT_SUCCESS;
 1002              		.loc 1 183 14 is_stmt 0 view .LVU346
 1003 0445 6641890A 		movw	%cx, (%r10)
 184:lib_convert.cpp ****     } else {
 1004              		.loc 1 184 9 is_stmt 1 view .LVU347
 184:lib_convert.cpp ****     } else {
 1005              		.loc 1 184 16 is_stmt 0 view .LVU348
 1006 0449 B8000000 		movl	$0, %eax
 1006      00
 1007              	.L83:
 188:lib_convert.cpp **** 
 1008              		.loc 1 188 1 view .LVU349
 1009 044e 5B       		popq	%rbx
 1010              		.cfi_remember_state
 1011              		.cfi_def_cfa_offset 8
 1012 044f C3       		ret
 1013              	.L94:
 1014              		.cfi_restore_state
 186:lib_convert.cpp ****     }
 1015              		.loc 1 186 16 view .LVU350
 1016 0450 B8010000 		movl	$1, %eax
 1016      00
 1017 0455 EBF7     		jmp	.L83
 1018              		.cfi_endproc
 1019              	.LFE59:
 1020              		.size	hstr_to_uint16, .-hstr_to_uint16
 1021              		.globl	hstr_to_uint32
 1022              		.type	hstr_to_uint32, @function
 1023              	hstr_to_uint32:
 1024              	.LVL135:
 1025              	.LFB60:
 192:lib_convert.cpp ****     uint32_t val = 0;
 1026              		.loc 1 192 1 is_stmt 1 view -0
 1027              		.cfi_startproc
 192:lib_convert.cpp ****     uint32_t val = 0;
 1028              		.loc 1 192 1 is_stmt 0 view .LVU352
 1029 0457 53       		pushq	%rbx
 1030              		.cfi_def_cfa_offset 16
 1031              		.cfi_offset 3, -16
 1032 0458 4989F2   		movq	%rsi, %r10
GAS LISTING /tmp/cceaV4lG.s 			page 34


 1033 045b 89D3     		movl	%edx, %ebx
 1034 045d 89D6     		movl	%edx, %esi
 1035              	.LVL136:
 192:lib_convert.cpp ****     uint32_t val = 0;
 1036              		.loc 1 192 1 view .LVU353
 1037 045f 4189CB   		movl	%ecx, %r11d
 193:lib_convert.cpp ****     uint32_t pow = 1;
 1038              		.loc 1 193 5 is_stmt 1 view .LVU354
 1039              	.LVL137:
 194:lib_convert.cpp ****     uint8_t i;
 1040              		.loc 1 194 5 view .LVU355
 195:lib_convert.cpp **** 
 1041              		.loc 1 195 5 view .LVU356
 198:lib_convert.cpp ****         pow *= 16;
 1042              		.loc 1 198 5 view .LVU357
 198:lib_convert.cpp ****         pow *= 16;
 1043              		.loc 1 198 22 view .LVU358
 1044 0462 38CA     		cmpb	%cl, %dl
 1045 0464 731D     		jnb	.L107
 198:lib_convert.cpp ****         pow *= 16;
 1046              		.loc 1 198 12 is_stmt 0 view .LVU359
 1047 0466 89D0     		movl	%edx, %eax
 194:lib_convert.cpp ****     uint8_t i;
 1048              		.loc 1 194 14 view .LVU360
 1049 0468 BA010000 		movl	$1, %edx
 1049      00
 1050              	.LVL138:
 1051              	.L100:
 199:lib_convert.cpp ****     }
 1052              		.loc 1 199 9 is_stmt 1 discriminator 3 view .LVU361
 199:lib_convert.cpp ****     }
 1053              		.loc 1 199 13 is_stmt 0 discriminator 3 view .LVU362
 1054 046d C1E204   		sall	$4, %edx
 1055              	.LVL139:
 198:lib_convert.cpp ****         pow *= 16;
 1056              		.loc 1 198 5 is_stmt 1 discriminator 3 view .LVU363
 1057 0470 83C001   		addl	$1, %eax
 1058              	.LVL140:
 198:lib_convert.cpp ****         pow *= 16;
 1059              		.loc 1 198 22 discriminator 3 view .LVU364
 1060 0473 4138C3   		cmpb	%al, %r11b
 1061 0476 75F5     		jne	.L100
 1062              	.LVL141:
 1063              	.L99:
 202:lib_convert.cpp ****         if ((str[i] > 47) && (str[i] < 58)) {
 1064              		.loc 1 202 22 view .LVU365
 1065 0478 38D9     		cmpb	%bl, %cl
 1066 047a 725E     		jb	.L108
 193:lib_convert.cpp ****     uint32_t pow = 1;
 1067              		.loc 1 193 14 is_stmt 0 view .LVU366
 1068 047c B9000000 		movl	$0, %ecx
 1068      00
 1069              	.LVL142:
 193:lib_convert.cpp ****     uint32_t pow = 1;
 1070              		.loc 1 193 14 view .LVU367
 1071 0481 EB25     		jmp	.L105
 1072              	.LVL143:
GAS LISTING /tmp/cceaV4lG.s 			page 35


 1073              	.L107:
 194:lib_convert.cpp ****     uint8_t i;
 1074              		.loc 1 194 14 view .LVU368
 1075 0483 BA010000 		movl	$1, %edx
 1075      00
 1076              	.LVL144:
 194:lib_convert.cpp ****     uint8_t i;
 1077              		.loc 1 194 14 view .LVU369
 1078 0488 EBEE     		jmp	.L99
 1079              	.LVL145:
 1080              	.L102:
 206:lib_convert.cpp ****             // a - f
 1081              		.loc 1 206 16 is_stmt 1 view .LVU370
 206:lib_convert.cpp ****             // a - f
 1082              		.loc 1 206 34 is_stmt 0 view .LVU371
 1083 048a 8D589F   		leal	-97(%rax), %ebx
 206:lib_convert.cpp ****             // a - f
 1084              		.loc 1 206 16 view .LVU372
 1085 048d 80FB05   		cmpb	$5, %bl
 1086 0490 7733     		ja	.L104
 208:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 1087              		.loc 1 208 13 is_stmt 1 view .LVU373
 208:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 1088              		.loc 1 208 26 is_stmt 0 view .LVU374
 1089 0492 0FBEC0   		movsbl	%al, %eax
 208:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 1090              		.loc 1 208 28 view .LVU375
 1091 0495 83E857   		subl	$87, %eax
 208:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 1092              		.loc 1 208 34 view .LVU376
 1093 0498 0FAFC2   		imull	%edx, %eax
 208:lib_convert.cpp ****         } else if ((str[i] > 64) && (str[i] < 71)) {
 1094              		.loc 1 208 17 view .LVU377
 1095 049b 01C1     		addl	%eax, %ecx
 1096              	.LVL146:
 1097              	.L103:
 213:lib_convert.cpp ****     }
 1098              		.loc 1 213 9 is_stmt 1 discriminator 2 view .LVU378
 213:lib_convert.cpp ****     }
 1099              		.loc 1 213 13 is_stmt 0 discriminator 2 view .LVU379
 1100 049d C1EA04   		shrl	$4, %edx
 1101              	.LVL147:
 202:lib_convert.cpp ****         if ((str[i] > 47) && (str[i] < 58)) {
 1102              		.loc 1 202 5 is_stmt 1 discriminator 2 view .LVU380
 1103 04a0 83C601   		addl	$1, %esi
 1104              	.LVL148:
 202:lib_convert.cpp ****         if ((str[i] > 47) && (str[i] < 58)) {
 1105              		.loc 1 202 22 discriminator 2 view .LVU381
 1106 04a3 4138F3   		cmpb	%sil, %r11b
 1107 04a6 7237     		jb	.L101
 1108              	.LVL149:
 1109              	.L105:
 203:lib_convert.cpp ****             // 0 - 9
 1110              		.loc 1 203 9 view .LVU382
 203:lib_convert.cpp ****             // 0 - 9
 1111              		.loc 1 203 18 is_stmt 0 view .LVU383
 1112 04a8 400FB6C6 		movzbl	%sil, %eax
GAS LISTING /tmp/cceaV4lG.s 			page 36


 203:lib_convert.cpp ****             // 0 - 9
 1113              		.loc 1 203 19 view .LVU384
 1114 04ac 0FB60407 		movzbl	(%rdi,%rax), %eax
 203:lib_convert.cpp ****             // 0 - 9
 1115              		.loc 1 203 27 view .LVU385
 1116 04b0 8D58D0   		leal	-48(%rax), %ebx
 203:lib_convert.cpp ****             // 0 - 9
 1117              		.loc 1 203 9 view .LVU386
 1118 04b3 80FB09   		cmpb	$9, %bl
 1119 04b6 77D2     		ja	.L102
 205:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 1120              		.loc 1 205 13 is_stmt 1 view .LVU387
 205:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 1121              		.loc 1 205 26 is_stmt 0 view .LVU388
 1122 04b8 0FBEC0   		movsbl	%al, %eax
 205:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 1123              		.loc 1 205 28 view .LVU389
 1124 04bb 83E830   		subl	$48, %eax
 205:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 1125              		.loc 1 205 34 view .LVU390
 1126 04be 0FAFC2   		imull	%edx, %eax
 205:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 1127              		.loc 1 205 17 view .LVU391
 1128 04c1 01C1     		addl	%eax, %ecx
 1129              	.LVL150:
 205:lib_convert.cpp ****         } else if ((str[i] > 96) && (str[i] < 103)) {
 1130              		.loc 1 205 17 view .LVU392
 1131 04c3 EBD8     		jmp	.L103
 1132              	.L104:
 209:lib_convert.cpp ****             // A - F
 1133              		.loc 1 209 16 is_stmt 1 view .LVU393
 209:lib_convert.cpp ****             // A - F
 1134              		.loc 1 209 34 is_stmt 0 view .LVU394
 1135 04c5 8D58BF   		leal	-65(%rax), %ebx
 209:lib_convert.cpp ****             // A - F
 1136              		.loc 1 209 16 view .LVU395
 1137 04c8 80FB05   		cmpb	$5, %bl
 1138 04cb 77D0     		ja	.L103
 211:lib_convert.cpp ****         }
 1139              		.loc 1 211 13 is_stmt 1 view .LVU396
 211:lib_convert.cpp ****         }
 1140              		.loc 1 211 26 is_stmt 0 view .LVU397
 1141 04cd 0FBEC0   		movsbl	%al, %eax
 211:lib_convert.cpp ****         }
 1142              		.loc 1 211 28 view .LVU398
 1143 04d0 83E837   		subl	$55, %eax
 211:lib_convert.cpp ****         }
 1144              		.loc 1 211 34 view .LVU399
 1145 04d3 0FAFC2   		imull	%edx, %eax
 211:lib_convert.cpp ****         }
 1146              		.loc 1 211 17 view .LVU400
 1147 04d6 01C1     		addl	%eax, %ecx
 1148              	.LVL151:
 211:lib_convert.cpp ****         }
 1149              		.loc 1 211 17 view .LVU401
 1150 04d8 EBC3     		jmp	.L103
 1151              	.LVL152:
GAS LISTING /tmp/cceaV4lG.s 			page 37


 1152              	.L108:
 193:lib_convert.cpp ****     uint32_t pow = 1;
 1153              		.loc 1 193 14 view .LVU402
 1154 04da B9000000 		movl	$0, %ecx
 1154      00
 1155              	.LVL153:
 1156              	.L101:
 216:lib_convert.cpp ****         *out = val;
 1157              		.loc 1 216 5 is_stmt 1 view .LVU403
 1158 04df 4439C1   		cmpl	%r8d, %ecx
 1159 04e2 720F     		jb	.L109
 1160 04e4 4139C9   		cmpl	%ecx, %r9d
 1161 04e7 720A     		jb	.L109
 217:lib_convert.cpp ****         return EXIT_SUCCESS;
 1162              		.loc 1 217 9 view .LVU404
 217:lib_convert.cpp ****         return EXIT_SUCCESS;
 1163              		.loc 1 217 14 is_stmt 0 view .LVU405
 1164 04e9 41890A   		movl	%ecx, (%r10)
 218:lib_convert.cpp ****     } else {
 1165              		.loc 1 218 9 is_stmt 1 view .LVU406
 218:lib_convert.cpp ****     } else {
 1166              		.loc 1 218 16 is_stmt 0 view .LVU407
 1167 04ec B8000000 		movl	$0, %eax
 1167      00
 1168              	.L98:
 222:lib_convert.cpp **** 
 1169              		.loc 1 222 1 view .LVU408
 1170 04f1 5B       		popq	%rbx
 1171              		.cfi_remember_state
 1172              		.cfi_def_cfa_offset 8
 1173 04f2 C3       		ret
 1174              	.L109:
 1175              		.cfi_restore_state
 220:lib_convert.cpp ****     }
 1176              		.loc 1 220 16 view .LVU409
 1177 04f3 B8010000 		movl	$1, %eax
 1177      00
 1178 04f8 EBF7     		jmp	.L98
 1179              		.cfi_endproc
 1180              	.LFE60:
 1181              		.size	hstr_to_uint32, .-hstr_to_uint32
 1182              		.globl	_utoh
 1183              		.type	_utoh, @function
 1184              	_utoh:
 1185              	.LVL154:
 1186              	.LFB61:
 230:lib_convert.cpp ****     char *p = buf + (CONV_BASE_16_BUF_SZ - 1);   // the very end of the buffer
 1187              		.loc 1 230 1 is_stmt 1 view -0
 1188              		.cfi_startproc
 231:lib_convert.cpp ****     uint32_t m = val;
 1189              		.loc 1 231 5 view .LVU411
 232:lib_convert.cpp ****     uint8_t i = 0;
 1190              		.loc 1 232 5 view .LVU412
 233:lib_convert.cpp **** 
 1191              		.loc 1 233 5 view .LVU413
 235:lib_convert.cpp **** 
 1192              		.loc 1 235 5 view .LVU414
GAS LISTING /tmp/cceaV4lG.s 			page 38


 235:lib_convert.cpp **** 
 1193              		.loc 1 235 8 is_stmt 0 view .LVU415
 1194 04fa C6470B00 		movb	$0, 11(%rdi)
 237:lib_convert.cpp ****         p -= 1;
 1195              		.loc 1 237 5 is_stmt 1 view .LVU416
 231:lib_convert.cpp ****     uint32_t m = val;
 1196              		.loc 1 231 11 is_stmt 0 view .LVU417
 1197 04fe 4C8D470B 		leaq	11(%rdi), %r8
 1198              	.LVL155:
 237:lib_convert.cpp ****         p -= 1;
 1199              		.loc 1 237 5 view .LVU418
 1200 0502 85F6     		testl	%esi, %esi
 1201 0504 740C     		je	.L118
 1202              	.L115:
 230:lib_convert.cpp ****     char *p = buf + (CONV_BASE_16_BUF_SZ - 1);   // the very end of the buffer
 1203              		.loc 1 230 1 view .LVU419
 1204 0506 4C89C0   		movq	%r8, %rax
 1205              	.LBB34:
 1206              	.LBB35:
 1207              		.file 2 "/usr/include/bits/string_fortified.h"
   1:/usr/include/bits/string_fortified.h **** /* Copyright (C) 2004-2022 Free Software Foundation, Inc.
   2:/usr/include/bits/string_fortified.h ****    This file is part of the GNU C Library.
   3:/usr/include/bits/string_fortified.h **** 
   4:/usr/include/bits/string_fortified.h ****    The GNU C Library is free software; you can redistribute it and/or
   5:/usr/include/bits/string_fortified.h ****    modify it under the terms of the GNU Lesser General Public
   6:/usr/include/bits/string_fortified.h ****    License as published by the Free Software Foundation; either
   7:/usr/include/bits/string_fortified.h ****    version 2.1 of the License, or (at your option) any later version.
   8:/usr/include/bits/string_fortified.h **** 
   9:/usr/include/bits/string_fortified.h ****    The GNU C Library is distributed in the hope that it will be useful,
  10:/usr/include/bits/string_fortified.h ****    but WITHOUT ANY WARRANTY; without even the implied warranty of
  11:/usr/include/bits/string_fortified.h ****    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  12:/usr/include/bits/string_fortified.h ****    Lesser General Public License for more details.
  13:/usr/include/bits/string_fortified.h **** 
  14:/usr/include/bits/string_fortified.h ****    You should have received a copy of the GNU Lesser General Public
  15:/usr/include/bits/string_fortified.h ****    License along with the GNU C Library; if not, see
  16:/usr/include/bits/string_fortified.h ****    <https://www.gnu.org/licenses/>.  */
  17:/usr/include/bits/string_fortified.h **** 
  18:/usr/include/bits/string_fortified.h **** #ifndef _BITS_STRING_FORTIFIED_H
  19:/usr/include/bits/string_fortified.h **** #define _BITS_STRING_FORTIFIED_H 1
  20:/usr/include/bits/string_fortified.h **** 
  21:/usr/include/bits/string_fortified.h **** #ifndef _STRING_H
  22:/usr/include/bits/string_fortified.h **** # error "Never use <bits/string_fortified.h> directly; include <string.h> instead."
  23:/usr/include/bits/string_fortified.h **** #endif
  24:/usr/include/bits/string_fortified.h **** 
  25:/usr/include/bits/string_fortified.h **** __fortify_function void *
  26:/usr/include/bits/string_fortified.h **** __NTH (memcpy (void *__restrict __dest, const void *__restrict __src,
  27:/usr/include/bits/string_fortified.h **** 	       size_t __len))
  28:/usr/include/bits/string_fortified.h **** {
  29:/usr/include/bits/string_fortified.h ****   return __builtin___memcpy_chk (__dest, __src, __len,
 1208              		.loc 2 29 33 view .LVU420
 1209 0509 488D0D00 		leaq	_ZL9hex_ascii(%rip), %rcx
 1209      000000
 1210 0510 EB1C     		jmp	.L116
 1211              	.L118:
 1212              		.loc 2 29 33 view .LVU421
 1213              	.LBE35:
 1214              	.LBE34:
GAS LISTING /tmp/cceaV4lG.s 			page 39


 238:lib_convert.cpp ****         memcpy(p, &hex_ascii[0], sizeof(uint8_t));
 1215              		.loc 1 238 9 is_stmt 1 view .LVU422
 238:lib_convert.cpp ****         memcpy(p, &hex_ascii[0], sizeof(uint8_t));
 1216              		.loc 1 238 11 is_stmt 0 view .LVU423
 1217 0512 4C8D470A 		leaq	10(%rdi), %r8
 1218              	.LVL156:
 239:lib_convert.cpp ****     }
 1219              		.loc 1 239 9 is_stmt 1 view .LVU424
 1220              	.LBB38:
 1221              	.LBI38:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1222              		.loc 2 26 1 view .LVU425
 1223              	.LBB39:
 1224              		.loc 2 29 3 view .LVU426
 1225              		.loc 2 29 33 is_stmt 0 view .LVU427
 1226 0516 C6470A30 		movb	$48, 10(%rdi)
  30:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1227              		.loc 2 30 31 view .LVU428
 1228 051a EBEA     		jmp	.L115
 1229              	.LVL157:
 1230              	.L117:
 1231              		.loc 2 30 31 view .LVU429
 1232              	.LBE39:
 1233              	.LBE38:
 243:lib_convert.cpp ****         memcpy(p, &hex_ascii[m & 0xf], sizeof(uint8_t));
 1234              		.loc 1 243 9 is_stmt 1 view .LVU430
 243:lib_convert.cpp ****         memcpy(p, &hex_ascii[m & 0xf], sizeof(uint8_t));
 1235              		.loc 1 243 11 is_stmt 0 view .LVU431
 1236 051c 4883E801 		subq	$1, %rax
 1237              	.LVL158:
 244:lib_convert.cpp ****         m >>= 4;
 1238              		.loc 1 244 9 is_stmt 1 view .LVU432
 1239              	.LBB40:
 1240              	.LBI34:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1241              		.loc 2 26 1 view .LVU433
 1242              	.LBB36:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1243              		.loc 2 29 3 view .LVU434
 1244              	.LBE36:
 1245              	.LBE40:
 244:lib_convert.cpp ****         m >>= 4;
 1246              		.loc 1 244 19 is_stmt 0 view .LVU435
 1247 0520 89F2     		movl	%esi, %edx
 1248 0522 83E20F   		andl	$15, %edx
 1249              	.LBB41:
 1250              	.LBB37:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1251              		.loc 2 29 33 view .LVU436
 1252 0525 0FB61451 		movzbl	(%rcx,%rdx,2), %edx
 1253 0529 8810     		movb	%dl, (%rax)
 1254              	.LVL159:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1255              		.loc 2 29 33 view .LVU437
 1256              	.LBE37:
 1257              	.LBE41:
 245:lib_convert.cpp ****         i++;
GAS LISTING /tmp/cceaV4lG.s 			page 40


 1258              		.loc 1 245 9 is_stmt 1 view .LVU438
 245:lib_convert.cpp ****         i++;
 1259              		.loc 1 245 11 is_stmt 0 view .LVU439
 1260 052b C1EE04   		shrl	$4, %esi
 1261              	.LVL160:
 246:lib_convert.cpp ****     }
 1262              		.loc 1 246 9 is_stmt 1 view .LVU440
 1263              	.L116:
 242:lib_convert.cpp ****         p -= 1;
 1264              		.loc 1 242 18 view .LVU441
 1265 052e 85F6     		testl	%esi, %esi
 1266 0530 75EA     		jne	.L117
 1267              	.LVL161:
 242:lib_convert.cpp ****         p -= 1;
 1268              		.loc 1 242 18 is_stmt 0 discriminator 1 view .LVU442
 1269 0532 4489C2   		movl	%r8d, %edx
 1270 0535 29C2     		subl	%eax, %edx
 1271 0537 F6C201   		testb	$1, %dl
 1272 053a 75E0     		jne	.L117
 249:lib_convert.cpp ****     memcpy(p, "0x", sizeof(uint16_t));
 1273              		.loc 1 249 5 is_stmt 1 view .LVU443
 249:lib_convert.cpp ****     memcpy(p, "0x", sizeof(uint16_t));
 1274              		.loc 1 249 7 is_stmt 0 view .LVU444
 1275 053c 488D50FE 		leaq	-2(%rax), %rdx
 1276              	.LVL162:
 250:lib_convert.cpp **** 
 1277              		.loc 1 250 5 is_stmt 1 view .LVU445
 1278              	.LBB42:
 1279              	.LBI42:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1280              		.loc 2 26 1 view .LVU446
 1281              	.LBB43:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1282              		.loc 2 29 3 view .LVU447
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1283              		.loc 2 29 33 is_stmt 0 view .LVU448
 1284 0540 66C740FE 		movw	$30768, -2(%rax)
 1284      3078
 1285              	.LVL163:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1286              		.loc 2 29 33 view .LVU449
 1287              	.LBE43:
 1288              	.LBE42:
 252:lib_convert.cpp **** }
 1289              		.loc 1 252 5 is_stmt 1 view .LVU450
 253:lib_convert.cpp **** 
 1290              		.loc 1 253 1 is_stmt 0 view .LVU451
 1291 0546 4889D0   		movq	%rdx, %rax
 1292              	.LVL164:
 253:lib_convert.cpp **** 
 1293              		.loc 1 253 1 view .LVU452
 1294 0549 C3       		ret
 1295              		.cfi_endproc
 1296              	.LFE61:
 1297              		.size	_utoh, .-_utoh
 1298              		.globl	_utoh8
 1299              		.type	_utoh8, @function
GAS LISTING /tmp/cceaV4lG.s 			page 41


 1300              	_utoh8:
 1301              	.LVL165:
 1302              	.LFB62:
 256:lib_convert.cpp ****     char *p = buf + (CONV_BASE_16_BUF_SZ - 1);   // the very end of the buffer
 1303              		.loc 1 256 1 is_stmt 1 view -0
 1304              		.cfi_startproc
 257:lib_convert.cpp ****     uint32_t m = val;
 1305              		.loc 1 257 5 view .LVU454
 258:lib_convert.cpp ****     uint8_t i = 0;
 1306              		.loc 1 258 5 view .LVU455
 259:lib_convert.cpp **** 
 1307              		.loc 1 259 5 view .LVU456
 261:lib_convert.cpp **** 
 1308              		.loc 1 261 5 view .LVU457
 261:lib_convert.cpp **** 
 1309              		.loc 1 261 8 is_stmt 0 view .LVU458
 1310 054a C6470B00 		movb	$0, 11(%rdi)
 263:lib_convert.cpp ****         p -= 2;
 1311              		.loc 1 263 5 is_stmt 1 view .LVU459
 257:lib_convert.cpp ****     uint32_t m = val;
 1312              		.loc 1 257 11 is_stmt 0 view .LVU460
 1313 054e 4C8D470B 		leaq	11(%rdi), %r8
 1314              	.LVL166:
 263:lib_convert.cpp ****         p -= 2;
 1315              		.loc 1 263 5 view .LVU461
 1316 0552 85F6     		testl	%esi, %esi
 1317 0554 740C     		je	.L124
 1318              	.L121:
 256:lib_convert.cpp ****     char *p = buf + (CONV_BASE_16_BUF_SZ - 1);   // the very end of the buffer
 1319              		.loc 1 256 1 view .LVU462
 1320 0556 4C89C0   		movq	%r8, %rax
 1321              	.LBB44:
 1322              	.LBB45:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1323              		.loc 2 29 33 view .LVU463
 1324 0559 488D0D00 		leaq	_ZL9hex_ascii(%rip), %rcx
 1324      000000
 1325 0560 EB20     		jmp	.L122
 1326              	.L124:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1327              		.loc 2 29 33 view .LVU464
 1328              	.LBE45:
 1329              	.LBE44:
 264:lib_convert.cpp ****         memcpy(p, &hex_ascii[0], sizeof(uint8_t));
 1330              		.loc 1 264 9 is_stmt 1 view .LVU465
 264:lib_convert.cpp ****         memcpy(p, &hex_ascii[0], sizeof(uint8_t));
 1331              		.loc 1 264 11 is_stmt 0 view .LVU466
 1332 0562 4C8D4709 		leaq	9(%rdi), %r8
 1333              	.LVL167:
 265:lib_convert.cpp ****         memcpy(p + 1, &hex_ascii[0], sizeof(uint8_t));
 1334              		.loc 1 265 9 is_stmt 1 view .LVU467
 1335              	.LBB48:
 1336              	.LBI48:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1337              		.loc 2 26 1 view .LVU468
 1338              	.LBB49:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
GAS LISTING /tmp/cceaV4lG.s 			page 42


 1339              		.loc 2 29 3 view .LVU469
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1340              		.loc 2 29 33 is_stmt 0 view .LVU470
 1341 0566 C6470930 		movb	$48, 9(%rdi)
 1342              	.LVL168:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1343              		.loc 2 29 33 view .LVU471
 1344              	.LBE49:
 1345              	.LBE48:
 266:lib_convert.cpp ****     }
 1346              		.loc 1 266 9 is_stmt 1 view .LVU472
 1347              	.LBB50:
 1348              	.LBI50:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1349              		.loc 2 26 1 view .LVU473
 1350              	.LBB51:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1351              		.loc 2 29 3 view .LVU474
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1352              		.loc 2 29 33 is_stmt 0 view .LVU475
 1353 056a C6470A30 		movb	$48, 10(%rdi)
 1354              		.loc 2 30 31 view .LVU476
 1355 056e EBE6     		jmp	.L121
 1356              	.LVL169:
 1357              	.L123:
 1358              		.loc 2 30 31 view .LVU477
 1359              	.LBE51:
 1360              	.LBE50:
 270:lib_convert.cpp ****         memcpy(p, &hex_ascii[m & 0xf], sizeof(uint8_t));
 1361              		.loc 1 270 9 is_stmt 1 view .LVU478
 270:lib_convert.cpp ****         memcpy(p, &hex_ascii[m & 0xf], sizeof(uint8_t));
 1362              		.loc 1 270 11 is_stmt 0 view .LVU479
 1363 0570 4883E801 		subq	$1, %rax
 1364              	.LVL170:
 271:lib_convert.cpp ****         m >>= 4;
 1365              		.loc 1 271 9 is_stmt 1 view .LVU480
 1366              	.LBB52:
 1367              	.LBI44:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1368              		.loc 2 26 1 view .LVU481
 1369              	.LBB46:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1370              		.loc 2 29 3 view .LVU482
 1371              	.LBE46:
 1372              	.LBE52:
 271:lib_convert.cpp ****         m >>= 4;
 1373              		.loc 1 271 19 is_stmt 0 view .LVU483
 1374 0574 89F2     		movl	%esi, %edx
 1375 0576 83E20F   		andl	$15, %edx
 1376              	.LBB53:
 1377              	.LBB47:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1378              		.loc 2 29 33 view .LVU484
 1379 0579 0FB61451 		movzbl	(%rcx,%rdx,2), %edx
 1380 057d 8810     		movb	%dl, (%rax)
 1381              	.LVL171:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
GAS LISTING /tmp/cceaV4lG.s 			page 43


 1382              		.loc 2 29 33 view .LVU485
 1383              	.LBE47:
 1384              	.LBE53:
 272:lib_convert.cpp ****         i++;
 1385              		.loc 1 272 9 is_stmt 1 view .LVU486
 272:lib_convert.cpp ****         i++;
 1386              		.loc 1 272 11 is_stmt 0 view .LVU487
 1387 057f C1EE04   		shrl	$4, %esi
 1388              	.LVL172:
 273:lib_convert.cpp ****     }
 1389              		.loc 1 273 9 is_stmt 1 view .LVU488
 1390              	.L122:
 269:lib_convert.cpp ****         p -= 1;
 1391              		.loc 1 269 18 view .LVU489
 1392 0582 85F6     		testl	%esi, %esi
 1393 0584 75EA     		jne	.L123
 1394              	.LVL173:
 269:lib_convert.cpp ****         p -= 1;
 1395              		.loc 1 269 18 is_stmt 0 discriminator 1 view .LVU490
 1396 0586 4489C2   		movl	%r8d, %edx
 1397 0589 29C2     		subl	%eax, %edx
 1398 058b F6C201   		testb	$1, %dl
 1399 058e 75E0     		jne	.L123
 276:lib_convert.cpp **** }
 1400              		.loc 1 276 5 is_stmt 1 view .LVU491
 277:lib_convert.cpp **** 
 1401              		.loc 1 277 1 is_stmt 0 view .LVU492
 1402 0590 C3       		ret
 1403              		.cfi_endproc
 1404              	.LFE62:
 1405              		.size	_utoh8, .-_utoh8
 1406              		.globl	_utoh16
 1407              		.type	_utoh16, @function
 1408              	_utoh16:
 1409              	.LVL174:
 1410              	.LFB63:
 280:lib_convert.cpp ****     char *p = buf + (CONV_BASE_16_BUF_SZ - 1);   // the very end of the buffer
 1411              		.loc 1 280 1 is_stmt 1 view -0
 1412              		.cfi_startproc
 281:lib_convert.cpp ****     uint32_t m = val;
 1413              		.loc 1 281 5 view .LVU494
 281:lib_convert.cpp ****     uint32_t m = val;
 1414              		.loc 1 281 11 is_stmt 0 view .LVU495
 1415 0591 488D4F0B 		leaq	11(%rdi), %rcx
 1416              	.LVL175:
 282:lib_convert.cpp ****     uint8_t i = 0;
 1417              		.loc 1 282 5 is_stmt 1 view .LVU496
 283:lib_convert.cpp **** 
 1418              		.loc 1 283 5 view .LVU497
 285:lib_convert.cpp **** 
 1419              		.loc 1 285 5 view .LVU498
 285:lib_convert.cpp **** 
 1420              		.loc 1 285 8 is_stmt 0 view .LVU499
 1421 0595 C6470B00 		movb	$0, 11(%rdi)
 287:lib_convert.cpp ****         p -= 4;
 1422              		.loc 1 287 5 is_stmt 1 view .LVU500
 282:lib_convert.cpp ****     uint8_t i = 0;
GAS LISTING /tmp/cceaV4lG.s 			page 44


 1423              		.loc 1 282 14 is_stmt 0 view .LVU501
 1424 0599 89F0     		movl	%esi, %eax
 283:lib_convert.cpp **** 
 1425              		.loc 1 283 13 view .LVU502
 1426 059b BA000000 		movl	$0, %edx
 1426      00
 1427              	.LBB54:
 1428              	.LBB55:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1429              		.loc 2 29 33 view .LVU503
 1430 05a0 4C8D0D00 		leaq	_ZL9hex_ascii(%rip), %r9
 1430      000000
 1431              	.LBE55:
 1432              	.LBE54:
 287:lib_convert.cpp ****         p -= 4;
 1433              		.loc 1 287 5 view .LVU504
 1434 05a7 85F6     		testl	%esi, %esi
 1435 05a9 742B     		je	.L131
 1436              	.LVL176:
 1437              	.L126:
 297:lib_convert.cpp ****         memcpy(p, &hex_ascii[m & 0xf], sizeof(uint8_t));
 1438              		.loc 1 297 9 is_stmt 1 view .LVU505
 297:lib_convert.cpp ****         memcpy(p, &hex_ascii[m & 0xf], sizeof(uint8_t));
 1439              		.loc 1 297 11 is_stmt 0 view .LVU506
 1440 05ab 4C8D41FF 		leaq	-1(%rcx), %r8
 1441              	.LVL177:
 298:lib_convert.cpp ****         m >>= 4;
 1442              		.loc 1 298 9 is_stmt 1 view .LVU507
 1443              	.LBB58:
 1444              	.LBI54:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1445              		.loc 2 26 1 view .LVU508
 1446              	.LBB56:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1447              		.loc 2 29 3 view .LVU509
 1448              	.LBE56:
 1449              	.LBE58:
 298:lib_convert.cpp ****         m >>= 4;
 1450              		.loc 1 298 19 is_stmt 0 view .LVU510
 1451 05af 89C7     		movl	%eax, %edi
 1452 05b1 83E70F   		andl	$15, %edi
 1453              	.LBB59:
 1454              	.LBB57:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1455              		.loc 2 29 33 view .LVU511
 1456 05b4 410FB63C 		movzbl	(%r9,%rdi,2), %edi
 1456      79
 1457 05b9 408879FF 		movb	%dil, -1(%rcx)
 1458              	.LVL178:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1459              		.loc 2 29 33 view .LVU512
 1460              	.LBE57:
 1461              	.LBE59:
 299:lib_convert.cpp ****         i++;
 1462              		.loc 1 299 9 is_stmt 1 view .LVU513
 300:lib_convert.cpp ****     }
 1463              		.loc 1 300 9 view .LVU514
GAS LISTING /tmp/cceaV4lG.s 			page 45


 300:lib_convert.cpp ****     }
 1464              		.loc 1 300 10 is_stmt 0 view .LVU515
 1465 05bd 83C201   		addl	$1, %edx
 1466              	.LVL179:
 296:lib_convert.cpp ****         p -= 1;
 1467              		.loc 1 296 18 is_stmt 1 view .LVU516
 1468 05c0 C1E804   		shrl	$4, %eax
 1469              	.LVL180:
 296:lib_convert.cpp ****         p -= 1;
 1470              		.loc 1 296 18 is_stmt 0 view .LVU517
 1471 05c3 7527     		jne	.L128
 296:lib_convert.cpp ****         p -= 1;
 1472              		.loc 1 296 18 discriminator 1 view .LVU518
 1473 05c5 F6C201   		testb	$1, %dl
 1474 05c8 7522     		jne	.L128
 303:lib_convert.cpp ****         p -= 2;
 1475              		.loc 1 303 5 is_stmt 1 view .LVU519
 1476 05ca 81FEFF00 		cmpl	$255, %esi
 1476      0000
 1477 05d0 761F     		jbe	.L132
 1478              	.LVL181:
 1479              	.L125:
 310:lib_convert.cpp **** 
 1480              		.loc 1 310 1 is_stmt 0 view .LVU520
 1481 05d2 4C89C0   		movq	%r8, %rax
 1482              	.LVL182:
 310:lib_convert.cpp **** 
 1483              		.loc 1 310 1 view .LVU521
 1484 05d5 C3       		ret
 1485              	.LVL183:
 1486              	.L131:
 288:lib_convert.cpp ****         memcpy(p, &hex_ascii[0], sizeof(uint8_t));
 1487              		.loc 1 288 9 is_stmt 1 view .LVU522
 288:lib_convert.cpp ****         memcpy(p, &hex_ascii[0], sizeof(uint8_t));
 1488              		.loc 1 288 11 is_stmt 0 view .LVU523
 1489 05d6 4C8D4707 		leaq	7(%rdi), %r8
 1490              	.LVL184:
 289:lib_convert.cpp ****         memcpy(p + 1, &hex_ascii[0], sizeof(uint8_t));
 1491              		.loc 1 289 9 is_stmt 1 view .LVU524
 1492              	.LBB60:
 1493              	.LBI60:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1494              		.loc 2 26 1 view .LVU525
 1495              	.LBB61:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1496              		.loc 2 29 3 view .LVU526
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1497              		.loc 2 29 33 is_stmt 0 view .LVU527
 1498 05da C6470730 		movb	$48, 7(%rdi)
 1499              	.LVL185:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1500              		.loc 2 29 33 view .LVU528
 1501              	.LBE61:
 1502              	.LBE60:
 290:lib_convert.cpp ****         memcpy(p + 2, &hex_ascii[0], sizeof(uint8_t));
 1503              		.loc 1 290 9 is_stmt 1 view .LVU529
 1504              	.LBB62:
GAS LISTING /tmp/cceaV4lG.s 			page 46


 1505              	.LBI62:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1506              		.loc 2 26 1 view .LVU530
 1507              	.LBB63:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1508              		.loc 2 29 3 view .LVU531
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1509              		.loc 2 29 33 is_stmt 0 view .LVU532
 1510 05de C6470830 		movb	$48, 8(%rdi)
 1511              	.LVL186:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1512              		.loc 2 29 33 view .LVU533
 1513              	.LBE63:
 1514              	.LBE62:
 291:lib_convert.cpp ****         memcpy(p + 3, &hex_ascii[0], sizeof(uint8_t));
 1515              		.loc 1 291 9 is_stmt 1 view .LVU534
 1516              	.LBB64:
 1517              	.LBI64:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1518              		.loc 2 26 1 view .LVU535
 1519              	.LBB65:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1520              		.loc 2 29 3 view .LVU536
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1521              		.loc 2 29 33 is_stmt 0 view .LVU537
 1522 05e2 C6470930 		movb	$48, 9(%rdi)
 1523              	.LVL187:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1524              		.loc 2 29 33 view .LVU538
 1525              	.LBE65:
 1526              	.LBE64:
 292:lib_convert.cpp ****         return p;
 1527              		.loc 1 292 9 is_stmt 1 view .LVU539
 1528              	.LBB66:
 1529              	.LBI66:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1530              		.loc 2 26 1 view .LVU540
 1531              	.LBB67:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1532              		.loc 2 29 3 view .LVU541
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1533              		.loc 2 29 33 is_stmt 0 view .LVU542
 1534 05e6 C6470A30 		movb	$48, 10(%rdi)
 1535              	.LVL188:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1536              		.loc 2 29 33 view .LVU543
 1537              	.LBE67:
 1538              	.LBE66:
 293:lib_convert.cpp ****     }
 1539              		.loc 1 293 9 is_stmt 1 view .LVU544
 293:lib_convert.cpp ****     }
 1540              		.loc 1 293 16 is_stmt 0 view .LVU545
 1541 05ea EBE6     		jmp	.L125
 1542              	.LVL189:
 1543              	.L128:
 280:lib_convert.cpp ****     char *p = buf + (CONV_BASE_16_BUF_SZ - 1);   // the very end of the buffer
 1544              		.loc 1 280 1 view .LVU546
GAS LISTING /tmp/cceaV4lG.s 			page 47


 1545 05ec 4C89C1   		movq	%r8, %rcx
 1546 05ef EBBA     		jmp	.L126
 1547              	.L132:
 304:lib_convert.cpp ****         memcpy(p, &hex_ascii[0], sizeof(uint8_t));
 1548              		.loc 1 304 9 is_stmt 1 view .LVU547
 1549              	.LVL190:
 305:lib_convert.cpp ****         memcpy(p + 1, &hex_ascii[0], sizeof(uint8_t));
 1550              		.loc 1 305 9 view .LVU548
 1551              	.LBB68:
 1552              	.LBI68:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1553              		.loc 2 26 1 view .LVU549
 1554              	.LBB69:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1555              		.loc 2 29 3 view .LVU550
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1556              		.loc 2 29 33 is_stmt 0 view .LVU551
 1557 05f1 41C640FE 		movb	$48, -2(%r8)
 1557      30
 1558              	.LVL191:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1559              		.loc 2 29 33 view .LVU552
 1560              	.LBE69:
 1561              	.LBE68:
 306:lib_convert.cpp ****     }
 1562              		.loc 1 306 9 is_stmt 1 view .LVU553
 1563              	.LBB70:
 1564              	.LBI70:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1565              		.loc 2 26 1 view .LVU554
 1566              	.LBB71:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1567              		.loc 2 29 3 view .LVU555
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1568              		.loc 2 29 33 is_stmt 0 view .LVU556
 1569 05f6 41C640FF 		movb	$48, -1(%r8)
 1569      30
 1570              	.LBE71:
 1571              	.LBE70:
 304:lib_convert.cpp ****         memcpy(p, &hex_ascii[0], sizeof(uint8_t));
 1572              		.loc 1 304 11 view .LVU557
 1573 05fb 4C8D41FD 		leaq	-3(%rcx), %r8
 1574              	.LVL192:
 1575              	.LBB73:
 1576              	.LBB72:
 1577              		.loc 2 30 31 view .LVU558
 1578 05ff EBD1     		jmp	.L125
 1579              	.LBE72:
 1580              	.LBE73:
 1581              		.cfi_endproc
 1582              	.LFE63:
 1583              		.size	_utoh16, .-_utoh16
 1584              		.globl	_utoh32
 1585              		.type	_utoh32, @function
 1586              	_utoh32:
 1587              	.LVL193:
 1588              	.LFB64:
GAS LISTING /tmp/cceaV4lG.s 			page 48


 313:lib_convert.cpp ****     char *p = buf + (CONV_BASE_16_BUF_SZ - 1);     // the very end of the buffer
 1589              		.loc 1 313 1 is_stmt 1 view -0
 1590              		.cfi_startproc
 314:lib_convert.cpp ****     uint32_t m = val;
 1591              		.loc 1 314 5 view .LVU560
 314:lib_convert.cpp ****     uint32_t m = val;
 1592              		.loc 1 314 11 is_stmt 0 view .LVU561
 1593 0601 488D570B 		leaq	11(%rdi), %rdx
 1594              	.LVL194:
 315:lib_convert.cpp ****     uint8_t i = 0;
 1595              		.loc 1 315 5 is_stmt 1 view .LVU562
 316:lib_convert.cpp **** 
 1596              		.loc 1 316 5 view .LVU563
 318:lib_convert.cpp **** 
 1597              		.loc 1 318 5 view .LVU564
 318:lib_convert.cpp **** 
 1598              		.loc 1 318 8 is_stmt 0 view .LVU565
 1599 0605 C6470B00 		movb	$0, 11(%rdi)
 320:lib_convert.cpp ****     for (i=0;i<8;i++) {
 1600              		.loc 1 320 5 is_stmt 1 view .LVU566
 320:lib_convert.cpp ****     for (i=0;i<8;i++) {
 1601              		.loc 1 320 7 is_stmt 0 view .LVU567
 1602 0609 4883C703 		addq	$3, %rdi
 1603              	.LVL195:
 321:lib_convert.cpp ****         *(p + i) = 0x30;
 1604              		.loc 1 321 5 is_stmt 1 view .LVU568
 321:lib_convert.cpp ****         *(p + i) = 0x30;
 1605              		.loc 1 321 15 view .LVU569
 1606 060d 4889F8   		movq	%rdi, %rax
 1607              	.LVL196:
 1608              	.L134:
 322:lib_convert.cpp ****     }
 1609              		.loc 1 322 9 discriminator 3 view .LVU570
 322:lib_convert.cpp ****     }
 1610              		.loc 1 322 18 is_stmt 0 discriminator 3 view .LVU571
 1611 0610 C60030   		movb	$48, (%rax)
 321:lib_convert.cpp ****         *(p + i) = 0x30;
 1612              		.loc 1 321 5 is_stmt 1 discriminator 3 view .LVU572
 1613              	.LVL197:
 321:lib_convert.cpp ****         *(p + i) = 0x30;
 1614              		.loc 1 321 15 discriminator 3 view .LVU573
 1615 0613 4883C001 		addq	$1, %rax
 1616              	.LVL198:
 321:lib_convert.cpp ****         *(p + i) = 0x30;
 1617              		.loc 1 321 15 is_stmt 0 discriminator 3 view .LVU574
 1618 0617 4839D0   		cmpq	%rdx, %rax
 1619 061a 75F4     		jne	.L134
 325:lib_convert.cpp ****     // groups of 8 bits
 1620              		.loc 1 325 7 view .LVU575
 1621 061c 4889D0   		movq	%rdx, %rax
 327:lib_convert.cpp ****         p -= 1;
 1622              		.loc 1 327 18 view .LVU576
 1623 061f 8D4A08   		leal	8(%rdx), %ecx
 1624              	.LBB74:
 1625              	.LBB75:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1626              		.loc 2 29 33 view .LVU577
GAS LISTING /tmp/cceaV4lG.s 			page 49


 1627 0622 4C8D0500 		leaq	_ZL9hex_ascii(%rip), %r8
 1627      000000
 1628 0629 EB13     		jmp	.L135
 1629              	.LVL199:
 1630              	.L136:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1631              		.loc 2 29 33 view .LVU578
 1632              	.LBE75:
 1633              	.LBE74:
 328:lib_convert.cpp ****         memcpy(p, &hex_ascii[m & 0xf], sizeof(uint8_t));
 1634              		.loc 1 328 9 is_stmt 1 view .LVU579
 328:lib_convert.cpp ****         memcpy(p, &hex_ascii[m & 0xf], sizeof(uint8_t));
 1635              		.loc 1 328 11 is_stmt 0 view .LVU580
 1636 062b 4883E801 		subq	$1, %rax
 1637              	.LVL200:
 329:lib_convert.cpp ****         m >>= 4;
 1638              		.loc 1 329 9 is_stmt 1 view .LVU581
 1639              	.LBB78:
 1640              	.LBI74:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1641              		.loc 2 26 1 view .LVU582
 1642              	.LBB76:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1643              		.loc 2 29 3 view .LVU583
 1644              	.LBE76:
 1645              	.LBE78:
 329:lib_convert.cpp ****         m >>= 4;
 1646              		.loc 1 329 19 is_stmt 0 view .LVU584
 1647 062f 89F2     		movl	%esi, %edx
 1648 0631 83E20F   		andl	$15, %edx
 1649              	.LBB79:
 1650              	.LBB77:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1651              		.loc 2 29 33 view .LVU585
 1652 0634 410FB614 		movzbl	(%r8,%rdx,2), %edx
 1652      50
 1653 0639 8810     		movb	%dl, (%rax)
 1654              	.LVL201:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1655              		.loc 2 29 33 view .LVU586
 1656              	.LBE77:
 1657              	.LBE79:
 330:lib_convert.cpp ****         i++;
 1658              		.loc 1 330 9 is_stmt 1 view .LVU587
 330:lib_convert.cpp ****         i++;
 1659              		.loc 1 330 11 is_stmt 0 view .LVU588
 1660 063b C1EE04   		shrl	$4, %esi
 1661              	.LVL202:
 331:lib_convert.cpp ****     }
 1662              		.loc 1 331 9 is_stmt 1 view .LVU589
 1663              	.L135:
 327:lib_convert.cpp ****         p -= 1;
 1664              		.loc 1 327 18 view .LVU590
 1665 063e 85F6     		testl	%esi, %esi
 1666 0640 75E9     		jne	.L136
 327:lib_convert.cpp ****         p -= 1;
 1667              		.loc 1 327 18 is_stmt 0 discriminator 1 view .LVU591
GAS LISTING /tmp/cceaV4lG.s 			page 50


 1668 0642 89CA     		movl	%ecx, %edx
 1669 0644 29C2     		subl	%eax, %edx
 1670 0646 F6C201   		testb	$1, %dl
 1671 0649 75E0     		jne	.L136
 334:lib_convert.cpp **** }
 1672              		.loc 1 334 5 is_stmt 1 view .LVU592
 335:lib_convert.cpp **** 
 1673              		.loc 1 335 1 is_stmt 0 view .LVU593
 1674 064b 4889F8   		movq	%rdi, %rax
 1675              	.LVL203:
 335:lib_convert.cpp **** 
 1676              		.loc 1 335 1 view .LVU594
 1677 064e C3       		ret
 1678              		.cfi_endproc
 1679              	.LFE64:
 1680              		.size	_utoh32, .-_utoh32
 1681              		.globl	_utorh
 1682              		.type	_utorh, @function
 1683              	_utorh:
 1684              	.LVL204:
 1685              	.LFB65:
 343:lib_convert.cpp ****     char *p = &buf[11];
 1686              		.loc 1 343 1 is_stmt 1 view -0
 1687              		.cfi_startproc
 343:lib_convert.cpp ****     char *p = &buf[11];
 1688              		.loc 1 343 1 is_stmt 0 view .LVU596
 1689 064f 4189D1   		movl	%edx, %r9d
 344:lib_convert.cpp ****     uint32_t m = val;
 1690              		.loc 1 344 5 is_stmt 1 view .LVU597
 344:lib_convert.cpp ****     uint32_t m = val;
 1691              		.loc 1 344 11 is_stmt 0 view .LVU598
 1692 0652 488D470B 		leaq	11(%rdi), %rax
 1693              	.LVL205:
 345:lib_convert.cpp ****     uint8_t i = 0;
 1694              		.loc 1 345 5 is_stmt 1 view .LVU599
 346:lib_convert.cpp ****     uint8_t pc = 0;
 1695              		.loc 1 346 5 view .LVU600
 347:lib_convert.cpp **** 
 1696              		.loc 1 347 5 view .LVU601
 349:lib_convert.cpp **** 
 1697              		.loc 1 349 5 view .LVU602
 349:lib_convert.cpp **** 
 1698              		.loc 1 349 8 is_stmt 0 view .LVU603
 1699 0656 C6470B00 		movb	$0, 11(%rdi)
 351:lib_convert.cpp ****         for (pc = 0; pc < pad_size; pc++) {
 1700              		.loc 1 351 5 is_stmt 1 view .LVU604
 346:lib_convert.cpp ****     uint8_t pc = 0;
 1701              		.loc 1 346 13 is_stmt 0 view .LVU605
 1702 065a B9000000 		movl	$0, %ecx
 1702      00
 1703              	.LBB80:
 1704              	.LBB81:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1705              		.loc 2 29 33 view .LVU606
 1706 065f 4C8D0500 		leaq	_ZL14caps_hex_ascii(%rip), %r8
 1706      000000
 1707              	.LBE81:
GAS LISTING /tmp/cceaV4lG.s 			page 51


 1708              	.LBE80:
 351:lib_convert.cpp ****         for (pc = 0; pc < pad_size; pc++) {
 1709              		.loc 1 351 5 view .LVU607
 1710 0666 85F6     		testl	%esi, %esi
 1711 0668 741E     		je	.L147
 1712              	.LVL206:
 1713              	.L144:
 361:lib_convert.cpp ****         memcpy(p, &caps_hex_ascii[m & 0xf], sizeof(uint8_t));
 1714              		.loc 1 361 9 is_stmt 1 view .LVU608
 361:lib_convert.cpp ****         memcpy(p, &caps_hex_ascii[m & 0xf], sizeof(uint8_t));
 1715              		.loc 1 361 11 is_stmt 0 view .LVU609
 1716 066a 4883E801 		subq	$1, %rax
 1717              	.LVL207:
 362:lib_convert.cpp ****         m >>= 4;
 1718              		.loc 1 362 9 is_stmt 1 view .LVU610
 1719              	.LBB84:
 1720              	.LBI80:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1721              		.loc 2 26 1 view .LVU611
 1722              	.LBB82:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1723              		.loc 2 29 3 view .LVU612
 1724              	.LBE82:
 1725              	.LBE84:
 362:lib_convert.cpp ****         m >>= 4;
 1726              		.loc 1 362 19 is_stmt 0 view .LVU613
 1727 066e 89F2     		movl	%esi, %edx
 1728 0670 83E20F   		andl	$15, %edx
 1729              	.LBB85:
 1730              	.LBB83:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1731              		.loc 2 29 33 view .LVU614
 1732 0673 410FB614 		movzbl	(%r8,%rdx,2), %edx
 1732      50
 1733 0678 8810     		movb	%dl, (%rax)
 1734              	.LVL208:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1735              		.loc 2 29 33 view .LVU615
 1736              	.LBE83:
 1737              	.LBE85:
 363:lib_convert.cpp ****         i++;
 1738              		.loc 1 363 9 is_stmt 1 view .LVU616
 364:lib_convert.cpp ****     }
 1739              		.loc 1 364 9 view .LVU617
 364:lib_convert.cpp ****     }
 1740              		.loc 1 364 10 is_stmt 0 view .LVU618
 1741 067a 83C101   		addl	$1, %ecx
 1742              	.LVL209:
 360:lib_convert.cpp ****         p -= 1;
 1743              		.loc 1 360 18 is_stmt 1 view .LVU619
 1744 067d C1EE04   		shrl	$4, %esi
 1745              	.LVL210:
 360:lib_convert.cpp ****         p -= 1;
 1746              		.loc 1 360 18 is_stmt 0 view .LVU620
 1747 0680 75E8     		jne	.L144
 1748 0682 4438C9   		cmpb	%r9b, %cl
 1749 0685 72E3     		jb	.L144
GAS LISTING /tmp/cceaV4lG.s 			page 52


 368:lib_convert.cpp **** 
 1750              		.loc 1 368 1 view .LVU621
 1751 0687 C3       		ret
 1752              	.LVL211:
 1753              	.L147:
 352:lib_convert.cpp ****             memcpy(p - (pc + 1), &caps_hex_ascii[0], sizeof(uint8_t));
 1754              		.loc 1 352 25 is_stmt 1 view .LVU622
 1755 0688 84D2     		testb	%dl, %dl
 1756 068a 7416     		je	.L140
 1757 068c 4889F9   		movq	%rdi, %rcx
 1758 068f 0FB6F2   		movzbl	%dl, %esi
 1759              	.LVL212:
 352:lib_convert.cpp ****             memcpy(p - (pc + 1), &caps_hex_ascii[0], sizeof(uint8_t));
 1760              		.loc 1 352 25 is_stmt 0 view .LVU623
 1761 0692 4829F7   		subq	%rsi, %rdi
 1762              	.LVL213:
 1763              	.L141:
 353:lib_convert.cpp ****         }
 1764              		.loc 1 353 13 is_stmt 1 discriminator 3 view .LVU624
 1765              	.LBB86:
 1766              	.LBI86:
  26:/usr/include/bits/string_fortified.h **** 	       size_t __len))
 1767              		.loc 2 26 1 discriminator 3 view .LVU625
 1768              	.LBB87:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1769              		.loc 2 29 3 discriminator 3 view .LVU626
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1770              		.loc 2 29 33 is_stmt 0 discriminator 3 view .LVU627
 1771 0695 C6410A30 		movb	$48, 10(%rcx)
 1772              	.LVL214:
  29:/usr/include/bits/string_fortified.h **** 				 __glibc_objsize0 (__dest));
 1773              		.loc 2 29 33 discriminator 3 view .LVU628
 1774              	.LBE87:
 1775              	.LBE86:
 352:lib_convert.cpp ****             memcpy(p - (pc + 1), &caps_hex_ascii[0], sizeof(uint8_t));
 1776              		.loc 1 352 9 is_stmt 1 discriminator 3 view .LVU629
 352:lib_convert.cpp ****             memcpy(p - (pc + 1), &caps_hex_ascii[0], sizeof(uint8_t));
 1777              		.loc 1 352 25 discriminator 3 view .LVU630
 1778 0699 4883E901 		subq	$1, %rcx
 1779              	.LVL215:
 352:lib_convert.cpp ****             memcpy(p - (pc + 1), &caps_hex_ascii[0], sizeof(uint8_t));
 1780              		.loc 1 352 25 is_stmt 0 discriminator 3 view .LVU631
 1781 069d 4839CF   		cmpq	%rcx, %rdi
 1782 06a0 75F3     		jne	.L141
 1783              	.LVL216:
 1784              	.L140:
 355:lib_convert.cpp ****         return p;
 1785              		.loc 1 355 9 is_stmt 1 view .LVU632
 355:lib_convert.cpp ****         return p;
 1786              		.loc 1 355 14 is_stmt 0 view .LVU633
 1787 06a2 0FB6D2   		movzbl	%dl, %edx
 1788              	.LVL217:
 355:lib_convert.cpp ****         return p;
 1789              		.loc 1 355 11 view .LVU634
 1790 06a5 4829D0   		subq	%rdx, %rax
 1791              	.LVL218:
 356:lib_convert.cpp ****     }
GAS LISTING /tmp/cceaV4lG.s 			page 53


 1792              		.loc 1 356 9 is_stmt 1 view .LVU635
 356:lib_convert.cpp ****     }
 1793              		.loc 1 356 16 is_stmt 0 view .LVU636
 1794 06a8 C3       		ret
 1795              		.cfi_endproc
 1796              	.LFE65:
 1797              		.size	_utorh, .-_utorh
 1798              		.globl	_utob
 1799              		.type	_utob, @function
 1800              	_utob:
 1801              	.LVL219:
 1802              	.LFB68:
 466:lib_convert.cpp **** 
 467:lib_convert.cpp **** static char *_uint16toa(char *buf, const uint16_t val)
 468:lib_convert.cpp **** {
 469:lib_convert.cpp ****     char *p = buf + (CONV_BASE_10_BUF_SZ - 1);  // the very end of the buffer
 470:lib_convert.cpp ****     uint32_t m = val;
 471:lib_convert.cpp **** 
 472:lib_convert.cpp ****     *p = '\0';
 473:lib_convert.cpp **** 
 474:lib_convert.cpp ****     if (val == 0) {
 475:lib_convert.cpp ****         p -= 1;
 476:lib_convert.cpp ****         *p = '0';
 477:lib_convert.cpp ****     }
 478:lib_convert.cpp **** 
 479:lib_convert.cpp ****     while (m > 0) {
 480:lib_convert.cpp ****         p -= 1;
 481:lib_convert.cpp ****         *p = (m % 10) + '0';
 482:lib_convert.cpp ****         m /= 10;
 483:lib_convert.cpp ****     }
 484:lib_convert.cpp **** 
 485:lib_convert.cpp ****     return p;
 486:lib_convert.cpp **** }
 487:lib_convert.cpp **** 
 488:lib_convert.cpp **** char *_utob(char *buf, const uint16_t val)
 489:lib_convert.cpp **** {
 1803              		.loc 1 489 1 is_stmt 1 view -0
 1804              		.cfi_startproc
 1805              		.loc 1 489 1 is_stmt 0 view .LVU638
 1806 06a9 89F0     		movl	%esi, %eax
 490:lib_convert.cpp ****     char *p = buf + (CONV_BASE_2_BUF_SZ - 1);   // the very end of the buffer
 1807              		.loc 1 490 5 is_stmt 1 view .LVU639
 1808              	.LVL220:
 491:lib_convert.cpp ****     uint16_t m = val;
 1809              		.loc 1 491 5 view .LVU640
 492:lib_convert.cpp ****     uint8_t i = 0;
 1810              		.loc 1 492 5 view .LVU641
 493:lib_convert.cpp **** 
 494:lib_convert.cpp ****     *p = '\0';
 1811              		.loc 1 494 5 view .LVU642
 1812              		.loc 1 494 8 is_stmt 0 view .LVU643
 1813 06ab C6471200 		movb	$0, 18(%rdi)
 495:lib_convert.cpp **** 
 496:lib_convert.cpp ****     if (val == 0) {
 1814              		.loc 1 496 5 is_stmt 1 view .LVU644
 490:lib_convert.cpp ****     uint16_t m = val;
 1815              		.loc 1 490 11 is_stmt 0 view .LVU645
GAS LISTING /tmp/cceaV4lG.s 			page 54


 1816 06af 488D4F12 		leaq	18(%rdi), %rcx
 1817              	.LVL221:
 1818              		.loc 1 496 5 view .LVU646
 1819 06b3 6685F6   		testw	%si, %si
 1820 06b6 7508     		jne	.L150
 497:lib_convert.cpp ****         p -= 1;
 1821              		.loc 1 497 9 is_stmt 1 view .LVU647
 1822              		.loc 1 497 11 is_stmt 0 view .LVU648
 1823 06b8 488D4F11 		leaq	17(%rdi), %rcx
 1824              	.LVL222:
 498:lib_convert.cpp ****         *p = '0';
 1825              		.loc 1 498 9 is_stmt 1 view .LVU649
 1826              		.loc 1 498 12 is_stmt 0 view .LVU650
 1827 06bc C6471130 		movb	$48, 17(%rdi)
 1828              	.L150:
 499:lib_convert.cpp ****     }
 500:lib_convert.cpp ****     // groups of 8bits
 501:lib_convert.cpp ****     while (m > 0 || (i & 7)) {
 502:lib_convert.cpp ****         if (m > 0 && !(i & 7)) {
 503:lib_convert.cpp ****             p -= 1;
 1829              		.loc 1 503 15 view .LVU651
 1830 06c0 BE000000 		movl	$0, %esi
 1830      00
 1831              	.LVL223:
 1832              		.loc 1 503 15 view .LVU652
 1833 06c5 EB23     		jmp	.L151
 1834              	.LVL224:
 1835              	.L153:
 502:lib_convert.cpp ****             p -= 1;
 1836              		.loc 1 502 19 discriminator 1 view .LVU653
 1837 06c7 40F6C607 		testb	$7, %sil
 1838 06cb 7508     		jne	.L152
 1839              		.loc 1 503 13 is_stmt 1 view .LVU654
 1840              	.LVL225:
 504:lib_convert.cpp ****             *p = ' ';
 1841              		.loc 1 504 13 view .LVU655
 1842              		.loc 1 504 16 is_stmt 0 view .LVU656
 1843 06cd C641FF20 		movb	$32, -1(%rcx)
 503:lib_convert.cpp ****             *p = ' ';
 1844              		.loc 1 503 15 view .LVU657
 1845 06d1 488D49FF 		leaq	-1(%rcx), %rcx
 1846              	.LVL226:
 1847              	.L152:
 505:lib_convert.cpp ****         }
 506:lib_convert.cpp ****         p -= 1;
 1848              		.loc 1 506 9 is_stmt 1 view .LVU658
 507:lib_convert.cpp ****         *p = (m & 0x1) + '0';
 1849              		.loc 1 507 9 view .LVU659
 1850              		.loc 1 507 17 is_stmt 0 view .LVU660
 1851 06d5 89C2     		movl	%eax, %edx
 1852 06d7 83E201   		andl	$1, %edx
 1853              		.loc 1 507 24 view .LVU661
 1854 06da 83C230   		addl	$48, %edx
 1855 06dd 8851FF   		movb	%dl, -1(%rcx)
 508:lib_convert.cpp ****         m >>= 1;
 1856              		.loc 1 508 9 is_stmt 1 view .LVU662
 1857              		.loc 1 508 11 is_stmt 0 view .LVU663
GAS LISTING /tmp/cceaV4lG.s 			page 55


 1858 06e0 66D1E8   		shrw	%ax
 1859              	.LVL227:
 509:lib_convert.cpp ****         i++;
 1860              		.loc 1 509 9 is_stmt 1 view .LVU664
 1861              		.loc 1 509 10 is_stmt 0 view .LVU665
 1862 06e3 83C601   		addl	$1, %esi
 1863              	.LVL228:
 506:lib_convert.cpp ****         *p = (m & 0x1) + '0';
 1864              		.loc 1 506 11 view .LVU666
 1865 06e6 488D49FF 		leaq	-1(%rcx), %rcx
 1866              	.LVL229:
 1867              	.L151:
 501:lib_convert.cpp ****         if (m > 0 && !(i & 7)) {
 1868              		.loc 1 501 18 is_stmt 1 view .LVU667
 1869 06ea 6685C0   		testw	%ax, %ax
 1870 06ed 75D8     		jne	.L153
 1871              	.LVL230:
 501:lib_convert.cpp ****         if (m > 0 && !(i & 7)) {
 1872              		.loc 1 501 18 is_stmt 0 discriminator 1 view .LVU668
 1873 06ef 40F6C607 		testb	$7, %sil
 1874 06f3 75E0     		jne	.L152
 510:lib_convert.cpp ****     }
 511:lib_convert.cpp **** 
 512:lib_convert.cpp ****     return p;
 1875              		.loc 1 512 5 is_stmt 1 view .LVU669
 513:lib_convert.cpp **** }
 1876              		.loc 1 513 1 is_stmt 0 view .LVU670
 1877 06f5 4889C8   		movq	%rcx, %rax
 1878 06f8 C3       		ret
 1879              		.cfi_endproc
 1880              	.LFE68:
 1881              		.size	_utob, .-_utob
 1882              		.globl	_utoa
 1883              		.type	_utoa, @function
 1884              	_utoa:
 1885              	.LVL231:
 1886              	.LFB69:
 514:lib_convert.cpp **** 
 515:lib_convert.cpp **** #endif
 516:lib_convert.cpp **** 
 517:lib_convert.cpp **** char *_utoa(char *buf, const uint32_t val)
 518:lib_convert.cpp **** {
 1887              		.loc 1 518 1 is_stmt 1 view -0
 1888              		.cfi_startproc
 519:lib_convert.cpp ****     return _uint32toa(buf, val);
 1889              		.loc 1 519 5 view .LVU672
 1890              		.loc 1 519 22 is_stmt 0 view .LVU673
 1891 06f9 E802F9FF 		call	_ZL10_uint32toaPcj
 1891      FF
 1892              	.LVL232:
 520:lib_convert.cpp **** }
 1893              		.loc 1 520 1 view .LVU674
 1894 06fe C3       		ret
 1895              		.cfi_endproc
 1896              	.LFE69:
 1897              		.size	_utoa, .-_utoa
 1898              		.globl	_itoa
GAS LISTING /tmp/cceaV4lG.s 			page 56


 1899              		.type	_itoa, @function
 1900              	_itoa:
 1901              	.LVL233:
 1902              	.LFB70:
 521:lib_convert.cpp **** 
 522:lib_convert.cpp **** char *_itoa(char *buf, const int32_t val)
 523:lib_convert.cpp **** {
 1903              		.loc 1 523 1 is_stmt 1 view -0
 1904              		.cfi_startproc
 524:lib_convert.cpp ****     char *p;
 1905              		.loc 1 524 5 view .LVU676
 525:lib_convert.cpp ****     if (val >= 0) {
 1906              		.loc 1 525 5 view .LVU677
 1907 06ff 85F6     		testl	%esi, %esi
 1908 0701 7806     		js	.L156
 526:lib_convert.cpp ****         return _uint32toa(buf, val);
 1909              		.loc 1 526 9 view .LVU678
 1910              		.loc 1 526 26 is_stmt 0 view .LVU679
 1911 0703 E8F8F8FF 		call	_ZL10_uint32toaPcj
 1911      FF
 1912              	.LVL234:
 1913              		.loc 1 526 35 view .LVU680
 1914 0708 C3       		ret
 1915              	.LVL235:
 1916              	.L156:
 527:lib_convert.cpp ****     } else {
 528:lib_convert.cpp ****         p = _uint32toa(buf, val * -1);
 1917              		.loc 1 528 9 is_stmt 1 view .LVU681
 1918              		.loc 1 528 33 is_stmt 0 view .LVU682
 1919 0709 F7DE     		negl	%esi
 1920              	.LVL236:
 1921              		.loc 1 528 23 view .LVU683
 1922 070b E8F0F8FF 		call	_ZL10_uint32toaPcj
 1922      FF
 1923              	.LVL237:
 529:lib_convert.cpp ****         *(p - 1) = '-';
 1924              		.loc 1 529 9 is_stmt 1 view .LVU684
 1925              		.loc 1 529 18 is_stmt 0 view .LVU685
 1926 0710 C640FF2D 		movb	$45, -1(%rax)
 530:lib_convert.cpp ****         return p - 1;
 1927              		.loc 1 530 9 is_stmt 1 view .LVU686
 1928              		.loc 1 530 20 is_stmt 0 view .LVU687
 1929 0714 4883E801 		subq	$1, %rax
 1930              	.LVL238:
 531:lib_convert.cpp ****     }
 532:lib_convert.cpp **** }
 1931              		.loc 1 532 1 view .LVU688
 1932 0718 C3       		ret
 1933              		.cfi_endproc
 1934              	.LFE70:
 1935              		.size	_itoa, .-_itoa
 1936              		.globl	_i16toa
 1937              		.type	_i16toa, @function
 1938              	_i16toa:
 1939              	.LVL239:
 1940              	.LFB71:
 533:lib_convert.cpp **** 
GAS LISTING /tmp/cceaV4lG.s 			page 57


 534:lib_convert.cpp **** char *_i16toa(char *buf, const int16_t val)
 535:lib_convert.cpp **** {
 1941              		.loc 1 535 1 is_stmt 1 view -0
 1942              		.cfi_startproc
 536:lib_convert.cpp ****     char *p;
 1943              		.loc 1 536 5 view .LVU690
 537:lib_convert.cpp ****     if (val >= 0) {
 1944              		.loc 1 537 5 view .LVU691
 1945 0719 6685F6   		testw	%si, %si
 1946 071c 7846     		js	.L159
 538:lib_convert.cpp ****         return _uint16toa(buf, val);
 1947              		.loc 1 538 9 view .LVU692
 1948              	.LVL240:
 1949              	.LBB92:
 1950              	.LBI92:
 467:lib_convert.cpp **** {
 1951              		.loc 1 467 14 view .LVU693
 1952              	.LBB93:
 469:lib_convert.cpp ****     uint32_t m = val;
 1953              		.loc 1 469 5 view .LVU694
 470:lib_convert.cpp **** 
 1954              		.loc 1 470 5 view .LVU695
 472:lib_convert.cpp **** 
 1955              		.loc 1 472 5 view .LVU696
 472:lib_convert.cpp **** 
 1956              		.loc 1 472 8 is_stmt 0 view .LVU697
 1957 071e C6470B00 		movb	$0, 11(%rdi)
 474:lib_convert.cpp ****         p -= 1;
 1958              		.loc 1 474 5 is_stmt 1 view .LVU698
 1959 0722 750A     		jne	.L160
 475:lib_convert.cpp ****         *p = '0';
 1960              		.loc 1 475 9 view .LVU699
 475:lib_convert.cpp ****         *p = '0';
 1961              		.loc 1 475 11 is_stmt 0 view .LVU700
 1962 0724 4C8D470A 		leaq	10(%rdi), %r8
 1963              	.LVL241:
 476:lib_convert.cpp ****     }
 1964              		.loc 1 476 9 is_stmt 1 view .LVU701
 476:lib_convert.cpp ****     }
 1965              		.loc 1 476 12 is_stmt 0 view .LVU702
 1966 0728 C6470A30 		movb	$48, 10(%rdi)
 1967              	.LVL242:
 479:lib_convert.cpp ****         p -= 1;
 1968              		.loc 1 479 14 is_stmt 1 view .LVU703
 1969 072c EB32     		jmp	.L158
 1970              	.LVL243:
 1971              	.L160:
 469:lib_convert.cpp ****     uint32_t m = val;
 1972              		.loc 1 469 11 is_stmt 0 view .LVU704
 1973 072e 4C8D470B 		leaq	11(%rdi), %r8
 470:lib_convert.cpp **** 
 1974              		.loc 1 470 14 view .LVU705
 1975 0732 0FB7D6   		movzwl	%si, %edx
 481:lib_convert.cpp ****         m /= 10;
 1976              		.loc 1 481 17 view .LVU706
 1977 0735 BFCDCCCC 		movl	$3435973837, %edi
 1977      CC
GAS LISTING /tmp/cceaV4lG.s 			page 58


 1978              	.LVL244:
 1979              	.L162:
 480:lib_convert.cpp ****         *p = (m % 10) + '0';
 1980              		.loc 1 480 9 is_stmt 1 view .LVU707
 480:lib_convert.cpp ****         *p = (m % 10) + '0';
 1981              		.loc 1 480 11 is_stmt 0 view .LVU708
 1982 073a 4983E801 		subq	$1, %r8
 1983              	.LVL245:
 481:lib_convert.cpp ****         m /= 10;
 1984              		.loc 1 481 9 is_stmt 1 view .LVU709
 481:lib_convert.cpp ****         m /= 10;
 1985              		.loc 1 481 17 is_stmt 0 view .LVU710
 1986 073e 89D0     		movl	%edx, %eax
 1987 0740 480FAFC7 		imulq	%rdi, %rax
 1988 0744 48C1E823 		shrq	$35, %rax
 1989 0748 8D3480   		leal	(%rax,%rax,4), %esi
 1990 074b 01F6     		addl	%esi, %esi
 1991 074d 89D1     		movl	%edx, %ecx
 1992 074f 29F1     		subl	%esi, %ecx
 481:lib_convert.cpp ****         m /= 10;
 1993              		.loc 1 481 23 view .LVU711
 1994 0751 83C130   		addl	$48, %ecx
 1995 0754 418808   		movb	%cl, (%r8)
 482:lib_convert.cpp ****     }
 1996              		.loc 1 482 9 is_stmt 1 view .LVU712
 1997 0757 89D1     		movl	%edx, %ecx
 482:lib_convert.cpp ****     }
 1998              		.loc 1 482 11 is_stmt 0 view .LVU713
 1999 0759 89C2     		movl	%eax, %edx
 2000              	.LVL246:
 479:lib_convert.cpp ****         p -= 1;
 2001              		.loc 1 479 14 is_stmt 1 view .LVU714
 2002 075b 83F909   		cmpl	$9, %ecx
 2003 075e 77DA     		ja	.L162
 2004              	.LVL247:
 2005              	.L158:
 479:lib_convert.cpp ****         p -= 1;
 2006              		.loc 1 479 14 is_stmt 0 view .LVU715
 2007              	.LBE93:
 2008              	.LBE92:
 539:lib_convert.cpp ****     } else {
 540:lib_convert.cpp ****         p = _uint16toa(buf, val * -1);
 541:lib_convert.cpp ****         *(p - 1) = '-';
 542:lib_convert.cpp ****         return p - 1;
 543:lib_convert.cpp ****     }
 544:lib_convert.cpp **** }
 2009              		.loc 1 544 1 view .LVU716
 2010 0760 4C89C0   		movq	%r8, %rax
 2011 0763 C3       		ret
 2012              	.LVL248:
 2013              	.L159:
 540:lib_convert.cpp ****         *(p - 1) = '-';
 2014              		.loc 1 540 9 is_stmt 1 view .LVU717
 2015              	.LBB94:
 2016              	.LBI94:
 467:lib_convert.cpp **** {
 2017              		.loc 1 467 14 view .LVU718
GAS LISTING /tmp/cceaV4lG.s 			page 59


 2018              	.LBB95:
 469:lib_convert.cpp ****     uint32_t m = val;
 2019              		.loc 1 469 5 view .LVU719
 469:lib_convert.cpp ****     uint32_t m = val;
 2020              		.loc 1 469 11 is_stmt 0 view .LVU720
 2021 0764 488D4F0B 		leaq	11(%rdi), %rcx
 2022              	.LVL249:
 470:lib_convert.cpp **** 
 2023              		.loc 1 470 5 is_stmt 1 view .LVU721
 2024              	.LBE95:
 2025              	.LBE94:
 540:lib_convert.cpp ****         *(p - 1) = '-';
 2026              		.loc 1 540 23 is_stmt 0 view .LVU722
 2027 0768 89F2     		movl	%esi, %edx
 2028 076a F7DA     		negl	%edx
 2029              	.LBB97:
 2030              	.LBB96:
 470:lib_convert.cpp **** 
 2031              		.loc 1 470 14 view .LVU723
 2032 076c 0FB7D2   		movzwl	%dx, %edx
 2033              	.LVL250:
 472:lib_convert.cpp **** 
 2034              		.loc 1 472 5 is_stmt 1 view .LVU724
 472:lib_convert.cpp **** 
 2035              		.loc 1 472 8 is_stmt 0 view .LVU725
 2036 076f C6470B00 		movb	$0, 11(%rdi)
 474:lib_convert.cpp ****         p -= 1;
 2037              		.loc 1 474 5 is_stmt 1 view .LVU726
 479:lib_convert.cpp ****         p -= 1;
 2038              		.loc 1 479 14 view .LVU727
 481:lib_convert.cpp ****         m /= 10;
 2039              		.loc 1 481 17 is_stmt 0 view .LVU728
 2040 0773 41B9CDCC 		movl	$3435973837, %r9d
 2040      CCCC
 2041              	.LVL251:
 2042              	.L163:
 480:lib_convert.cpp ****         *p = (m % 10) + '0';
 2043              		.loc 1 480 9 is_stmt 1 view .LVU729
 2044 0779 4989C8   		movq	%rcx, %r8
 480:lib_convert.cpp ****         *p = (m % 10) + '0';
 2045              		.loc 1 480 11 is_stmt 0 view .LVU730
 2046 077c 4883E901 		subq	$1, %rcx
 2047              	.LVL252:
 481:lib_convert.cpp ****         m /= 10;
 2048              		.loc 1 481 9 is_stmt 1 view .LVU731
 481:lib_convert.cpp ****         m /= 10;
 2049              		.loc 1 481 17 is_stmt 0 view .LVU732
 2050 0780 89D0     		movl	%edx, %eax
 2051 0782 490FAFC1 		imulq	%r9, %rax
 2052 0786 48C1E823 		shrq	$35, %rax
 2053 078a 8D3C80   		leal	(%rax,%rax,4), %edi
 2054 078d 01FF     		addl	%edi, %edi
 2055 078f 89D6     		movl	%edx, %esi
 2056 0791 29FE     		subl	%edi, %esi
 481:lib_convert.cpp ****         m /= 10;
 2057              		.loc 1 481 23 view .LVU733
 2058 0793 83C630   		addl	$48, %esi
GAS LISTING /tmp/cceaV4lG.s 			page 60


 2059 0796 408831   		movb	%sil, (%rcx)
 482:lib_convert.cpp ****     }
 2060              		.loc 1 482 9 is_stmt 1 view .LVU734
 2061 0799 89D6     		movl	%edx, %esi
 482:lib_convert.cpp ****     }
 2062              		.loc 1 482 11 is_stmt 0 view .LVU735
 2063 079b 89C2     		movl	%eax, %edx
 2064              	.LVL253:
 479:lib_convert.cpp ****         p -= 1;
 2065              		.loc 1 479 14 is_stmt 1 view .LVU736
 2066 079d 83FE09   		cmpl	$9, %esi
 2067 07a0 77D7     		ja	.L163
 485:lib_convert.cpp **** }
 2068              		.loc 1 485 5 view .LVU737
 2069              	.LVL254:
 485:lib_convert.cpp **** }
 2070              		.loc 1 485 5 is_stmt 0 view .LVU738
 2071              	.LBE96:
 2072              	.LBE97:
 541:lib_convert.cpp ****         return p - 1;
 2073              		.loc 1 541 9 is_stmt 1 view .LVU739
 541:lib_convert.cpp ****         return p - 1;
 2074              		.loc 1 541 18 is_stmt 0 view .LVU740
 2075 07a2 C641FF2D 		movb	$45, -1(%rcx)
 542:lib_convert.cpp ****     }
 2076              		.loc 1 542 9 is_stmt 1 view .LVU741
 542:lib_convert.cpp ****     }
 2077              		.loc 1 542 20 is_stmt 0 view .LVU742
 2078 07a6 4983E802 		subq	$2, %r8
 2079 07aa EBB4     		jmp	.L158
 2080              		.cfi_endproc
 2081              	.LFE71:
 2082              		.size	_i16toa, .-_i16toa
 2083              		.globl	prepend_padding
 2084              		.type	prepend_padding, @function
 2085              	prepend_padding:
 2086              	.LVL255:
 2087              	.LFB72:
 545:lib_convert.cpp **** 
 546:lib_convert.cpp **** char *prepend_padding(char *buf, char *converted_buf, const pad_type padding_type,
 547:lib_convert.cpp ****                       const uint8_t target_len)
 548:lib_convert.cpp **** {
 2088              		.loc 1 548 1 is_stmt 1 view -0
 2089              		.cfi_startproc
 2090              		.loc 1 548 1 is_stmt 0 view .LVU744
 2091 07ac 4155     		pushq	%r13
 2092              		.cfi_def_cfa_offset 16
 2093              		.cfi_offset 13, -16
 2094 07ae 4154     		pushq	%r12
 2095              		.cfi_def_cfa_offset 24
 2096              		.cfi_offset 12, -24
 2097 07b0 55       		pushq	%rbp
 2098              		.cfi_def_cfa_offset 32
 2099              		.cfi_offset 6, -32
 2100 07b1 53       		pushq	%rbx
 2101              		.cfi_def_cfa_offset 40
 2102              		.cfi_offset 3, -40
GAS LISTING /tmp/cceaV4lG.s 			page 61


 2103 07b2 4883EC08 		subq	$8, %rsp
 2104              		.cfi_def_cfa_offset 48
 2105 07b6 4889FB   		movq	%rdi, %rbx
 2106 07b9 4889F5   		movq	%rsi, %rbp
 2107 07bc 4189D5   		movl	%edx, %r13d
 2108 07bf 4189CC   		movl	%ecx, %r12d
 549:lib_convert.cpp ****     uint8_t conv_len;
 2109              		.loc 1 549 5 is_stmt 1 view .LVU745
 550:lib_convert.cpp ****     uint8_t buf_pos;
 2110              		.loc 1 550 5 view .LVU746
 551:lib_convert.cpp ****     uint8_t cnt;
 2111              		.loc 1 551 5 view .LVU747
 552:lib_convert.cpp ****     uint8_t padding_char = '0';
 2112              		.loc 1 552 5 view .LVU748
 2113              	.LVL256:
 553:lib_convert.cpp **** 
 554:lib_convert.cpp ****     conv_len = strlen(converted_buf);
 2114              		.loc 1 554 5 view .LVU749
 2115              		.loc 1 554 22 is_stmt 0 view .LVU750
 2116 07c2 4889F7   		movq	%rsi, %rdi
 2117              	.LVL257:
 2118              		.loc 1 554 22 view .LVU751
 2119 07c5 E8000000 		call	strlen@PLT
 2119      00
 2120              	.LVL258:
 555:lib_convert.cpp ****     buf_pos = converted_buf - buf;
 2121              		.loc 1 555 5 is_stmt 1 view .LVU752
 2122              		.loc 1 555 29 is_stmt 0 view .LVU753
 2123 07ca 4989E9   		movq	%rbp, %r9
 2124 07cd 4929D9   		subq	%rbx, %r9
 2125              	.LVL259:
 556:lib_convert.cpp **** 
 557:lib_convert.cpp ****     // if not enough buffer space is available for the prepend
 558:lib_convert.cpp ****     if (buf_pos < target_len - conv_len) {
 2126              		.loc 1 558 5 is_stmt 1 view .LVU754
 2127              		.loc 1 558 19 is_stmt 0 view .LVU755
 2128 07d0 410FB6D4 		movzbl	%r12b, %edx
 2129              		.loc 1 558 32 view .LVU756
 2130 07d4 0FB6C8   		movzbl	%al, %ecx
 2131              		.loc 1 558 30 view .LVU757
 2132 07d7 29CA     		subl	%ecx, %edx
 559:lib_convert.cpp ****         return converted_buf;
 560:lib_convert.cpp ****     }
 561:lib_convert.cpp ****     // if the converted string is already longer than the target length
 562:lib_convert.cpp ****     if (target_len <= conv_len) {
 2133              		.loc 1 562 5 is_stmt 1 view .LVU758
 2134 07d9 4438E0   		cmpb	%r12b, %al
 2135 07dc 734F     		jnb	.L167
 558:lib_convert.cpp ****         return converted_buf;
 2136              		.loc 1 558 9 is_stmt 0 view .LVU759
 2137 07de 410FB6C1 		movzbl	%r9b, %eax
 2138              	.LVL260:
 2139              		.loc 1 562 5 view .LVU760
 2140 07e2 39D0     		cmpl	%edx, %eax
 2141 07e4 7C47     		jl	.L167
 563:lib_convert.cpp ****         return converted_buf;
 564:lib_convert.cpp ****     }
GAS LISTING /tmp/cceaV4lG.s 			page 62


 565:lib_convert.cpp **** 
 566:lib_convert.cpp ****     if (padding_type == PAD_SPACES) {
 2142              		.loc 1 566 5 is_stmt 1 view .LVU761
 552:lib_convert.cpp **** 
 2143              		.loc 1 552 13 is_stmt 0 view .LVU762
 2144 07e6 4183FD02 		cmpl	$2, %r13d
 2145 07ea BF200000 		movl	$32, %edi
 2145      00
 2146 07ef B8300000 		movl	$48, %eax
 2146      00
 2147 07f4 0F45F8   		cmovne	%eax, %edi
 2148              	.LVL261:
 567:lib_convert.cpp ****         padding_char = ' ';
 568:lib_convert.cpp ****     }
 569:lib_convert.cpp **** 
 570:lib_convert.cpp ****     for (cnt = 0; cnt < target_len - conv_len; cnt++) {
 2149              		.loc 1 570 5 is_stmt 1 view .LVU763
 2150              		.loc 1 570 23 view .LVU764
 2151 07f7 85D2     		testl	%edx, %edx
 2152 07f9 7E40     		jle	.L172
 2153              		.loc 1 570 14 is_stmt 0 view .LVU765
 2154 07fb B8000000 		movl	$0, %eax
 2154      00
 571:lib_convert.cpp ****         *(buf + buf_pos - cnt - 1) = padding_char;
 2155              		.loc 1 571 17 view .LVU766
 2156 0800 450FB6C1 		movzbl	%r9b, %r8d
 2157              		.loc 1 571 31 view .LVU767
 2158 0804 4983E801 		subq	$1, %r8
 2159              	.LVL262:
 2160              	.L170:
 2161              		.loc 1 571 9 is_stmt 1 discriminator 3 view .LVU768
 2162              		.loc 1 571 27 is_stmt 0 discriminator 3 view .LVU769
 2163 0808 0FB6F0   		movzbl	%al, %esi
 2164              		.loc 1 571 31 discriminator 3 view .LVU770
 2165 080b 4C89C1   		movq	%r8, %rcx
 2166 080e 4829F1   		subq	%rsi, %rcx
 2167              		.loc 1 571 36 discriminator 3 view .LVU771
 2168 0811 40883C0B 		movb	%dil, (%rbx,%rcx)
 570:lib_convert.cpp ****         *(buf + buf_pos - cnt - 1) = padding_char;
 2169              		.loc 1 570 5 is_stmt 1 discriminator 3 view .LVU772
 2170 0815 83C001   		addl	$1, %eax
 2171              	.LVL263:
 570:lib_convert.cpp ****         *(buf + buf_pos - cnt - 1) = padding_char;
 2172              		.loc 1 570 23 discriminator 3 view .LVU773
 570:lib_convert.cpp ****         *(buf + buf_pos - cnt - 1) = padding_char;
 2173              		.loc 1 570 19 is_stmt 0 discriminator 3 view .LVU774
 2174 0818 0FB6C8   		movzbl	%al, %ecx
 570:lib_convert.cpp ****         *(buf + buf_pos - cnt - 1) = padding_char;
 2175              		.loc 1 570 23 discriminator 3 view .LVU775
 2176 081b 39CA     		cmpl	%ecx, %edx
 2177 081d 7FE9     		jg	.L170
 2178              	.LVL264:
 2179              	.L169:
 572:lib_convert.cpp ****     }
 573:lib_convert.cpp **** 
 574:lib_convert.cpp ****     return buf + buf_pos - cnt;
 2180              		.loc 1 574 5 is_stmt 1 view .LVU776
GAS LISTING /tmp/cceaV4lG.s 			page 63


 2181              		.loc 1 574 18 is_stmt 0 view .LVU777
 2182 081f 450FB6C9 		movzbl	%r9b, %r9d
 2183              		.loc 1 574 28 view .LVU778
 2184 0823 0FB6C0   		movzbl	%al, %eax
 2185              		.loc 1 574 26 view .LVU779
 2186 0826 4929C1   		subq	%rax, %r9
 2187              	.LVL265:
 2188              		.loc 1 574 28 view .LVU780
 2189 0829 4A8D2C0B 		leaq	(%rbx,%r9), %rbp
 2190              	.LVL266:
 2191              	.L167:
 575:lib_convert.cpp **** }
 2192              		.loc 1 575 1 view .LVU781
 2193 082d 4889E8   		movq	%rbp, %rax
 2194 0830 4883C408 		addq	$8, %rsp
 2195              		.cfi_remember_state
 2196              		.cfi_def_cfa_offset 40
 2197 0834 5B       		popq	%rbx
 2198              		.cfi_def_cfa_offset 32
 2199              	.LVL267:
 2200              		.loc 1 575 1 view .LVU782
 2201 0835 5D       		popq	%rbp
 2202              		.cfi_def_cfa_offset 24
 2203 0836 415C     		popq	%r12
 2204              		.cfi_def_cfa_offset 16
 2205 0838 415D     		popq	%r13
 2206              		.cfi_def_cfa_offset 8
 2207              	.LVL268:
 2208              		.loc 1 575 1 view .LVU783
 2209 083a C3       		ret
 2210              	.LVL269:
 2211              	.L172:
 2212              		.cfi_restore_state
 570:lib_convert.cpp ****         *(buf + buf_pos - cnt - 1) = padding_char;
 2213              		.loc 1 570 14 view .LVU784
 2214 083b B8000000 		movl	$0, %eax
 2214      00
 2215 0840 EBDD     		jmp	.L169
 2216              		.cfi_endproc
 2217              	.LFE72:
 2218              		.size	prepend_padding, .-prepend_padding
 2219              		.globl	mem2ascii
 2220              		.type	mem2ascii, @function
 2221              	mem2ascii:
 2222              	.LVL270:
 2223              	.LFB73:
 576:lib_convert.cpp **** 
 577:lib_convert.cpp **** void mem2ascii(uint8_t * data_in, uint8_t * data_out, uint8_t len)
 578:lib_convert.cpp **** {
 2224              		.loc 1 578 1 is_stmt 1 view -0
 2225              		.cfi_startproc
 2226              		.loc 1 578 1 is_stmt 0 view .LVU786
 2227 0842 4889F9   		movq	%rdi, %rcx
 579:lib_convert.cpp ****     uint8_t byte;
 2228              		.loc 1 579 5 is_stmt 1 view .LVU787
 580:lib_convert.cpp ****     while (len) {
 2229              		.loc 1 580 5 view .LVU788
GAS LISTING /tmp/cceaV4lG.s 			page 64


 2230              		.loc 1 580 12 view .LVU789
 2231 0845 84D2     		testb	%dl, %dl
 2232 0847 7440     		je	.L175
 2233 0849 0FB6D2   		movzbl	%dl, %edx
 2234              		.loc 1 580 12 is_stmt 0 view .LVU790
 2235 084c 4C8D0417 		leaq	(%rdi,%rdx), %r8
 2236              	.LVL271:
 2237              	.L181:
 581:lib_convert.cpp ****         byte = *data_in;
 2238              		.loc 1 581 9 is_stmt 1 view .LVU791
 582:lib_convert.cpp ****         byte >>= 4;
 2239              		.loc 1 582 9 view .LVU792
 2240              		.loc 1 582 14 is_stmt 0 view .LVU793
 2241 0850 0FB601   		movzbl	(%rcx), %eax
 2242 0853 C0E804   		shrb	$4, %al
 2243              	.LVL272:
 583:lib_convert.cpp ****         byte &= 0x0f;
 2244              		.loc 1 583 9 is_stmt 1 view .LVU794
 584:lib_convert.cpp ****         if (byte > (uint8_t) 9) {
 2245              		.loc 1 584 9 view .LVU795
 585:lib_convert.cpp ****             byte += 0x37;
 2246              		.loc 1 585 18 is_stmt 0 view .LVU796
 2247 0856 8D7837   		leal	55(%rax), %edi
 2248 0859 8D5030   		leal	48(%rax), %edx
 2249 085c 3C0A     		cmpb	$10, %al
 2250 085e 89F8     		movl	%edi, %eax
 2251              	.LVL273:
 2252              		.loc 1 585 18 view .LVU797
 2253 0860 0F42C2   		cmovb	%edx, %eax
 2254              	.LVL274:
 586:lib_convert.cpp ****         } else {
 587:lib_convert.cpp ****             byte += 0x30;
 588:lib_convert.cpp ****         }
 589:lib_convert.cpp ****         *(data_out++) = byte;
 2255              		.loc 1 589 9 is_stmt 1 view .LVU798
 2256              		.loc 1 589 23 is_stmt 0 view .LVU799
 2257 0863 8806     		movb	%al, (%rsi)
 590:lib_convert.cpp ****         byte = *(data_in++);
 2258              		.loc 1 590 9 is_stmt 1 view .LVU800
 2259              		.loc 1 590 25 is_stmt 0 view .LVU801
 2260 0865 4883C101 		addq	$1, %rcx
 2261              	.LVL275:
 591:lib_convert.cpp ****         byte &= 0x0f;
 2262              		.loc 1 591 9 is_stmt 1 view .LVU802
 2263              		.loc 1 591 14 is_stmt 0 view .LVU803
 2264 0869 0FB641FF 		movzbl	-1(%rcx), %eax
 2265 086d 83E00F   		andl	$15, %eax
 2266              	.LVL276:
 592:lib_convert.cpp ****         if (byte > (uint8_t) 9) {
 2267              		.loc 1 592 9 is_stmt 1 view .LVU804
 593:lib_convert.cpp ****             byte += 0x37;
 2268              		.loc 1 593 18 is_stmt 0 view .LVU805
 2269 0870 8D7837   		leal	55(%rax), %edi
 2270 0873 8D5030   		leal	48(%rax), %edx
 2271 0876 3C0A     		cmpb	$10, %al
 2272 0878 89F8     		movl	%edi, %eax
 2273              	.LVL277:
GAS LISTING /tmp/cceaV4lG.s 			page 65


 2274              		.loc 1 593 18 view .LVU806
 2275 087a 0F42C2   		cmovb	%edx, %eax
 2276              	.LVL278:
 594:lib_convert.cpp ****         } else {
 595:lib_convert.cpp ****             byte += 0x30;
 596:lib_convert.cpp ****         }
 597:lib_convert.cpp ****         *(data_out++) = byte;
 2277              		.loc 1 597 9 is_stmt 1 view .LVU807
 2278              		.loc 1 597 19 is_stmt 0 view .LVU808
 2279 087d 4883C602 		addq	$2, %rsi
 2280              	.LVL279:
 2281              		.loc 1 597 23 view .LVU809
 2282 0881 8846FF   		movb	%al, -1(%rsi)
 598:lib_convert.cpp ****         len--;
 2283              		.loc 1 598 9 is_stmt 1 view .LVU810
 580:lib_convert.cpp ****         byte = *data_in;
 2284              		.loc 1 580 12 view .LVU811
 2285 0884 4939C8   		cmpq	%rcx, %r8
 2286 0887 75C7     		jne	.L181
 2287              	.LVL280:
 2288              	.L175:
 599:lib_convert.cpp ****     }
 600:lib_convert.cpp **** }
 2289              		.loc 1 600 1 is_stmt 0 view .LVU812
 2290 0889 C3       		ret
 2291              		.cfi_endproc
 2292              	.LFE73:
 2293              		.size	mem2ascii, .-mem2ascii
 2294              		.globl	dec_to_bcd
 2295              		.type	dec_to_bcd, @function
 2296              	dec_to_bcd:
 2297              	.LVL281:
 2298              	.LFB74:
 601:lib_convert.cpp **** 
 602:lib_convert.cpp **** uint8_t dec_to_bcd(const uint8_t val)
 603:lib_convert.cpp **** {
 2299              		.loc 1 603 1 is_stmt 1 view -0
 2300              		.cfi_startproc
 604:lib_convert.cpp ****     return ((val / 10 * 16) + (val % 10));
 2301              		.loc 1 604 5 view .LVU814
 2302              		.loc 1 604 18 is_stmt 0 view .LVU815
 2303 088a BACDFFFF 		movl	$-51, %edx
 2303      FF
 2304 088f 89D0     		movl	%edx, %eax
 2305 0891 40F6E7   		mulb	%dil
 2306 0894 66C1E80B 		shrw	$11, %ax
 2307              		.loc 1 604 29 view .LVU816
 2308 0898 89C1     		movl	%eax, %ecx
 2309 089a C1E104   		sall	$4, %ecx
 2310              		.loc 1 604 36 view .LVU817
 2311 089d 8D0480   		leal	(%rax,%rax,4), %eax
 2312 08a0 8D1400   		leal	(%rax,%rax), %edx
 2313 08a3 29D7     		subl	%edx, %edi
 2314              	.LVL282:
 2315              		.loc 1 604 41 view .LVU818
 2316 08a5 8D0439   		leal	(%rcx,%rdi), %eax
 605:lib_convert.cpp **** }
GAS LISTING /tmp/cceaV4lG.s 			page 66


 2317              		.loc 1 605 1 view .LVU819
 2318 08a8 C3       		ret
 2319              		.cfi_endproc
 2320              	.LFE74:
 2321              		.size	dec_to_bcd, .-dec_to_bcd
 2322              		.globl	bcd_to_dec
 2323              		.type	bcd_to_dec, @function
 2324              	bcd_to_dec:
 2325              	.LVL283:
 2326              	.LFB75:
 606:lib_convert.cpp **** 
 607:lib_convert.cpp **** uint8_t bcd_to_dec(const uint8_t val)
 608:lib_convert.cpp **** {
 2327              		.loc 1 608 1 is_stmt 1 view -0
 2328              		.cfi_startproc
 609:lib_convert.cpp ****     return ((val & 0xf0) >> 4) * 10 + (val & 0x0f);
 2329              		.loc 1 609 5 view .LVU821
 2330              		.loc 1 609 26 is_stmt 0 view .LVU822
 2331 08a9 89F8     		movl	%edi, %eax
 2332 08ab C0E804   		shrb	$4, %al
 2333              		.loc 1 609 37 view .LVU823
 2334 08ae 8D0480   		leal	(%rax,%rax,4), %eax
 2335              		.loc 1 609 44 view .LVU824
 2336 08b1 83E70F   		andl	$15, %edi
 2337              	.LVL284:
 2338              		.loc 1 609 50 view .LVU825
 2339 08b4 8D0447   		leal	(%rdi,%rax,2), %eax
 610:lib_convert.cpp **** }
 2340              		.loc 1 610 1 view .LVU826
 2341 08b7 C3       		ret
 2342              		.cfi_endproc
 2343              	.LFE75:
 2344              		.size	bcd_to_dec, .-bcd_to_dec
 2345              		.globl	_flip_u16
 2346              		.type	_flip_u16, @function
 2347              	_flip_u16:
 2348              	.LVL285:
 2349              	.LFB76:
 611:lib_convert.cpp **** 
 612:lib_convert.cpp **** uint16_t _flip_u16(const uint16_t val)
 613:lib_convert.cpp **** {
 2350              		.loc 1 613 1 is_stmt 1 view -0
 2351              		.cfi_startproc
 614:lib_convert.cpp ****     uint16_t tmp;
 2352              		.loc 1 614 5 view .LVU828
 615:lib_convert.cpp ****     tmp = val << 8;
 2353              		.loc 1 615 5 view .LVU829
 616:lib_convert.cpp **** 
 617:lib_convert.cpp ****     return ((val >> 8) | tmp);
 2354              		.loc 1 617 5 view .LVU830
 2355              		.loc 1 617 29 is_stmt 0 view .LVU831
 2356 08b8 89F8     		movl	%edi, %eax
 2357 08ba 66C1C008 		rolw	$8, %ax
 618:lib_convert.cpp **** }
 2358              		.loc 1 618 1 view .LVU832
 2359 08be C3       		ret
 2360              		.cfi_endproc
GAS LISTING /tmp/cceaV4lG.s 			page 67


 2361              	.LFE76:
 2362              		.size	_flip_u16, .-_flip_u16
 2363              		.globl	_flip_u32
 2364              		.type	_flip_u32, @function
 2365              	_flip_u32:
 2366              	.LVL286:
 2367              	.LFB77:
 619:lib_convert.cpp **** 
 620:lib_convert.cpp **** uint32_t _flip_u32(const uint32_t val)
 621:lib_convert.cpp **** {
 2368              		.loc 1 621 1 is_stmt 1 view -0
 2369              		.cfi_startproc
 622:lib_convert.cpp ****     uint32_t a, b, c, d;
 2370              		.loc 1 622 5 view .LVU834
 623:lib_convert.cpp **** 
 624:lib_convert.cpp ****     a = (val & 0xff000000) >> 24;
 2371              		.loc 1 624 5 view .LVU835
 625:lib_convert.cpp ****     b = (val & 0x00ff0000) >> 8;
 2372              		.loc 1 625 5 view .LVU836
 626:lib_convert.cpp ****     c = (val & 0x0000ff00) << 8;
 2373              		.loc 1 626 5 view .LVU837
 627:lib_convert.cpp ****     d = (val & 0x000000ff) << 24;
 2374              		.loc 1 627 5 view .LVU838
 628:lib_convert.cpp **** 
 629:lib_convert.cpp ****     return (a | b | c | d);
 2375              		.loc 1 629 5 view .LVU839
 624:lib_convert.cpp ****     b = (val & 0x00ff0000) >> 8;
 2376              		.loc 1 624 7 is_stmt 0 view .LVU840
 2377 08bf 89F8     		movl	%edi, %eax
 2378 08c1 C1E818   		shrl	$24, %eax
 2379              	.LVL287:
 627:lib_convert.cpp ****     d = (val & 0x000000ff) << 24;
 2380              		.loc 1 627 7 view .LVU841
 2381 08c4 89FA     		movl	%edi, %edx
 2382 08c6 C1E218   		sall	$24, %edx
 2383              	.LVL288:
 2384              		.loc 1 629 26 view .LVU842
 2385 08c9 09D0     		orl	%edx, %eax
 2386              	.LVL289:
 625:lib_convert.cpp ****     c = (val & 0x0000ff00) << 8;
 2387              		.loc 1 625 28 view .LVU843
 2388 08cb 89FA     		movl	%edi, %edx
 2389              	.LVL290:
 625:lib_convert.cpp ****     c = (val & 0x0000ff00) << 8;
 2390              		.loc 1 625 28 view .LVU844
 2391 08cd C1EA08   		shrl	$8, %edx
 625:lib_convert.cpp ****     c = (val & 0x0000ff00) << 8;
 2392              		.loc 1 625 7 view .LVU845
 2393 08d0 81E200FF 		andl	$65280, %edx
 2393      0000
 2394              	.LVL291:
 2395              		.loc 1 629 26 view .LVU846
 2396 08d6 09D0     		orl	%edx, %eax
 626:lib_convert.cpp ****     d = (val & 0x000000ff) << 24;
 2397              		.loc 1 626 28 view .LVU847
 2398 08d8 C1E708   		sall	$8, %edi
 2399              	.LVL292:
GAS LISTING /tmp/cceaV4lG.s 			page 68


 626:lib_convert.cpp ****     d = (val & 0x000000ff) << 24;
 2400              		.loc 1 626 7 view .LVU848
 2401 08db 81E70000 		andl	$16711680, %edi
 2401      FF00
 2402              	.LVL293:
 2403              		.loc 1 629 26 view .LVU849
 2404 08e1 09F8     		orl	%edi, %eax
 630:lib_convert.cpp **** }
 2405              		.loc 1 630 1 view .LVU850
 2406 08e3 C3       		ret
 2407              		.cfi_endproc
 2408              	.LFE77:
 2409              		.size	_flip_u32, .-_flip_u32
 2410              		.globl	_wiretou32
 2411              		.type	_wiretou32, @function
 2412              	_wiretou32:
 2413              	.LVL294:
 2414              	.LFB78:
 631:lib_convert.cpp **** 
 632:lib_convert.cpp **** uint32_t _wiretou32(char *buf, const uint16_t seek, const uint16_t len)
 633:lib_convert.cpp **** {
 2415              		.loc 1 633 1 is_stmt 1 view -0
 2416              		.cfi_startproc
 2417              		.loc 1 633 1 is_stmt 0 view .LVU852
 2418 08e4 4989F8   		movq	%rdi, %r8
 2419 08e7 4189F2   		movl	%esi, %r10d
 634:lib_convert.cpp ****     uint32_t val = 0, c = 0;    //, pow = 1;
 2420              		.loc 1 634 5 is_stmt 1 view .LVU853
 2421              	.LVL295:
 635:lib_convert.cpp ****     uint8_t i, buf0;
 2422              		.loc 1 635 5 view .LVU854
 636:lib_convert.cpp ****     //char itoa_buf[18];
 637:lib_convert.cpp **** 
 638:lib_convert.cpp ****     buf0 = buf[seek];
 2423              		.loc 1 638 5 view .LVU855
 2424              		.loc 1 638 16 is_stmt 0 view .LVU856
 2425 08ea 0FB7F6   		movzwl	%si, %esi
 2426              	.LVL296:
 2427              		.loc 1 638 10 view .LVU857
 2428 08ed 0FB60437 		movzbl	(%rdi,%rsi), %eax
 2429              	.LVL297:
 639:lib_convert.cpp **** 
 640:lib_convert.cpp ****     if ((buf0 < 0x30) || (buf0 > 0x46) || (buf0 == 0x40)) {
 2430              		.loc 1 640 5 is_stmt 1 view .LVU858
 2431              		.loc 1 640 23 is_stmt 0 view .LVU859
 2432 08f1 8D48D0   		leal	-48(%rax), %ecx
 2433              		.loc 1 640 5 view .LVU860
 2434 08f4 80F916   		cmpb	$22, %cl
 2435 08f7 777F     		ja	.L188
 2436 08f9 3C40     		cmpb	$64, %al
 2437 08fb 747B     		je	.L188
 2438              	.LVL298:
 641:lib_convert.cpp ****         // binary input
 642:lib_convert.cpp ****         for (i = 0; i < len; i++) {
 643:lib_convert.cpp ****             c = buf[seek + len - i - 1];
 644:lib_convert.cpp ****             val |= c << (i * 8);
 645:lib_convert.cpp ****         }
GAS LISTING /tmp/cceaV4lG.s 			page 69


 646:lib_convert.cpp ****         return val;
 647:lib_convert.cpp ****     }
 648:lib_convert.cpp ****     // ascii(hex) input
 649:lib_convert.cpp ****     for (i = 0; i < len / 2; i++) {
 2439              		.loc 1 649 19 is_stmt 1 view .LVU861
 2440              		.loc 1 649 25 is_stmt 0 view .LVU862
 2441 08fd 4189D3   		movl	%edx, %r11d
 2442 0900 6641D1EB 		shrw	%r11w
 2443 0904 450FB7DB 		movzwl	%r11w, %r11d
 2444              		.loc 1 649 12 view .LVU863
 2445 0908 41B90000 		movl	$0, %r9d
 2445      0000
 634:lib_convert.cpp ****     uint8_t i, buf0;
 2446              		.loc 1 634 14 view .LVU864
 2447 090e BF000000 		movl	$0, %edi
 2447      00
 2448              	.LVL299:
 2449              		.loc 1 649 17 view .LVU865
 2450 0913 B9000000 		movl	$0, %ecx
 2450      00
 650:lib_convert.cpp ****         c = buf[seek + i * 2];
 2451              		.loc 1 650 17 view .LVU866
 2452 0918 450FB7D2 		movzwl	%r10w, %r10d
 649:lib_convert.cpp ****         c = buf[seek + i * 2];
 2453              		.loc 1 649 19 view .LVU867
 2454 091c 6683FA01 		cmpw	$1, %dx
 2455 0920 0F869200 		jbe	.L202
 2455      0000
 633:lib_convert.cpp ****     uint32_t val = 0, c = 0;    //, pow = 1;
 2456              		.loc 1 633 1 view .LVU868
 2457 0926 53       		pushq	%rbx
 2458              		.cfi_def_cfa_offset 16
 2459              		.cfi_offset 3, -16
 2460              	.LVL300:
 2461              	.L189:
 2462              		.loc 1 650 9 is_stmt 1 view .LVU869
 2463              		.loc 1 650 22 is_stmt 0 view .LVU870
 2464 0927 418D1C4A 		leal	(%r10,%rcx,2), %ebx
 2465 092b 4863DB   		movslq	%ebx, %rbx
 2466              		.loc 1 650 11 view .LVU871
 2467 092e 410FBE14 		movsbl	(%r8,%rbx), %edx
 2467      18
 2468              	.LVL301:
 651:lib_convert.cpp ****         if (c < 0x40) {
 2469              		.loc 1 651 9 is_stmt 1 view .LVU872
 652:lib_convert.cpp ****             c -= 48;
 2470              		.loc 1 652 15 is_stmt 0 view .LVU873
 2471 0933 8D72D0   		leal	-48(%rdx), %esi
 2472 0936 8D42C9   		leal	-55(%rdx), %eax
 2473 0939 83FA3F   		cmpl	$63, %edx
 2474 093c 0F46C6   		cmovbe	%esi, %eax
 2475              	.LVL302:
 653:lib_convert.cpp ****         } else {
 654:lib_convert.cpp ****             c -= 55;
 655:lib_convert.cpp ****         }
 656:lib_convert.cpp ****         val |= c << (i * 8 + 4);
 2476              		.loc 1 656 9 is_stmt 1 view .LVU874
GAS LISTING /tmp/cceaV4lG.s 			page 70


 2477              		.loc 1 656 24 is_stmt 0 view .LVU875
 2478 093f 8D14CD00 		leal	0(,%rcx,8), %edx
 2478      000000
 2479              		.loc 1 656 28 view .LVU876
 2480 0946 8D4A04   		leal	4(%rdx), %ecx
 2481              		.loc 1 656 18 view .LVU877
 2482 0949 D3E0     		sall	%cl, %eax
 2483              	.LVL303:
 2484              		.loc 1 656 18 view .LVU878
 2485 094b 89C6     		movl	%eax, %esi
 2486              	.LVL304:
 657:lib_convert.cpp ****         c = buf[seek + i * 2 + 1];
 2487              		.loc 1 657 9 is_stmt 1 view .LVU879
 2488              		.loc 1 657 11 is_stmt 0 view .LVU880
 2489 094d 410FBE4C 		movsbl	1(%r8,%rbx), %ecx
 2489      1801
 2490              	.LVL305:
 658:lib_convert.cpp ****         if (c < 0x40) {
 2491              		.loc 1 658 9 is_stmt 1 view .LVU881
 659:lib_convert.cpp ****             c -= 48;
 2492              		.loc 1 659 15 is_stmt 0 view .LVU882
 2493 0953 8D59D0   		leal	-48(%rcx), %ebx
 2494 0956 8D41C9   		leal	-55(%rcx), %eax
 2495              	.LVL306:
 2496              		.loc 1 659 15 view .LVU883
 2497 0959 83F93F   		cmpl	$63, %ecx
 2498 095c 0F46C3   		cmovbe	%ebx, %eax
 2499              	.LVL307:
 660:lib_convert.cpp ****         } else {
 661:lib_convert.cpp ****             c -= 55;
 662:lib_convert.cpp ****         }
 663:lib_convert.cpp ****         val |= c << (i * 8);
 2500              		.loc 1 663 9 is_stmt 1 view .LVU884
 2501              		.loc 1 663 18 is_stmt 0 view .LVU885
 2502 095f 89D1     		movl	%edx, %ecx
 2503 0961 D3E0     		sall	%cl, %eax
 2504              	.LVL308:
 2505              		.loc 1 663 13 view .LVU886
 2506 0963 09F0     		orl	%esi, %eax
 2507 0965 09C7     		orl	%eax, %edi
 2508              	.LVL309:
 649:lib_convert.cpp ****         c = buf[seek + i * 2];
 2509              		.loc 1 649 5 is_stmt 1 view .LVU887
 2510 0967 4183C101 		addl	$1, %r9d
 2511              	.LVL310:
 649:lib_convert.cpp ****         c = buf[seek + i * 2];
 2512              		.loc 1 649 19 view .LVU888
 649:lib_convert.cpp ****         c = buf[seek + i * 2];
 2513              		.loc 1 649 17 is_stmt 0 view .LVU889
 2514 096b 410FB6C9 		movzbl	%r9b, %ecx
 649:lib_convert.cpp ****         c = buf[seek + i * 2];
 2515              		.loc 1 649 19 view .LVU890
 2516 096f 4439D9   		cmpl	%r11d, %ecx
 2517 0972 7CB3     		jl	.L189
 664:lib_convert.cpp ****     }
 665:lib_convert.cpp **** 
 666:lib_convert.cpp **** /*
GAS LISTING /tmp/cceaV4lG.s 			page 71


 667:lib_convert.cpp ****     uart0_print(" val ");
 668:lib_convert.cpp ****     uart0_print(_utoh(&itoa_buf[0], val));
 669:lib_convert.cpp ****     uart0_print("\r\n");
 670:lib_convert.cpp **** */
 671:lib_convert.cpp ****     return val;
 672:lib_convert.cpp **** }
 2518              		.loc 1 672 1 view .LVU891
 2519 0974 89F8     		movl	%edi, %eax
 2520 0976 5B       		popq	%rbx
 2521              		.cfi_def_cfa_offset 8
 2522              	.LVL311:
 2523              		.loc 1 672 1 view .LVU892
 2524 0977 C3       		ret
 2525              	.LVL312:
 2526              	.L188:
 2527              		.cfi_restore 3
 642:lib_convert.cpp ****             c = buf[seek + len - i - 1];
 2528              		.loc 1 642 23 is_stmt 1 view .LVU893
 2529 0978 81E2FFFF 		andl	$65535, %edx
 2529      0000
 2530              	.LVL313:
 642:lib_convert.cpp ****             c = buf[seek + len - i - 1];
 2531              		.loc 1 642 23 is_stmt 0 view .LVU894
 2532 097e 743B     		je	.L197
 642:lib_convert.cpp ****             c = buf[seek + len - i - 1];
 2533              		.loc 1 642 16 view .LVU895
 2534 0980 41B90000 		movl	$0, %r9d
 2534      0000
 634:lib_convert.cpp ****     uint8_t i, buf0;
 2535              		.loc 1 634 14 view .LVU896
 2536 0986 BF000000 		movl	$0, %edi
 2536      00
 2537              	.LVL314:
 642:lib_convert.cpp ****             c = buf[seek + len - i - 1];
 2538              		.loc 1 642 21 view .LVU897
 2539 098b B9000000 		movl	$0, %ecx
 2539      00
 643:lib_convert.cpp ****             val |= c << (i * 8);
 2540              		.loc 1 643 21 view .LVU898
 2541 0990 450FB7D2 		movzwl	%r10w, %r10d
 643:lib_convert.cpp ****             val |= c << (i * 8);
 2542              		.loc 1 643 26 view .LVU899
 2543 0994 418D0412 		leal	(%r10,%rdx), %eax
 2544              	.LVL315:
 2545              	.L191:
 643:lib_convert.cpp ****             val |= c << (i * 8);
 2546              		.loc 1 643 13 is_stmt 1 discriminator 3 view .LVU900
 644:lib_convert.cpp ****         }
 2547              		.loc 1 644 13 discriminator 3 view .LVU901
 643:lib_convert.cpp ****             val |= c << (i * 8);
 2548              		.loc 1 643 32 is_stmt 0 discriminator 3 view .LVU902
 2549 0998 89C6     		movl	%eax, %esi
 2550 099a 29CE     		subl	%ecx, %esi
 2551 099c 4863F6   		movslq	%esi, %rsi
 643:lib_convert.cpp ****             val |= c << (i * 8);
 2552              		.loc 1 643 15 discriminator 3 view .LVU903
 2553 099f 410FBE74 		movsbl	-1(%r8,%rsi), %esi
GAS LISTING /tmp/cceaV4lG.s 			page 72


 2553      30FF
 644:lib_convert.cpp ****         }
 2554              		.loc 1 644 28 discriminator 3 view .LVU904
 2555 09a5 C1E103   		sall	$3, %ecx
 644:lib_convert.cpp ****         }
 2556              		.loc 1 644 22 discriminator 3 view .LVU905
 2557 09a8 D3E6     		sall	%cl, %esi
 644:lib_convert.cpp ****         }
 2558              		.loc 1 644 17 discriminator 3 view .LVU906
 2559 09aa 09F7     		orl	%esi, %edi
 2560              	.LVL316:
 642:lib_convert.cpp ****             c = buf[seek + len - i - 1];
 2561              		.loc 1 642 9 is_stmt 1 discriminator 3 view .LVU907
 2562 09ac 4183C101 		addl	$1, %r9d
 2563              	.LVL317:
 642:lib_convert.cpp ****             c = buf[seek + len - i - 1];
 2564              		.loc 1 642 23 discriminator 3 view .LVU908
 642:lib_convert.cpp ****             c = buf[seek + len - i - 1];
 2565              		.loc 1 642 21 is_stmt 0 discriminator 3 view .LVU909
 2566 09b0 410FB6C9 		movzbl	%r9b, %ecx
 642:lib_convert.cpp ****             c = buf[seek + len - i - 1];
 2567              		.loc 1 642 23 discriminator 3 view .LVU910
 2568 09b4 39D1     		cmpl	%edx, %ecx
 2569 09b6 7CE0     		jl	.L191
 2570              	.LVL318:
 2571              	.L202:
 2572              		.loc 1 672 1 view .LVU911
 2573 09b8 89F8     		movl	%edi, %eax
 2574 09ba C3       		ret
 2575              	.LVL319:
 2576              	.L197:
 634:lib_convert.cpp ****     uint8_t i, buf0;
 2577              		.loc 1 634 14 view .LVU912
 2578 09bb BF000000 		movl	$0, %edi
 2578      00
 2579              	.LVL320:
 634:lib_convert.cpp ****     uint8_t i, buf0;
 2580              		.loc 1 634 14 view .LVU913
 2581 09c0 EBF6     		jmp	.L202
 2582              		.cfi_endproc
 2583              	.LFE78:
 2584              		.size	_wiretou32, .-_wiretou32
 2585              		.section	.rodata
 2586              		.align 32
 2587              		.type	_ZL14caps_hex_ascii, @object
 2588              		.size	_ZL14caps_hex_ascii, 32
 2589              	_ZL14caps_hex_ascii:
 2590 0000 3000     		.value	48
 2591 0002 3100     		.value	49
 2592 0004 3200     		.value	50
 2593 0006 3300     		.value	51
 2594 0008 3400     		.value	52
 2595 000a 3500     		.value	53
 2596 000c 3600     		.value	54
 2597 000e 3700     		.value	55
 2598 0010 3800     		.value	56
 2599 0012 3900     		.value	57
GAS LISTING /tmp/cceaV4lG.s 			page 73


 2600 0014 4100     		.value	65
 2601 0016 4200     		.value	66
 2602 0018 4300     		.value	67
 2603 001a 4400     		.value	68
 2604 001c 4500     		.value	69
 2605 001e 4600     		.value	70
 2606              		.align 32
 2607              		.type	_ZL9hex_ascii, @object
 2608              		.size	_ZL9hex_ascii, 32
 2609              	_ZL9hex_ascii:
 2610 0020 3000     		.value	48
 2611 0022 3100     		.value	49
 2612 0024 3200     		.value	50
 2613 0026 3300     		.value	51
 2614 0028 3400     		.value	52
 2615 002a 3500     		.value	53
 2616 002c 3600     		.value	54
 2617 002e 3700     		.value	55
 2618 0030 3800     		.value	56
 2619 0032 3900     		.value	57
 2620 0034 6100     		.value	97
 2621 0036 6200     		.value	98
 2622 0038 6300     		.value	99
 2623 003a 6400     		.value	100
 2624 003c 6500     		.value	101
 2625 003e 6600     		.value	102
 2626              		.text
 2627              	.Letext0:
 2628              		.file 3 "/usr/include/bits/types.h"
 2629              		.file 4 "/usr/include/bits/stdint-intn.h"
 2630              		.file 5 "/usr/include/bits/stdint-uintn.h"
 2631              		.file 6 "/usr/lib/gcc/x86_64-pc-linux-gnu/12/include/stddef.h"
 2632              		.file 7 "/usr/include/stdlib.h"
 2633              		.file 8 "/usr/lib/gcc/x86_64-pc-linux-gnu/12/include/g++-v12/cstdlib"
 2634              		.file 9 "/usr/lib/gcc/x86_64-pc-linux-gnu/12/include/g++-v12/bits/std_abs.h"
 2635              		.file 10 "/usr/include/bits/stdlib-float.h"
 2636              		.file 11 "/usr/include/bits/stdlib-bsearch.h"
 2637              		.file 12 "/usr/include/bits/stdlib.h"
 2638              		.file 13 "/usr/lib/gcc/x86_64-pc-linux-gnu/12/include/g++-v12/stdlib.h"
 2639              		.file 14 "lib_convert.h"
 2640              		.file 15 "/usr/include/string.h"
 2641              		.file 16 "/usr/lib/gcc/x86_64-pc-linux-gnu/12/include/g++-v12/x86_64-pc-linux-gnu/bits/c++config.h
 2642              		.section	.debug_info,"",@progbits
 2643              	.Ldebug_info0:
 2644 0000 031C0000 		.long	0x1c03
 2645 0004 0500     		.value	0x5
 2646 0006 01       		.byte	0x1
 2647 0007 08       		.byte	0x8
 2648 0008 00000000 		.long	.Ldebug_abbrev0
 2649 000c 27       		.uleb128 0x27
 2650 000d 00000000 		.long	.LASF122
 2651 0011 21       		.byte	0x21
 2652 0012 00000000 		.long	.LASF0
 2653 0016 00000000 		.long	.LASF1
 2654 001a 00000000 		.quad	.Ltext0
 2654      00000000 
 2655 0022 C2090000 		.quad	.Letext0-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 74


 2655      00000000 
 2656 002a 00000000 		.long	.Ldebug_line0
 2657 002e 08       		.uleb128 0x8
 2658 002f 01       		.byte	0x1
 2659 0030 08       		.byte	0x8
 2660 0031 00000000 		.long	.LASF2
 2661 0035 08       		.uleb128 0x8
 2662 0036 02       		.byte	0x2
 2663 0037 07       		.byte	0x7
 2664 0038 00000000 		.long	.LASF3
 2665 003c 08       		.uleb128 0x8
 2666 003d 04       		.byte	0x4
 2667 003e 07       		.byte	0x7
 2668 003f 00000000 		.long	.LASF4
 2669 0043 08       		.uleb128 0x8
 2670 0044 08       		.byte	0x8
 2671 0045 07       		.byte	0x7
 2672 0046 00000000 		.long	.LASF5
 2673 004a 09       		.uleb128 0x9
 2674 004b 00000000 		.long	.LASF7
 2675 004f 03       		.byte	0x3
 2676 0050 25       		.byte	0x25
 2677 0051 15       		.byte	0x15
 2678 0052 56000000 		.long	0x56
 2679 0056 08       		.uleb128 0x8
 2680 0057 01       		.byte	0x1
 2681 0058 06       		.byte	0x6
 2682 0059 00000000 		.long	.LASF6
 2683 005d 09       		.uleb128 0x9
 2684 005e 00000000 		.long	.LASF8
 2685 0062 03       		.byte	0x3
 2686 0063 26       		.byte	0x26
 2687 0064 17       		.byte	0x17
 2688 0065 2E000000 		.long	0x2e
 2689 0069 09       		.uleb128 0x9
 2690 006a 00000000 		.long	.LASF9
 2691 006e 03       		.byte	0x3
 2692 006f 27       		.byte	0x27
 2693 0070 1A       		.byte	0x1a
 2694 0071 75000000 		.long	0x75
 2695 0075 08       		.uleb128 0x8
 2696 0076 02       		.byte	0x2
 2697 0077 05       		.byte	0x5
 2698 0078 00000000 		.long	.LASF10
 2699 007c 09       		.uleb128 0x9
 2700 007d 00000000 		.long	.LASF11
 2701 0081 03       		.byte	0x3
 2702 0082 28       		.byte	0x28
 2703 0083 1C       		.byte	0x1c
 2704 0084 35000000 		.long	0x35
 2705 0088 09       		.uleb128 0x9
 2706 0089 00000000 		.long	.LASF12
 2707 008d 03       		.byte	0x3
 2708 008e 29       		.byte	0x29
 2709 008f 14       		.byte	0x14
 2710 0090 94000000 		.long	0x94
 2711 0094 28       		.uleb128 0x28
GAS LISTING /tmp/cceaV4lG.s 			page 75


 2712 0095 04       		.byte	0x4
 2713 0096 05       		.byte	0x5
 2714 0097 696E7400 		.string	"int"
 2715 009b 09       		.uleb128 0x9
 2716 009c 00000000 		.long	.LASF13
 2717 00a0 03       		.byte	0x3
 2718 00a1 2A       		.byte	0x2a
 2719 00a2 16       		.byte	0x16
 2720 00a3 3C000000 		.long	0x3c
 2721 00a7 08       		.uleb128 0x8
 2722 00a8 08       		.byte	0x8
 2723 00a9 05       		.byte	0x5
 2724 00aa 00000000 		.long	.LASF14
 2725 00ae 29       		.uleb128 0x29
 2726 00af 08       		.byte	0x8
 2727 00b0 20       		.uleb128 0x20
 2728 00b1 AE000000 		.long	0xae
 2729 00b5 0C       		.uleb128 0xc
 2730 00b6 BA000000 		.long	0xba
 2731 00ba 08       		.uleb128 0x8
 2732 00bb 01       		.byte	0x1
 2733 00bc 06       		.byte	0x6
 2734 00bd 00000000 		.long	.LASF15
 2735 00c1 0F       		.uleb128 0xf
 2736 00c2 BA000000 		.long	0xba
 2737 00c6 09       		.uleb128 0x9
 2738 00c7 00000000 		.long	.LASF16
 2739 00cb 04       		.byte	0x4
 2740 00cc 18       		.byte	0x18
 2741 00cd 12       		.byte	0x12
 2742 00ce 4A000000 		.long	0x4a
 2743 00d2 09       		.uleb128 0x9
 2744 00d3 00000000 		.long	.LASF17
 2745 00d7 04       		.byte	0x4
 2746 00d8 19       		.byte	0x19
 2747 00d9 13       		.byte	0x13
 2748 00da 69000000 		.long	0x69
 2749 00de 0F       		.uleb128 0xf
 2750 00df D2000000 		.long	0xd2
 2751 00e3 09       		.uleb128 0x9
 2752 00e4 00000000 		.long	.LASF18
 2753 00e8 04       		.byte	0x4
 2754 00e9 1A       		.byte	0x1a
 2755 00ea 13       		.byte	0x13
 2756 00eb 88000000 		.long	0x88
 2757 00ef 0F       		.uleb128 0xf
 2758 00f0 E3000000 		.long	0xe3
 2759 00f4 09       		.uleb128 0x9
 2760 00f5 00000000 		.long	.LASF19
 2761 00f9 05       		.byte	0x5
 2762 00fa 18       		.byte	0x18
 2763 00fb 13       		.byte	0x13
 2764 00fc 5D000000 		.long	0x5d
 2765 0100 0F       		.uleb128 0xf
 2766 0101 F4000000 		.long	0xf4
 2767 0105 09       		.uleb128 0x9
 2768 0106 00000000 		.long	.LASF20
GAS LISTING /tmp/cceaV4lG.s 			page 76


 2769 010a 05       		.byte	0x5
 2770 010b 19       		.byte	0x19
 2771 010c 14       		.byte	0x14
 2772 010d 7C000000 		.long	0x7c
 2773 0111 0F       		.uleb128 0xf
 2774 0112 05010000 		.long	0x105
 2775 0116 09       		.uleb128 0x9
 2776 0117 00000000 		.long	.LASF21
 2777 011b 05       		.byte	0x5
 2778 011c 1A       		.byte	0x1a
 2779 011d 14       		.byte	0x14
 2780 011e 9B000000 		.long	0x9b
 2781 0122 0F       		.uleb128 0xf
 2782 0123 16010000 		.long	0x116
 2783 0127 09       		.uleb128 0x9
 2784 0128 00000000 		.long	.LASF22
 2785 012c 06       		.byte	0x6
 2786 012d D6       		.byte	0xd6
 2787 012e 17       		.byte	0x17
 2788 012f 43000000 		.long	0x43
 2789 0133 0C       		.uleb128 0xc
 2790 0134 C1000000 		.long	0xc1
 2791 0138 08       		.uleb128 0x8
 2792 0139 20       		.byte	0x20
 2793 013a 03       		.byte	0x3
 2794 013b 00000000 		.long	.LASF23
 2795 013f 08       		.uleb128 0x8
 2796 0140 10       		.byte	0x10
 2797 0141 04       		.byte	0x4
 2798 0142 00000000 		.long	.LASF24
 2799 0146 08       		.uleb128 0x8
 2800 0147 04       		.byte	0x4
 2801 0148 04       		.byte	0x4
 2802 0149 00000000 		.long	.LASF25
 2803 014d 08       		.uleb128 0x8
 2804 014e 08       		.byte	0x8
 2805 014f 04       		.byte	0x4
 2806 0150 00000000 		.long	.LASF26
 2807 0154 08       		.uleb128 0x8
 2808 0155 10       		.byte	0x10
 2809 0156 04       		.byte	0x4
 2810 0157 00000000 		.long	.LASF27
 2811 015b 18       		.uleb128 0x18
 2812 015c 08       		.byte	0x8
 2813 015d 3C       		.byte	0x3c
 2814 015e 00000000 		.long	.LASF30
 2815 0162 7E010000 		.long	0x17e
 2816 0166 19       		.uleb128 0x19
 2817 0167 00000000 		.long	.LASF28
 2818 016b 3D       		.byte	0x3d
 2819 016c 09       		.byte	0x9
 2820 016d 94000000 		.long	0x94
 2821 0171 1A       		.uleb128 0x1a
 2822 0172 72656D00 		.string	"rem"
 2823 0176 3E       		.byte	0x3e
 2824 0177 09       		.byte	0x9
 2825 0178 94000000 		.long	0x94
GAS LISTING /tmp/cceaV4lG.s 			page 77


 2826 017c 04       		.byte	0x4
 2827 017d 00       		.byte	0
 2828 017e 09       		.uleb128 0x9
 2829 017f 00000000 		.long	.LASF29
 2830 0183 07       		.byte	0x7
 2831 0184 3F       		.byte	0x3f
 2832 0185 05       		.byte	0x5
 2833 0186 5B010000 		.long	0x15b
 2834 018a 18       		.uleb128 0x18
 2835 018b 10       		.byte	0x10
 2836 018c 44       		.byte	0x44
 2837 018d 00000000 		.long	.LASF31
 2838 0191 AD010000 		.long	0x1ad
 2839 0195 19       		.uleb128 0x19
 2840 0196 00000000 		.long	.LASF28
 2841 019a 45       		.byte	0x45
 2842 019b 0E       		.byte	0xe
 2843 019c A7000000 		.long	0xa7
 2844 01a0 1A       		.uleb128 0x1a
 2845 01a1 72656D00 		.string	"rem"
 2846 01a5 46       		.byte	0x46
 2847 01a6 0E       		.byte	0xe
 2848 01a7 A7000000 		.long	0xa7
 2849 01ab 08       		.byte	0x8
 2850 01ac 00       		.byte	0
 2851 01ad 09       		.uleb128 0x9
 2852 01ae 00000000 		.long	.LASF32
 2853 01b2 07       		.byte	0x7
 2854 01b3 47       		.byte	0x47
 2855 01b4 05       		.byte	0x5
 2856 01b5 8A010000 		.long	0x18a
 2857 01b9 18       		.uleb128 0x18
 2858 01ba 10       		.byte	0x10
 2859 01bb 4E       		.byte	0x4e
 2860 01bc 00000000 		.long	.LASF33
 2861 01c0 DC010000 		.long	0x1dc
 2862 01c4 19       		.uleb128 0x19
 2863 01c5 00000000 		.long	.LASF28
 2864 01c9 4F       		.byte	0x4f
 2865 01ca 13       		.byte	0x13
 2866 01cb DC010000 		.long	0x1dc
 2867 01cf 1A       		.uleb128 0x1a
 2868 01d0 72656D00 		.string	"rem"
 2869 01d4 50       		.byte	0x50
 2870 01d5 13       		.byte	0x13
 2871 01d6 DC010000 		.long	0x1dc
 2872 01da 08       		.byte	0x8
 2873 01db 00       		.byte	0
 2874 01dc 08       		.uleb128 0x8
 2875 01dd 08       		.byte	0x8
 2876 01de 05       		.byte	0x5
 2877 01df 00000000 		.long	.LASF34
 2878 01e3 09       		.uleb128 0x9
 2879 01e4 00000000 		.long	.LASF35
 2880 01e8 07       		.byte	0x7
 2881 01e9 51       		.byte	0x51
 2882 01ea 05       		.byte	0x5
GAS LISTING /tmp/cceaV4lG.s 			page 78


 2883 01eb B9010000 		.long	0x1b9
 2884 01ef 08       		.uleb128 0x8
 2885 01f0 08       		.byte	0x8
 2886 01f1 07       		.byte	0x7
 2887 01f2 00000000 		.long	.LASF36
 2888 01f6 0C       		.uleb128 0xc
 2889 01f7 E3000000 		.long	0xe3
 2890 01fb 2A       		.uleb128 0x2a
 2891 01fc 00000000 		.long	.LASF37
 2892 0200 07       		.byte	0x7
 2893 0201 3D03     		.value	0x33d
 2894 0203 0F       		.byte	0xf
 2895 0204 08020000 		.long	0x208
 2896 0208 0C       		.uleb128 0xc
 2897 0209 0D020000 		.long	0x20d
 2898 020d 2B       		.uleb128 0x2b
 2899 020e 94000000 		.long	0x94
 2900 0212 21020000 		.long	0x221
 2901 0216 02       		.uleb128 0x2
 2902 0217 21020000 		.long	0x221
 2903 021b 02       		.uleb128 0x2
 2904 021c 21020000 		.long	0x221
 2905 0220 00       		.byte	0
 2906 0221 0C       		.uleb128 0xc
 2907 0222 2B020000 		.long	0x22b
 2908 0226 20       		.uleb128 0x20
 2909 0227 21020000 		.long	0x221
 2910 022b 2C       		.uleb128 0x2c
 2911 022c 2D       		.uleb128 0x2d
 2912 022d 73746400 		.string	"std"
 2913 0231 10       		.byte	0x10
 2914 0232 2801     		.value	0x128
 2915 0234 0B       		.byte	0xb
 2916 0235 FB030000 		.long	0x3fb
 2917 0239 01       		.uleb128 0x1
 2918 023a 08       		.byte	0x8
 2919 023b 7F       		.byte	0x7f
 2920 023c 0B       		.byte	0xb
 2921 023d 7E010000 		.long	0x17e
 2922 0241 01       		.uleb128 0x1
 2923 0242 08       		.byte	0x8
 2924 0243 80       		.byte	0x80
 2925 0244 0B       		.byte	0xb
 2926 0245 AD010000 		.long	0x1ad
 2927 0249 01       		.uleb128 0x1
 2928 024a 08       		.byte	0x8
 2929 024b 86       		.byte	0x86
 2930 024c 0B       		.byte	0xb
 2931 024d FB030000 		.long	0x3fb
 2932 0251 01       		.uleb128 0x1
 2933 0252 08       		.byte	0x8
 2934 0253 89       		.byte	0x89
 2935 0254 0B       		.byte	0xb
 2936 0255 18040000 		.long	0x418
 2937 0259 01       		.uleb128 0x1
 2938 025a 08       		.byte	0x8
 2939 025b 8C       		.byte	0x8c
GAS LISTING /tmp/cceaV4lG.s 			page 79


 2940 025c 0B       		.byte	0xb
 2941 025d 33040000 		.long	0x433
 2942 0261 01       		.uleb128 0x1
 2943 0262 08       		.byte	0x8
 2944 0263 8D       		.byte	0x8d
 2945 0264 0B       		.byte	0xb
 2946 0265 49040000 		.long	0x449
 2947 0269 01       		.uleb128 0x1
 2948 026a 08       		.byte	0x8
 2949 026b 8E       		.byte	0x8e
 2950 026c 0B       		.byte	0xb
 2951 026d 60040000 		.long	0x460
 2952 0271 01       		.uleb128 0x1
 2953 0272 08       		.byte	0x8
 2954 0273 8F       		.byte	0x8f
 2955 0274 0B       		.byte	0xb
 2956 0275 77040000 		.long	0x477
 2957 0279 01       		.uleb128 0x1
 2958 027a 08       		.byte	0x8
 2959 027b 91       		.byte	0x91
 2960 027c 0B       		.byte	0xb
 2961 027d A1040000 		.long	0x4a1
 2962 0281 01       		.uleb128 0x1
 2963 0282 08       		.byte	0x8
 2964 0283 94       		.byte	0x94
 2965 0284 0B       		.byte	0xb
 2966 0285 BD040000 		.long	0x4bd
 2967 0289 01       		.uleb128 0x1
 2968 028a 08       		.byte	0x8
 2969 028b 96       		.byte	0x96
 2970 028c 0B       		.byte	0xb
 2971 028d D4040000 		.long	0x4d4
 2972 0291 01       		.uleb128 0x1
 2973 0292 08       		.byte	0x8
 2974 0293 99       		.byte	0x99
 2975 0294 0B       		.byte	0xb
 2976 0295 F0040000 		.long	0x4f0
 2977 0299 01       		.uleb128 0x1
 2978 029a 08       		.byte	0x8
 2979 029b 9A       		.byte	0x9a
 2980 029c 0B       		.byte	0xb
 2981 029d 0C050000 		.long	0x50c
 2982 02a1 01       		.uleb128 0x1
 2983 02a2 08       		.byte	0x8
 2984 02a3 9B       		.byte	0x9b
 2985 02a4 0B       		.byte	0xb
 2986 02a5 3D050000 		.long	0x53d
 2987 02a9 01       		.uleb128 0x1
 2988 02aa 08       		.byte	0x8
 2989 02ab 9D       		.byte	0x9d
 2990 02ac 0B       		.byte	0xb
 2991 02ad 5E050000 		.long	0x55e
 2992 02b1 01       		.uleb128 0x1
 2993 02b2 08       		.byte	0x8
 2994 02b3 A0       		.byte	0xa0
 2995 02b4 0B       		.byte	0xb
 2996 02b5 7E050000 		.long	0x57e
GAS LISTING /tmp/cceaV4lG.s 			page 80


 2997 02b9 01       		.uleb128 0x1
 2998 02ba 08       		.byte	0x8
 2999 02bb A3       		.byte	0xa3
 3000 02bc 0B       		.byte	0xb
 3001 02bd 91050000 		.long	0x591
 3002 02c1 01       		.uleb128 0x1
 3003 02c2 08       		.byte	0x8
 3004 02c3 A5       		.byte	0xa5
 3005 02c4 0B       		.byte	0xb
 3006 02c5 9E050000 		.long	0x59e
 3007 02c9 01       		.uleb128 0x1
 3008 02ca 08       		.byte	0x8
 3009 02cb A6       		.byte	0xa6
 3010 02cc 0B       		.byte	0xb
 3011 02cd AF050000 		.long	0x5af
 3012 02d1 01       		.uleb128 0x1
 3013 02d2 08       		.byte	0x8
 3014 02d3 A7       		.byte	0xa7
 3015 02d4 0B       		.byte	0xb
 3016 02d5 CF050000 		.long	0x5cf
 3017 02d9 01       		.uleb128 0x1
 3018 02da 08       		.byte	0x8
 3019 02db A8       		.byte	0xa8
 3020 02dc 0B       		.byte	0xb
 3021 02dd EF050000 		.long	0x5ef
 3022 02e1 01       		.uleb128 0x1
 3023 02e2 08       		.byte	0x8
 3024 02e3 A9       		.byte	0xa9
 3025 02e4 0B       		.byte	0xb
 3026 02e5 0F060000 		.long	0x60f
 3027 02e9 01       		.uleb128 0x1
 3028 02ea 08       		.byte	0x8
 3029 02eb AB       		.byte	0xab
 3030 02ec 0B       		.byte	0xb
 3031 02ed 26060000 		.long	0x626
 3032 02f1 01       		.uleb128 0x1
 3033 02f2 08       		.byte	0x8
 3034 02f3 AC       		.byte	0xac
 3035 02f4 0B       		.byte	0xb
 3036 02f5 4B060000 		.long	0x64b
 3037 02f9 01       		.uleb128 0x1
 3038 02fa 08       		.byte	0x8
 3039 02fb F0       		.byte	0xf0
 3040 02fc 16       		.byte	0x16
 3041 02fd E3010000 		.long	0x1e3
 3042 0301 01       		.uleb128 0x1
 3043 0302 08       		.byte	0x8
 3044 0303 F5       		.byte	0xf5
 3045 0304 16       		.byte	0x16
 3046 0305 AB060000 		.long	0x6ab
 3047 0309 01       		.uleb128 0x1
 3048 030a 08       		.byte	0x8
 3049 030b F6       		.byte	0xf6
 3050 030c 16       		.byte	0x16
 3051 030d C5060000 		.long	0x6c5
 3052 0311 01       		.uleb128 0x1
 3053 0312 08       		.byte	0x8
GAS LISTING /tmp/cceaV4lG.s 			page 81


 3054 0313 F8       		.byte	0xf8
 3055 0314 16       		.byte	0x16
 3056 0315 E1060000 		.long	0x6e1
 3057 0319 01       		.uleb128 0x1
 3058 031a 08       		.byte	0x8
 3059 031b F9       		.byte	0xf9
 3060 031c 16       		.byte	0x16
 3061 031d 38070000 		.long	0x738
 3062 0321 01       		.uleb128 0x1
 3063 0322 08       		.byte	0x8
 3064 0323 FA       		.byte	0xfa
 3065 0324 16       		.byte	0x16
 3066 0325 F8060000 		.long	0x6f8
 3067 0329 01       		.uleb128 0x1
 3068 032a 08       		.byte	0x8
 3069 032b FB       		.byte	0xfb
 3070 032c 16       		.byte	0x16
 3071 032d 18070000 		.long	0x718
 3072 0331 01       		.uleb128 0x1
 3073 0332 08       		.byte	0x8
 3074 0333 FC       		.byte	0xfc
 3075 0334 16       		.byte	0x16
 3076 0335 53070000 		.long	0x753
 3077 0339 11       		.uleb128 0x11
 3078 033a 61627300 		.string	"abs"
 3079 033e 67       		.byte	0x67
 3080 033f 00000000 		.long	.LASF38
 3081 0343 3F010000 		.long	0x13f
 3082 0347 51030000 		.long	0x351
 3083 034b 02       		.uleb128 0x2
 3084 034c 3F010000 		.long	0x13f
 3085 0350 00       		.byte	0
 3086 0351 11       		.uleb128 0x11
 3087 0352 61627300 		.string	"abs"
 3088 0356 55       		.byte	0x55
 3089 0357 00000000 		.long	.LASF39
 3090 035b 9E070000 		.long	0x79e
 3091 035f 69030000 		.long	0x369
 3092 0363 02       		.uleb128 0x2
 3093 0364 9E070000 		.long	0x79e
 3094 0368 00       		.byte	0
 3095 0369 11       		.uleb128 0x11
 3096 036a 61627300 		.string	"abs"
 3097 036e 4F       		.byte	0x4f
 3098 036f 00000000 		.long	.LASF40
 3099 0373 54010000 		.long	0x154
 3100 0377 81030000 		.long	0x381
 3101 037b 02       		.uleb128 0x2
 3102 037c 54010000 		.long	0x154
 3103 0380 00       		.byte	0
 3104 0381 11       		.uleb128 0x11
 3105 0382 61627300 		.string	"abs"
 3106 0386 4B       		.byte	0x4b
 3107 0387 00000000 		.long	.LASF41
 3108 038b 46010000 		.long	0x146
 3109 038f 99030000 		.long	0x399
 3110 0393 02       		.uleb128 0x2
GAS LISTING /tmp/cceaV4lG.s 			page 82


 3111 0394 46010000 		.long	0x146
 3112 0398 00       		.byte	0
 3113 0399 11       		.uleb128 0x11
 3114 039a 61627300 		.string	"abs"
 3115 039e 47       		.byte	0x47
 3116 039f 00000000 		.long	.LASF42
 3117 03a3 4D010000 		.long	0x14d
 3118 03a7 B1030000 		.long	0x3b1
 3119 03ab 02       		.uleb128 0x2
 3120 03ac 4D010000 		.long	0x14d
 3121 03b0 00       		.byte	0
 3122 03b1 11       		.uleb128 0x11
 3123 03b2 61627300 		.string	"abs"
 3124 03b6 3D       		.byte	0x3d
 3125 03b7 00000000 		.long	.LASF43
 3126 03bb DC010000 		.long	0x1dc
 3127 03bf C9030000 		.long	0x3c9
 3128 03c3 02       		.uleb128 0x2
 3129 03c4 DC010000 		.long	0x1dc
 3130 03c8 00       		.byte	0
 3131 03c9 11       		.uleb128 0x11
 3132 03ca 61627300 		.string	"abs"
 3133 03ce 38       		.byte	0x38
 3134 03cf 00000000 		.long	.LASF44
 3135 03d3 A7000000 		.long	0xa7
 3136 03d7 E1030000 		.long	0x3e1
 3137 03db 02       		.uleb128 0x2
 3138 03dc A7000000 		.long	0xa7
 3139 03e0 00       		.byte	0
 3140 03e1 21       		.uleb128 0x21
 3141 03e2 64697600 		.string	"div"
 3142 03e6 B1       		.byte	0xb1
 3143 03e7 00000000 		.long	.LASF67
 3144 03eb AD010000 		.long	0x1ad
 3145 03ef 02       		.uleb128 0x2
 3146 03f0 A7000000 		.long	0xa7
 3147 03f4 02       		.uleb128 0x2
 3148 03f5 A7000000 		.long	0xa7
 3149 03f9 00       		.byte	0
 3150 03fa 00       		.byte	0
 3151 03fb 0E       		.uleb128 0xe
 3152 03fc 00000000 		.long	.LASF45
 3153 0400 07       		.byte	0x7
 3154 0401 6702     		.value	0x267
 3155 0403 0C       		.byte	0xc
 3156 0404 94000000 		.long	0x94
 3157 0408 12040000 		.long	0x412
 3158 040c 02       		.uleb128 0x2
 3159 040d 12040000 		.long	0x412
 3160 0411 00       		.byte	0
 3161 0412 0C       		.uleb128 0xc
 3162 0413 17040000 		.long	0x417
 3163 0417 2E       		.uleb128 0x2e
 3164 0418 2F       		.uleb128 0x2f
 3165 0419 00000000 		.long	.LASF46
 3166 041d 07       		.byte	0x7
 3167 041e 6C02     		.value	0x26c
GAS LISTING /tmp/cceaV4lG.s 			page 83


 3168 0420 12       		.byte	0x12
 3169 0421 00000000 		.long	.LASF46
 3170 0425 94000000 		.long	0x94
 3171 0429 33040000 		.long	0x433
 3172 042d 02       		.uleb128 0x2
 3173 042e 12040000 		.long	0x412
 3174 0432 00       		.byte	0
 3175 0433 0D       		.uleb128 0xd
 3176 0434 00000000 		.long	.LASF47
 3177 0438 0A       		.byte	0xa
 3178 0439 19       		.byte	0x19
 3179 043a 01       		.byte	0x1
 3180 043b 4D010000 		.long	0x14d
 3181 043f 49040000 		.long	0x449
 3182 0443 02       		.uleb128 0x2
 3183 0444 33010000 		.long	0x133
 3184 0448 00       		.byte	0
 3185 0449 0E       		.uleb128 0xe
 3186 044a 00000000 		.long	.LASF48
 3187 044e 07       		.byte	0x7
 3188 044f 6A01     		.value	0x16a
 3189 0451 01       		.byte	0x1
 3190 0452 94000000 		.long	0x94
 3191 0456 60040000 		.long	0x460
 3192 045a 02       		.uleb128 0x2
 3193 045b 33010000 		.long	0x133
 3194 045f 00       		.byte	0
 3195 0460 0E       		.uleb128 0xe
 3196 0461 00000000 		.long	.LASF49
 3197 0465 07       		.byte	0x7
 3198 0466 6F01     		.value	0x16f
 3199 0468 01       		.byte	0x1
 3200 0469 A7000000 		.long	0xa7
 3201 046d 77040000 		.long	0x477
 3202 0471 02       		.uleb128 0x2
 3203 0472 33010000 		.long	0x133
 3204 0476 00       		.byte	0
 3205 0477 0D       		.uleb128 0xd
 3206 0478 00000000 		.long	.LASF50
 3207 047c 0B       		.byte	0xb
 3208 047d 14       		.byte	0x14
 3209 047e 01       		.byte	0x1
 3210 047f AE000000 		.long	0xae
 3211 0483 A1040000 		.long	0x4a1
 3212 0487 02       		.uleb128 0x2
 3213 0488 21020000 		.long	0x221
 3214 048c 02       		.uleb128 0x2
 3215 048d 21020000 		.long	0x221
 3216 0491 02       		.uleb128 0x2
 3217 0492 27010000 		.long	0x127
 3218 0496 02       		.uleb128 0x2
 3219 0497 27010000 		.long	0x127
 3220 049b 02       		.uleb128 0x2
 3221 049c FB010000 		.long	0x1fb
 3222 04a0 00       		.byte	0
 3223 04a1 30       		.uleb128 0x30
 3224 04a2 64697600 		.string	"div"
GAS LISTING /tmp/cceaV4lG.s 			page 84


 3225 04a6 07       		.byte	0x7
 3226 04a7 6903     		.value	0x369
 3227 04a9 0E       		.byte	0xe
 3228 04aa 7E010000 		.long	0x17e
 3229 04ae BD040000 		.long	0x4bd
 3230 04b2 02       		.uleb128 0x2
 3231 04b3 94000000 		.long	0x94
 3232 04b7 02       		.uleb128 0x2
 3233 04b8 94000000 		.long	0x94
 3234 04bc 00       		.byte	0
 3235 04bd 0E       		.uleb128 0xe
 3236 04be 00000000 		.long	.LASF51
 3237 04c2 07       		.byte	0x7
 3238 04c3 8E02     		.value	0x28e
 3239 04c5 0E       		.byte	0xe
 3240 04c6 B5000000 		.long	0xb5
 3241 04ca D4040000 		.long	0x4d4
 3242 04ce 02       		.uleb128 0x2
 3243 04cf 33010000 		.long	0x133
 3244 04d3 00       		.byte	0
 3245 04d4 0E       		.uleb128 0xe
 3246 04d5 00000000 		.long	.LASF52
 3247 04d9 07       		.byte	0x7
 3248 04da 6B03     		.value	0x36b
 3249 04dc 0F       		.byte	0xf
 3250 04dd AD010000 		.long	0x1ad
 3251 04e1 F0040000 		.long	0x4f0
 3252 04e5 02       		.uleb128 0x2
 3253 04e6 A7000000 		.long	0xa7
 3254 04ea 02       		.uleb128 0x2
 3255 04eb A7000000 		.long	0xa7
 3256 04ef 00       		.byte	0
 3257 04f0 0E       		.uleb128 0xe
 3258 04f1 00000000 		.long	.LASF53
 3259 04f5 07       		.byte	0x7
 3260 04f6 AF03     		.value	0x3af
 3261 04f8 0C       		.byte	0xc
 3262 04f9 94000000 		.long	0x94
 3263 04fd 0C050000 		.long	0x50c
 3264 0501 02       		.uleb128 0x2
 3265 0502 33010000 		.long	0x133
 3266 0506 02       		.uleb128 0x2
 3267 0507 27010000 		.long	0x127
 3268 050b 00       		.byte	0
 3269 050c 0D       		.uleb128 0xd
 3270 050d 00000000 		.long	.LASF54
 3271 0511 0C       		.byte	0xc
 3272 0512 75       		.byte	0x75
 3273 0513 01       		.byte	0x1
 3274 0514 27010000 		.long	0x127
 3275 0518 2C050000 		.long	0x52c
 3276 051c 02       		.uleb128 0x2
 3277 051d 2C050000 		.long	0x52c
 3278 0521 02       		.uleb128 0x2
 3279 0522 33010000 		.long	0x133
 3280 0526 02       		.uleb128 0x2
 3281 0527 27010000 		.long	0x127
GAS LISTING /tmp/cceaV4lG.s 			page 85


 3282 052b 00       		.byte	0
 3283 052c 0C       		.uleb128 0xc
 3284 052d 31050000 		.long	0x531
 3285 0531 08       		.uleb128 0x8
 3286 0532 04       		.byte	0x4
 3287 0533 05       		.byte	0x5
 3288 0534 00000000 		.long	.LASF55
 3289 0538 0F       		.uleb128 0xf
 3290 0539 31050000 		.long	0x531
 3291 053d 0E       		.uleb128 0xe
 3292 053e 00000000 		.long	.LASF56
 3293 0542 07       		.byte	0x7
 3294 0543 B203     		.value	0x3b2
 3295 0545 0C       		.byte	0xc
 3296 0546 94000000 		.long	0x94
 3297 054a 5E050000 		.long	0x55e
 3298 054e 02       		.uleb128 0x2
 3299 054f 2C050000 		.long	0x52c
 3300 0553 02       		.uleb128 0x2
 3301 0554 33010000 		.long	0x133
 3302 0558 02       		.uleb128 0x2
 3303 0559 27010000 		.long	0x127
 3304 055d 00       		.byte	0
 3305 055e 22       		.uleb128 0x22
 3306 055f 00000000 		.long	.LASF58
 3307 0563 5303     		.value	0x353
 3308 0565 7E050000 		.long	0x57e
 3309 0569 02       		.uleb128 0x2
 3310 056a AE000000 		.long	0xae
 3311 056e 02       		.uleb128 0x2
 3312 056f 27010000 		.long	0x127
 3313 0573 02       		.uleb128 0x2
 3314 0574 27010000 		.long	0x127
 3315 0578 02       		.uleb128 0x2
 3316 0579 FB010000 		.long	0x1fb
 3317 057d 00       		.byte	0
 3318 057e 31       		.uleb128 0x31
 3319 057f 00000000 		.long	.LASF57
 3320 0583 07       		.byte	0x7
 3321 0584 8302     		.value	0x283
 3322 0586 0D       		.byte	0xd
 3323 0587 91050000 		.long	0x591
 3324 058b 02       		.uleb128 0x2
 3325 058c 94000000 		.long	0x94
 3326 0590 00       		.byte	0
 3327 0591 32       		.uleb128 0x32
 3328 0592 00000000 		.long	.LASF123
 3329 0596 07       		.byte	0x7
 3330 0597 C601     		.value	0x1c6
 3331 0599 0C       		.byte	0xc
 3332 059a 94000000 		.long	0x94
 3333 059e 22       		.uleb128 0x22
 3334 059f 00000000 		.long	.LASF59
 3335 05a3 C801     		.value	0x1c8
 3336 05a5 AF050000 		.long	0x5af
 3337 05a9 02       		.uleb128 0x2
 3338 05aa 3C000000 		.long	0x3c
GAS LISTING /tmp/cceaV4lG.s 			page 86


 3339 05ae 00       		.byte	0
 3340 05af 0D       		.uleb128 0xd
 3341 05b0 00000000 		.long	.LASF60
 3342 05b4 07       		.byte	0x7
 3343 05b5 76       		.byte	0x76
 3344 05b6 0F       		.byte	0xf
 3345 05b7 4D010000 		.long	0x14d
 3346 05bb CA050000 		.long	0x5ca
 3347 05bf 02       		.uleb128 0x2
 3348 05c0 33010000 		.long	0x133
 3349 05c4 02       		.uleb128 0x2
 3350 05c5 CA050000 		.long	0x5ca
 3351 05c9 00       		.byte	0
 3352 05ca 0C       		.uleb128 0xc
 3353 05cb B5000000 		.long	0xb5
 3354 05cf 0D       		.uleb128 0xd
 3355 05d0 00000000 		.long	.LASF61
 3356 05d4 07       		.byte	0x7
 3357 05d5 B1       		.byte	0xb1
 3358 05d6 11       		.byte	0x11
 3359 05d7 A7000000 		.long	0xa7
 3360 05db EF050000 		.long	0x5ef
 3361 05df 02       		.uleb128 0x2
 3362 05e0 33010000 		.long	0x133
 3363 05e4 02       		.uleb128 0x2
 3364 05e5 CA050000 		.long	0x5ca
 3365 05e9 02       		.uleb128 0x2
 3366 05ea 94000000 		.long	0x94
 3367 05ee 00       		.byte	0
 3368 05ef 0D       		.uleb128 0xd
 3369 05f0 00000000 		.long	.LASF62
 3370 05f4 07       		.byte	0x7
 3371 05f5 B5       		.byte	0xb5
 3372 05f6 1A       		.byte	0x1a
 3373 05f7 43000000 		.long	0x43
 3374 05fb 0F060000 		.long	0x60f
 3375 05ff 02       		.uleb128 0x2
 3376 0600 33010000 		.long	0x133
 3377 0604 02       		.uleb128 0x2
 3378 0605 CA050000 		.long	0x5ca
 3379 0609 02       		.uleb128 0x2
 3380 060a 94000000 		.long	0x94
 3381 060e 00       		.byte	0
 3382 060f 0E       		.uleb128 0xe
 3383 0610 00000000 		.long	.LASF63
 3384 0614 07       		.byte	0x7
 3385 0615 2403     		.value	0x324
 3386 0617 0C       		.byte	0xc
 3387 0618 94000000 		.long	0x94
 3388 061c 26060000 		.long	0x626
 3389 0620 02       		.uleb128 0x2
 3390 0621 33010000 		.long	0x133
 3391 0625 00       		.byte	0
 3392 0626 0D       		.uleb128 0xd
 3393 0627 00000000 		.long	.LASF64
 3394 062b 0C       		.byte	0xc
 3395 062c 8F       		.byte	0x8f
GAS LISTING /tmp/cceaV4lG.s 			page 87


 3396 062d 01       		.byte	0x1
 3397 062e 27010000 		.long	0x127
 3398 0632 46060000 		.long	0x646
 3399 0636 02       		.uleb128 0x2
 3400 0637 B5000000 		.long	0xb5
 3401 063b 02       		.uleb128 0x2
 3402 063c 46060000 		.long	0x646
 3403 0640 02       		.uleb128 0x2
 3404 0641 27010000 		.long	0x127
 3405 0645 00       		.byte	0
 3406 0646 0C       		.uleb128 0xc
 3407 0647 38050000 		.long	0x538
 3408 064b 0D       		.uleb128 0xd
 3409 064c 00000000 		.long	.LASF65
 3410 0650 0C       		.byte	0xc
 3411 0651 4F       		.byte	0x4f
 3412 0652 01       		.byte	0x1
 3413 0653 94000000 		.long	0x94
 3414 0657 66060000 		.long	0x666
 3415 065b 02       		.uleb128 0x2
 3416 065c B5000000 		.long	0xb5
 3417 0660 02       		.uleb128 0x2
 3418 0661 31050000 		.long	0x531
 3419 0665 00       		.byte	0
 3420 0666 33       		.uleb128 0x33
 3421 0667 00000000 		.long	.LASF66
 3422 066b 10       		.byte	0x10
 3423 066c 4D01     		.value	0x14d
 3424 066e 0B       		.byte	0xb
 3425 066f C5060000 		.long	0x6c5
 3426 0673 01       		.uleb128 0x1
 3427 0674 08       		.byte	0x8
 3428 0675 C8       		.byte	0xc8
 3429 0676 0B       		.byte	0xb
 3430 0677 E3010000 		.long	0x1e3
 3431 067b 01       		.uleb128 0x1
 3432 067c 08       		.byte	0x8
 3433 067d D8       		.byte	0xd8
 3434 067e 0B       		.byte	0xb
 3435 067f C5060000 		.long	0x6c5
 3436 0683 01       		.uleb128 0x1
 3437 0684 08       		.byte	0x8
 3438 0685 E3       		.byte	0xe3
 3439 0686 0B       		.byte	0xb
 3440 0687 E1060000 		.long	0x6e1
 3441 068b 01       		.uleb128 0x1
 3442 068c 08       		.byte	0x8
 3443 068d E4       		.byte	0xe4
 3444 068e 0B       		.byte	0xb
 3445 068f F8060000 		.long	0x6f8
 3446 0693 01       		.uleb128 0x1
 3447 0694 08       		.byte	0x8
 3448 0695 E5       		.byte	0xe5
 3449 0696 0B       		.byte	0xb
 3450 0697 18070000 		.long	0x718
 3451 069b 01       		.uleb128 0x1
 3452 069c 08       		.byte	0x8
GAS LISTING /tmp/cceaV4lG.s 			page 88


 3453 069d E7       		.byte	0xe7
 3454 069e 0B       		.byte	0xb
 3455 069f 38070000 		.long	0x738
 3456 06a3 01       		.uleb128 0x1
 3457 06a4 08       		.byte	0x8
 3458 06a5 E8       		.byte	0xe8
 3459 06a6 0B       		.byte	0xb
 3460 06a7 53070000 		.long	0x753
 3461 06ab 21       		.uleb128 0x21
 3462 06ac 64697600 		.string	"div"
 3463 06b0 D5       		.byte	0xd5
 3464 06b1 00000000 		.long	.LASF68
 3465 06b5 E3010000 		.long	0x1e3
 3466 06b9 02       		.uleb128 0x2
 3467 06ba DC010000 		.long	0x1dc
 3468 06be 02       		.uleb128 0x2
 3469 06bf DC010000 		.long	0x1dc
 3470 06c3 00       		.byte	0
 3471 06c4 00       		.byte	0
 3472 06c5 0E       		.uleb128 0xe
 3473 06c6 00000000 		.long	.LASF69
 3474 06ca 07       		.byte	0x7
 3475 06cb 6F03     		.value	0x36f
 3476 06cd 1E       		.byte	0x1e
 3477 06ce E3010000 		.long	0x1e3
 3478 06d2 E1060000 		.long	0x6e1
 3479 06d6 02       		.uleb128 0x2
 3480 06d7 DC010000 		.long	0x1dc
 3481 06db 02       		.uleb128 0x2
 3482 06dc DC010000 		.long	0x1dc
 3483 06e0 00       		.byte	0
 3484 06e1 0E       		.uleb128 0xe
 3485 06e2 00000000 		.long	.LASF70
 3486 06e6 07       		.byte	0x7
 3487 06e7 7601     		.value	0x176
 3488 06e9 01       		.byte	0x1
 3489 06ea DC010000 		.long	0x1dc
 3490 06ee F8060000 		.long	0x6f8
 3491 06f2 02       		.uleb128 0x2
 3492 06f3 33010000 		.long	0x133
 3493 06f7 00       		.byte	0
 3494 06f8 0D       		.uleb128 0xd
 3495 06f9 00000000 		.long	.LASF71
 3496 06fd 07       		.byte	0x7
 3497 06fe C9       		.byte	0xc9
 3498 06ff 16       		.byte	0x16
 3499 0700 DC010000 		.long	0x1dc
 3500 0704 18070000 		.long	0x718
 3501 0708 02       		.uleb128 0x2
 3502 0709 33010000 		.long	0x133
 3503 070d 02       		.uleb128 0x2
 3504 070e CA050000 		.long	0x5ca
 3505 0712 02       		.uleb128 0x2
 3506 0713 94000000 		.long	0x94
 3507 0717 00       		.byte	0
 3508 0718 0D       		.uleb128 0xd
 3509 0719 00000000 		.long	.LASF72
GAS LISTING /tmp/cceaV4lG.s 			page 89


 3510 071d 07       		.byte	0x7
 3511 071e CE       		.byte	0xce
 3512 071f 1F       		.byte	0x1f
 3513 0720 EF010000 		.long	0x1ef
 3514 0724 38070000 		.long	0x738
 3515 0728 02       		.uleb128 0x2
 3516 0729 33010000 		.long	0x133
 3517 072d 02       		.uleb128 0x2
 3518 072e CA050000 		.long	0x5ca
 3519 0732 02       		.uleb128 0x2
 3520 0733 94000000 		.long	0x94
 3521 0737 00       		.byte	0
 3522 0738 0D       		.uleb128 0xd
 3523 0739 00000000 		.long	.LASF73
 3524 073d 07       		.byte	0x7
 3525 073e 7C       		.byte	0x7c
 3526 073f 0E       		.byte	0xe
 3527 0740 46010000 		.long	0x146
 3528 0744 53070000 		.long	0x753
 3529 0748 02       		.uleb128 0x2
 3530 0749 33010000 		.long	0x133
 3531 074d 02       		.uleb128 0x2
 3532 074e CA050000 		.long	0x5ca
 3533 0752 00       		.byte	0
 3534 0753 0D       		.uleb128 0xd
 3535 0754 00000000 		.long	.LASF74
 3536 0758 07       		.byte	0x7
 3537 0759 7F       		.byte	0x7f
 3538 075a 14       		.byte	0x14
 3539 075b 54010000 		.long	0x154
 3540 075f 6E070000 		.long	0x76e
 3541 0763 02       		.uleb128 0x2
 3542 0764 33010000 		.long	0x133
 3543 0768 02       		.uleb128 0x2
 3544 0769 CA050000 		.long	0x5ca
 3545 076d 00       		.byte	0
 3546 076e 01       		.uleb128 0x1
 3547 076f 0D       		.byte	0xd
 3548 0770 27       		.byte	0x27
 3549 0771 0C       		.byte	0xc
 3550 0772 FB030000 		.long	0x3fb
 3551 0776 01       		.uleb128 0x1
 3552 0777 0D       		.byte	0xd
 3553 0778 2B       		.byte	0x2b
 3554 0779 0E       		.byte	0xe
 3555 077a 18040000 		.long	0x418
 3556 077e 01       		.uleb128 0x1
 3557 077f 0D       		.byte	0xd
 3558 0780 2E       		.byte	0x2e
 3559 0781 0E       		.byte	0xe
 3560 0782 7E050000 		.long	0x57e
 3561 0786 01       		.uleb128 0x1
 3562 0787 0D       		.byte	0xd
 3563 0788 33       		.byte	0x33
 3564 0789 0C       		.byte	0xc
 3565 078a 7E010000 		.long	0x17e
 3566 078e 01       		.uleb128 0x1
GAS LISTING /tmp/cceaV4lG.s 			page 90


 3567 078f 0D       		.byte	0xd
 3568 0790 34       		.byte	0x34
 3569 0791 0C       		.byte	0xc
 3570 0792 AD010000 		.long	0x1ad
 3571 0796 01       		.uleb128 0x1
 3572 0797 0D       		.byte	0xd
 3573 0798 36       		.byte	0x36
 3574 0799 0C       		.byte	0xc
 3575 079a 39030000 		.long	0x339
 3576 079e 08       		.uleb128 0x8
 3577 079f 10       		.byte	0x10
 3578 07a0 05       		.byte	0x5
 3579 07a1 00000000 		.long	.LASF75
 3580 07a5 01       		.uleb128 0x1
 3581 07a6 0D       		.byte	0xd
 3582 07a7 36       		.byte	0x36
 3583 07a8 0C       		.byte	0xc
 3584 07a9 51030000 		.long	0x351
 3585 07ad 01       		.uleb128 0x1
 3586 07ae 0D       		.byte	0xd
 3587 07af 36       		.byte	0x36
 3588 07b0 0C       		.byte	0xc
 3589 07b1 69030000 		.long	0x369
 3590 07b5 01       		.uleb128 0x1
 3591 07b6 0D       		.byte	0xd
 3592 07b7 36       		.byte	0x36
 3593 07b8 0C       		.byte	0xc
 3594 07b9 81030000 		.long	0x381
 3595 07bd 01       		.uleb128 0x1
 3596 07be 0D       		.byte	0xd
 3597 07bf 36       		.byte	0x36
 3598 07c0 0C       		.byte	0xc
 3599 07c1 99030000 		.long	0x399
 3600 07c5 01       		.uleb128 0x1
 3601 07c6 0D       		.byte	0xd
 3602 07c7 36       		.byte	0x36
 3603 07c8 0C       		.byte	0xc
 3604 07c9 B1030000 		.long	0x3b1
 3605 07cd 01       		.uleb128 0x1
 3606 07ce 0D       		.byte	0xd
 3607 07cf 36       		.byte	0x36
 3608 07d0 0C       		.byte	0xc
 3609 07d1 C9030000 		.long	0x3c9
 3610 07d5 01       		.uleb128 0x1
 3611 07d6 0D       		.byte	0xd
 3612 07d7 37       		.byte	0x37
 3613 07d8 0C       		.byte	0xc
 3614 07d9 33040000 		.long	0x433
 3615 07dd 01       		.uleb128 0x1
 3616 07de 0D       		.byte	0xd
 3617 07df 38       		.byte	0x38
 3618 07e0 0C       		.byte	0xc
 3619 07e1 49040000 		.long	0x449
 3620 07e5 01       		.uleb128 0x1
 3621 07e6 0D       		.byte	0xd
 3622 07e7 39       		.byte	0x39
 3623 07e8 0C       		.byte	0xc
GAS LISTING /tmp/cceaV4lG.s 			page 91


 3624 07e9 60040000 		.long	0x460
 3625 07ed 01       		.uleb128 0x1
 3626 07ee 0D       		.byte	0xd
 3627 07ef 3A       		.byte	0x3a
 3628 07f0 0C       		.byte	0xc
 3629 07f1 77040000 		.long	0x477
 3630 07f5 01       		.uleb128 0x1
 3631 07f6 0D       		.byte	0xd
 3632 07f7 3C       		.byte	0x3c
 3633 07f8 0C       		.byte	0xc
 3634 07f9 AB060000 		.long	0x6ab
 3635 07fd 01       		.uleb128 0x1
 3636 07fe 0D       		.byte	0xd
 3637 07ff 3C       		.byte	0x3c
 3638 0800 0C       		.byte	0xc
 3639 0801 E1030000 		.long	0x3e1
 3640 0805 01       		.uleb128 0x1
 3641 0806 0D       		.byte	0xd
 3642 0807 3C       		.byte	0x3c
 3643 0808 0C       		.byte	0xc
 3644 0809 A1040000 		.long	0x4a1
 3645 080d 01       		.uleb128 0x1
 3646 080e 0D       		.byte	0xd
 3647 080f 3E       		.byte	0x3e
 3648 0810 0C       		.byte	0xc
 3649 0811 BD040000 		.long	0x4bd
 3650 0815 01       		.uleb128 0x1
 3651 0816 0D       		.byte	0xd
 3652 0817 40       		.byte	0x40
 3653 0818 0C       		.byte	0xc
 3654 0819 D4040000 		.long	0x4d4
 3655 081d 01       		.uleb128 0x1
 3656 081e 0D       		.byte	0xd
 3657 081f 43       		.byte	0x43
 3658 0820 0C       		.byte	0xc
 3659 0821 F0040000 		.long	0x4f0
 3660 0825 01       		.uleb128 0x1
 3661 0826 0D       		.byte	0xd
 3662 0827 44       		.byte	0x44
 3663 0828 0C       		.byte	0xc
 3664 0829 0C050000 		.long	0x50c
 3665 082d 01       		.uleb128 0x1
 3666 082e 0D       		.byte	0xd
 3667 082f 45       		.byte	0x45
 3668 0830 0C       		.byte	0xc
 3669 0831 3D050000 		.long	0x53d
 3670 0835 01       		.uleb128 0x1
 3671 0836 0D       		.byte	0xd
 3672 0837 47       		.byte	0x47
 3673 0838 0C       		.byte	0xc
 3674 0839 5E050000 		.long	0x55e
 3675 083d 01       		.uleb128 0x1
 3676 083e 0D       		.byte	0xd
 3677 083f 48       		.byte	0x48
 3678 0840 0C       		.byte	0xc
 3679 0841 91050000 		.long	0x591
 3680 0845 01       		.uleb128 0x1
GAS LISTING /tmp/cceaV4lG.s 			page 92


 3681 0846 0D       		.byte	0xd
 3682 0847 4A       		.byte	0x4a
 3683 0848 0C       		.byte	0xc
 3684 0849 9E050000 		.long	0x59e
 3685 084d 01       		.uleb128 0x1
 3686 084e 0D       		.byte	0xd
 3687 084f 4B       		.byte	0x4b
 3688 0850 0C       		.byte	0xc
 3689 0851 AF050000 		.long	0x5af
 3690 0855 01       		.uleb128 0x1
 3691 0856 0D       		.byte	0xd
 3692 0857 4C       		.byte	0x4c
 3693 0858 0C       		.byte	0xc
 3694 0859 CF050000 		.long	0x5cf
 3695 085d 01       		.uleb128 0x1
 3696 085e 0D       		.byte	0xd
 3697 085f 4D       		.byte	0x4d
 3698 0860 0C       		.byte	0xc
 3699 0861 EF050000 		.long	0x5ef
 3700 0865 01       		.uleb128 0x1
 3701 0866 0D       		.byte	0xd
 3702 0867 4E       		.byte	0x4e
 3703 0868 0C       		.byte	0xc
 3704 0869 0F060000 		.long	0x60f
 3705 086d 01       		.uleb128 0x1
 3706 086e 0D       		.byte	0xd
 3707 086f 50       		.byte	0x50
 3708 0870 0C       		.byte	0xc
 3709 0871 26060000 		.long	0x626
 3710 0875 01       		.uleb128 0x1
 3711 0876 0D       		.byte	0xd
 3712 0877 51       		.byte	0x51
 3713 0878 0C       		.byte	0xc
 3714 0879 4B060000 		.long	0x64b
 3715 087d 34       		.uleb128 0x34
 3716 087e 07       		.byte	0x7
 3717 087f 04       		.byte	0x4
 3718 0880 3C000000 		.long	0x3c
 3719 0884 0E       		.byte	0xe
 3720 0885 28       		.byte	0x28
 3721 0886 0E       		.byte	0xe
 3722 0887 00000000 		.long	.LASF124
 3723 088b A2080000 		.long	0x8a2
 3724 088f 1B       		.uleb128 0x1b
 3725 0890 00000000 		.long	.LASF76
 3726 0894 00       		.byte	0
 3727 0895 1B       		.uleb128 0x1b
 3728 0896 00000000 		.long	.LASF77
 3729 089a 01       		.byte	0x1
 3730 089b 1B       		.uleb128 0x1b
 3731 089c 00000000 		.long	.LASF78
 3732 08a0 02       		.byte	0x2
 3733 08a1 00       		.byte	0
 3734 08a2 09       		.uleb128 0x9
 3735 08a3 00000000 		.long	.LASF79
 3736 08a7 0E       		.byte	0xe
 3737 08a8 2C       		.byte	0x2c
GAS LISTING /tmp/cceaV4lG.s 			page 93


 3738 08a9 03       		.byte	0x3
 3739 08aa 7D080000 		.long	0x87d
 3740 08ae 0F       		.uleb128 0xf
 3741 08af A2080000 		.long	0x8a2
 3742 08b3 35       		.uleb128 0x35
 3743 08b4 11010000 		.long	0x111
 3744 08b8 C3080000 		.long	0x8c3
 3745 08bc 36       		.uleb128 0x36
 3746 08bd 43000000 		.long	0x43
 3747 08c1 0F       		.byte	0xf
 3748 08c2 00       		.byte	0
 3749 08c3 0F       		.uleb128 0xf
 3750 08c4 B3080000 		.long	0x8b3
 3751 08c8 37       		.uleb128 0x37
 3752 08c9 00000000 		.long	.LASF80
 3753 08cd 01       		.byte	0x1
 3754 08ce E0       		.byte	0xe0
 3755 08cf 17       		.byte	0x17
 3756 08d0 C3080000 		.long	0x8c3
 3757 08d4 09       		.uleb128 0x9
 3758 08d5 03       		.byte	0x3
 3759 08d6 00000000 		.quad	_ZL9hex_ascii
 3759      00000000 
 3760 08de 38       		.uleb128 0x38
 3761 08df 00000000 		.long	.LASF81
 3762 08e3 01       		.byte	0x1
 3763 08e4 5101     		.value	0x151
 3764 08e6 17       		.byte	0x17
 3765 08e7 C3080000 		.long	0x8c3
 3766 08eb 09       		.uleb128 0x9
 3767 08ec 03       		.byte	0x3
 3768 08ed 00000000 		.quad	_ZL14caps_hex_ascii
 3768      00000000 
 3769 08f5 0E       		.uleb128 0xe
 3770 08f6 00000000 		.long	.LASF82
 3771 08fa 0F       		.byte	0xf
 3772 08fb 9701     		.value	0x197
 3773 08fd 0F       		.byte	0xf
 3774 08fe 27010000 		.long	0x127
 3775 0902 0C090000 		.long	0x90c
 3776 0906 02       		.uleb128 0x2
 3777 0907 33010000 		.long	0x133
 3778 090b 00       		.byte	0
 3779 090c 0B       		.uleb128 0xb
 3780 090d 00000000 		.long	.LASF85
 3781 0911 7802     		.value	0x278
 3782 0913 0A       		.byte	0xa
 3783 0914 16010000 		.long	0x116
 3784 0918 00000000 		.quad	.LFB78
 3784      00000000 
 3785 0920 DE000000 		.quad	.LFE78-.LFB78
 3785      00000000 
 3786 0928 01       		.uleb128 0x1
 3787 0929 9C       		.byte	0x9c
 3788 092a B7090000 		.long	0x9b7
 3789 092e 07       		.uleb128 0x7
 3790 092f 62756600 		.string	"buf"
GAS LISTING /tmp/cceaV4lG.s 			page 94


 3791 0933 7802     		.value	0x278
 3792 0935 1B       		.byte	0x1b
 3793 0936 B5000000 		.long	0xb5
 3794 093a 00000000 		.long	.LLST176
 3795 093e 00000000 		.long	.LVUS176
 3796 0942 12       		.uleb128 0x12
 3797 0943 00000000 		.long	.LASF83
 3798 0947 7802     		.value	0x278
 3799 0949 2F       		.byte	0x2f
 3800 094a 11010000 		.long	0x111
 3801 094e 00000000 		.long	.LLST177
 3802 0952 00000000 		.long	.LVUS177
 3803 0956 07       		.uleb128 0x7
 3804 0957 6C656E00 		.string	"len"
 3805 095b 7802     		.value	0x278
 3806 095d 44       		.byte	0x44
 3807 095e 11010000 		.long	0x111
 3808 0962 00000000 		.long	.LLST178
 3809 0966 00000000 		.long	.LVUS178
 3810 096a 04       		.uleb128 0x4
 3811 096b 76616C00 		.string	"val"
 3812 096f 7A02     		.value	0x27a
 3813 0971 0E       		.byte	0xe
 3814 0972 16010000 		.long	0x116
 3815 0976 00000000 		.long	.LLST179
 3816 097a 00000000 		.long	.LVUS179
 3817 097e 04       		.uleb128 0x4
 3818 097f 6300     		.string	"c"
 3819 0981 7A02     		.value	0x27a
 3820 0983 17       		.byte	0x17
 3821 0984 16010000 		.long	0x116
 3822 0988 00000000 		.long	.LLST180
 3823 098c 00000000 		.long	.LVUS180
 3824 0990 04       		.uleb128 0x4
 3825 0991 6900     		.string	"i"
 3826 0993 7B02     		.value	0x27b
 3827 0995 0D       		.byte	0xd
 3828 0996 F4000000 		.long	0xf4
 3829 099a 00000000 		.long	.LLST181
 3830 099e 00000000 		.long	.LVUS181
 3831 09a2 16       		.uleb128 0x16
 3832 09a3 00000000 		.long	.LASF84
 3833 09a7 7B02     		.value	0x27b
 3834 09a9 10       		.byte	0x10
 3835 09aa F4000000 		.long	0xf4
 3836 09ae 00000000 		.long	.LLST182
 3837 09b2 00000000 		.long	.LVUS182
 3838 09b6 00       		.byte	0
 3839 09b7 0B       		.uleb128 0xb
 3840 09b8 00000000 		.long	.LASF86
 3841 09bc 6C02     		.value	0x26c
 3842 09be 0A       		.byte	0xa
 3843 09bf 16010000 		.long	0x116
 3844 09c3 00000000 		.quad	.LFB77
 3844      00000000 
 3845 09cb 25000000 		.quad	.LFE77-.LFB77
 3845      00000000 
GAS LISTING /tmp/cceaV4lG.s 			page 95


 3846 09d3 01       		.uleb128 0x1
 3847 09d4 9C       		.byte	0x9c
 3848 09d5 360A0000 		.long	0xa36
 3849 09d9 07       		.uleb128 0x7
 3850 09da 76616C00 		.string	"val"
 3851 09de 6C02     		.value	0x26c
 3852 09e0 23       		.byte	0x23
 3853 09e1 22010000 		.long	0x122
 3854 09e5 00000000 		.long	.LLST171
 3855 09e9 00000000 		.long	.LVUS171
 3856 09ed 04       		.uleb128 0x4
 3857 09ee 6100     		.string	"a"
 3858 09f0 6E02     		.value	0x26e
 3859 09f2 0E       		.byte	0xe
 3860 09f3 16010000 		.long	0x116
 3861 09f7 00000000 		.long	.LLST172
 3862 09fb 00000000 		.long	.LVUS172
 3863 09ff 04       		.uleb128 0x4
 3864 0a00 6200     		.string	"b"
 3865 0a02 6E02     		.value	0x26e
 3866 0a04 11       		.byte	0x11
 3867 0a05 16010000 		.long	0x116
 3868 0a09 00000000 		.long	.LLST173
 3869 0a0d 00000000 		.long	.LVUS173
 3870 0a11 04       		.uleb128 0x4
 3871 0a12 6300     		.string	"c"
 3872 0a14 6E02     		.value	0x26e
 3873 0a16 14       		.byte	0x14
 3874 0a17 16010000 		.long	0x116
 3875 0a1b 00000000 		.long	.LLST174
 3876 0a1f 00000000 		.long	.LVUS174
 3877 0a23 04       		.uleb128 0x4
 3878 0a24 6400     		.string	"d"
 3879 0a26 6E02     		.value	0x26e
 3880 0a28 17       		.byte	0x17
 3881 0a29 16010000 		.long	0x116
 3882 0a2d 00000000 		.long	.LLST175
 3883 0a31 00000000 		.long	.LVUS175
 3884 0a35 00       		.byte	0
 3885 0a36 0B       		.uleb128 0xb
 3886 0a37 00000000 		.long	.LASF87
 3887 0a3b 6402     		.value	0x264
 3888 0a3d 0A       		.byte	0xa
 3889 0a3e 05010000 		.long	0x105
 3890 0a42 00000000 		.quad	.LFB76
 3890      00000000 
 3891 0a4a 07000000 		.quad	.LFE76-.LFB76
 3891      00000000 
 3892 0a52 01       		.uleb128 0x1
 3893 0a53 9C       		.byte	0x9c
 3894 0a54 7B0A0000 		.long	0xa7b
 3895 0a58 23       		.uleb128 0x23
 3896 0a59 76616C00 		.string	"val"
 3897 0a5d 6402     		.value	0x264
 3898 0a5f 23       		.byte	0x23
 3899 0a60 11010000 		.long	0x111
 3900 0a64 01       		.uleb128 0x1
GAS LISTING /tmp/cceaV4lG.s 			page 96


 3901 0a65 55       		.byte	0x55
 3902 0a66 04       		.uleb128 0x4
 3903 0a67 746D7000 		.string	"tmp"
 3904 0a6b 6602     		.value	0x266
 3905 0a6d 0E       		.byte	0xe
 3906 0a6e 05010000 		.long	0x105
 3907 0a72 00000000 		.long	.LLST170
 3908 0a76 00000000 		.long	.LVUS170
 3909 0a7a 00       		.byte	0
 3910 0a7b 0B       		.uleb128 0xb
 3911 0a7c 00000000 		.long	.LASF88
 3912 0a80 5F02     		.value	0x25f
 3913 0a82 09       		.byte	0x9
 3914 0a83 F4000000 		.long	0xf4
 3915 0a87 00000000 		.quad	.LFB75
 3915      00000000 
 3916 0a8f 0F000000 		.quad	.LFE75-.LFB75
 3916      00000000 
 3917 0a97 01       		.uleb128 0x1
 3918 0a98 9C       		.byte	0x9c
 3919 0a99 B20A0000 		.long	0xab2
 3920 0a9d 07       		.uleb128 0x7
 3921 0a9e 76616C00 		.string	"val"
 3922 0aa2 5F02     		.value	0x25f
 3923 0aa4 22       		.byte	0x22
 3924 0aa5 00010000 		.long	0x100
 3925 0aa9 00000000 		.long	.LLST169
 3926 0aad 00000000 		.long	.LVUS169
 3927 0ab1 00       		.byte	0
 3928 0ab2 0B       		.uleb128 0xb
 3929 0ab3 00000000 		.long	.LASF89
 3930 0ab7 5A02     		.value	0x25a
 3931 0ab9 09       		.byte	0x9
 3932 0aba F4000000 		.long	0xf4
 3933 0abe 00000000 		.quad	.LFB74
 3933      00000000 
 3934 0ac6 1F000000 		.quad	.LFE74-.LFB74
 3934      00000000 
 3935 0ace 01       		.uleb128 0x1
 3936 0acf 9C       		.byte	0x9c
 3937 0ad0 E90A0000 		.long	0xae9
 3938 0ad4 07       		.uleb128 0x7
 3939 0ad5 76616C00 		.string	"val"
 3940 0ad9 5A02     		.value	0x25a
 3941 0adb 22       		.byte	0x22
 3942 0adc 00010000 		.long	0x100
 3943 0ae0 00000000 		.long	.LLST168
 3944 0ae4 00000000 		.long	.LVUS168
 3945 0ae8 00       		.byte	0
 3946 0ae9 39       		.uleb128 0x39
 3947 0aea 00000000 		.long	.LASF125
 3948 0aee 01       		.byte	0x1
 3949 0aef 4102     		.value	0x241
 3950 0af1 06       		.byte	0x6
 3951 0af2 00000000 		.quad	.LFB73
 3951      00000000 
 3952 0afa 48000000 		.quad	.LFE73-.LFB73
GAS LISTING /tmp/cceaV4lG.s 			page 97


 3952      00000000 
 3953 0b02 01       		.uleb128 0x1
 3954 0b03 9C       		.byte	0x9c
 3955 0b04 590B0000 		.long	0xb59
 3956 0b08 12       		.uleb128 0x12
 3957 0b09 00000000 		.long	.LASF90
 3958 0b0d 4102     		.value	0x241
 3959 0b0f 1A       		.byte	0x1a
 3960 0b10 590B0000 		.long	0xb59
 3961 0b14 00000000 		.long	.LLST164
 3962 0b18 00000000 		.long	.LVUS164
 3963 0b1c 12       		.uleb128 0x12
 3964 0b1d 00000000 		.long	.LASF91
 3965 0b21 4102     		.value	0x241
 3966 0b23 2D       		.byte	0x2d
 3967 0b24 590B0000 		.long	0xb59
 3968 0b28 00000000 		.long	.LLST165
 3969 0b2c 00000000 		.long	.LVUS165
 3970 0b30 07       		.uleb128 0x7
 3971 0b31 6C656E00 		.string	"len"
 3972 0b35 4102     		.value	0x241
 3973 0b37 3F       		.byte	0x3f
 3974 0b38 F4000000 		.long	0xf4
 3975 0b3c 00000000 		.long	.LLST166
 3976 0b40 00000000 		.long	.LVUS166
 3977 0b44 16       		.uleb128 0x16
 3978 0b45 00000000 		.long	.LASF92
 3979 0b49 4302     		.value	0x243
 3980 0b4b 0D       		.byte	0xd
 3981 0b4c F4000000 		.long	0xf4
 3982 0b50 00000000 		.long	.LLST167
 3983 0b54 00000000 		.long	.LVUS167
 3984 0b58 00       		.byte	0
 3985 0b59 0C       		.uleb128 0xc
 3986 0b5a F4000000 		.long	0xf4
 3987 0b5e 0B       		.uleb128 0xb
 3988 0b5f 00000000 		.long	.LASF93
 3989 0b63 2202     		.value	0x222
 3990 0b65 07       		.byte	0x7
 3991 0b66 B5000000 		.long	0xb5
 3992 0b6a 00000000 		.quad	.LFB72
 3992      00000000 
 3993 0b72 96000000 		.quad	.LFE72-.LFB72
 3993      00000000 
 3994 0b7a 01       		.uleb128 0x1
 3995 0b7b 9C       		.byte	0x9c
 3996 0b7c 350C0000 		.long	0xc35
 3997 0b80 07       		.uleb128 0x7
 3998 0b81 62756600 		.string	"buf"
 3999 0b85 2202     		.value	0x222
 4000 0b87 1D       		.byte	0x1d
 4001 0b88 B5000000 		.long	0xb5
 4002 0b8c 00000000 		.long	.LLST156
 4003 0b90 00000000 		.long	.LVUS156
 4004 0b94 12       		.uleb128 0x12
 4005 0b95 00000000 		.long	.LASF94
 4006 0b99 2202     		.value	0x222
GAS LISTING /tmp/cceaV4lG.s 			page 98


 4007 0b9b 28       		.byte	0x28
 4008 0b9c B5000000 		.long	0xb5
 4009 0ba0 00000000 		.long	.LLST157
 4010 0ba4 00000000 		.long	.LVUS157
 4011 0ba8 12       		.uleb128 0x12
 4012 0ba9 00000000 		.long	.LASF95
 4013 0bad 2202     		.value	0x222
 4014 0baf 46       		.byte	0x46
 4015 0bb0 AE080000 		.long	0x8ae
 4016 0bb4 00000000 		.long	.LLST158
 4017 0bb8 00000000 		.long	.LVUS158
 4018 0bbc 12       		.uleb128 0x12
 4019 0bbd 00000000 		.long	.LASF96
 4020 0bc1 2302     		.value	0x223
 4021 0bc3 25       		.byte	0x25
 4022 0bc4 00010000 		.long	0x100
 4023 0bc8 00000000 		.long	.LLST159
 4024 0bcc 00000000 		.long	.LVUS159
 4025 0bd0 16       		.uleb128 0x16
 4026 0bd1 00000000 		.long	.LASF97
 4027 0bd5 2502     		.value	0x225
 4028 0bd7 0D       		.byte	0xd
 4029 0bd8 F4000000 		.long	0xf4
 4030 0bdc 00000000 		.long	.LLST160
 4031 0be0 00000000 		.long	.LVUS160
 4032 0be4 16       		.uleb128 0x16
 4033 0be5 00000000 		.long	.LASF98
 4034 0be9 2602     		.value	0x226
 4035 0beb 0D       		.byte	0xd
 4036 0bec F4000000 		.long	0xf4
 4037 0bf0 00000000 		.long	.LLST161
 4038 0bf4 00000000 		.long	.LVUS161
 4039 0bf8 04       		.uleb128 0x4
 4040 0bf9 636E7400 		.string	"cnt"
 4041 0bfd 2702     		.value	0x227
 4042 0bff 0D       		.byte	0xd
 4043 0c00 F4000000 		.long	0xf4
 4044 0c04 00000000 		.long	.LLST162
 4045 0c08 00000000 		.long	.LVUS162
 4046 0c0c 16       		.uleb128 0x16
 4047 0c0d 00000000 		.long	.LASF99
 4048 0c11 2802     		.value	0x228
 4049 0c13 0D       		.byte	0xd
 4050 0c14 F4000000 		.long	0xf4
 4051 0c18 00000000 		.long	.LLST163
 4052 0c1c 00000000 		.long	.LVUS163
 4053 0c20 1C       		.uleb128 0x1c
 4054 0c21 00000000 		.quad	.LVL258
 4054      00000000 
 4055 0c29 F5080000 		.long	0x8f5
 4056 0c2d 15       		.uleb128 0x15
 4057 0c2e 01       		.uleb128 0x1
 4058 0c2f 55       		.byte	0x55
 4059 0c30 02       		.uleb128 0x2
 4060 0c31 76       		.byte	0x76
 4061 0c32 00       		.sleb128 0
 4062 0c33 00       		.byte	0
GAS LISTING /tmp/cceaV4lG.s 			page 99


 4063 0c34 00       		.byte	0
 4064 0c35 0B       		.uleb128 0xb
 4065 0c36 00000000 		.long	.LASF100
 4066 0c3a 1602     		.value	0x216
 4067 0c3c 07       		.byte	0x7
 4068 0c3d B5000000 		.long	0xb5
 4069 0c41 00000000 		.quad	.LFB71
 4069      00000000 
 4070 0c49 93000000 		.quad	.LFE71-.LFB71
 4070      00000000 
 4071 0c51 01       		.uleb128 0x1
 4072 0c52 9C       		.byte	0x9c
 4073 0c53 3C0D0000 		.long	0xd3c
 4074 0c57 07       		.uleb128 0x7
 4075 0c58 62756600 		.string	"buf"
 4076 0c5c 1602     		.value	0x216
 4077 0c5e 15       		.byte	0x15
 4078 0c5f B5000000 		.long	0xb5
 4079 0c63 00000000 		.long	.LLST144
 4080 0c67 00000000 		.long	.LVUS144
 4081 0c6b 07       		.uleb128 0x7
 4082 0c6c 76616C00 		.string	"val"
 4083 0c70 1602     		.value	0x216
 4084 0c72 28       		.byte	0x28
 4085 0c73 DE000000 		.long	0xde
 4086 0c77 00000000 		.long	.LLST145
 4087 0c7b 00000000 		.long	.LVUS145
 4088 0c7f 04       		.uleb128 0x4
 4089 0c80 7000     		.string	"p"
 4090 0c82 1802     		.value	0x218
 4091 0c84 0B       		.byte	0xb
 4092 0c85 B5000000 		.long	0xb5
 4093 0c89 00000000 		.long	.LLST146
 4094 0c8d 00000000 		.long	.LVUS146
 4095 0c91 13       		.uleb128 0x13
 4096 0c92 B10E0000 		.long	0xeb1
 4097 0c96 00000000 		.quad	.LBI92
 4097      00000000 
 4098 0c9e 01       		.byte	.LVU693
 4099 0c9f 00000000 		.quad	.LBB92
 4099      00000000 
 4100 0ca7 42000000 		.quad	.LBE92-.LBB92
 4100      00000000 
 4101 0caf 1A02     		.value	0x21a
 4102 0cb1 1A       		.byte	0x1a
 4103 0cb2 EB0C0000 		.long	0xceb
 4104 0cb6 03       		.uleb128 0x3
 4105 0cb7 CD0E0000 		.long	0xecd
 4106 0cbb 00000000 		.long	.LLST147
 4107 0cbf 00000000 		.long	.LVUS147
 4108 0cc3 03       		.uleb128 0x3
 4109 0cc4 C30E0000 		.long	0xec3
 4110 0cc8 00000000 		.long	.LLST148
 4111 0ccc 00000000 		.long	.LVUS148
 4112 0cd0 17       		.uleb128 0x17
 4113 0cd1 D70E0000 		.long	0xed7
 4114 0cd5 00000000 		.long	.LLST149
GAS LISTING /tmp/cceaV4lG.s 			page 100


 4115 0cd9 00000000 		.long	.LVUS149
 4116 0cdd 17       		.uleb128 0x17
 4117 0cde E10E0000 		.long	0xee1
 4118 0ce2 00000000 		.long	.LLST150
 4119 0ce6 00000000 		.long	.LVUS150
 4120 0cea 00       		.byte	0
 4121 0ceb 1D       		.uleb128 0x1d
 4122 0cec B10E0000 		.long	0xeb1
 4123 0cf0 00000000 		.quad	.LBI94
 4123      00000000 
 4124 0cf8 01       		.byte	.LVU718
 4125 0cf9 00000000 		.long	.LLRL151
 4126 0cfd 1C02     		.value	0x21c
 4127 0cff 17       		.byte	0x17
 4128 0d00 03       		.uleb128 0x3
 4129 0d01 CD0E0000 		.long	0xecd
 4130 0d05 00000000 		.long	.LLST152
 4131 0d09 00000000 		.long	.LVUS152
 4132 0d0d 03       		.uleb128 0x3
 4133 0d0e C30E0000 		.long	0xec3
 4134 0d12 00000000 		.long	.LLST153
 4135 0d16 00000000 		.long	.LVUS153
 4136 0d1a 3A       		.uleb128 0x3a
 4137 0d1b 00000000 		.long	.LLRL151
 4138 0d1f 17       		.uleb128 0x17
 4139 0d20 D70E0000 		.long	0xed7
 4140 0d24 00000000 		.long	.LLST154
 4141 0d28 00000000 		.long	.LVUS154
 4142 0d2c 17       		.uleb128 0x17
 4143 0d2d E10E0000 		.long	0xee1
 4144 0d31 00000000 		.long	.LLST155
 4145 0d35 00000000 		.long	.LVUS155
 4146 0d39 00       		.byte	0
 4147 0d3a 00       		.byte	0
 4148 0d3b 00       		.byte	0
 4149 0d3c 0B       		.uleb128 0xb
 4150 0d3d 00000000 		.long	.LASF101
 4151 0d41 0A02     		.value	0x20a
 4152 0d43 07       		.byte	0x7
 4153 0d44 B5000000 		.long	0xb5
 4154 0d48 00000000 		.quad	.LFB70
 4154      00000000 
 4155 0d50 1A000000 		.quad	.LFE70-.LFB70
 4155      00000000 
 4156 0d58 01       		.uleb128 0x1
 4157 0d59 9C       		.byte	0x9c
 4158 0d5a CF0D0000 		.long	0xdcf
 4159 0d5e 07       		.uleb128 0x7
 4160 0d5f 62756600 		.string	"buf"
 4161 0d63 0A02     		.value	0x20a
 4162 0d65 13       		.byte	0x13
 4163 0d66 B5000000 		.long	0xb5
 4164 0d6a 00000000 		.long	.LLST141
 4165 0d6e 00000000 		.long	.LVUS141
 4166 0d72 07       		.uleb128 0x7
 4167 0d73 76616C00 		.string	"val"
 4168 0d77 0A02     		.value	0x20a
GAS LISTING /tmp/cceaV4lG.s 			page 101


 4169 0d79 26       		.byte	0x26
 4170 0d7a EF000000 		.long	0xef
 4171 0d7e 00000000 		.long	.LLST142
 4172 0d82 00000000 		.long	.LVUS142
 4173 0d86 04       		.uleb128 0x4
 4174 0d87 7000     		.string	"p"
 4175 0d89 0C02     		.value	0x20c
 4176 0d8b 0B       		.byte	0xb
 4177 0d8c B5000000 		.long	0xb5
 4178 0d90 00000000 		.long	.LLST143
 4179 0d94 00000000 		.long	.LVUS143
 4180 0d98 3B       		.uleb128 0x3b
 4181 0d99 00000000 		.quad	.LVL234
 4181      00000000 
 4182 0da1 EC0E0000 		.long	0xeec
 4183 0da5 B80D0000 		.long	0xdb8
 4184 0da9 15       		.uleb128 0x15
 4185 0daa 01       		.uleb128 0x1
 4186 0dab 55       		.byte	0x55
 4187 0dac 03       		.uleb128 0x3
 4188 0dad A3       		.byte	0xa3
 4189 0dae 01       		.uleb128 0x1
 4190 0daf 55       		.byte	0x55
 4191 0db0 15       		.uleb128 0x15
 4192 0db1 01       		.uleb128 0x1
 4193 0db2 54       		.byte	0x54
 4194 0db3 03       		.uleb128 0x3
 4195 0db4 A3       		.byte	0xa3
 4196 0db5 01       		.uleb128 0x1
 4197 0db6 54       		.byte	0x54
 4198 0db7 00       		.byte	0
 4199 0db8 1C       		.uleb128 0x1c
 4200 0db9 00000000 		.quad	.LVL237
 4200      00000000 
 4201 0dc1 EC0E0000 		.long	0xeec
 4202 0dc5 15       		.uleb128 0x15
 4203 0dc6 01       		.uleb128 0x1
 4204 0dc7 54       		.byte	0x54
 4205 0dc8 04       		.uleb128 0x4
 4206 0dc9 A3       		.byte	0xa3
 4207 0dca 01       		.uleb128 0x1
 4208 0dcb 54       		.byte	0x54
 4209 0dcc 1F       		.byte	0x1f
 4210 0dcd 00       		.byte	0
 4211 0dce 00       		.byte	0
 4212 0dcf 0B       		.uleb128 0xb
 4213 0dd0 00000000 		.long	.LASF102
 4214 0dd4 0502     		.value	0x205
 4215 0dd6 07       		.byte	0x7
 4216 0dd7 B5000000 		.long	0xb5
 4217 0ddb 00000000 		.quad	.LFB69
 4217      00000000 
 4218 0de3 06000000 		.quad	.LFE69-.LFB69
 4218      00000000 
 4219 0deb 01       		.uleb128 0x1
 4220 0dec 9C       		.byte	0x9c
 4221 0ded 360E0000 		.long	0xe36
GAS LISTING /tmp/cceaV4lG.s 			page 102


 4222 0df1 07       		.uleb128 0x7
 4223 0df2 62756600 		.string	"buf"
 4224 0df6 0502     		.value	0x205
 4225 0df8 13       		.byte	0x13
 4226 0df9 B5000000 		.long	0xb5
 4227 0dfd 00000000 		.long	.LLST139
 4228 0e01 00000000 		.long	.LVUS139
 4229 0e05 07       		.uleb128 0x7
 4230 0e06 76616C00 		.string	"val"
 4231 0e0a 0502     		.value	0x205
 4232 0e0c 27       		.byte	0x27
 4233 0e0d 22010000 		.long	0x122
 4234 0e11 00000000 		.long	.LLST140
 4235 0e15 00000000 		.long	.LVUS140
 4236 0e19 1C       		.uleb128 0x1c
 4237 0e1a 00000000 		.quad	.LVL232
 4237      00000000 
 4238 0e22 EC0E0000 		.long	0xeec
 4239 0e26 15       		.uleb128 0x15
 4240 0e27 01       		.uleb128 0x1
 4241 0e28 55       		.byte	0x55
 4242 0e29 03       		.uleb128 0x3
 4243 0e2a A3       		.byte	0xa3
 4244 0e2b 01       		.uleb128 0x1
 4245 0e2c 55       		.byte	0x55
 4246 0e2d 15       		.uleb128 0x15
 4247 0e2e 01       		.uleb128 0x1
 4248 0e2f 54       		.byte	0x54
 4249 0e30 03       		.uleb128 0x3
 4250 0e31 A3       		.byte	0xa3
 4251 0e32 01       		.uleb128 0x1
 4252 0e33 54       		.byte	0x54
 4253 0e34 00       		.byte	0
 4254 0e35 00       		.byte	0
 4255 0e36 0B       		.uleb128 0xb
 4256 0e37 00000000 		.long	.LASF103
 4257 0e3b E801     		.value	0x1e8
 4258 0e3d 07       		.byte	0x7
 4259 0e3e B5000000 		.long	0xb5
 4260 0e42 00000000 		.quad	.LFB68
 4260      00000000 
 4261 0e4a 50000000 		.quad	.LFE68-.LFB68
 4261      00000000 
 4262 0e52 01       		.uleb128 0x1
 4263 0e53 9C       		.byte	0x9c
 4264 0e54 B10E0000 		.long	0xeb1
 4265 0e58 23       		.uleb128 0x23
 4266 0e59 62756600 		.string	"buf"
 4267 0e5d E801     		.value	0x1e8
 4268 0e5f 13       		.byte	0x13
 4269 0e60 B5000000 		.long	0xb5
 4270 0e64 01       		.uleb128 0x1
 4271 0e65 55       		.byte	0x55
 4272 0e66 07       		.uleb128 0x7
 4273 0e67 76616C00 		.string	"val"
 4274 0e6b E801     		.value	0x1e8
 4275 0e6d 27       		.byte	0x27
GAS LISTING /tmp/cceaV4lG.s 			page 103


 4276 0e6e 11010000 		.long	0x111
 4277 0e72 00000000 		.long	.LLST135
 4278 0e76 00000000 		.long	.LVUS135
 4279 0e7a 04       		.uleb128 0x4
 4280 0e7b 7000     		.string	"p"
 4281 0e7d EA01     		.value	0x1ea
 4282 0e7f 0B       		.byte	0xb
 4283 0e80 B5000000 		.long	0xb5
 4284 0e84 00000000 		.long	.LLST136
 4285 0e88 00000000 		.long	.LVUS136
 4286 0e8c 04       		.uleb128 0x4
 4287 0e8d 6D00     		.string	"m"
 4288 0e8f EB01     		.value	0x1eb
 4289 0e91 0E       		.byte	0xe
 4290 0e92 05010000 		.long	0x105
 4291 0e96 00000000 		.long	.LLST137
 4292 0e9a 00000000 		.long	.LVUS137
 4293 0e9e 04       		.uleb128 0x4
 4294 0e9f 6900     		.string	"i"
 4295 0ea1 EC01     		.value	0x1ec
 4296 0ea3 0D       		.byte	0xd
 4297 0ea4 F4000000 		.long	0xf4
 4298 0ea8 00000000 		.long	.LLST138
 4299 0eac 00000000 		.long	.LVUS138
 4300 0eb0 00       		.byte	0
 4301 0eb1 3C       		.uleb128 0x3c
 4302 0eb2 00000000 		.long	.LASF126
 4303 0eb6 01       		.byte	0x1
 4304 0eb7 D301     		.value	0x1d3
 4305 0eb9 0E       		.byte	0xe
 4306 0eba B5000000 		.long	0xb5
 4307 0ebe 01       		.byte	0x1
 4308 0ebf EC0E0000 		.long	0xeec
 4309 0ec3 24       		.uleb128 0x24
 4310 0ec4 62756600 		.string	"buf"
 4311 0ec8 1F       		.byte	0x1f
 4312 0ec9 B5000000 		.long	0xb5
 4313 0ecd 24       		.uleb128 0x24
 4314 0ece 76616C00 		.string	"val"
 4315 0ed2 33       		.byte	0x33
 4316 0ed3 11010000 		.long	0x111
 4317 0ed7 25       		.uleb128 0x25
 4318 0ed8 7000     		.string	"p"
 4319 0eda D501     		.value	0x1d5
 4320 0edc 0B       		.byte	0xb
 4321 0edd B5000000 		.long	0xb5
 4322 0ee1 25       		.uleb128 0x25
 4323 0ee2 6D00     		.string	"m"
 4324 0ee4 D601     		.value	0x1d6
 4325 0ee6 0E       		.byte	0xe
 4326 0ee7 16010000 		.long	0x116
 4327 0eeb 00       		.byte	0
 4328 0eec 3D       		.uleb128 0x3d
 4329 0eed 00000000 		.long	.LASF127
 4330 0ef1 01       		.byte	0x1
 4331 0ef2 BE01     		.value	0x1be
 4332 0ef4 0E       		.byte	0xe
GAS LISTING /tmp/cceaV4lG.s 			page 104


 4333 0ef5 B5000000 		.long	0xb5
 4334 0ef9 00000000 		.quad	.LFB66
 4334      00000000 
 4335 0f01 45000000 		.quad	.LFE66-.LFB66
 4335      00000000 
 4336 0f09 01       		.uleb128 0x1
 4337 0f0a 9C       		.byte	0x9c
 4338 0f0b 5C0F0000 		.long	0xf5c
 4339 0f0f 07       		.uleb128 0x7
 4340 0f10 62756600 		.string	"buf"
 4341 0f14 BE01     		.value	0x1be
 4342 0f16 1F       		.byte	0x1f
 4343 0f17 B5000000 		.long	0xb5
 4344 0f1b 00000000 		.long	.LLST0
 4345 0f1f 00000000 		.long	.LVUS0
 4346 0f23 07       		.uleb128 0x7
 4347 0f24 76616C00 		.string	"val"
 4348 0f28 BE01     		.value	0x1be
 4349 0f2a 33       		.byte	0x33
 4350 0f2b 22010000 		.long	0x122
 4351 0f2f 00000000 		.long	.LLST1
 4352 0f33 00000000 		.long	.LVUS1
 4353 0f37 04       		.uleb128 0x4
 4354 0f38 7000     		.string	"p"
 4355 0f3a C001     		.value	0x1c0
 4356 0f3c 0B       		.byte	0xb
 4357 0f3d B5000000 		.long	0xb5
 4358 0f41 00000000 		.long	.LLST2
 4359 0f45 00000000 		.long	.LVUS2
 4360 0f49 04       		.uleb128 0x4
 4361 0f4a 6D00     		.string	"m"
 4362 0f4c C101     		.value	0x1c1
 4363 0f4e 0E       		.byte	0xe
 4364 0f4f 16010000 		.long	0x116
 4365 0f53 00000000 		.long	.LLST3
 4366 0f57 00000000 		.long	.LVUS3
 4367 0f5b 00       		.byte	0
 4368 0f5c 0B       		.uleb128 0xb
 4369 0f5d 00000000 		.long	.LASF104
 4370 0f61 5601     		.value	0x156
 4371 0f63 07       		.byte	0x7
 4372 0f64 B5000000 		.long	0xb5
 4373 0f68 00000000 		.quad	.LFB65
 4373      00000000 
 4374 0f70 5A000000 		.quad	.LFE65-.LFB65
 4374      00000000 
 4375 0f78 01       		.uleb128 0x1
 4376 0f79 9C       		.byte	0x9c
 4377 0f7a 8D100000 		.long	0x108d
 4378 0f7e 07       		.uleb128 0x7
 4379 0f7f 62756600 		.string	"buf"
 4380 0f83 5601     		.value	0x156
 4381 0f85 14       		.byte	0x14
 4382 0f86 B5000000 		.long	0xb5
 4383 0f8a 00000000 		.long	.LLST121
 4384 0f8e 00000000 		.long	.LVUS121
 4385 0f92 07       		.uleb128 0x7
GAS LISTING /tmp/cceaV4lG.s 			page 105


 4386 0f93 76616C00 		.string	"val"
 4387 0f97 5601     		.value	0x156
 4388 0f99 28       		.byte	0x28
 4389 0f9a 22010000 		.long	0x122
 4390 0f9e 00000000 		.long	.LLST122
 4391 0fa2 00000000 		.long	.LVUS122
 4392 0fa6 12       		.uleb128 0x12
 4393 0fa7 00000000 		.long	.LASF105
 4394 0fab 5601     		.value	0x156
 4395 0fad 3B       		.byte	0x3b
 4396 0fae 00010000 		.long	0x100
 4397 0fb2 00000000 		.long	.LLST123
 4398 0fb6 00000000 		.long	.LVUS123
 4399 0fba 04       		.uleb128 0x4
 4400 0fbb 7000     		.string	"p"
 4401 0fbd 5801     		.value	0x158
 4402 0fbf 0B       		.byte	0xb
 4403 0fc0 B5000000 		.long	0xb5
 4404 0fc4 00000000 		.long	.LLST124
 4405 0fc8 00000000 		.long	.LVUS124
 4406 0fcc 04       		.uleb128 0x4
 4407 0fcd 6D00     		.string	"m"
 4408 0fcf 5901     		.value	0x159
 4409 0fd1 0E       		.byte	0xe
 4410 0fd2 16010000 		.long	0x116
 4411 0fd6 00000000 		.long	.LLST125
 4412 0fda 00000000 		.long	.LVUS125
 4413 0fde 04       		.uleb128 0x4
 4414 0fdf 6900     		.string	"i"
 4415 0fe1 5A01     		.value	0x15a
 4416 0fe3 0D       		.byte	0xd
 4417 0fe4 F4000000 		.long	0xf4
 4418 0fe8 00000000 		.long	.LLST126
 4419 0fec 00000000 		.long	.LVUS126
 4420 0ff0 04       		.uleb128 0x4
 4421 0ff1 706300   		.string	"pc"
 4422 0ff4 5B01     		.value	0x15b
 4423 0ff6 0D       		.byte	0xd
 4424 0ff7 F4000000 		.long	0xf4
 4425 0ffb 00000000 		.long	.LLST127
 4426 0fff 00000000 		.long	.LVUS127
 4427 1003 1E       		.uleb128 0x1e
 4428 1004 D21B0000 		.long	0x1bd2
 4429 1008 00000000 		.quad	.LBI80
 4429      00000000 
 4430 1010 01       		.byte	.LVU611
 4431 1011 00000000 		.long	.LLRL128
 4432 1015 6A01     		.value	0x16a
 4433 1017 43100000 		.long	0x1043
 4434 101b 03       		.uleb128 0x3
 4435 101c F51B0000 		.long	0x1bf5
 4436 1020 00000000 		.long	.LLST129
 4437 1024 00000000 		.long	.LVUS129
 4438 1028 03       		.uleb128 0x3
 4439 1029 EC1B0000 		.long	0x1bec
 4440 102d 00000000 		.long	.LLST130
 4441 1031 00000000 		.long	.LVUS130
GAS LISTING /tmp/cceaV4lG.s 			page 106


 4442 1035 03       		.uleb128 0x3
 4443 1036 E31B0000 		.long	0x1be3
 4444 103a 00000000 		.long	.LLST131
 4445 103e 00000000 		.long	.LVUS131
 4446 1042 00       		.byte	0
 4447 1043 26       		.uleb128 0x26
 4448 1044 D21B0000 		.long	0x1bd2
 4449 1048 00000000 		.quad	.LBI86
 4449      00000000 
 4450 1050 01       		.byte	.LVU625
 4451 1051 00000000 		.quad	.LBB86
 4451      00000000 
 4452 1059 04000000 		.quad	.LBE86-.LBB86
 4452      00000000 
 4453 1061 6101     		.value	0x161
 4454 1063 13       		.byte	0x13
 4455 1064 03       		.uleb128 0x3
 4456 1065 F51B0000 		.long	0x1bf5
 4457 1069 00000000 		.long	.LLST132
 4458 106d 00000000 		.long	.LVUS132
 4459 1071 03       		.uleb128 0x3
 4460 1072 EC1B0000 		.long	0x1bec
 4461 1076 00000000 		.long	.LLST133
 4462 107a 00000000 		.long	.LVUS133
 4463 107e 03       		.uleb128 0x3
 4464 107f E31B0000 		.long	0x1be3
 4465 1083 00000000 		.long	.LLST134
 4466 1087 00000000 		.long	.LVUS134
 4467 108b 00       		.byte	0
 4468 108c 00       		.byte	0
 4469 108d 0B       		.uleb128 0xb
 4470 108e 00000000 		.long	.LASF106
 4471 1092 3801     		.value	0x138
 4472 1094 07       		.byte	0x7
 4473 1095 B5000000 		.long	0xb5
 4474 1099 00000000 		.quad	.LFB64
 4474      00000000 
 4475 10a1 4E000000 		.quad	.LFE64-.LFB64
 4475      00000000 
 4476 10a9 01       		.uleb128 0x1
 4477 10aa 9C       		.byte	0x9c
 4478 10ab 4B110000 		.long	0x114b
 4479 10af 07       		.uleb128 0x7
 4480 10b0 62756600 		.string	"buf"
 4481 10b4 3801     		.value	0x138
 4482 10b6 15       		.byte	0x15
 4483 10b7 B5000000 		.long	0xb5
 4484 10bb 00000000 		.long	.LLST112
 4485 10bf 00000000 		.long	.LVUS112
 4486 10c3 07       		.uleb128 0x7
 4487 10c4 76616C00 		.string	"val"
 4488 10c8 3801     		.value	0x138
 4489 10ca 29       		.byte	0x29
 4490 10cb 22010000 		.long	0x122
 4491 10cf 00000000 		.long	.LLST113
 4492 10d3 00000000 		.long	.LVUS113
 4493 10d7 04       		.uleb128 0x4
GAS LISTING /tmp/cceaV4lG.s 			page 107


 4494 10d8 7000     		.string	"p"
 4495 10da 3A01     		.value	0x13a
 4496 10dc 0B       		.byte	0xb
 4497 10dd B5000000 		.long	0xb5
 4498 10e1 00000000 		.long	.LLST114
 4499 10e5 00000000 		.long	.LVUS114
 4500 10e9 04       		.uleb128 0x4
 4501 10ea 6D00     		.string	"m"
 4502 10ec 3B01     		.value	0x13b
 4503 10ee 0E       		.byte	0xe
 4504 10ef 16010000 		.long	0x116
 4505 10f3 00000000 		.long	.LLST115
 4506 10f7 00000000 		.long	.LVUS115
 4507 10fb 04       		.uleb128 0x4
 4508 10fc 6900     		.string	"i"
 4509 10fe 3C01     		.value	0x13c
 4510 1100 0D       		.byte	0xd
 4511 1101 F4000000 		.long	0xf4
 4512 1105 00000000 		.long	.LLST116
 4513 1109 00000000 		.long	.LVUS116
 4514 110d 1D       		.uleb128 0x1d
 4515 110e D21B0000 		.long	0x1bd2
 4516 1112 00000000 		.quad	.LBI74
 4516      00000000 
 4517 111a 01       		.byte	.LVU582
 4518 111b 00000000 		.long	.LLRL117
 4519 111f 4901     		.value	0x149
 4520 1121 0F       		.byte	0xf
 4521 1122 03       		.uleb128 0x3
 4522 1123 F51B0000 		.long	0x1bf5
 4523 1127 00000000 		.long	.LLST118
 4524 112b 00000000 		.long	.LVUS118
 4525 112f 03       		.uleb128 0x3
 4526 1130 EC1B0000 		.long	0x1bec
 4527 1134 00000000 		.long	.LLST119
 4528 1138 00000000 		.long	.LVUS119
 4529 113c 03       		.uleb128 0x3
 4530 113d E31B0000 		.long	0x1be3
 4531 1141 00000000 		.long	.LLST120
 4532 1145 00000000 		.long	.LVUS120
 4533 1149 00       		.byte	0
 4534 114a 00       		.byte	0
 4535 114b 0B       		.uleb128 0xb
 4536 114c 00000000 		.long	.LASF107
 4537 1150 1701     		.value	0x117
 4538 1152 07       		.byte	0x7
 4539 1153 B5000000 		.long	0xb5
 4540 1157 00000000 		.quad	.LFB63
 4540      00000000 
 4541 115f 70000000 		.quad	.LFE63-.LFB63
 4541      00000000 
 4542 1167 01       		.uleb128 0x1
 4543 1168 9C       		.byte	0x9c
 4544 1169 CA130000 		.long	0x13ca
 4545 116d 07       		.uleb128 0x7
 4546 116e 62756600 		.string	"buf"
 4547 1172 1701     		.value	0x117
GAS LISTING /tmp/cceaV4lG.s 			page 108


 4548 1174 15       		.byte	0x15
 4549 1175 B5000000 		.long	0xb5
 4550 1179 00000000 		.long	.LLST84
 4551 117d 00000000 		.long	.LVUS84
 4552 1181 07       		.uleb128 0x7
 4553 1182 76616C00 		.string	"val"
 4554 1186 1701     		.value	0x117
 4555 1188 29       		.byte	0x29
 4556 1189 22010000 		.long	0x122
 4557 118d 00000000 		.long	.LLST85
 4558 1191 00000000 		.long	.LVUS85
 4559 1195 04       		.uleb128 0x4
 4560 1196 7000     		.string	"p"
 4561 1198 1901     		.value	0x119
 4562 119a 0B       		.byte	0xb
 4563 119b B5000000 		.long	0xb5
 4564 119f 00000000 		.long	.LLST86
 4565 11a3 00000000 		.long	.LVUS86
 4566 11a7 04       		.uleb128 0x4
 4567 11a8 6D00     		.string	"m"
 4568 11aa 1A01     		.value	0x11a
 4569 11ac 0E       		.byte	0xe
 4570 11ad 16010000 		.long	0x116
 4571 11b1 00000000 		.long	.LLST87
 4572 11b5 00000000 		.long	.LVUS87
 4573 11b9 04       		.uleb128 0x4
 4574 11ba 6900     		.string	"i"
 4575 11bc 1B01     		.value	0x11b
 4576 11be 0D       		.byte	0xd
 4577 11bf F4000000 		.long	0xf4
 4578 11c3 00000000 		.long	.LLST88
 4579 11c7 00000000 		.long	.LVUS88
 4580 11cb 1E       		.uleb128 0x1e
 4581 11cc D21B0000 		.long	0x1bd2
 4582 11d0 00000000 		.quad	.LBI54
 4582      00000000 
 4583 11d8 01       		.byte	.LVU508
 4584 11d9 00000000 		.long	.LLRL89
 4585 11dd 2A01     		.value	0x12a
 4586 11df 0B120000 		.long	0x120b
 4587 11e3 03       		.uleb128 0x3
 4588 11e4 F51B0000 		.long	0x1bf5
 4589 11e8 00000000 		.long	.LLST90
 4590 11ec 00000000 		.long	.LVUS90
 4591 11f0 03       		.uleb128 0x3
 4592 11f1 EC1B0000 		.long	0x1bec
 4593 11f5 00000000 		.long	.LLST91
 4594 11f9 00000000 		.long	.LVUS91
 4595 11fd 03       		.uleb128 0x3
 4596 11fe E31B0000 		.long	0x1be3
 4597 1202 00000000 		.long	.LLST92
 4598 1206 00000000 		.long	.LVUS92
 4599 120a 00       		.byte	0
 4600 120b 13       		.uleb128 0x13
 4601 120c D21B0000 		.long	0x1bd2
 4602 1210 00000000 		.quad	.LBI60
 4602      00000000 
GAS LISTING /tmp/cceaV4lG.s 			page 109


 4603 1218 01       		.byte	.LVU525
 4604 1219 00000000 		.quad	.LBB60
 4604      00000000 
 4605 1221 04000000 		.quad	.LBE60-.LBB60
 4605      00000000 
 4606 1229 2101     		.value	0x121
 4607 122b 0F       		.byte	0xf
 4608 122c 58120000 		.long	0x1258
 4609 1230 03       		.uleb128 0x3
 4610 1231 F51B0000 		.long	0x1bf5
 4611 1235 00000000 		.long	.LLST93
 4612 1239 00000000 		.long	.LVUS93
 4613 123d 03       		.uleb128 0x3
 4614 123e EC1B0000 		.long	0x1bec
 4615 1242 00000000 		.long	.LLST94
 4616 1246 00000000 		.long	.LVUS94
 4617 124a 03       		.uleb128 0x3
 4618 124b E31B0000 		.long	0x1be3
 4619 124f 00000000 		.long	.LLST95
 4620 1253 00000000 		.long	.LVUS95
 4621 1257 00       		.byte	0
 4622 1258 13       		.uleb128 0x13
 4623 1259 D21B0000 		.long	0x1bd2
 4624 125d 00000000 		.quad	.LBI62
 4624      00000000 
 4625 1265 02       		.byte	.LVU530
 4626 1266 00000000 		.quad	.LBB62
 4626      00000000 
 4627 126e 04000000 		.quad	.LBE62-.LBB62
 4627      00000000 
 4628 1276 2201     		.value	0x122
 4629 1278 0F       		.byte	0xf
 4630 1279 A5120000 		.long	0x12a5
 4631 127d 03       		.uleb128 0x3
 4632 127e F51B0000 		.long	0x1bf5
 4633 1282 00000000 		.long	.LLST96
 4634 1286 00000000 		.long	.LVUS96
 4635 128a 03       		.uleb128 0x3
 4636 128b EC1B0000 		.long	0x1bec
 4637 128f 00000000 		.long	.LLST97
 4638 1293 00000000 		.long	.LVUS97
 4639 1297 03       		.uleb128 0x3
 4640 1298 E31B0000 		.long	0x1be3
 4641 129c 00000000 		.long	.LLST98
 4642 12a0 00000000 		.long	.LVUS98
 4643 12a4 00       		.byte	0
 4644 12a5 13       		.uleb128 0x13
 4645 12a6 D21B0000 		.long	0x1bd2
 4646 12aa 00000000 		.quad	.LBI64
 4646      00000000 
 4647 12b2 02       		.byte	.LVU535
 4648 12b3 00000000 		.quad	.LBB64
 4648      00000000 
 4649 12bb 04000000 		.quad	.LBE64-.LBB64
 4649      00000000 
 4650 12c3 2301     		.value	0x123
 4651 12c5 0F       		.byte	0xf
GAS LISTING /tmp/cceaV4lG.s 			page 110


 4652 12c6 F2120000 		.long	0x12f2
 4653 12ca 03       		.uleb128 0x3
 4654 12cb F51B0000 		.long	0x1bf5
 4655 12cf 00000000 		.long	.LLST99
 4656 12d3 00000000 		.long	.LVUS99
 4657 12d7 03       		.uleb128 0x3
 4658 12d8 EC1B0000 		.long	0x1bec
 4659 12dc 00000000 		.long	.LLST100
 4660 12e0 00000000 		.long	.LVUS100
 4661 12e4 03       		.uleb128 0x3
 4662 12e5 E31B0000 		.long	0x1be3
 4663 12e9 00000000 		.long	.LLST101
 4664 12ed 00000000 		.long	.LVUS101
 4665 12f1 00       		.byte	0
 4666 12f2 13       		.uleb128 0x13
 4667 12f3 D21B0000 		.long	0x1bd2
 4668 12f7 00000000 		.quad	.LBI66
 4668      00000000 
 4669 12ff 02       		.byte	.LVU540
 4670 1300 00000000 		.quad	.LBB66
 4670      00000000 
 4671 1308 04000000 		.quad	.LBE66-.LBB66
 4671      00000000 
 4672 1310 2401     		.value	0x124
 4673 1312 0F       		.byte	0xf
 4674 1313 3F130000 		.long	0x133f
 4675 1317 03       		.uleb128 0x3
 4676 1318 F51B0000 		.long	0x1bf5
 4677 131c 00000000 		.long	.LLST102
 4678 1320 00000000 		.long	.LVUS102
 4679 1324 03       		.uleb128 0x3
 4680 1325 EC1B0000 		.long	0x1bec
 4681 1329 00000000 		.long	.LLST103
 4682 132d 00000000 		.long	.LVUS103
 4683 1331 03       		.uleb128 0x3
 4684 1332 E31B0000 		.long	0x1be3
 4685 1336 00000000 		.long	.LLST104
 4686 133a 00000000 		.long	.LVUS104
 4687 133e 00       		.byte	0
 4688 133f 13       		.uleb128 0x13
 4689 1340 D21B0000 		.long	0x1bd2
 4690 1344 00000000 		.quad	.LBI68
 4690      00000000 
 4691 134c 02       		.byte	.LVU549
 4692 134d 00000000 		.quad	.LBB68
 4692      00000000 
 4693 1355 05000000 		.quad	.LBE68-.LBB68
 4693      00000000 
 4694 135d 3101     		.value	0x131
 4695 135f 0F       		.byte	0xf
 4696 1360 8C130000 		.long	0x138c
 4697 1364 03       		.uleb128 0x3
 4698 1365 F51B0000 		.long	0x1bf5
 4699 1369 00000000 		.long	.LLST105
 4700 136d 00000000 		.long	.LVUS105
 4701 1371 03       		.uleb128 0x3
 4702 1372 EC1B0000 		.long	0x1bec
GAS LISTING /tmp/cceaV4lG.s 			page 111


 4703 1376 00000000 		.long	.LLST106
 4704 137a 00000000 		.long	.LVUS106
 4705 137e 03       		.uleb128 0x3
 4706 137f E31B0000 		.long	0x1be3
 4707 1383 00000000 		.long	.LLST107
 4708 1387 00000000 		.long	.LVUS107
 4709 138b 00       		.byte	0
 4710 138c 1D       		.uleb128 0x1d
 4711 138d D21B0000 		.long	0x1bd2
 4712 1391 00000000 		.quad	.LBI70
 4712      00000000 
 4713 1399 02       		.byte	.LVU554
 4714 139a 00000000 		.long	.LLRL108
 4715 139e 3201     		.value	0x132
 4716 13a0 0F       		.byte	0xf
 4717 13a1 03       		.uleb128 0x3
 4718 13a2 F51B0000 		.long	0x1bf5
 4719 13a6 00000000 		.long	.LLST109
 4720 13aa 00000000 		.long	.LVUS109
 4721 13ae 03       		.uleb128 0x3
 4722 13af EC1B0000 		.long	0x1bec
 4723 13b3 00000000 		.long	.LLST110
 4724 13b7 00000000 		.long	.LVUS110
 4725 13bb 03       		.uleb128 0x3
 4726 13bc E31B0000 		.long	0x1be3
 4727 13c0 00000000 		.long	.LLST111
 4728 13c4 00000000 		.long	.LVUS111
 4729 13c8 00       		.byte	0
 4730 13c9 00       		.byte	0
 4731 13ca 10       		.uleb128 0x10
 4732 13cb 00000000 		.long	.LASF108
 4733 13cf FF       		.byte	0xff
 4734 13d0 07       		.byte	0x7
 4735 13d1 B5000000 		.long	0xb5
 4736 13d5 00000000 		.quad	.LFB62
 4736      00000000 
 4737 13dd 47000000 		.quad	.LFE62-.LFB62
 4737      00000000 
 4738 13e5 01       		.uleb128 0x1
 4739 13e6 9C       		.byte	0x9c
 4740 13e7 18150000 		.long	0x1518
 4741 13eb 0A       		.uleb128 0xa
 4742 13ec 62756600 		.string	"buf"
 4743 13f0 FF       		.byte	0xff
 4744 13f1 14       		.byte	0x14
 4745 13f2 B5000000 		.long	0xb5
 4746 13f6 01       		.uleb128 0x1
 4747 13f7 55       		.byte	0x55
 4748 13f8 06       		.uleb128 0x6
 4749 13f9 76616C00 		.string	"val"
 4750 13fd FF       		.byte	0xff
 4751 13fe 28       		.byte	0x28
 4752 13ff 22010000 		.long	0x122
 4753 1403 00000000 		.long	.LLST70
 4754 1407 00000000 		.long	.LVUS70
 4755 140b 04       		.uleb128 0x4
 4756 140c 7000     		.string	"p"
GAS LISTING /tmp/cceaV4lG.s 			page 112


 4757 140e 0101     		.value	0x101
 4758 1410 0B       		.byte	0xb
 4759 1411 B5000000 		.long	0xb5
 4760 1415 00000000 		.long	.LLST71
 4761 1419 00000000 		.long	.LVUS71
 4762 141d 04       		.uleb128 0x4
 4763 141e 6D00     		.string	"m"
 4764 1420 0201     		.value	0x102
 4765 1422 0E       		.byte	0xe
 4766 1423 16010000 		.long	0x116
 4767 1427 00000000 		.long	.LLST72
 4768 142b 00000000 		.long	.LVUS72
 4769 142f 04       		.uleb128 0x4
 4770 1430 6900     		.string	"i"
 4771 1432 0301     		.value	0x103
 4772 1434 0D       		.byte	0xd
 4773 1435 F4000000 		.long	0xf4
 4774 1439 00000000 		.long	.LLST73
 4775 143d 00000000 		.long	.LVUS73
 4776 1441 1E       		.uleb128 0x1e
 4777 1442 D21B0000 		.long	0x1bd2
 4778 1446 00000000 		.quad	.LBI44
 4778      00000000 
 4779 144e 01       		.byte	.LVU481
 4780 144f 00000000 		.long	.LLRL74
 4781 1453 0F01     		.value	0x10f
 4782 1455 81140000 		.long	0x1481
 4783 1459 03       		.uleb128 0x3
 4784 145a F51B0000 		.long	0x1bf5
 4785 145e 00000000 		.long	.LLST75
 4786 1462 00000000 		.long	.LVUS75
 4787 1466 03       		.uleb128 0x3
 4788 1467 EC1B0000 		.long	0x1bec
 4789 146b 00000000 		.long	.LLST76
 4790 146f 00000000 		.long	.LVUS76
 4791 1473 03       		.uleb128 0x3
 4792 1474 E31B0000 		.long	0x1be3
 4793 1478 00000000 		.long	.LLST77
 4794 147c 00000000 		.long	.LVUS77
 4795 1480 00       		.byte	0
 4796 1481 13       		.uleb128 0x13
 4797 1482 D21B0000 		.long	0x1bd2
 4798 1486 00000000 		.quad	.LBI48
 4798      00000000 
 4799 148e 01       		.byte	.LVU468
 4800 148f 00000000 		.quad	.LBB48
 4800      00000000 
 4801 1497 04000000 		.quad	.LBE48-.LBB48
 4801      00000000 
 4802 149f 0901     		.value	0x109
 4803 14a1 0F       		.byte	0xf
 4804 14a2 CE140000 		.long	0x14ce
 4805 14a6 03       		.uleb128 0x3
 4806 14a7 F51B0000 		.long	0x1bf5
 4807 14ab 00000000 		.long	.LLST78
 4808 14af 00000000 		.long	.LVUS78
 4809 14b3 03       		.uleb128 0x3
GAS LISTING /tmp/cceaV4lG.s 			page 113


 4810 14b4 EC1B0000 		.long	0x1bec
 4811 14b8 00000000 		.long	.LLST79
 4812 14bc 00000000 		.long	.LVUS79
 4813 14c0 03       		.uleb128 0x3
 4814 14c1 E31B0000 		.long	0x1be3
 4815 14c5 00000000 		.long	.LLST80
 4816 14c9 00000000 		.long	.LVUS80
 4817 14cd 00       		.byte	0
 4818 14ce 26       		.uleb128 0x26
 4819 14cf D21B0000 		.long	0x1bd2
 4820 14d3 00000000 		.quad	.LBI50
 4820      00000000 
 4821 14db 02       		.byte	.LVU473
 4822 14dc 00000000 		.quad	.LBB50
 4822      00000000 
 4823 14e4 06000000 		.quad	.LBE50-.LBB50
 4823      00000000 
 4824 14ec 0A01     		.value	0x10a
 4825 14ee 0F       		.byte	0xf
 4826 14ef 03       		.uleb128 0x3
 4827 14f0 F51B0000 		.long	0x1bf5
 4828 14f4 00000000 		.long	.LLST81
 4829 14f8 00000000 		.long	.LVUS81
 4830 14fc 03       		.uleb128 0x3
 4831 14fd EC1B0000 		.long	0x1bec
 4832 1501 00000000 		.long	.LLST82
 4833 1505 00000000 		.long	.LVUS82
 4834 1509 03       		.uleb128 0x3
 4835 150a E31B0000 		.long	0x1be3
 4836 150e 00000000 		.long	.LLST83
 4837 1512 00000000 		.long	.LVUS83
 4838 1516 00       		.byte	0
 4839 1517 00       		.byte	0
 4840 1518 10       		.uleb128 0x10
 4841 1519 00000000 		.long	.LASF109
 4842 151d E5       		.byte	0xe5
 4843 151e 07       		.byte	0x7
 4844 151f B5000000 		.long	0xb5
 4845 1523 00000000 		.quad	.LFB61
 4845      00000000 
 4846 152b 50000000 		.quad	.LFE61-.LFB61
 4846      00000000 
 4847 1533 01       		.uleb128 0x1
 4848 1534 9C       		.byte	0x9c
 4849 1535 64160000 		.long	0x1664
 4850 1539 0A       		.uleb128 0xa
 4851 153a 62756600 		.string	"buf"
 4852 153e E5       		.byte	0xe5
 4853 153f 13       		.byte	0x13
 4854 1540 B5000000 		.long	0xb5
 4855 1544 01       		.uleb128 0x1
 4856 1545 55       		.byte	0x55
 4857 1546 06       		.uleb128 0x6
 4858 1547 76616C00 		.string	"val"
 4859 154b E5       		.byte	0xe5
 4860 154c 27       		.byte	0x27
 4861 154d 22010000 		.long	0x122
GAS LISTING /tmp/cceaV4lG.s 			page 114


 4862 1551 00000000 		.long	.LLST56
 4863 1555 00000000 		.long	.LVUS56
 4864 1559 05       		.uleb128 0x5
 4865 155a 7000     		.string	"p"
 4866 155c E7       		.byte	0xe7
 4867 155d 0B       		.byte	0xb
 4868 155e B5000000 		.long	0xb5
 4869 1562 00000000 		.long	.LLST57
 4870 1566 00000000 		.long	.LVUS57
 4871 156a 05       		.uleb128 0x5
 4872 156b 6D00     		.string	"m"
 4873 156d E8       		.byte	0xe8
 4874 156e 0E       		.byte	0xe
 4875 156f 16010000 		.long	0x116
 4876 1573 00000000 		.long	.LLST58
 4877 1577 00000000 		.long	.LVUS58
 4878 157b 05       		.uleb128 0x5
 4879 157c 6900     		.string	"i"
 4880 157e E9       		.byte	0xe9
 4881 157f 0D       		.byte	0xd
 4882 1580 F4000000 		.long	0xf4
 4883 1584 00000000 		.long	.LLST59
 4884 1588 00000000 		.long	.LVUS59
 4885 158c 3E       		.uleb128 0x3e
 4886 158d D21B0000 		.long	0x1bd2
 4887 1591 00000000 		.quad	.LBI34
 4887      00000000 
 4888 1599 01       		.byte	.LVU433
 4889 159a 00000000 		.long	.LLRL60
 4890 159e 01       		.byte	0x1
 4891 159f F4       		.byte	0xf4
 4892 15a0 0F       		.byte	0xf
 4893 15a1 CD150000 		.long	0x15cd
 4894 15a5 03       		.uleb128 0x3
 4895 15a6 F51B0000 		.long	0x1bf5
 4896 15aa 00000000 		.long	.LLST61
 4897 15ae 00000000 		.long	.LVUS61
 4898 15b2 03       		.uleb128 0x3
 4899 15b3 EC1B0000 		.long	0x1bec
 4900 15b7 00000000 		.long	.LLST62
 4901 15bb 00000000 		.long	.LVUS62
 4902 15bf 03       		.uleb128 0x3
 4903 15c0 E31B0000 		.long	0x1be3
 4904 15c4 00000000 		.long	.LLST63
 4905 15c8 00000000 		.long	.LVUS63
 4906 15cc 00       		.byte	0
 4907 15cd 3F       		.uleb128 0x3f
 4908 15ce D21B0000 		.long	0x1bd2
 4909 15d2 00000000 		.quad	.LBI38
 4909      00000000 
 4910 15da 01       		.byte	.LVU425
 4911 15db 00000000 		.quad	.LBB38
 4911      00000000 
 4912 15e3 06000000 		.quad	.LBE38-.LBB38
 4912      00000000 
 4913 15eb 01       		.byte	0x1
 4914 15ec EF       		.byte	0xef
GAS LISTING /tmp/cceaV4lG.s 			page 115


 4915 15ed 0F       		.byte	0xf
 4916 15ee 1A160000 		.long	0x161a
 4917 15f2 03       		.uleb128 0x3
 4918 15f3 F51B0000 		.long	0x1bf5
 4919 15f7 00000000 		.long	.LLST64
 4920 15fb 00000000 		.long	.LVUS64
 4921 15ff 03       		.uleb128 0x3
 4922 1600 EC1B0000 		.long	0x1bec
 4923 1604 00000000 		.long	.LLST65
 4924 1608 00000000 		.long	.LVUS65
 4925 160c 03       		.uleb128 0x3
 4926 160d E31B0000 		.long	0x1be3
 4927 1611 00000000 		.long	.LLST66
 4928 1615 00000000 		.long	.LVUS66
 4929 1619 00       		.byte	0
 4930 161a 40       		.uleb128 0x40
 4931 161b D21B0000 		.long	0x1bd2
 4932 161f 00000000 		.quad	.LBI42
 4932      00000000 
 4933 1627 01       		.byte	.LVU446
 4934 1628 00000000 		.quad	.LBB42
 4934      00000000 
 4935 1630 06000000 		.quad	.LBE42-.LBB42
 4935      00000000 
 4936 1638 01       		.byte	0x1
 4937 1639 FA       		.byte	0xfa
 4938 163a 0B       		.byte	0xb
 4939 163b 03       		.uleb128 0x3
 4940 163c F51B0000 		.long	0x1bf5
 4941 1640 00000000 		.long	.LLST67
 4942 1644 00000000 		.long	.LVUS67
 4943 1648 03       		.uleb128 0x3
 4944 1649 EC1B0000 		.long	0x1bec
 4945 164d 00000000 		.long	.LLST68
 4946 1651 00000000 		.long	.LVUS68
 4947 1655 03       		.uleb128 0x3
 4948 1656 E31B0000 		.long	0x1be3
 4949 165a 00000000 		.long	.LLST69
 4950 165e 00000000 		.long	.LVUS69
 4951 1662 00       		.byte	0
 4952 1663 00       		.byte	0
 4953 1664 10       		.uleb128 0x10
 4954 1665 00000000 		.long	.LASF110
 4955 1669 BE       		.byte	0xbe
 4956 166a 09       		.byte	0x9
 4957 166b F4000000 		.long	0xf4
 4958 166f 00000000 		.quad	.LFB60
 4958      00000000 
 4959 1677 A3000000 		.quad	.LFE60-.LFB60
 4959      00000000 
 4960 167f 01       		.uleb128 0x1
 4961 1680 9C       		.byte	0x9c
 4962 1681 1D170000 		.long	0x171d
 4963 1685 0A       		.uleb128 0xa
 4964 1686 73747200 		.string	"str"
 4965 168a BE       		.byte	0xbe
 4966 168b 1E       		.byte	0x1e
GAS LISTING /tmp/cceaV4lG.s 			page 116


 4967 168c B5000000 		.long	0xb5
 4968 1690 01       		.uleb128 0x1
 4969 1691 55       		.byte	0x55
 4970 1692 06       		.uleb128 0x6
 4971 1693 6F757400 		.string	"out"
 4972 1697 BE       		.byte	0xbe
 4973 1698 2E       		.byte	0x2e
 4974 1699 1D170000 		.long	0x171d
 4975 169d 00000000 		.long	.LLST50
 4976 16a1 00000000 		.long	.LVUS50
 4977 16a5 14       		.uleb128 0x14
 4978 16a6 00000000 		.long	.LASF83
 4979 16aa BE       		.byte	0xbe
 4980 16ab 41       		.byte	0x41
 4981 16ac 00010000 		.long	0x100
 4982 16b0 00000000 		.long	.LLST51
 4983 16b4 00000000 		.long	.LVUS51
 4984 16b8 06       		.uleb128 0x6
 4985 16b9 6C656E00 		.string	"len"
 4986 16bd BF       		.byte	0xbf
 4987 16be 26       		.byte	0x26
 4988 16bf 00010000 		.long	0x100
 4989 16c3 00000000 		.long	.LLST52
 4990 16c7 00000000 		.long	.LVUS52
 4991 16cb 0A       		.uleb128 0xa
 4992 16cc 6D696E00 		.string	"min"
 4993 16d0 BF       		.byte	0xbf
 4994 16d1 3A       		.byte	0x3a
 4995 16d2 22010000 		.long	0x122
 4996 16d6 01       		.uleb128 0x1
 4997 16d7 58       		.byte	0x58
 4998 16d8 0A       		.uleb128 0xa
 4999 16d9 6D617800 		.string	"max"
 5000 16dd BF       		.byte	0xbf
 5001 16de 4E       		.byte	0x4e
 5002 16df 22010000 		.long	0x122
 5003 16e3 01       		.uleb128 0x1
 5004 16e4 59       		.byte	0x59
 5005 16e5 05       		.uleb128 0x5
 5006 16e6 76616C00 		.string	"val"
 5007 16ea C1       		.byte	0xc1
 5008 16eb 0E       		.byte	0xe
 5009 16ec 16010000 		.long	0x116
 5010 16f0 00000000 		.long	.LLST53
 5011 16f4 00000000 		.long	.LVUS53
 5012 16f8 05       		.uleb128 0x5
 5013 16f9 706F7700 		.string	"pow"
 5014 16fd C2       		.byte	0xc2
 5015 16fe 0E       		.byte	0xe
 5016 16ff 16010000 		.long	0x116
 5017 1703 00000000 		.long	.LLST54
 5018 1707 00000000 		.long	.LVUS54
 5019 170b 05       		.uleb128 0x5
 5020 170c 6900     		.string	"i"
 5021 170e C3       		.byte	0xc3
 5022 170f 0D       		.byte	0xd
 5023 1710 F4000000 		.long	0xf4
GAS LISTING /tmp/cceaV4lG.s 			page 117


 5024 1714 00000000 		.long	.LLST55
 5025 1718 00000000 		.long	.LVUS55
 5026 171c 00       		.byte	0
 5027 171d 0C       		.uleb128 0xc
 5028 171e 16010000 		.long	0x116
 5029 1722 10       		.uleb128 0x10
 5030 1723 00000000 		.long	.LASF111
 5031 1727 9C       		.byte	0x9c
 5032 1728 09       		.byte	0x9
 5033 1729 F4000000 		.long	0xf4
 5034 172d 00000000 		.quad	.LFB59
 5034      00000000 
 5035 1735 A6000000 		.quad	.LFE59-.LFB59
 5035      00000000 
 5036 173d 01       		.uleb128 0x1
 5037 173e 9C       		.byte	0x9c
 5038 173f DB170000 		.long	0x17db
 5039 1743 0A       		.uleb128 0xa
 5040 1744 73747200 		.string	"str"
 5041 1748 9C       		.byte	0x9c
 5042 1749 1E       		.byte	0x1e
 5043 174a B5000000 		.long	0xb5
 5044 174e 01       		.uleb128 0x1
 5045 174f 55       		.byte	0x55
 5046 1750 06       		.uleb128 0x6
 5047 1751 6F757400 		.string	"out"
 5048 1755 9C       		.byte	0x9c
 5049 1756 2E       		.byte	0x2e
 5050 1757 DB170000 		.long	0x17db
 5051 175b 00000000 		.long	.LLST44
 5052 175f 00000000 		.long	.LVUS44
 5053 1763 14       		.uleb128 0x14
 5054 1764 00000000 		.long	.LASF83
 5055 1768 9C       		.byte	0x9c
 5056 1769 41       		.byte	0x41
 5057 176a 00010000 		.long	0x100
 5058 176e 00000000 		.long	.LLST45
 5059 1772 00000000 		.long	.LVUS45
 5060 1776 06       		.uleb128 0x6
 5061 1777 6C656E00 		.string	"len"
 5062 177b 9D       		.byte	0x9d
 5063 177c 26       		.byte	0x26
 5064 177d 00010000 		.long	0x100
 5065 1781 00000000 		.long	.LLST46
 5066 1785 00000000 		.long	.LVUS46
 5067 1789 0A       		.uleb128 0xa
 5068 178a 6D696E00 		.string	"min"
 5069 178e 9D       		.byte	0x9d
 5070 178f 3A       		.byte	0x3a
 5071 1790 11010000 		.long	0x111
 5072 1794 01       		.uleb128 0x1
 5073 1795 58       		.byte	0x58
 5074 1796 0A       		.uleb128 0xa
 5075 1797 6D617800 		.string	"max"
 5076 179b 9D       		.byte	0x9d
 5077 179c 4E       		.byte	0x4e
 5078 179d 11010000 		.long	0x111
GAS LISTING /tmp/cceaV4lG.s 			page 118


 5079 17a1 01       		.uleb128 0x1
 5080 17a2 59       		.byte	0x59
 5081 17a3 05       		.uleb128 0x5
 5082 17a4 76616C00 		.string	"val"
 5083 17a8 9F       		.byte	0x9f
 5084 17a9 0E       		.byte	0xe
 5085 17aa 05010000 		.long	0x105
 5086 17ae 00000000 		.long	.LLST47
 5087 17b2 00000000 		.long	.LVUS47
 5088 17b6 05       		.uleb128 0x5
 5089 17b7 706F7700 		.string	"pow"
 5090 17bb A0       		.byte	0xa0
 5091 17bc 0E       		.byte	0xe
 5092 17bd 16010000 		.long	0x116
 5093 17c1 00000000 		.long	.LLST48
 5094 17c5 00000000 		.long	.LVUS48
 5095 17c9 05       		.uleb128 0x5
 5096 17ca 6900     		.string	"i"
 5097 17cc A1       		.byte	0xa1
 5098 17cd 0D       		.byte	0xd
 5099 17ce F4000000 		.long	0xf4
 5100 17d2 00000000 		.long	.LLST49
 5101 17d6 00000000 		.long	.LVUS49
 5102 17da 00       		.byte	0
 5103 17db 0C       		.uleb128 0xc
 5104 17dc 05010000 		.long	0x105
 5105 17e0 10       		.uleb128 0x10
 5106 17e1 00000000 		.long	.LASF112
 5107 17e5 7A       		.byte	0x7a
 5108 17e6 09       		.byte	0x9
 5109 17e7 F4000000 		.long	0xf4
 5110 17eb 00000000 		.quad	.LFB58
 5110      00000000 
 5111 17f3 AA000000 		.quad	.LFE58-.LFB58
 5111      00000000 
 5112 17fb 01       		.uleb128 0x1
 5113 17fc 9C       		.byte	0x9c
 5114 17fd A5180000 		.long	0x18a5
 5115 1801 0A       		.uleb128 0xa
 5116 1802 73747200 		.string	"str"
 5117 1806 7A       		.byte	0x7a
 5118 1807 1D       		.byte	0x1d
 5119 1808 B5000000 		.long	0xb5
 5120 180c 01       		.uleb128 0x1
 5121 180d 55       		.byte	0x55
 5122 180e 06       		.uleb128 0x6
 5123 180f 6F757400 		.string	"out"
 5124 1813 7A       		.byte	0x7a
 5125 1814 2C       		.byte	0x2c
 5126 1815 590B0000 		.long	0xb59
 5127 1819 00000000 		.long	.LLST36
 5128 181d 00000000 		.long	.LVUS36
 5129 1821 14       		.uleb128 0x14
 5130 1822 00000000 		.long	.LASF83
 5131 1826 7A       		.byte	0x7a
 5132 1827 3F       		.byte	0x3f
 5133 1828 00010000 		.long	0x100
GAS LISTING /tmp/cceaV4lG.s 			page 119


 5134 182c 00000000 		.long	.LLST37
 5135 1830 00000000 		.long	.LVUS37
 5136 1834 06       		.uleb128 0x6
 5137 1835 6C656E00 		.string	"len"
 5138 1839 7B       		.byte	0x7b
 5139 183a 25       		.byte	0x25
 5140 183b 00010000 		.long	0x100
 5141 183f 00000000 		.long	.LLST38
 5142 1843 00000000 		.long	.LVUS38
 5143 1847 06       		.uleb128 0x6
 5144 1848 6D696E00 		.string	"min"
 5145 184c 7B       		.byte	0x7b
 5146 184d 38       		.byte	0x38
 5147 184e 00010000 		.long	0x100
 5148 1852 00000000 		.long	.LLST39
 5149 1856 00000000 		.long	.LVUS39
 5150 185a 06       		.uleb128 0x6
 5151 185b 6D617800 		.string	"max"
 5152 185f 7B       		.byte	0x7b
 5153 1860 4C       		.byte	0x4c
 5154 1861 11010000 		.long	0x111
 5155 1865 00000000 		.long	.LLST40
 5156 1869 00000000 		.long	.LVUS40
 5157 186d 05       		.uleb128 0x5
 5158 186e 76616C00 		.string	"val"
 5159 1872 7D       		.byte	0x7d
 5160 1873 0D       		.byte	0xd
 5161 1874 F4000000 		.long	0xf4
 5162 1878 00000000 		.long	.LLST41
 5163 187c 00000000 		.long	.LVUS41
 5164 1880 05       		.uleb128 0x5
 5165 1881 706F7700 		.string	"pow"
 5166 1885 7E       		.byte	0x7e
 5167 1886 0E       		.byte	0xe
 5168 1887 16010000 		.long	0x116
 5169 188b 00000000 		.long	.LLST42
 5170 188f 00000000 		.long	.LVUS42
 5171 1893 05       		.uleb128 0x5
 5172 1894 6900     		.string	"i"
 5173 1896 7F       		.byte	0x7f
 5174 1897 0D       		.byte	0xd
 5175 1898 F4000000 		.long	0xf4
 5176 189c 00000000 		.long	.LLST43
 5177 18a0 00000000 		.long	.LVUS43
 5178 18a4 00       		.byte	0
 5179 18a5 10       		.uleb128 0x10
 5180 18a6 00000000 		.long	.LASF113
 5181 18aa 5C       		.byte	0x5c
 5182 18ab 09       		.byte	0x9
 5183 18ac F4000000 		.long	0xf4
 5184 18b0 00000000 		.quad	.LFB57
 5184      00000000 
 5185 18b8 E3000000 		.quad	.LFE57-.LFB57
 5185      00000000 
 5186 18c0 01       		.uleb128 0x1
 5187 18c1 9C       		.byte	0x9c
 5188 18c2 78190000 		.long	0x1978
GAS LISTING /tmp/cceaV4lG.s 			page 120


 5189 18c6 06       		.uleb128 0x6
 5190 18c7 73747200 		.string	"str"
 5191 18cb 5C       		.byte	0x5c
 5192 18cc 1C       		.byte	0x1c
 5193 18cd B5000000 		.long	0xb5
 5194 18d1 00000000 		.long	.LLST28
 5195 18d5 00000000 		.long	.LVUS28
 5196 18d9 06       		.uleb128 0x6
 5197 18da 6F757400 		.string	"out"
 5198 18de 5C       		.byte	0x5c
 5199 18df 2B       		.byte	0x2b
 5200 18e0 F6010000 		.long	0x1f6
 5201 18e4 00000000 		.long	.LLST29
 5202 18e8 00000000 		.long	.LVUS29
 5203 18ec 14       		.uleb128 0x14
 5204 18ed 00000000 		.long	.LASF83
 5205 18f1 5C       		.byte	0x5c
 5206 18f2 3E       		.byte	0x3e
 5207 18f3 00010000 		.long	0x100
 5208 18f7 00000000 		.long	.LLST30
 5209 18fb 00000000 		.long	.LVUS30
 5210 18ff 06       		.uleb128 0x6
 5211 1900 6C656E00 		.string	"len"
 5212 1904 5D       		.byte	0x5d
 5213 1905 24       		.byte	0x24
 5214 1906 00010000 		.long	0x100
 5215 190a 00000000 		.long	.LLST31
 5216 190e 00000000 		.long	.LVUS31
 5217 1912 0A       		.uleb128 0xa
 5218 1913 6D696E00 		.string	"min"
 5219 1917 5D       		.byte	0x5d
 5220 1918 37       		.byte	0x37
 5221 1919 EF000000 		.long	0xef
 5222 191d 01       		.uleb128 0x1
 5223 191e 58       		.byte	0x58
 5224 191f 0A       		.uleb128 0xa
 5225 1920 6D617800 		.string	"max"
 5226 1924 5D       		.byte	0x5d
 5227 1925 4A       		.byte	0x4a
 5228 1926 EF000000 		.long	0xef
 5229 192a 01       		.uleb128 0x1
 5230 192b 59       		.byte	0x59
 5231 192c 05       		.uleb128 0x5
 5232 192d 76616C00 		.string	"val"
 5233 1931 5F       		.byte	0x5f
 5234 1932 0D       		.byte	0xd
 5235 1933 E3000000 		.long	0xe3
 5236 1937 00000000 		.long	.LLST32
 5237 193b 00000000 		.long	.LVUS32
 5238 193f 05       		.uleb128 0x5
 5239 1940 706F7700 		.string	"pow"
 5240 1944 60       		.byte	0x60
 5241 1945 0E       		.byte	0xe
 5242 1946 16010000 		.long	0x116
 5243 194a 00000000 		.long	.LLST33
 5244 194e 00000000 		.long	.LVUS33
 5245 1952 05       		.uleb128 0x5
GAS LISTING /tmp/cceaV4lG.s 			page 121


 5246 1953 6900     		.string	"i"
 5247 1955 61       		.byte	0x61
 5248 1956 0D       		.byte	0xd
 5249 1957 F4000000 		.long	0xf4
 5250 195b 00000000 		.long	.LLST34
 5251 195f 00000000 		.long	.LVUS34
 5252 1963 41       		.uleb128 0x41
 5253 1964 00000000 		.long	.LASF114
 5254 1968 01       		.byte	0x1
 5255 1969 62       		.byte	0x62
 5256 196a 0C       		.byte	0xc
 5257 196b C6000000 		.long	0xc6
 5258 196f 00000000 		.long	.LLST35
 5259 1973 00000000 		.long	.LVUS35
 5260 1977 00       		.byte	0
 5261 1978 10       		.uleb128 0x10
 5262 1979 00000000 		.long	.LASF115
 5263 197d 42       		.byte	0x42
 5264 197e 09       		.byte	0x9
 5265 197f F4000000 		.long	0xf4
 5266 1983 00000000 		.quad	.LFB56
 5266      00000000 
 5267 198b AD000000 		.quad	.LFE56-.LFB56
 5267      00000000 
 5268 1993 01       		.uleb128 0x1
 5269 1994 9C       		.byte	0x9c
 5270 1995 371A0000 		.long	0x1a37
 5271 1999 06       		.uleb128 0x6
 5272 199a 73747200 		.string	"str"
 5273 199e 42       		.byte	0x42
 5274 199f 1D       		.byte	0x1d
 5275 19a0 B5000000 		.long	0xb5
 5276 19a4 00000000 		.long	.LLST21
 5277 19a8 00000000 		.long	.LVUS21
 5278 19ac 06       		.uleb128 0x6
 5279 19ad 6F757400 		.string	"out"
 5280 19b1 42       		.byte	0x42
 5281 19b2 2D       		.byte	0x2d
 5282 19b3 1D170000 		.long	0x171d
 5283 19b7 00000000 		.long	.LLST22
 5284 19bb 00000000 		.long	.LVUS22
 5285 19bf 14       		.uleb128 0x14
 5286 19c0 00000000 		.long	.LASF83
 5287 19c4 42       		.byte	0x42
 5288 19c5 40       		.byte	0x40
 5289 19c6 00010000 		.long	0x100
 5290 19ca 00000000 		.long	.LLST23
 5291 19ce 00000000 		.long	.LVUS23
 5292 19d2 06       		.uleb128 0x6
 5293 19d3 6C656E00 		.string	"len"
 5294 19d7 43       		.byte	0x43
 5295 19d8 25       		.byte	0x25
 5296 19d9 00010000 		.long	0x100
 5297 19dd 00000000 		.long	.LLST24
 5298 19e1 00000000 		.long	.LVUS24
 5299 19e5 0A       		.uleb128 0xa
 5300 19e6 6D696E00 		.string	"min"
GAS LISTING /tmp/cceaV4lG.s 			page 122


 5301 19ea 43       		.byte	0x43
 5302 19eb 39       		.byte	0x39
 5303 19ec 22010000 		.long	0x122
 5304 19f0 01       		.uleb128 0x1
 5305 19f1 58       		.byte	0x58
 5306 19f2 0A       		.uleb128 0xa
 5307 19f3 6D617800 		.string	"max"
 5308 19f7 43       		.byte	0x43
 5309 19f8 4D       		.byte	0x4d
 5310 19f9 22010000 		.long	0x122
 5311 19fd 01       		.uleb128 0x1
 5312 19fe 59       		.byte	0x59
 5313 19ff 05       		.uleb128 0x5
 5314 1a00 76616C00 		.string	"val"
 5315 1a04 45       		.byte	0x45
 5316 1a05 0E       		.byte	0xe
 5317 1a06 16010000 		.long	0x116
 5318 1a0a 00000000 		.long	.LLST25
 5319 1a0e 00000000 		.long	.LVUS25
 5320 1a12 05       		.uleb128 0x5
 5321 1a13 706F7700 		.string	"pow"
 5322 1a17 45       		.byte	0x45
 5323 1a18 17       		.byte	0x17
 5324 1a19 16010000 		.long	0x116
 5325 1a1d 00000000 		.long	.LLST26
 5326 1a21 00000000 		.long	.LVUS26
 5327 1a25 05       		.uleb128 0x5
 5328 1a26 6900     		.string	"i"
 5329 1a28 46       		.byte	0x46
 5330 1a29 0D       		.byte	0xd
 5331 1a2a F4000000 		.long	0xf4
 5332 1a2e 00000000 		.long	.LLST27
 5333 1a32 00000000 		.long	.LVUS27
 5334 1a36 00       		.byte	0
 5335 1a37 10       		.uleb128 0x10
 5336 1a38 00000000 		.long	.LASF116
 5337 1a3c 25       		.byte	0x25
 5338 1a3d 09       		.byte	0x9
 5339 1a3e F4000000 		.long	0xf4
 5340 1a42 00000000 		.quad	.LFB55
 5340      00000000 
 5341 1a4a 75000000 		.quad	.LFE55-.LFB55
 5341      00000000 
 5342 1a52 01       		.uleb128 0x1
 5343 1a53 9C       		.byte	0x9c
 5344 1a54 071B0000 		.long	0x1b07
 5345 1a58 06       		.uleb128 0x6
 5346 1a59 73747200 		.string	"str"
 5347 1a5d 25       		.byte	0x25
 5348 1a5e 1D       		.byte	0x1d
 5349 1a5f B5000000 		.long	0xb5
 5350 1a63 00000000 		.long	.LLST13
 5351 1a67 00000000 		.long	.LVUS13
 5352 1a6b 06       		.uleb128 0x6
 5353 1a6c 6F757400 		.string	"out"
 5354 1a70 25       		.byte	0x25
 5355 1a71 2D       		.byte	0x2d
GAS LISTING /tmp/cceaV4lG.s 			page 123


 5356 1a72 DB170000 		.long	0x17db
 5357 1a76 00000000 		.long	.LLST14
 5358 1a7a 00000000 		.long	.LVUS14
 5359 1a7e 14       		.uleb128 0x14
 5360 1a7f 00000000 		.long	.LASF83
 5361 1a83 25       		.byte	0x25
 5362 1a84 40       		.byte	0x40
 5363 1a85 00010000 		.long	0x100
 5364 1a89 00000000 		.long	.LLST15
 5365 1a8d 00000000 		.long	.LVUS15
 5366 1a91 06       		.uleb128 0x6
 5367 1a92 6C656E00 		.string	"len"
 5368 1a96 26       		.byte	0x26
 5369 1a97 25       		.byte	0x25
 5370 1a98 00010000 		.long	0x100
 5371 1a9c 00000000 		.long	.LLST16
 5372 1aa0 00000000 		.long	.LVUS16
 5373 1aa4 0A       		.uleb128 0xa
 5374 1aa5 6D696E00 		.string	"min"
 5375 1aa9 26       		.byte	0x26
 5376 1aaa 39       		.byte	0x39
 5377 1aab 11010000 		.long	0x111
 5378 1aaf 01       		.uleb128 0x1
 5379 1ab0 58       		.byte	0x58
 5380 1ab1 0A       		.uleb128 0xa
 5381 1ab2 6D617800 		.string	"max"
 5382 1ab6 26       		.byte	0x26
 5383 1ab7 4D       		.byte	0x4d
 5384 1ab8 11010000 		.long	0x111
 5385 1abc 01       		.uleb128 0x1
 5386 1abd 59       		.byte	0x59
 5387 1abe 05       		.uleb128 0x5
 5388 1abf 76616C00 		.string	"val"
 5389 1ac3 28       		.byte	0x28
 5390 1ac4 0E       		.byte	0xe
 5391 1ac5 05010000 		.long	0x105
 5392 1ac9 00000000 		.long	.LLST17
 5393 1acd 00000000 		.long	.LVUS17
 5394 1ad1 05       		.uleb128 0x5
 5395 1ad2 706F7700 		.string	"pow"
 5396 1ad6 29       		.byte	0x29
 5397 1ad7 0E       		.byte	0xe
 5398 1ad8 16010000 		.long	0x116
 5399 1adc 00000000 		.long	.LLST18
 5400 1ae0 00000000 		.long	.LVUS18
 5401 1ae4 05       		.uleb128 0x5
 5402 1ae5 6900     		.string	"i"
 5403 1ae7 2A       		.byte	0x2a
 5404 1ae8 0D       		.byte	0xd
 5405 1ae9 F4000000 		.long	0xf4
 5406 1aed 00000000 		.long	.LLST19
 5407 1af1 00000000 		.long	.LVUS19
 5408 1af5 05       		.uleb128 0x5
 5409 1af6 6300     		.string	"c"
 5410 1af8 2A       		.byte	0x2a
 5411 1af9 10       		.byte	0x10
 5412 1afa F4000000 		.long	0xf4
GAS LISTING /tmp/cceaV4lG.s 			page 124


 5413 1afe 00000000 		.long	.LLST20
 5414 1b02 00000000 		.long	.LVUS20
 5415 1b06 00       		.byte	0
 5416 1b07 10       		.uleb128 0x10
 5417 1b08 00000000 		.long	.LASF117
 5418 1b0c 0D       		.byte	0xd
 5419 1b0d 09       		.byte	0x9
 5420 1b0e F4000000 		.long	0xf4
 5421 1b12 00000000 		.quad	.LFB54
 5421      00000000 
 5422 1b1a BD000000 		.quad	.LFE54-.LFB54
 5422      00000000 
 5423 1b22 01       		.uleb128 0x1
 5424 1b23 9C       		.byte	0x9c
 5425 1b24 D21B0000 		.long	0x1bd2
 5426 1b28 06       		.uleb128 0x6
 5427 1b29 73747200 		.string	"str"
 5428 1b2d 0D       		.byte	0xd
 5429 1b2e 1C       		.byte	0x1c
 5430 1b2f B5000000 		.long	0xb5
 5431 1b33 00000000 		.long	.LLST4
 5432 1b37 00000000 		.long	.LVUS4
 5433 1b3b 06       		.uleb128 0x6
 5434 1b3c 6F757400 		.string	"out"
 5435 1b40 0D       		.byte	0xd
 5436 1b41 2B       		.byte	0x2b
 5437 1b42 590B0000 		.long	0xb59
 5438 1b46 00000000 		.long	.LLST5
 5439 1b4a 00000000 		.long	.LVUS5
 5440 1b4e 14       		.uleb128 0x14
 5441 1b4f 00000000 		.long	.LASF83
 5442 1b53 0D       		.byte	0xd
 5443 1b54 3E       		.byte	0x3e
 5444 1b55 00010000 		.long	0x100
 5445 1b59 00000000 		.long	.LLST6
 5446 1b5d 00000000 		.long	.LVUS6
 5447 1b61 06       		.uleb128 0x6
 5448 1b62 6C656E00 		.string	"len"
 5449 1b66 0E       		.byte	0xe
 5450 1b67 24       		.byte	0x24
 5451 1b68 00010000 		.long	0x100
 5452 1b6c 00000000 		.long	.LLST7
 5453 1b70 00000000 		.long	.LVUS7
 5454 1b74 06       		.uleb128 0x6
 5455 1b75 6D696E00 		.string	"min"
 5456 1b79 0E       		.byte	0xe
 5457 1b7a 37       		.byte	0x37
 5458 1b7b 00010000 		.long	0x100
 5459 1b7f 00000000 		.long	.LLST8
 5460 1b83 00000000 		.long	.LVUS8
 5461 1b87 06       		.uleb128 0x6
 5462 1b88 6D617800 		.string	"max"
 5463 1b8c 0E       		.byte	0xe
 5464 1b8d 4A       		.byte	0x4a
 5465 1b8e 00010000 		.long	0x100
 5466 1b92 00000000 		.long	.LLST9
 5467 1b96 00000000 		.long	.LVUS9
GAS LISTING /tmp/cceaV4lG.s 			page 125


 5468 1b9a 05       		.uleb128 0x5
 5469 1b9b 76616C00 		.string	"val"
 5470 1b9f 10       		.byte	0x10
 5471 1ba0 0E       		.byte	0xe
 5472 1ba1 16010000 		.long	0x116
 5473 1ba5 00000000 		.long	.LLST10
 5474 1ba9 00000000 		.long	.LVUS10
 5475 1bad 05       		.uleb128 0x5
 5476 1bae 706F7700 		.string	"pow"
 5477 1bb2 10       		.byte	0x10
 5478 1bb3 17       		.byte	0x17
 5479 1bb4 16010000 		.long	0x116
 5480 1bb8 00000000 		.long	.LLST11
 5481 1bbc 00000000 		.long	.LVUS11
 5482 1bc0 05       		.uleb128 0x5
 5483 1bc1 6900     		.string	"i"
 5484 1bc3 11       		.byte	0x11
 5485 1bc4 0D       		.byte	0xd
 5486 1bc5 F4000000 		.long	0xf4
 5487 1bc9 00000000 		.long	.LLST12
 5488 1bcd 00000000 		.long	.LVUS12
 5489 1bd1 00       		.byte	0
 5490 1bd2 42       		.uleb128 0x42
 5491 1bd3 00000000 		.long	.LASF118
 5492 1bd7 02       		.byte	0x2
 5493 1bd8 1A       		.byte	0x1a
 5494 1bd9 01       		.byte	0x1
 5495 1bda AE000000 		.long	0xae
 5496 1bde 03       		.byte	0x3
 5497 1bdf FF1B0000 		.long	0x1bff
 5498 1be3 1F       		.uleb128 0x1f
 5499 1be4 00000000 		.long	.LASF119
 5500 1be8 B0000000 		.long	0xb0
 5501 1bec 1F       		.uleb128 0x1f
 5502 1bed 00000000 		.long	.LASF120
 5503 1bf1 26020000 		.long	0x226
 5504 1bf5 1F       		.uleb128 0x1f
 5505 1bf6 00000000 		.long	.LASF121
 5506 1bfa 27010000 		.long	0x127
 5507 1bfe 00       		.byte	0
 5508 1bff 43       		.uleb128 0x43
 5509 1c00 05       		.uleb128 0x5
 5510 1c01 9E       		.byte	0x9e
 5511 1c02 03       		.uleb128 0x3
 5512 1c03 30       		.byte	0x30
 5513 1c04 78       		.byte	0x78
 5514 1c05 00       		.byte	0
 5515 1c06 00       		.byte	0
 5516              		.section	.debug_abbrev,"",@progbits
 5517              	.Ldebug_abbrev0:
 5518 0000 01       		.uleb128 0x1
 5519 0001 08       		.uleb128 0x8
 5520 0002 00       		.byte	0
 5521 0003 3A       		.uleb128 0x3a
 5522 0004 0B       		.uleb128 0xb
 5523 0005 3B       		.uleb128 0x3b
 5524 0006 0B       		.uleb128 0xb
GAS LISTING /tmp/cceaV4lG.s 			page 126


 5525 0007 39       		.uleb128 0x39
 5526 0008 0B       		.uleb128 0xb
 5527 0009 18       		.uleb128 0x18
 5528 000a 13       		.uleb128 0x13
 5529 000b 00       		.byte	0
 5530 000c 00       		.byte	0
 5531 000d 02       		.uleb128 0x2
 5532 000e 05       		.uleb128 0x5
 5533 000f 00       		.byte	0
 5534 0010 49       		.uleb128 0x49
 5535 0011 13       		.uleb128 0x13
 5536 0012 00       		.byte	0
 5537 0013 00       		.byte	0
 5538 0014 03       		.uleb128 0x3
 5539 0015 05       		.uleb128 0x5
 5540 0016 00       		.byte	0
 5541 0017 31       		.uleb128 0x31
 5542 0018 13       		.uleb128 0x13
 5543 0019 02       		.uleb128 0x2
 5544 001a 17       		.uleb128 0x17
 5545 001b B742     		.uleb128 0x2137
 5546 001d 17       		.uleb128 0x17
 5547 001e 00       		.byte	0
 5548 001f 00       		.byte	0
 5549 0020 04       		.uleb128 0x4
 5550 0021 34       		.uleb128 0x34
 5551 0022 00       		.byte	0
 5552 0023 03       		.uleb128 0x3
 5553 0024 08       		.uleb128 0x8
 5554 0025 3A       		.uleb128 0x3a
 5555 0026 21       		.uleb128 0x21
 5556 0027 01       		.sleb128 1
 5557 0028 3B       		.uleb128 0x3b
 5558 0029 05       		.uleb128 0x5
 5559 002a 39       		.uleb128 0x39
 5560 002b 0B       		.uleb128 0xb
 5561 002c 49       		.uleb128 0x49
 5562 002d 13       		.uleb128 0x13
 5563 002e 02       		.uleb128 0x2
 5564 002f 17       		.uleb128 0x17
 5565 0030 B742     		.uleb128 0x2137
 5566 0032 17       		.uleb128 0x17
 5567 0033 00       		.byte	0
 5568 0034 00       		.byte	0
 5569 0035 05       		.uleb128 0x5
 5570 0036 34       		.uleb128 0x34
 5571 0037 00       		.byte	0
 5572 0038 03       		.uleb128 0x3
 5573 0039 08       		.uleb128 0x8
 5574 003a 3A       		.uleb128 0x3a
 5575 003b 21       		.uleb128 0x21
 5576 003c 01       		.sleb128 1
 5577 003d 3B       		.uleb128 0x3b
 5578 003e 0B       		.uleb128 0xb
 5579 003f 39       		.uleb128 0x39
 5580 0040 0B       		.uleb128 0xb
 5581 0041 49       		.uleb128 0x49
GAS LISTING /tmp/cceaV4lG.s 			page 127


 5582 0042 13       		.uleb128 0x13
 5583 0043 02       		.uleb128 0x2
 5584 0044 17       		.uleb128 0x17
 5585 0045 B742     		.uleb128 0x2137
 5586 0047 17       		.uleb128 0x17
 5587 0048 00       		.byte	0
 5588 0049 00       		.byte	0
 5589 004a 06       		.uleb128 0x6
 5590 004b 05       		.uleb128 0x5
 5591 004c 00       		.byte	0
 5592 004d 03       		.uleb128 0x3
 5593 004e 08       		.uleb128 0x8
 5594 004f 3A       		.uleb128 0x3a
 5595 0050 21       		.uleb128 0x21
 5596 0051 01       		.sleb128 1
 5597 0052 3B       		.uleb128 0x3b
 5598 0053 0B       		.uleb128 0xb
 5599 0054 39       		.uleb128 0x39
 5600 0055 0B       		.uleb128 0xb
 5601 0056 49       		.uleb128 0x49
 5602 0057 13       		.uleb128 0x13
 5603 0058 02       		.uleb128 0x2
 5604 0059 17       		.uleb128 0x17
 5605 005a B742     		.uleb128 0x2137
 5606 005c 17       		.uleb128 0x17
 5607 005d 00       		.byte	0
 5608 005e 00       		.byte	0
 5609 005f 07       		.uleb128 0x7
 5610 0060 05       		.uleb128 0x5
 5611 0061 00       		.byte	0
 5612 0062 03       		.uleb128 0x3
 5613 0063 08       		.uleb128 0x8
 5614 0064 3A       		.uleb128 0x3a
 5615 0065 21       		.uleb128 0x21
 5616 0066 01       		.sleb128 1
 5617 0067 3B       		.uleb128 0x3b
 5618 0068 05       		.uleb128 0x5
 5619 0069 39       		.uleb128 0x39
 5620 006a 0B       		.uleb128 0xb
 5621 006b 49       		.uleb128 0x49
 5622 006c 13       		.uleb128 0x13
 5623 006d 02       		.uleb128 0x2
 5624 006e 17       		.uleb128 0x17
 5625 006f B742     		.uleb128 0x2137
 5626 0071 17       		.uleb128 0x17
 5627 0072 00       		.byte	0
 5628 0073 00       		.byte	0
 5629 0074 08       		.uleb128 0x8
 5630 0075 24       		.uleb128 0x24
 5631 0076 00       		.byte	0
 5632 0077 0B       		.uleb128 0xb
 5633 0078 0B       		.uleb128 0xb
 5634 0079 3E       		.uleb128 0x3e
 5635 007a 0B       		.uleb128 0xb
 5636 007b 03       		.uleb128 0x3
 5637 007c 0E       		.uleb128 0xe
 5638 007d 00       		.byte	0
GAS LISTING /tmp/cceaV4lG.s 			page 128


 5639 007e 00       		.byte	0
 5640 007f 09       		.uleb128 0x9
 5641 0080 16       		.uleb128 0x16
 5642 0081 00       		.byte	0
 5643 0082 03       		.uleb128 0x3
 5644 0083 0E       		.uleb128 0xe
 5645 0084 3A       		.uleb128 0x3a
 5646 0085 0B       		.uleb128 0xb
 5647 0086 3B       		.uleb128 0x3b
 5648 0087 0B       		.uleb128 0xb
 5649 0088 39       		.uleb128 0x39
 5650 0089 0B       		.uleb128 0xb
 5651 008a 49       		.uleb128 0x49
 5652 008b 13       		.uleb128 0x13
 5653 008c 00       		.byte	0
 5654 008d 00       		.byte	0
 5655 008e 0A       		.uleb128 0xa
 5656 008f 05       		.uleb128 0x5
 5657 0090 00       		.byte	0
 5658 0091 03       		.uleb128 0x3
 5659 0092 08       		.uleb128 0x8
 5660 0093 3A       		.uleb128 0x3a
 5661 0094 21       		.uleb128 0x21
 5662 0095 01       		.sleb128 1
 5663 0096 3B       		.uleb128 0x3b
 5664 0097 0B       		.uleb128 0xb
 5665 0098 39       		.uleb128 0x39
 5666 0099 0B       		.uleb128 0xb
 5667 009a 49       		.uleb128 0x49
 5668 009b 13       		.uleb128 0x13
 5669 009c 02       		.uleb128 0x2
 5670 009d 18       		.uleb128 0x18
 5671 009e 00       		.byte	0
 5672 009f 00       		.byte	0
 5673 00a0 0B       		.uleb128 0xb
 5674 00a1 2E       		.uleb128 0x2e
 5675 00a2 01       		.byte	0x1
 5676 00a3 3F       		.uleb128 0x3f
 5677 00a4 19       		.uleb128 0x19
 5678 00a5 03       		.uleb128 0x3
 5679 00a6 0E       		.uleb128 0xe
 5680 00a7 3A       		.uleb128 0x3a
 5681 00a8 21       		.uleb128 0x21
 5682 00a9 01       		.sleb128 1
 5683 00aa 3B       		.uleb128 0x3b
 5684 00ab 05       		.uleb128 0x5
 5685 00ac 39       		.uleb128 0x39
 5686 00ad 0B       		.uleb128 0xb
 5687 00ae 49       		.uleb128 0x49
 5688 00af 13       		.uleb128 0x13
 5689 00b0 11       		.uleb128 0x11
 5690 00b1 01       		.uleb128 0x1
 5691 00b2 12       		.uleb128 0x12
 5692 00b3 07       		.uleb128 0x7
 5693 00b4 40       		.uleb128 0x40
 5694 00b5 18       		.uleb128 0x18
 5695 00b6 7A       		.uleb128 0x7a
GAS LISTING /tmp/cceaV4lG.s 			page 129


 5696 00b7 19       		.uleb128 0x19
 5697 00b8 01       		.uleb128 0x1
 5698 00b9 13       		.uleb128 0x13
 5699 00ba 00       		.byte	0
 5700 00bb 00       		.byte	0
 5701 00bc 0C       		.uleb128 0xc
 5702 00bd 0F       		.uleb128 0xf
 5703 00be 00       		.byte	0
 5704 00bf 0B       		.uleb128 0xb
 5705 00c0 21       		.uleb128 0x21
 5706 00c1 08       		.sleb128 8
 5707 00c2 49       		.uleb128 0x49
 5708 00c3 13       		.uleb128 0x13
 5709 00c4 00       		.byte	0
 5710 00c5 00       		.byte	0
 5711 00c6 0D       		.uleb128 0xd
 5712 00c7 2E       		.uleb128 0x2e
 5713 00c8 01       		.byte	0x1
 5714 00c9 3F       		.uleb128 0x3f
 5715 00ca 19       		.uleb128 0x19
 5716 00cb 03       		.uleb128 0x3
 5717 00cc 0E       		.uleb128 0xe
 5718 00cd 3A       		.uleb128 0x3a
 5719 00ce 0B       		.uleb128 0xb
 5720 00cf 3B       		.uleb128 0x3b
 5721 00d0 0B       		.uleb128 0xb
 5722 00d1 39       		.uleb128 0x39
 5723 00d2 0B       		.uleb128 0xb
 5724 00d3 49       		.uleb128 0x49
 5725 00d4 13       		.uleb128 0x13
 5726 00d5 3C       		.uleb128 0x3c
 5727 00d6 19       		.uleb128 0x19
 5728 00d7 01       		.uleb128 0x1
 5729 00d8 13       		.uleb128 0x13
 5730 00d9 00       		.byte	0
 5731 00da 00       		.byte	0
 5732 00db 0E       		.uleb128 0xe
 5733 00dc 2E       		.uleb128 0x2e
 5734 00dd 01       		.byte	0x1
 5735 00de 3F       		.uleb128 0x3f
 5736 00df 19       		.uleb128 0x19
 5737 00e0 03       		.uleb128 0x3
 5738 00e1 0E       		.uleb128 0xe
 5739 00e2 3A       		.uleb128 0x3a
 5740 00e3 0B       		.uleb128 0xb
 5741 00e4 3B       		.uleb128 0x3b
 5742 00e5 05       		.uleb128 0x5
 5743 00e6 39       		.uleb128 0x39
 5744 00e7 0B       		.uleb128 0xb
 5745 00e8 49       		.uleb128 0x49
 5746 00e9 13       		.uleb128 0x13
 5747 00ea 3C       		.uleb128 0x3c
 5748 00eb 19       		.uleb128 0x19
 5749 00ec 01       		.uleb128 0x1
 5750 00ed 13       		.uleb128 0x13
 5751 00ee 00       		.byte	0
 5752 00ef 00       		.byte	0
GAS LISTING /tmp/cceaV4lG.s 			page 130


 5753 00f0 0F       		.uleb128 0xf
 5754 00f1 26       		.uleb128 0x26
 5755 00f2 00       		.byte	0
 5756 00f3 49       		.uleb128 0x49
 5757 00f4 13       		.uleb128 0x13
 5758 00f5 00       		.byte	0
 5759 00f6 00       		.byte	0
 5760 00f7 10       		.uleb128 0x10
 5761 00f8 2E       		.uleb128 0x2e
 5762 00f9 01       		.byte	0x1
 5763 00fa 3F       		.uleb128 0x3f
 5764 00fb 19       		.uleb128 0x19
 5765 00fc 03       		.uleb128 0x3
 5766 00fd 0E       		.uleb128 0xe
 5767 00fe 3A       		.uleb128 0x3a
 5768 00ff 21       		.uleb128 0x21
 5769 0100 01       		.sleb128 1
 5770 0101 3B       		.uleb128 0x3b
 5771 0102 0B       		.uleb128 0xb
 5772 0103 39       		.uleb128 0x39
 5773 0104 0B       		.uleb128 0xb
 5774 0105 49       		.uleb128 0x49
 5775 0106 13       		.uleb128 0x13
 5776 0107 11       		.uleb128 0x11
 5777 0108 01       		.uleb128 0x1
 5778 0109 12       		.uleb128 0x12
 5779 010a 07       		.uleb128 0x7
 5780 010b 40       		.uleb128 0x40
 5781 010c 18       		.uleb128 0x18
 5782 010d 7A       		.uleb128 0x7a
 5783 010e 19       		.uleb128 0x19
 5784 010f 01       		.uleb128 0x1
 5785 0110 13       		.uleb128 0x13
 5786 0111 00       		.byte	0
 5787 0112 00       		.byte	0
 5788 0113 11       		.uleb128 0x11
 5789 0114 2E       		.uleb128 0x2e
 5790 0115 01       		.byte	0x1
 5791 0116 3F       		.uleb128 0x3f
 5792 0117 19       		.uleb128 0x19
 5793 0118 03       		.uleb128 0x3
 5794 0119 08       		.uleb128 0x8
 5795 011a 3A       		.uleb128 0x3a
 5796 011b 21       		.uleb128 0x21
 5797 011c 09       		.sleb128 9
 5798 011d 3B       		.uleb128 0x3b
 5799 011e 0B       		.uleb128 0xb
 5800 011f 39       		.uleb128 0x39
 5801 0120 21       		.uleb128 0x21
 5802 0121 03       		.sleb128 3
 5803 0122 6E       		.uleb128 0x6e
 5804 0123 0E       		.uleb128 0xe
 5805 0124 49       		.uleb128 0x49
 5806 0125 13       		.uleb128 0x13
 5807 0126 3C       		.uleb128 0x3c
 5808 0127 19       		.uleb128 0x19
 5809 0128 01       		.uleb128 0x1
GAS LISTING /tmp/cceaV4lG.s 			page 131


 5810 0129 13       		.uleb128 0x13
 5811 012a 00       		.byte	0
 5812 012b 00       		.byte	0
 5813 012c 12       		.uleb128 0x12
 5814 012d 05       		.uleb128 0x5
 5815 012e 00       		.byte	0
 5816 012f 03       		.uleb128 0x3
 5817 0130 0E       		.uleb128 0xe
 5818 0131 3A       		.uleb128 0x3a
 5819 0132 21       		.uleb128 0x21
 5820 0133 01       		.sleb128 1
 5821 0134 3B       		.uleb128 0x3b
 5822 0135 05       		.uleb128 0x5
 5823 0136 39       		.uleb128 0x39
 5824 0137 0B       		.uleb128 0xb
 5825 0138 49       		.uleb128 0x49
 5826 0139 13       		.uleb128 0x13
 5827 013a 02       		.uleb128 0x2
 5828 013b 17       		.uleb128 0x17
 5829 013c B742     		.uleb128 0x2137
 5830 013e 17       		.uleb128 0x17
 5831 013f 00       		.byte	0
 5832 0140 00       		.byte	0
 5833 0141 13       		.uleb128 0x13
 5834 0142 1D       		.uleb128 0x1d
 5835 0143 01       		.byte	0x1
 5836 0144 31       		.uleb128 0x31
 5837 0145 13       		.uleb128 0x13
 5838 0146 52       		.uleb128 0x52
 5839 0147 01       		.uleb128 0x1
 5840 0148 B842     		.uleb128 0x2138
 5841 014a 0B       		.uleb128 0xb
 5842 014b 11       		.uleb128 0x11
 5843 014c 01       		.uleb128 0x1
 5844 014d 12       		.uleb128 0x12
 5845 014e 07       		.uleb128 0x7
 5846 014f 58       		.uleb128 0x58
 5847 0150 21       		.uleb128 0x21
 5848 0151 01       		.sleb128 1
 5849 0152 59       		.uleb128 0x59
 5850 0153 05       		.uleb128 0x5
 5851 0154 57       		.uleb128 0x57
 5852 0155 0B       		.uleb128 0xb
 5853 0156 01       		.uleb128 0x1
 5854 0157 13       		.uleb128 0x13
 5855 0158 00       		.byte	0
 5856 0159 00       		.byte	0
 5857 015a 14       		.uleb128 0x14
 5858 015b 05       		.uleb128 0x5
 5859 015c 00       		.byte	0
 5860 015d 03       		.uleb128 0x3
 5861 015e 0E       		.uleb128 0xe
 5862 015f 3A       		.uleb128 0x3a
 5863 0160 21       		.uleb128 0x21
 5864 0161 01       		.sleb128 1
 5865 0162 3B       		.uleb128 0x3b
 5866 0163 0B       		.uleb128 0xb
GAS LISTING /tmp/cceaV4lG.s 			page 132


 5867 0164 39       		.uleb128 0x39
 5868 0165 0B       		.uleb128 0xb
 5869 0166 49       		.uleb128 0x49
 5870 0167 13       		.uleb128 0x13
 5871 0168 02       		.uleb128 0x2
 5872 0169 17       		.uleb128 0x17
 5873 016a B742     		.uleb128 0x2137
 5874 016c 17       		.uleb128 0x17
 5875 016d 00       		.byte	0
 5876 016e 00       		.byte	0
 5877 016f 15       		.uleb128 0x15
 5878 0170 49       		.uleb128 0x49
 5879 0171 00       		.byte	0
 5880 0172 02       		.uleb128 0x2
 5881 0173 18       		.uleb128 0x18
 5882 0174 7E       		.uleb128 0x7e
 5883 0175 18       		.uleb128 0x18
 5884 0176 00       		.byte	0
 5885 0177 00       		.byte	0
 5886 0178 16       		.uleb128 0x16
 5887 0179 34       		.uleb128 0x34
 5888 017a 00       		.byte	0
 5889 017b 03       		.uleb128 0x3
 5890 017c 0E       		.uleb128 0xe
 5891 017d 3A       		.uleb128 0x3a
 5892 017e 21       		.uleb128 0x21
 5893 017f 01       		.sleb128 1
 5894 0180 3B       		.uleb128 0x3b
 5895 0181 05       		.uleb128 0x5
 5896 0182 39       		.uleb128 0x39
 5897 0183 0B       		.uleb128 0xb
 5898 0184 49       		.uleb128 0x49
 5899 0185 13       		.uleb128 0x13
 5900 0186 02       		.uleb128 0x2
 5901 0187 17       		.uleb128 0x17
 5902 0188 B742     		.uleb128 0x2137
 5903 018a 17       		.uleb128 0x17
 5904 018b 00       		.byte	0
 5905 018c 00       		.byte	0
 5906 018d 17       		.uleb128 0x17
 5907 018e 34       		.uleb128 0x34
 5908 018f 00       		.byte	0
 5909 0190 31       		.uleb128 0x31
 5910 0191 13       		.uleb128 0x13
 5911 0192 02       		.uleb128 0x2
 5912 0193 17       		.uleb128 0x17
 5913 0194 B742     		.uleb128 0x2137
 5914 0196 17       		.uleb128 0x17
 5915 0197 00       		.byte	0
 5916 0198 00       		.byte	0
 5917 0199 18       		.uleb128 0x18
 5918 019a 13       		.uleb128 0x13
 5919 019b 01       		.byte	0x1
 5920 019c 0B       		.uleb128 0xb
 5921 019d 0B       		.uleb128 0xb
 5922 019e 3A       		.uleb128 0x3a
 5923 019f 21       		.uleb128 0x21
GAS LISTING /tmp/cceaV4lG.s 			page 133


 5924 01a0 07       		.sleb128 7
 5925 01a1 3B       		.uleb128 0x3b
 5926 01a2 0B       		.uleb128 0xb
 5927 01a3 39       		.uleb128 0x39
 5928 01a4 21       		.uleb128 0x21
 5929 01a5 03       		.sleb128 3
 5930 01a6 6E       		.uleb128 0x6e
 5931 01a7 0E       		.uleb128 0xe
 5932 01a8 01       		.uleb128 0x1
 5933 01a9 13       		.uleb128 0x13
 5934 01aa 00       		.byte	0
 5935 01ab 00       		.byte	0
 5936 01ac 19       		.uleb128 0x19
 5937 01ad 0D       		.uleb128 0xd
 5938 01ae 00       		.byte	0
 5939 01af 03       		.uleb128 0x3
 5940 01b0 0E       		.uleb128 0xe
 5941 01b1 3A       		.uleb128 0x3a
 5942 01b2 21       		.uleb128 0x21
 5943 01b3 07       		.sleb128 7
 5944 01b4 3B       		.uleb128 0x3b
 5945 01b5 0B       		.uleb128 0xb
 5946 01b6 39       		.uleb128 0x39
 5947 01b7 0B       		.uleb128 0xb
 5948 01b8 49       		.uleb128 0x49
 5949 01b9 13       		.uleb128 0x13
 5950 01ba 38       		.uleb128 0x38
 5951 01bb 21       		.uleb128 0x21
 5952 01bc 00       		.sleb128 0
 5953 01bd 00       		.byte	0
 5954 01be 00       		.byte	0
 5955 01bf 1A       		.uleb128 0x1a
 5956 01c0 0D       		.uleb128 0xd
 5957 01c1 00       		.byte	0
 5958 01c2 03       		.uleb128 0x3
 5959 01c3 08       		.uleb128 0x8
 5960 01c4 3A       		.uleb128 0x3a
 5961 01c5 21       		.uleb128 0x21
 5962 01c6 07       		.sleb128 7
 5963 01c7 3B       		.uleb128 0x3b
 5964 01c8 0B       		.uleb128 0xb
 5965 01c9 39       		.uleb128 0x39
 5966 01ca 0B       		.uleb128 0xb
 5967 01cb 49       		.uleb128 0x49
 5968 01cc 13       		.uleb128 0x13
 5969 01cd 38       		.uleb128 0x38
 5970 01ce 0B       		.uleb128 0xb
 5971 01cf 00       		.byte	0
 5972 01d0 00       		.byte	0
 5973 01d1 1B       		.uleb128 0x1b
 5974 01d2 28       		.uleb128 0x28
 5975 01d3 00       		.byte	0
 5976 01d4 03       		.uleb128 0x3
 5977 01d5 0E       		.uleb128 0xe
 5978 01d6 1C       		.uleb128 0x1c
 5979 01d7 0B       		.uleb128 0xb
 5980 01d8 00       		.byte	0
GAS LISTING /tmp/cceaV4lG.s 			page 134


 5981 01d9 00       		.byte	0
 5982 01da 1C       		.uleb128 0x1c
 5983 01db 48       		.uleb128 0x48
 5984 01dc 01       		.byte	0x1
 5985 01dd 7D       		.uleb128 0x7d
 5986 01de 01       		.uleb128 0x1
 5987 01df 7F       		.uleb128 0x7f
 5988 01e0 13       		.uleb128 0x13
 5989 01e1 00       		.byte	0
 5990 01e2 00       		.byte	0
 5991 01e3 1D       		.uleb128 0x1d
 5992 01e4 1D       		.uleb128 0x1d
 5993 01e5 01       		.byte	0x1
 5994 01e6 31       		.uleb128 0x31
 5995 01e7 13       		.uleb128 0x13
 5996 01e8 52       		.uleb128 0x52
 5997 01e9 01       		.uleb128 0x1
 5998 01ea B842     		.uleb128 0x2138
 5999 01ec 0B       		.uleb128 0xb
 6000 01ed 55       		.uleb128 0x55
 6001 01ee 17       		.uleb128 0x17
 6002 01ef 58       		.uleb128 0x58
 6003 01f0 21       		.uleb128 0x21
 6004 01f1 01       		.sleb128 1
 6005 01f2 59       		.uleb128 0x59
 6006 01f3 05       		.uleb128 0x5
 6007 01f4 57       		.uleb128 0x57
 6008 01f5 0B       		.uleb128 0xb
 6009 01f6 00       		.byte	0
 6010 01f7 00       		.byte	0
 6011 01f8 1E       		.uleb128 0x1e
 6012 01f9 1D       		.uleb128 0x1d
 6013 01fa 01       		.byte	0x1
 6014 01fb 31       		.uleb128 0x31
 6015 01fc 13       		.uleb128 0x13
 6016 01fd 52       		.uleb128 0x52
 6017 01fe 01       		.uleb128 0x1
 6018 01ff B842     		.uleb128 0x2138
 6019 0201 0B       		.uleb128 0xb
 6020 0202 55       		.uleb128 0x55
 6021 0203 17       		.uleb128 0x17
 6022 0204 58       		.uleb128 0x58
 6023 0205 21       		.uleb128 0x21
 6024 0206 01       		.sleb128 1
 6025 0207 59       		.uleb128 0x59
 6026 0208 05       		.uleb128 0x5
 6027 0209 57       		.uleb128 0x57
 6028 020a 21       		.uleb128 0x21
 6029 020b 0F       		.sleb128 15
 6030 020c 01       		.uleb128 0x1
 6031 020d 13       		.uleb128 0x13
 6032 020e 00       		.byte	0
 6033 020f 00       		.byte	0
 6034 0210 1F       		.uleb128 0x1f
 6035 0211 05       		.uleb128 0x5
 6036 0212 00       		.byte	0
 6037 0213 03       		.uleb128 0x3
GAS LISTING /tmp/cceaV4lG.s 			page 135


 6038 0214 0E       		.uleb128 0xe
 6039 0215 3A       		.uleb128 0x3a
 6040 0216 21       		.uleb128 0x21
 6041 0217 02       		.sleb128 2
 6042 0218 3B       		.uleb128 0x3b
 6043 0219 21       		.uleb128 0x21
 6044 021a 1A       		.sleb128 26
 6045 021b 39       		.uleb128 0x39
 6046 021c 21       		.uleb128 0x21
 6047 021d 01       		.sleb128 1
 6048 021e 49       		.uleb128 0x49
 6049 021f 13       		.uleb128 0x13
 6050 0220 00       		.byte	0
 6051 0221 00       		.byte	0
 6052 0222 20       		.uleb128 0x20
 6053 0223 37       		.uleb128 0x37
 6054 0224 00       		.byte	0
 6055 0225 49       		.uleb128 0x49
 6056 0226 13       		.uleb128 0x13
 6057 0227 00       		.byte	0
 6058 0228 00       		.byte	0
 6059 0229 21       		.uleb128 0x21
 6060 022a 2E       		.uleb128 0x2e
 6061 022b 01       		.byte	0x1
 6062 022c 3F       		.uleb128 0x3f
 6063 022d 19       		.uleb128 0x19
 6064 022e 03       		.uleb128 0x3
 6065 022f 08       		.uleb128 0x8
 6066 0230 3A       		.uleb128 0x3a
 6067 0231 21       		.uleb128 0x21
 6068 0232 08       		.sleb128 8
 6069 0233 3B       		.uleb128 0x3b
 6070 0234 0B       		.uleb128 0xb
 6071 0235 39       		.uleb128 0x39
 6072 0236 21       		.uleb128 0x21
 6073 0237 03       		.sleb128 3
 6074 0238 6E       		.uleb128 0x6e
 6075 0239 0E       		.uleb128 0xe
 6076 023a 49       		.uleb128 0x49
 6077 023b 13       		.uleb128 0x13
 6078 023c 3C       		.uleb128 0x3c
 6079 023d 19       		.uleb128 0x19
 6080 023e 00       		.byte	0
 6081 023f 00       		.byte	0
 6082 0240 22       		.uleb128 0x22
 6083 0241 2E       		.uleb128 0x2e
 6084 0242 01       		.byte	0x1
 6085 0243 3F       		.uleb128 0x3f
 6086 0244 19       		.uleb128 0x19
 6087 0245 03       		.uleb128 0x3
 6088 0246 0E       		.uleb128 0xe
 6089 0247 3A       		.uleb128 0x3a
 6090 0248 21       		.uleb128 0x21
 6091 0249 07       		.sleb128 7
 6092 024a 3B       		.uleb128 0x3b
 6093 024b 05       		.uleb128 0x5
 6094 024c 39       		.uleb128 0x39
GAS LISTING /tmp/cceaV4lG.s 			page 136


 6095 024d 21       		.uleb128 0x21
 6096 024e 0D       		.sleb128 13
 6097 024f 3C       		.uleb128 0x3c
 6098 0250 19       		.uleb128 0x19
 6099 0251 01       		.uleb128 0x1
 6100 0252 13       		.uleb128 0x13
 6101 0253 00       		.byte	0
 6102 0254 00       		.byte	0
 6103 0255 23       		.uleb128 0x23
 6104 0256 05       		.uleb128 0x5
 6105 0257 00       		.byte	0
 6106 0258 03       		.uleb128 0x3
 6107 0259 08       		.uleb128 0x8
 6108 025a 3A       		.uleb128 0x3a
 6109 025b 21       		.uleb128 0x21
 6110 025c 01       		.sleb128 1
 6111 025d 3B       		.uleb128 0x3b
 6112 025e 05       		.uleb128 0x5
 6113 025f 39       		.uleb128 0x39
 6114 0260 0B       		.uleb128 0xb
 6115 0261 49       		.uleb128 0x49
 6116 0262 13       		.uleb128 0x13
 6117 0263 02       		.uleb128 0x2
 6118 0264 18       		.uleb128 0x18
 6119 0265 00       		.byte	0
 6120 0266 00       		.byte	0
 6121 0267 24       		.uleb128 0x24
 6122 0268 05       		.uleb128 0x5
 6123 0269 00       		.byte	0
 6124 026a 03       		.uleb128 0x3
 6125 026b 08       		.uleb128 0x8
 6126 026c 3A       		.uleb128 0x3a
 6127 026d 21       		.uleb128 0x21
 6128 026e 01       		.sleb128 1
 6129 026f 3B       		.uleb128 0x3b
 6130 0270 21       		.uleb128 0x21
 6131 0271 D303     		.sleb128 467
 6132 0273 39       		.uleb128 0x39
 6133 0274 0B       		.uleb128 0xb
 6134 0275 49       		.uleb128 0x49
 6135 0276 13       		.uleb128 0x13
 6136 0277 00       		.byte	0
 6137 0278 00       		.byte	0
 6138 0279 25       		.uleb128 0x25
 6139 027a 34       		.uleb128 0x34
 6140 027b 00       		.byte	0
 6141 027c 03       		.uleb128 0x3
 6142 027d 08       		.uleb128 0x8
 6143 027e 3A       		.uleb128 0x3a
 6144 027f 21       		.uleb128 0x21
 6145 0280 01       		.sleb128 1
 6146 0281 3B       		.uleb128 0x3b
 6147 0282 05       		.uleb128 0x5
 6148 0283 39       		.uleb128 0x39
 6149 0284 0B       		.uleb128 0xb
 6150 0285 49       		.uleb128 0x49
 6151 0286 13       		.uleb128 0x13
GAS LISTING /tmp/cceaV4lG.s 			page 137


 6152 0287 00       		.byte	0
 6153 0288 00       		.byte	0
 6154 0289 26       		.uleb128 0x26
 6155 028a 1D       		.uleb128 0x1d
 6156 028b 01       		.byte	0x1
 6157 028c 31       		.uleb128 0x31
 6158 028d 13       		.uleb128 0x13
 6159 028e 52       		.uleb128 0x52
 6160 028f 01       		.uleb128 0x1
 6161 0290 B842     		.uleb128 0x2138
 6162 0292 0B       		.uleb128 0xb
 6163 0293 11       		.uleb128 0x11
 6164 0294 01       		.uleb128 0x1
 6165 0295 12       		.uleb128 0x12
 6166 0296 07       		.uleb128 0x7
 6167 0297 58       		.uleb128 0x58
 6168 0298 21       		.uleb128 0x21
 6169 0299 01       		.sleb128 1
 6170 029a 59       		.uleb128 0x59
 6171 029b 05       		.uleb128 0x5
 6172 029c 57       		.uleb128 0x57
 6173 029d 0B       		.uleb128 0xb
 6174 029e 00       		.byte	0
 6175 029f 00       		.byte	0
 6176 02a0 27       		.uleb128 0x27
 6177 02a1 11       		.uleb128 0x11
 6178 02a2 01       		.byte	0x1
 6179 02a3 25       		.uleb128 0x25
 6180 02a4 0E       		.uleb128 0xe
 6181 02a5 13       		.uleb128 0x13
 6182 02a6 0B       		.uleb128 0xb
 6183 02a7 03       		.uleb128 0x3
 6184 02a8 1F       		.uleb128 0x1f
 6185 02a9 1B       		.uleb128 0x1b
 6186 02aa 1F       		.uleb128 0x1f
 6187 02ab 11       		.uleb128 0x11
 6188 02ac 01       		.uleb128 0x1
 6189 02ad 12       		.uleb128 0x12
 6190 02ae 07       		.uleb128 0x7
 6191 02af 10       		.uleb128 0x10
 6192 02b0 17       		.uleb128 0x17
 6193 02b1 00       		.byte	0
 6194 02b2 00       		.byte	0
 6195 02b3 28       		.uleb128 0x28
 6196 02b4 24       		.uleb128 0x24
 6197 02b5 00       		.byte	0
 6198 02b6 0B       		.uleb128 0xb
 6199 02b7 0B       		.uleb128 0xb
 6200 02b8 3E       		.uleb128 0x3e
 6201 02b9 0B       		.uleb128 0xb
 6202 02ba 03       		.uleb128 0x3
 6203 02bb 08       		.uleb128 0x8
 6204 02bc 00       		.byte	0
 6205 02bd 00       		.byte	0
 6206 02be 29       		.uleb128 0x29
 6207 02bf 0F       		.uleb128 0xf
 6208 02c0 00       		.byte	0
GAS LISTING /tmp/cceaV4lG.s 			page 138


 6209 02c1 0B       		.uleb128 0xb
 6210 02c2 0B       		.uleb128 0xb
 6211 02c3 00       		.byte	0
 6212 02c4 00       		.byte	0
 6213 02c5 2A       		.uleb128 0x2a
 6214 02c6 16       		.uleb128 0x16
 6215 02c7 00       		.byte	0
 6216 02c8 03       		.uleb128 0x3
 6217 02c9 0E       		.uleb128 0xe
 6218 02ca 3A       		.uleb128 0x3a
 6219 02cb 0B       		.uleb128 0xb
 6220 02cc 3B       		.uleb128 0x3b
 6221 02cd 05       		.uleb128 0x5
 6222 02ce 39       		.uleb128 0x39
 6223 02cf 0B       		.uleb128 0xb
 6224 02d0 49       		.uleb128 0x49
 6225 02d1 13       		.uleb128 0x13
 6226 02d2 00       		.byte	0
 6227 02d3 00       		.byte	0
 6228 02d4 2B       		.uleb128 0x2b
 6229 02d5 15       		.uleb128 0x15
 6230 02d6 01       		.byte	0x1
 6231 02d7 49       		.uleb128 0x49
 6232 02d8 13       		.uleb128 0x13
 6233 02d9 01       		.uleb128 0x1
 6234 02da 13       		.uleb128 0x13
 6235 02db 00       		.byte	0
 6236 02dc 00       		.byte	0
 6237 02dd 2C       		.uleb128 0x2c
 6238 02de 26       		.uleb128 0x26
 6239 02df 00       		.byte	0
 6240 02e0 00       		.byte	0
 6241 02e1 00       		.byte	0
 6242 02e2 2D       		.uleb128 0x2d
 6243 02e3 39       		.uleb128 0x39
 6244 02e4 01       		.byte	0x1
 6245 02e5 03       		.uleb128 0x3
 6246 02e6 08       		.uleb128 0x8
 6247 02e7 3A       		.uleb128 0x3a
 6248 02e8 0B       		.uleb128 0xb
 6249 02e9 3B       		.uleb128 0x3b
 6250 02ea 05       		.uleb128 0x5
 6251 02eb 39       		.uleb128 0x39
 6252 02ec 0B       		.uleb128 0xb
 6253 02ed 01       		.uleb128 0x1
 6254 02ee 13       		.uleb128 0x13
 6255 02ef 00       		.byte	0
 6256 02f0 00       		.byte	0
 6257 02f1 2E       		.uleb128 0x2e
 6258 02f2 15       		.uleb128 0x15
 6259 02f3 00       		.byte	0
 6260 02f4 00       		.byte	0
 6261 02f5 00       		.byte	0
 6262 02f6 2F       		.uleb128 0x2f
 6263 02f7 2E       		.uleb128 0x2e
 6264 02f8 01       		.byte	0x1
 6265 02f9 3F       		.uleb128 0x3f
GAS LISTING /tmp/cceaV4lG.s 			page 139


 6266 02fa 19       		.uleb128 0x19
 6267 02fb 03       		.uleb128 0x3
 6268 02fc 0E       		.uleb128 0xe
 6269 02fd 3A       		.uleb128 0x3a
 6270 02fe 0B       		.uleb128 0xb
 6271 02ff 3B       		.uleb128 0x3b
 6272 0300 05       		.uleb128 0x5
 6273 0301 39       		.uleb128 0x39
 6274 0302 0B       		.uleb128 0xb
 6275 0303 6E       		.uleb128 0x6e
 6276 0304 0E       		.uleb128 0xe
 6277 0305 49       		.uleb128 0x49
 6278 0306 13       		.uleb128 0x13
 6279 0307 3C       		.uleb128 0x3c
 6280 0308 19       		.uleb128 0x19
 6281 0309 01       		.uleb128 0x1
 6282 030a 13       		.uleb128 0x13
 6283 030b 00       		.byte	0
 6284 030c 00       		.byte	0
 6285 030d 30       		.uleb128 0x30
 6286 030e 2E       		.uleb128 0x2e
 6287 030f 01       		.byte	0x1
 6288 0310 3F       		.uleb128 0x3f
 6289 0311 19       		.uleb128 0x19
 6290 0312 03       		.uleb128 0x3
 6291 0313 08       		.uleb128 0x8
 6292 0314 3A       		.uleb128 0x3a
 6293 0315 0B       		.uleb128 0xb
 6294 0316 3B       		.uleb128 0x3b
 6295 0317 05       		.uleb128 0x5
 6296 0318 39       		.uleb128 0x39
 6297 0319 0B       		.uleb128 0xb
 6298 031a 49       		.uleb128 0x49
 6299 031b 13       		.uleb128 0x13
 6300 031c 3C       		.uleb128 0x3c
 6301 031d 19       		.uleb128 0x19
 6302 031e 01       		.uleb128 0x1
 6303 031f 13       		.uleb128 0x13
 6304 0320 00       		.byte	0
 6305 0321 00       		.byte	0
 6306 0322 31       		.uleb128 0x31
 6307 0323 2E       		.uleb128 0x2e
 6308 0324 01       		.byte	0x1
 6309 0325 3F       		.uleb128 0x3f
 6310 0326 19       		.uleb128 0x19
 6311 0327 03       		.uleb128 0x3
 6312 0328 0E       		.uleb128 0xe
 6313 0329 3A       		.uleb128 0x3a
 6314 032a 0B       		.uleb128 0xb
 6315 032b 3B       		.uleb128 0x3b
 6316 032c 05       		.uleb128 0x5
 6317 032d 39       		.uleb128 0x39
 6318 032e 0B       		.uleb128 0xb
 6319 032f 8701     		.uleb128 0x87
 6320 0331 19       		.uleb128 0x19
 6321 0332 3C       		.uleb128 0x3c
 6322 0333 19       		.uleb128 0x19
GAS LISTING /tmp/cceaV4lG.s 			page 140


 6323 0334 01       		.uleb128 0x1
 6324 0335 13       		.uleb128 0x13
 6325 0336 00       		.byte	0
 6326 0337 00       		.byte	0
 6327 0338 32       		.uleb128 0x32
 6328 0339 2E       		.uleb128 0x2e
 6329 033a 00       		.byte	0
 6330 033b 3F       		.uleb128 0x3f
 6331 033c 19       		.uleb128 0x19
 6332 033d 03       		.uleb128 0x3
 6333 033e 0E       		.uleb128 0xe
 6334 033f 3A       		.uleb128 0x3a
 6335 0340 0B       		.uleb128 0xb
 6336 0341 3B       		.uleb128 0x3b
 6337 0342 05       		.uleb128 0x5
 6338 0343 39       		.uleb128 0x39
 6339 0344 0B       		.uleb128 0xb
 6340 0345 49       		.uleb128 0x49
 6341 0346 13       		.uleb128 0x13
 6342 0347 3C       		.uleb128 0x3c
 6343 0348 19       		.uleb128 0x19
 6344 0349 00       		.byte	0
 6345 034a 00       		.byte	0
 6346 034b 33       		.uleb128 0x33
 6347 034c 39       		.uleb128 0x39
 6348 034d 01       		.byte	0x1
 6349 034e 03       		.uleb128 0x3
 6350 034f 0E       		.uleb128 0xe
 6351 0350 3A       		.uleb128 0x3a
 6352 0351 0B       		.uleb128 0xb
 6353 0352 3B       		.uleb128 0x3b
 6354 0353 05       		.uleb128 0x5
 6355 0354 39       		.uleb128 0x39
 6356 0355 0B       		.uleb128 0xb
 6357 0356 01       		.uleb128 0x1
 6358 0357 13       		.uleb128 0x13
 6359 0358 00       		.byte	0
 6360 0359 00       		.byte	0
 6361 035a 34       		.uleb128 0x34
 6362 035b 04       		.uleb128 0x4
 6363 035c 01       		.byte	0x1
 6364 035d 3E       		.uleb128 0x3e
 6365 035e 0B       		.uleb128 0xb
 6366 035f 0B       		.uleb128 0xb
 6367 0360 0B       		.uleb128 0xb
 6368 0361 49       		.uleb128 0x49
 6369 0362 13       		.uleb128 0x13
 6370 0363 3A       		.uleb128 0x3a
 6371 0364 0B       		.uleb128 0xb
 6372 0365 3B       		.uleb128 0x3b
 6373 0366 0B       		.uleb128 0xb
 6374 0367 39       		.uleb128 0x39
 6375 0368 0B       		.uleb128 0xb
 6376 0369 6E       		.uleb128 0x6e
 6377 036a 0E       		.uleb128 0xe
 6378 036b 01       		.uleb128 0x1
 6379 036c 13       		.uleb128 0x13
GAS LISTING /tmp/cceaV4lG.s 			page 141


 6380 036d 00       		.byte	0
 6381 036e 00       		.byte	0
 6382 036f 35       		.uleb128 0x35
 6383 0370 01       		.uleb128 0x1
 6384 0371 01       		.byte	0x1
 6385 0372 49       		.uleb128 0x49
 6386 0373 13       		.uleb128 0x13
 6387 0374 01       		.uleb128 0x1
 6388 0375 13       		.uleb128 0x13
 6389 0376 00       		.byte	0
 6390 0377 00       		.byte	0
 6391 0378 36       		.uleb128 0x36
 6392 0379 21       		.uleb128 0x21
 6393 037a 00       		.byte	0
 6394 037b 49       		.uleb128 0x49
 6395 037c 13       		.uleb128 0x13
 6396 037d 2F       		.uleb128 0x2f
 6397 037e 0B       		.uleb128 0xb
 6398 037f 00       		.byte	0
 6399 0380 00       		.byte	0
 6400 0381 37       		.uleb128 0x37
 6401 0382 34       		.uleb128 0x34
 6402 0383 00       		.byte	0
 6403 0384 03       		.uleb128 0x3
 6404 0385 0E       		.uleb128 0xe
 6405 0386 3A       		.uleb128 0x3a
 6406 0387 0B       		.uleb128 0xb
 6407 0388 3B       		.uleb128 0x3b
 6408 0389 0B       		.uleb128 0xb
 6409 038a 39       		.uleb128 0x39
 6410 038b 0B       		.uleb128 0xb
 6411 038c 49       		.uleb128 0x49
 6412 038d 13       		.uleb128 0x13
 6413 038e 02       		.uleb128 0x2
 6414 038f 18       		.uleb128 0x18
 6415 0390 00       		.byte	0
 6416 0391 00       		.byte	0
 6417 0392 38       		.uleb128 0x38
 6418 0393 34       		.uleb128 0x34
 6419 0394 00       		.byte	0
 6420 0395 03       		.uleb128 0x3
 6421 0396 0E       		.uleb128 0xe
 6422 0397 3A       		.uleb128 0x3a
 6423 0398 0B       		.uleb128 0xb
 6424 0399 3B       		.uleb128 0x3b
 6425 039a 05       		.uleb128 0x5
 6426 039b 39       		.uleb128 0x39
 6427 039c 0B       		.uleb128 0xb
 6428 039d 49       		.uleb128 0x49
 6429 039e 13       		.uleb128 0x13
 6430 039f 02       		.uleb128 0x2
 6431 03a0 18       		.uleb128 0x18
 6432 03a1 00       		.byte	0
 6433 03a2 00       		.byte	0
 6434 03a3 39       		.uleb128 0x39
 6435 03a4 2E       		.uleb128 0x2e
 6436 03a5 01       		.byte	0x1
GAS LISTING /tmp/cceaV4lG.s 			page 142


 6437 03a6 3F       		.uleb128 0x3f
 6438 03a7 19       		.uleb128 0x19
 6439 03a8 03       		.uleb128 0x3
 6440 03a9 0E       		.uleb128 0xe
 6441 03aa 3A       		.uleb128 0x3a
 6442 03ab 0B       		.uleb128 0xb
 6443 03ac 3B       		.uleb128 0x3b
 6444 03ad 05       		.uleb128 0x5
 6445 03ae 39       		.uleb128 0x39
 6446 03af 0B       		.uleb128 0xb
 6447 03b0 11       		.uleb128 0x11
 6448 03b1 01       		.uleb128 0x1
 6449 03b2 12       		.uleb128 0x12
 6450 03b3 07       		.uleb128 0x7
 6451 03b4 40       		.uleb128 0x40
 6452 03b5 18       		.uleb128 0x18
 6453 03b6 7A       		.uleb128 0x7a
 6454 03b7 19       		.uleb128 0x19
 6455 03b8 01       		.uleb128 0x1
 6456 03b9 13       		.uleb128 0x13
 6457 03ba 00       		.byte	0
 6458 03bb 00       		.byte	0
 6459 03bc 3A       		.uleb128 0x3a
 6460 03bd 0B       		.uleb128 0xb
 6461 03be 01       		.byte	0x1
 6462 03bf 55       		.uleb128 0x55
 6463 03c0 17       		.uleb128 0x17
 6464 03c1 00       		.byte	0
 6465 03c2 00       		.byte	0
 6466 03c3 3B       		.uleb128 0x3b
 6467 03c4 48       		.uleb128 0x48
 6468 03c5 01       		.byte	0x1
 6469 03c6 7D       		.uleb128 0x7d
 6470 03c7 01       		.uleb128 0x1
 6471 03c8 7F       		.uleb128 0x7f
 6472 03c9 13       		.uleb128 0x13
 6473 03ca 01       		.uleb128 0x1
 6474 03cb 13       		.uleb128 0x13
 6475 03cc 00       		.byte	0
 6476 03cd 00       		.byte	0
 6477 03ce 3C       		.uleb128 0x3c
 6478 03cf 2E       		.uleb128 0x2e
 6479 03d0 01       		.byte	0x1
 6480 03d1 03       		.uleb128 0x3
 6481 03d2 0E       		.uleb128 0xe
 6482 03d3 3A       		.uleb128 0x3a
 6483 03d4 0B       		.uleb128 0xb
 6484 03d5 3B       		.uleb128 0x3b
 6485 03d6 05       		.uleb128 0x5
 6486 03d7 39       		.uleb128 0x39
 6487 03d8 0B       		.uleb128 0xb
 6488 03d9 49       		.uleb128 0x49
 6489 03da 13       		.uleb128 0x13
 6490 03db 20       		.uleb128 0x20
 6491 03dc 0B       		.uleb128 0xb
 6492 03dd 01       		.uleb128 0x1
 6493 03de 13       		.uleb128 0x13
GAS LISTING /tmp/cceaV4lG.s 			page 143


 6494 03df 00       		.byte	0
 6495 03e0 00       		.byte	0
 6496 03e1 3D       		.uleb128 0x3d
 6497 03e2 2E       		.uleb128 0x2e
 6498 03e3 01       		.byte	0x1
 6499 03e4 03       		.uleb128 0x3
 6500 03e5 0E       		.uleb128 0xe
 6501 03e6 3A       		.uleb128 0x3a
 6502 03e7 0B       		.uleb128 0xb
 6503 03e8 3B       		.uleb128 0x3b
 6504 03e9 05       		.uleb128 0x5
 6505 03ea 39       		.uleb128 0x39
 6506 03eb 0B       		.uleb128 0xb
 6507 03ec 49       		.uleb128 0x49
 6508 03ed 13       		.uleb128 0x13
 6509 03ee 11       		.uleb128 0x11
 6510 03ef 01       		.uleb128 0x1
 6511 03f0 12       		.uleb128 0x12
 6512 03f1 07       		.uleb128 0x7
 6513 03f2 40       		.uleb128 0x40
 6514 03f3 18       		.uleb128 0x18
 6515 03f4 7A       		.uleb128 0x7a
 6516 03f5 19       		.uleb128 0x19
 6517 03f6 01       		.uleb128 0x1
 6518 03f7 13       		.uleb128 0x13
 6519 03f8 00       		.byte	0
 6520 03f9 00       		.byte	0
 6521 03fa 3E       		.uleb128 0x3e
 6522 03fb 1D       		.uleb128 0x1d
 6523 03fc 01       		.byte	0x1
 6524 03fd 31       		.uleb128 0x31
 6525 03fe 13       		.uleb128 0x13
 6526 03ff 52       		.uleb128 0x52
 6527 0400 01       		.uleb128 0x1
 6528 0401 B842     		.uleb128 0x2138
 6529 0403 0B       		.uleb128 0xb
 6530 0404 55       		.uleb128 0x55
 6531 0405 17       		.uleb128 0x17
 6532 0406 58       		.uleb128 0x58
 6533 0407 0B       		.uleb128 0xb
 6534 0408 59       		.uleb128 0x59
 6535 0409 0B       		.uleb128 0xb
 6536 040a 57       		.uleb128 0x57
 6537 040b 0B       		.uleb128 0xb
 6538 040c 01       		.uleb128 0x1
 6539 040d 13       		.uleb128 0x13
 6540 040e 00       		.byte	0
 6541 040f 00       		.byte	0
 6542 0410 3F       		.uleb128 0x3f
 6543 0411 1D       		.uleb128 0x1d
 6544 0412 01       		.byte	0x1
 6545 0413 31       		.uleb128 0x31
 6546 0414 13       		.uleb128 0x13
 6547 0415 52       		.uleb128 0x52
 6548 0416 01       		.uleb128 0x1
 6549 0417 B842     		.uleb128 0x2138
 6550 0419 0B       		.uleb128 0xb
GAS LISTING /tmp/cceaV4lG.s 			page 144


 6551 041a 11       		.uleb128 0x11
 6552 041b 01       		.uleb128 0x1
 6553 041c 12       		.uleb128 0x12
 6554 041d 07       		.uleb128 0x7
 6555 041e 58       		.uleb128 0x58
 6556 041f 0B       		.uleb128 0xb
 6557 0420 59       		.uleb128 0x59
 6558 0421 0B       		.uleb128 0xb
 6559 0422 57       		.uleb128 0x57
 6560 0423 0B       		.uleb128 0xb
 6561 0424 01       		.uleb128 0x1
 6562 0425 13       		.uleb128 0x13
 6563 0426 00       		.byte	0
 6564 0427 00       		.byte	0
 6565 0428 40       		.uleb128 0x40
 6566 0429 1D       		.uleb128 0x1d
 6567 042a 01       		.byte	0x1
 6568 042b 31       		.uleb128 0x31
 6569 042c 13       		.uleb128 0x13
 6570 042d 52       		.uleb128 0x52
 6571 042e 01       		.uleb128 0x1
 6572 042f B842     		.uleb128 0x2138
 6573 0431 0B       		.uleb128 0xb
 6574 0432 11       		.uleb128 0x11
 6575 0433 01       		.uleb128 0x1
 6576 0434 12       		.uleb128 0x12
 6577 0435 07       		.uleb128 0x7
 6578 0436 58       		.uleb128 0x58
 6579 0437 0B       		.uleb128 0xb
 6580 0438 59       		.uleb128 0x59
 6581 0439 0B       		.uleb128 0xb
 6582 043a 57       		.uleb128 0x57
 6583 043b 0B       		.uleb128 0xb
 6584 043c 00       		.byte	0
 6585 043d 00       		.byte	0
 6586 043e 41       		.uleb128 0x41
 6587 043f 34       		.uleb128 0x34
 6588 0440 00       		.byte	0
 6589 0441 03       		.uleb128 0x3
 6590 0442 0E       		.uleb128 0xe
 6591 0443 3A       		.uleb128 0x3a
 6592 0444 0B       		.uleb128 0xb
 6593 0445 3B       		.uleb128 0x3b
 6594 0446 0B       		.uleb128 0xb
 6595 0447 39       		.uleb128 0x39
 6596 0448 0B       		.uleb128 0xb
 6597 0449 49       		.uleb128 0x49
 6598 044a 13       		.uleb128 0x13
 6599 044b 02       		.uleb128 0x2
 6600 044c 17       		.uleb128 0x17
 6601 044d B742     		.uleb128 0x2137
 6602 044f 17       		.uleb128 0x17
 6603 0450 00       		.byte	0
 6604 0451 00       		.byte	0
 6605 0452 42       		.uleb128 0x42
 6606 0453 2E       		.uleb128 0x2e
 6607 0454 01       		.byte	0x1
GAS LISTING /tmp/cceaV4lG.s 			page 145


 6608 0455 3F       		.uleb128 0x3f
 6609 0456 19       		.uleb128 0x19
 6610 0457 03       		.uleb128 0x3
 6611 0458 0E       		.uleb128 0xe
 6612 0459 3A       		.uleb128 0x3a
 6613 045a 0B       		.uleb128 0xb
 6614 045b 3B       		.uleb128 0x3b
 6615 045c 0B       		.uleb128 0xb
 6616 045d 39       		.uleb128 0x39
 6617 045e 0B       		.uleb128 0xb
 6618 045f 49       		.uleb128 0x49
 6619 0460 13       		.uleb128 0x13
 6620 0461 20       		.uleb128 0x20
 6621 0462 0B       		.uleb128 0xb
 6622 0463 34       		.uleb128 0x34
 6623 0464 19       		.uleb128 0x19
 6624 0465 01       		.uleb128 0x1
 6625 0466 13       		.uleb128 0x13
 6626 0467 00       		.byte	0
 6627 0468 00       		.byte	0
 6628 0469 43       		.uleb128 0x43
 6629 046a 36       		.uleb128 0x36
 6630 046b 00       		.byte	0
 6631 046c 02       		.uleb128 0x2
 6632 046d 18       		.uleb128 0x18
 6633 046e 00       		.byte	0
 6634 046f 00       		.byte	0
 6635 0470 00       		.byte	0
 6636              		.section	.debug_loclists,"",@progbits
 6637 0000 EC170000 		.long	.Ldebug_loc3-.Ldebug_loc2
 6638              	.Ldebug_loc2:
 6639 0004 0500     		.value	0x5
 6640 0006 08       		.byte	0x8
 6641 0007 00       		.byte	0
 6642 0008 00000000 		.long	0
 6643              	.Ldebug_loc0:
 6644              	.LVUS176:
 6645 000c 00       		.uleb128 0
 6646 000d 00       		.uleb128 .LVU865
 6647 000e 00       		.uleb128 .LVU865
 6648 000f 00       		.uleb128 .LVU893
 6649 0010 00       		.uleb128 .LVU893
 6650 0011 00       		.uleb128 .LVU897
 6651 0012 00       		.uleb128 .LVU897
 6652 0013 00       		.uleb128 .LVU912
 6653 0014 00       		.uleb128 .LVU912
 6654 0015 00       		.uleb128 .LVU913
 6655 0016 00       		.uleb128 .LVU913
 6656 0017 00       		.uleb128 0
 6657              	.LLST176:
 6658 0018 04       		.byte	0x4
 6659 0019 E411     		.uleb128 .LVL294-.Ltext0
 6660 001b 9312     		.uleb128 .LVL299-.Ltext0
 6661 001d 01       		.uleb128 0x1
 6662 001e 55       		.byte	0x55
 6663 001f 04       		.byte	0x4
 6664 0020 9312     		.uleb128 .LVL299-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 146


 6665 0022 F812     		.uleb128 .LVL312-.Ltext0
 6666 0024 01       		.uleb128 0x1
 6667 0025 58       		.byte	0x58
 6668 0026 04       		.byte	0x4
 6669 0027 F812     		.uleb128 .LVL312-.Ltext0
 6670 0029 8B13     		.uleb128 .LVL314-.Ltext0
 6671 002b 01       		.uleb128 0x1
 6672 002c 55       		.byte	0x55
 6673 002d 04       		.byte	0x4
 6674 002e 8B13     		.uleb128 .LVL314-.Ltext0
 6675 0030 BB13     		.uleb128 .LVL319-.Ltext0
 6676 0032 01       		.uleb128 0x1
 6677 0033 58       		.byte	0x58
 6678 0034 04       		.byte	0x4
 6679 0035 BB13     		.uleb128 .LVL319-.Ltext0
 6680 0037 C013     		.uleb128 .LVL320-.Ltext0
 6681 0039 01       		.uleb128 0x1
 6682 003a 55       		.byte	0x55
 6683 003b 04       		.byte	0x4
 6684 003c C013     		.uleb128 .LVL320-.Ltext0
 6685 003e C213     		.uleb128 .LFE78-.Ltext0
 6686 0040 01       		.uleb128 0x1
 6687 0041 58       		.byte	0x58
 6688 0042 00       		.byte	0
 6689              	.LVUS177:
 6690 0043 00       		.uleb128 0
 6691 0044 00       		.uleb128 .LVU857
 6692 0045 00       		.uleb128 .LVU857
 6693 0046 00       		.uleb128 .LVU911
 6694 0047 00       		.uleb128 .LVU911
 6695 0048 00       		.uleb128 .LVU912
 6696 0049 00       		.uleb128 .LVU912
 6697 004a 00       		.uleb128 0
 6698              	.LLST177:
 6699 004b 04       		.byte	0x4
 6700 004c E411     		.uleb128 .LVL294-.Ltext0
 6701 004e ED11     		.uleb128 .LVL296-.Ltext0
 6702 0050 01       		.uleb128 0x1
 6703 0051 54       		.byte	0x54
 6704 0052 04       		.byte	0x4
 6705 0053 ED11     		.uleb128 .LVL296-.Ltext0
 6706 0055 B813     		.uleb128 .LVL318-.Ltext0
 6707 0057 01       		.uleb128 0x1
 6708 0058 5A       		.byte	0x5a
 6709 0059 04       		.byte	0x4
 6710 005a B813     		.uleb128 .LVL318-.Ltext0
 6711 005c BB13     		.uleb128 .LVL319-.Ltext0
 6712 005e 04       		.uleb128 0x4
 6713 005f A3       		.byte	0xa3
 6714 0060 01       		.uleb128 0x1
 6715 0061 54       		.byte	0x54
 6716 0062 9F       		.byte	0x9f
 6717 0063 04       		.byte	0x4
 6718 0064 BB13     		.uleb128 .LVL319-.Ltext0
 6719 0066 C213     		.uleb128 .LFE78-.Ltext0
 6720 0068 01       		.uleb128 0x1
 6721 0069 5A       		.byte	0x5a
GAS LISTING /tmp/cceaV4lG.s 			page 147


 6722 006a 00       		.byte	0
 6723              	.LVUS178:
 6724 006b 00       		.uleb128 0
 6725 006c 00       		.uleb128 .LVU869
 6726 006d 00       		.uleb128 .LVU869
 6727 006e 00       		.uleb128 .LVU893
 6728 006f 00       		.uleb128 .LVU893
 6729 0070 00       		.uleb128 .LVU894
 6730 0071 00       		.uleb128 .LVU894
 6731 0072 00       		.uleb128 0
 6732              	.LLST178:
 6733 0073 04       		.byte	0x4
 6734 0074 E411     		.uleb128 .LVL294-.Ltext0
 6735 0076 A712     		.uleb128 .LVL300-.Ltext0
 6736 0078 01       		.uleb128 0x1
 6737 0079 51       		.byte	0x51
 6738 007a 04       		.byte	0x4
 6739 007b A712     		.uleb128 .LVL300-.Ltext0
 6740 007d F812     		.uleb128 .LVL312-.Ltext0
 6741 007f 04       		.uleb128 0x4
 6742 0080 A3       		.byte	0xa3
 6743 0081 01       		.uleb128 0x1
 6744 0082 51       		.byte	0x51
 6745 0083 9F       		.byte	0x9f
 6746 0084 04       		.byte	0x4
 6747 0085 F812     		.uleb128 .LVL312-.Ltext0
 6748 0087 FE12     		.uleb128 .LVL313-.Ltext0
 6749 0089 01       		.uleb128 0x1
 6750 008a 51       		.byte	0x51
 6751 008b 04       		.byte	0x4
 6752 008c FE12     		.uleb128 .LVL313-.Ltext0
 6753 008e C213     		.uleb128 .LFE78-.Ltext0
 6754 0090 04       		.uleb128 0x4
 6755 0091 A3       		.byte	0xa3
 6756 0092 01       		.uleb128 0x1
 6757 0093 51       		.byte	0x51
 6758 0094 9F       		.byte	0x9f
 6759 0095 00       		.byte	0
 6760              	.LVUS179:
 6761 0096 01       		.uleb128 .LVU854
 6762 0097 00       		.uleb128 .LVU869
 6763 0098 00       		.uleb128 .LVU869
 6764 0099 00       		.uleb128 .LVU879
 6765 009a 00       		.uleb128 .LVU879
 6766 009b 00       		.uleb128 .LVU883
 6767 009c 00       		.uleb128 .LVU883
 6768 009d 00       		.uleb128 .LVU887
 6769 009e 00       		.uleb128 .LVU887
 6770 009f 00       		.uleb128 .LVU893
 6771 00a0 00       		.uleb128 .LVU893
 6772 00a1 00       		.uleb128 .LVU900
 6773 00a2 00       		.uleb128 .LVU900
 6774 00a3 00       		.uleb128 .LVU911
 6775 00a4 00       		.uleb128 .LVU912
 6776 00a5 00       		.uleb128 0
 6777              	.LLST179:
 6778 00a6 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 148


 6779 00a7 EA11     		.uleb128 .LVL295-.Ltext0
 6780 00a9 A712     		.uleb128 .LVL300-.Ltext0
 6781 00ab 02       		.uleb128 0x2
 6782 00ac 30       		.byte	0x30
 6783 00ad 9F       		.byte	0x9f
 6784 00ae 04       		.byte	0x4
 6785 00af A712     		.uleb128 .LVL300-.Ltext0
 6786 00b1 CD12     		.uleb128 .LVL304-.Ltext0
 6787 00b3 01       		.uleb128 0x1
 6788 00b4 55       		.byte	0x55
 6789 00b5 04       		.byte	0x4
 6790 00b6 CD12     		.uleb128 .LVL304-.Ltext0
 6791 00b8 D912     		.uleb128 .LVL306-.Ltext0
 6792 00ba 06       		.uleb128 0x6
 6793 00bb 70       		.byte	0x70
 6794 00bc 00       		.sleb128 0
 6795 00bd 75       		.byte	0x75
 6796 00be 00       		.sleb128 0
 6797 00bf 21       		.byte	0x21
 6798 00c0 9F       		.byte	0x9f
 6799 00c1 04       		.byte	0x4
 6800 00c2 D912     		.uleb128 .LVL306-.Ltext0
 6801 00c4 E712     		.uleb128 .LVL309-.Ltext0
 6802 00c6 06       		.uleb128 0x6
 6803 00c7 74       		.byte	0x74
 6804 00c8 00       		.sleb128 0
 6805 00c9 75       		.byte	0x75
 6806 00ca 00       		.sleb128 0
 6807 00cb 21       		.byte	0x21
 6808 00cc 9F       		.byte	0x9f
 6809 00cd 04       		.byte	0x4
 6810 00ce E712     		.uleb128 .LVL309-.Ltext0
 6811 00d0 F812     		.uleb128 .LVL312-.Ltext0
 6812 00d2 01       		.uleb128 0x1
 6813 00d3 55       		.byte	0x55
 6814 00d4 04       		.byte	0x4
 6815 00d5 F812     		.uleb128 .LVL312-.Ltext0
 6816 00d7 9813     		.uleb128 .LVL315-.Ltext0
 6817 00d9 02       		.uleb128 0x2
 6818 00da 30       		.byte	0x30
 6819 00db 9F       		.byte	0x9f
 6820 00dc 04       		.byte	0x4
 6821 00dd 9813     		.uleb128 .LVL315-.Ltext0
 6822 00df B813     		.uleb128 .LVL318-.Ltext0
 6823 00e1 01       		.uleb128 0x1
 6824 00e2 55       		.byte	0x55
 6825 00e3 04       		.byte	0x4
 6826 00e4 BB13     		.uleb128 .LVL319-.Ltext0
 6827 00e6 C213     		.uleb128 .LFE78-.Ltext0
 6828 00e8 02       		.uleb128 0x2
 6829 00e9 30       		.byte	0x30
 6830 00ea 9F       		.byte	0x9f
 6831 00eb 00       		.byte	0
 6832              	.LVUS180:
 6833 00ec 01       		.uleb128 .LVU854
 6834 00ed 00       		.uleb128 .LVU869
 6835 00ee 00       		.uleb128 .LVU872
GAS LISTING /tmp/cceaV4lG.s 			page 149


 6836 00ef 00       		.uleb128 .LVU874
 6837 00f0 00       		.uleb128 .LVU874
 6838 00f1 00       		.uleb128 .LVU878
 6839 00f2 00       		.uleb128 .LVU878
 6840 00f3 00       		.uleb128 .LVU879
 6841 00f4 00       		.uleb128 .LVU879
 6842 00f5 00       		.uleb128 .LVU881
 6843 00f6 00       		.uleb128 .LVU881
 6844 00f7 00       		.uleb128 .LVU884
 6845 00f8 00       		.uleb128 .LVU884
 6846 00f9 00       		.uleb128 .LVU886
 6847 00fa 00       		.uleb128 .LVU886
 6848 00fb 00       		.uleb128 .LVU892
 6849 00fc 00       		.uleb128 .LVU893
 6850 00fd 00       		.uleb128 .LVU900
 6851 00fe 00       		.uleb128 .LVU912
 6852 00ff 00       		.uleb128 0
 6853              	.LLST180:
 6854 0100 04       		.byte	0x4
 6855 0101 EA11     		.uleb128 .LVL295-.Ltext0
 6856 0103 A712     		.uleb128 .LVL300-.Ltext0
 6857 0105 02       		.uleb128 0x2
 6858 0106 30       		.byte	0x30
 6859 0107 9F       		.byte	0x9f
 6860 0108 04       		.byte	0x4
 6861 0109 B312     		.uleb128 .LVL301-.Ltext0
 6862 010b BF12     		.uleb128 .LVL302-.Ltext0
 6863 010d 01       		.uleb128 0x1
 6864 010e 51       		.byte	0x51
 6865 010f 04       		.byte	0x4
 6866 0110 BF12     		.uleb128 .LVL302-.Ltext0
 6867 0112 CB12     		.uleb128 .LVL303-.Ltext0
 6868 0114 01       		.uleb128 0x1
 6869 0115 50       		.byte	0x50
 6870 0116 04       		.byte	0x4
 6871 0117 CB12     		.uleb128 .LVL303-.Ltext0
 6872 0119 CD12     		.uleb128 .LVL304-.Ltext0
 6873 011b 15       		.uleb128 0x15
 6874 011c 74       		.byte	0x74
 6875 011d 79       		.sleb128 -7
 6876 011e 74       		.byte	0x74
 6877 011f 00       		.sleb128 0
 6878 0120 74       		.byte	0x74
 6879 0121 30       		.sleb128 48
 6880 0122 0C       		.byte	0xc
 6881 0123 FFFFFFFF 		.long	0xffffffff
 6882 0127 1A       		.byte	0x1a
 6883 0128 08       		.byte	0x8
 6884 0129 3F       		.byte	0x3f
 6885 012a 2B       		.byte	0x2b
 6886 012b 28       		.byte	0x28
 6887 012c 0100     		.value	0x1
 6888 012e 16       		.byte	0x16
 6889 012f 13       		.byte	0x13
 6890 0130 9F       		.byte	0x9f
 6891 0131 04       		.byte	0x4
 6892 0132 CD12     		.uleb128 .LVL304-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 150


 6893 0134 D312     		.uleb128 .LVL305-.Ltext0
 6894 0136 3C       		.uleb128 0x3c
 6895 0137 78       		.byte	0x78
 6896 0138 00       		.sleb128 0
 6897 0139 73       		.byte	0x73
 6898 013a 00       		.sleb128 0
 6899 013b 22       		.byte	0x22
 6900 013c 94       		.byte	0x94
 6901 013d 01       		.byte	0x1
 6902 013e 08       		.byte	0x8
 6903 013f 38       		.byte	0x38
 6904 0140 24       		.byte	0x24
 6905 0141 08       		.byte	0x8
 6906 0142 38       		.byte	0x38
 6907 0143 26       		.byte	0x26
 6908 0144 08       		.byte	0x8
 6909 0145 37       		.byte	0x37
 6910 0146 1C       		.byte	0x1c
 6911 0147 78       		.byte	0x78
 6912 0148 00       		.sleb128 0
 6913 0149 73       		.byte	0x73
 6914 014a 00       		.sleb128 0
 6915 014b 22       		.byte	0x22
 6916 014c 94       		.byte	0x94
 6917 014d 01       		.byte	0x1
 6918 014e 08       		.byte	0x8
 6919 014f 38       		.byte	0x38
 6920 0150 24       		.byte	0x24
 6921 0151 08       		.byte	0x8
 6922 0152 38       		.byte	0x38
 6923 0153 26       		.byte	0x26
 6924 0154 08       		.byte	0x8
 6925 0155 30       		.byte	0x30
 6926 0156 1C       		.byte	0x1c
 6927 0157 78       		.byte	0x78
 6928 0158 00       		.sleb128 0
 6929 0159 73       		.byte	0x73
 6930 015a 00       		.sleb128 0
 6931 015b 22       		.byte	0x22
 6932 015c 94       		.byte	0x94
 6933 015d 01       		.byte	0x1
 6934 015e 08       		.byte	0x8
 6935 015f 38       		.byte	0x38
 6936 0160 24       		.byte	0x24
 6937 0161 08       		.byte	0x8
 6938 0162 38       		.byte	0x38
 6939 0163 26       		.byte	0x26
 6940 0164 0C       		.byte	0xc
 6941 0165 FFFFFFFF 		.long	0xffffffff
 6942 0169 1A       		.byte	0x1a
 6943 016a 08       		.byte	0x8
 6944 016b 3F       		.byte	0x3f
 6945 016c 2B       		.byte	0x2b
 6946 016d 28       		.byte	0x28
 6947 016e 0100     		.value	0x1
 6948 0170 16       		.byte	0x16
 6949 0171 13       		.byte	0x13
GAS LISTING /tmp/cceaV4lG.s 			page 151


 6950 0172 9F       		.byte	0x9f
 6951 0173 04       		.byte	0x4
 6952 0174 D312     		.uleb128 .LVL305-.Ltext0
 6953 0176 DF12     		.uleb128 .LVL307-.Ltext0
 6954 0178 01       		.uleb128 0x1
 6955 0179 52       		.byte	0x52
 6956 017a 04       		.byte	0x4
 6957 017b DF12     		.uleb128 .LVL307-.Ltext0
 6958 017d E312     		.uleb128 .LVL308-.Ltext0
 6959 017f 01       		.uleb128 0x1
 6960 0180 50       		.byte	0x50
 6961 0181 04       		.byte	0x4
 6962 0182 E312     		.uleb128 .LVL308-.Ltext0
 6963 0184 F712     		.uleb128 .LVL311-.Ltext0
 6964 0186 15       		.uleb128 0x15
 6965 0187 73       		.byte	0x73
 6966 0188 79       		.sleb128 -7
 6967 0189 73       		.byte	0x73
 6968 018a 00       		.sleb128 0
 6969 018b 73       		.byte	0x73
 6970 018c 30       		.sleb128 48
 6971 018d 0C       		.byte	0xc
 6972 018e FFFFFFFF 		.long	0xffffffff
 6973 0192 1A       		.byte	0x1a
 6974 0193 08       		.byte	0x8
 6975 0194 3F       		.byte	0x3f
 6976 0195 2B       		.byte	0x2b
 6977 0196 28       		.byte	0x28
 6978 0197 0100     		.value	0x1
 6979 0199 16       		.byte	0x16
 6980 019a 13       		.byte	0x13
 6981 019b 9F       		.byte	0x9f
 6982 019c 04       		.byte	0x4
 6983 019d F812     		.uleb128 .LVL312-.Ltext0
 6984 019f 9813     		.uleb128 .LVL315-.Ltext0
 6985 01a1 02       		.uleb128 0x2
 6986 01a2 30       		.byte	0x30
 6987 01a3 9F       		.byte	0x9f
 6988 01a4 04       		.byte	0x4
 6989 01a5 BB13     		.uleb128 .LVL319-.Ltext0
 6990 01a7 C213     		.uleb128 .LFE78-.Ltext0
 6991 01a9 02       		.uleb128 0x2
 6992 01aa 30       		.byte	0x30
 6993 01ab 9F       		.byte	0x9f
 6994 01ac 00       		.byte	0
 6995              	.LVUS181:
 6996 01ad 00       		.uleb128 .LVU861
 6997 01ae 00       		.uleb128 .LVU869
 6998 01af 00       		.uleb128 .LVU869
 6999 01b0 00       		.uleb128 .LVU893
 7000 01b1 00       		.uleb128 .LVU893
 7001 01b2 00       		.uleb128 .LVU900
 7002 01b3 00       		.uleb128 .LVU900
 7003 01b4 00       		.uleb128 .LVU911
 7004 01b5 00       		.uleb128 .LVU912
 7005 01b6 00       		.uleb128 0
 7006              	.LLST181:
GAS LISTING /tmp/cceaV4lG.s 			page 152


 7007 01b7 04       		.byte	0x4
 7008 01b8 FD11     		.uleb128 .LVL298-.Ltext0
 7009 01ba A712     		.uleb128 .LVL300-.Ltext0
 7010 01bc 02       		.uleb128 0x2
 7011 01bd 30       		.byte	0x30
 7012 01be 9F       		.byte	0x9f
 7013 01bf 04       		.byte	0x4
 7014 01c0 A712     		.uleb128 .LVL300-.Ltext0
 7015 01c2 F812     		.uleb128 .LVL312-.Ltext0
 7016 01c4 01       		.uleb128 0x1
 7017 01c5 59       		.byte	0x59
 7018 01c6 04       		.byte	0x4
 7019 01c7 F812     		.uleb128 .LVL312-.Ltext0
 7020 01c9 9813     		.uleb128 .LVL315-.Ltext0
 7021 01cb 02       		.uleb128 0x2
 7022 01cc 30       		.byte	0x30
 7023 01cd 9F       		.byte	0x9f
 7024 01ce 04       		.byte	0x4
 7025 01cf 9813     		.uleb128 .LVL315-.Ltext0
 7026 01d1 B813     		.uleb128 .LVL318-.Ltext0
 7027 01d3 01       		.uleb128 0x1
 7028 01d4 59       		.byte	0x59
 7029 01d5 04       		.byte	0x4
 7030 01d6 BB13     		.uleb128 .LVL319-.Ltext0
 7031 01d8 C213     		.uleb128 .LFE78-.Ltext0
 7032 01da 02       		.uleb128 0x2
 7033 01db 30       		.byte	0x30
 7034 01dc 9F       		.byte	0x9f
 7035 01dd 00       		.byte	0
 7036              	.LVUS182:
 7037 01de 00       		.uleb128 .LVU858
 7038 01df 00       		.uleb128 .LVU869
 7039 01e0 00       		.uleb128 .LVU893
 7040 01e1 00       		.uleb128 .LVU900
 7041 01e2 00       		.uleb128 .LVU900
 7042 01e3 00       		.uleb128 .LVU911
 7043 01e4 00       		.uleb128 .LVU911
 7044 01e5 00       		.uleb128 .LVU912
 7045 01e6 00       		.uleb128 .LVU912
 7046 01e7 00       		.uleb128 0
 7047              	.LLST182:
 7048 01e8 04       		.byte	0x4
 7049 01e9 F111     		.uleb128 .LVL297-.Ltext0
 7050 01eb A712     		.uleb128 .LVL300-.Ltext0
 7051 01ed 01       		.uleb128 0x1
 7052 01ee 50       		.byte	0x50
 7053 01ef 04       		.byte	0x4
 7054 01f0 F812     		.uleb128 .LVL312-.Ltext0
 7055 01f2 9813     		.uleb128 .LVL315-.Ltext0
 7056 01f4 01       		.uleb128 0x1
 7057 01f5 50       		.byte	0x50
 7058 01f6 04       		.byte	0x4
 7059 01f7 9813     		.uleb128 .LVL315-.Ltext0
 7060 01f9 B813     		.uleb128 .LVL318-.Ltext0
 7061 01fb 09       		.uleb128 0x9
 7062 01fc 7A       		.byte	0x7a
 7063 01fd 00       		.sleb128 0
GAS LISTING /tmp/cceaV4lG.s 			page 153


 7064 01fe 0A       		.byte	0xa
 7065 01ff FFFF     		.value	0xffff
 7066 0201 1A       		.byte	0x1a
 7067 0202 78       		.byte	0x78
 7068 0203 00       		.sleb128 0
 7069 0204 22       		.byte	0x22
 7070 0205 04       		.byte	0x4
 7071 0206 B813     		.uleb128 .LVL318-.Ltext0
 7072 0208 BB13     		.uleb128 .LVL319-.Ltext0
 7073 020a 0A       		.uleb128 0xa
 7074 020b A3       		.byte	0xa3
 7075 020c 01       		.uleb128 0x1
 7076 020d 54       		.byte	0x54
 7077 020e 0A       		.byte	0xa
 7078 020f FFFF     		.value	0xffff
 7079 0211 1A       		.byte	0x1a
 7080 0212 78       		.byte	0x78
 7081 0213 00       		.sleb128 0
 7082 0214 22       		.byte	0x22
 7083 0215 04       		.byte	0x4
 7084 0216 BB13     		.uleb128 .LVL319-.Ltext0
 7085 0218 C213     		.uleb128 .LFE78-.Ltext0
 7086 021a 01       		.uleb128 0x1
 7087 021b 50       		.byte	0x50
 7088 021c 00       		.byte	0
 7089              	.LVUS171:
 7090 021d 00       		.uleb128 0
 7091 021e 00       		.uleb128 .LVU848
 7092 021f 00       		.uleb128 .LVU848
 7093 0220 00       		.uleb128 0
 7094              	.LLST171:
 7095 0221 04       		.byte	0x4
 7096 0222 BF11     		.uleb128 .LVL286-.Ltext0
 7097 0224 DB11     		.uleb128 .LVL292-.Ltext0
 7098 0226 01       		.uleb128 0x1
 7099 0227 55       		.byte	0x55
 7100 0228 04       		.byte	0x4
 7101 0229 DB11     		.uleb128 .LVL292-.Ltext0
 7102 022b E411     		.uleb128 .LFE77-.Ltext0
 7103 022d 04       		.uleb128 0x4
 7104 022e A3       		.byte	0xa3
 7105 022f 01       		.uleb128 0x1
 7106 0230 55       		.byte	0x55
 7107 0231 9F       		.byte	0x9f
 7108 0232 00       		.byte	0
 7109              	.LVUS172:
 7110 0233 03       		.uleb128 .LVU836
 7111 0234 00       		.uleb128 .LVU841
 7112 0235 00       		.uleb128 .LVU841
 7113 0236 00       		.uleb128 .LVU843
 7114 0237 00       		.uleb128 .LVU843
 7115 0238 00       		.uleb128 .LVU848
 7116 0239 00       		.uleb128 .LVU848
 7117 023a 00       		.uleb128 0
 7118              	.LLST172:
 7119 023b 04       		.byte	0x4
 7120 023c BF11     		.uleb128 .LVL286-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 154


 7121 023e C411     		.uleb128 .LVL287-.Ltext0
 7122 0240 05       		.uleb128 0x5
 7123 0241 75       		.byte	0x75
 7124 0242 00       		.sleb128 0
 7125 0243 48       		.byte	0x48
 7126 0244 25       		.byte	0x25
 7127 0245 9F       		.byte	0x9f
 7128 0246 04       		.byte	0x4
 7129 0247 C411     		.uleb128 .LVL287-.Ltext0
 7130 0249 CB11     		.uleb128 .LVL289-.Ltext0
 7131 024b 01       		.uleb128 0x1
 7132 024c 50       		.byte	0x50
 7133 024d 04       		.byte	0x4
 7134 024e CB11     		.uleb128 .LVL289-.Ltext0
 7135 0250 DB11     		.uleb128 .LVL292-.Ltext0
 7136 0252 05       		.uleb128 0x5
 7137 0253 75       		.byte	0x75
 7138 0254 00       		.sleb128 0
 7139 0255 48       		.byte	0x48
 7140 0256 25       		.byte	0x25
 7141 0257 9F       		.byte	0x9f
 7142 0258 04       		.byte	0x4
 7143 0259 DB11     		.uleb128 .LVL292-.Ltext0
 7144 025b E411     		.uleb128 .LFE77-.Ltext0
 7145 025d 06       		.uleb128 0x6
 7146 025e A3       		.byte	0xa3
 7147 025f 01       		.uleb128 0x1
 7148 0260 55       		.byte	0x55
 7149 0261 48       		.byte	0x48
 7150 0262 25       		.byte	0x25
 7151 0263 9F       		.byte	0x9f
 7152 0264 00       		.byte	0
 7153              	.LVUS173:
 7154 0265 04       		.uleb128 .LVU837
 7155 0266 00       		.uleb128 .LVU846
 7156 0267 00       		.uleb128 .LVU846
 7157 0268 00       		.uleb128 0
 7158              	.LLST173:
 7159 0269 04       		.byte	0x4
 7160 026a BF11     		.uleb128 .LVL286-.Ltext0
 7161 026c D611     		.uleb128 .LVL291-.Ltext0
 7162 026e 09       		.uleb128 0x9
 7163 026f 75       		.byte	0x75
 7164 0270 00       		.sleb128 0
 7165 0271 38       		.byte	0x38
 7166 0272 25       		.byte	0x25
 7167 0273 0A       		.byte	0xa
 7168 0274 00FF     		.value	0xff00
 7169 0276 1A       		.byte	0x1a
 7170 0277 9F       		.byte	0x9f
 7171 0278 04       		.byte	0x4
 7172 0279 D611     		.uleb128 .LVL291-.Ltext0
 7173 027b E411     		.uleb128 .LFE77-.Ltext0
 7174 027d 01       		.uleb128 0x1
 7175 027e 51       		.byte	0x51
 7176 027f 00       		.byte	0
 7177              	.LVUS174:
GAS LISTING /tmp/cceaV4lG.s 			page 155


 7178 0280 05       		.uleb128 .LVU838
 7179 0281 00       		.uleb128 .LVU848
 7180 0282 00       		.uleb128 .LVU848
 7181 0283 00       		.uleb128 .LVU849
 7182 0284 00       		.uleb128 .LVU849
 7183 0285 00       		.uleb128 0
 7184              	.LLST174:
 7185 0286 04       		.byte	0x4
 7186 0287 BF11     		.uleb128 .LVL286-.Ltext0
 7187 0289 DB11     		.uleb128 .LVL292-.Ltext0
 7188 028b 0A       		.uleb128 0xa
 7189 028c 75       		.byte	0x75
 7190 028d 00       		.sleb128 0
 7191 028e 38       		.byte	0x38
 7192 028f 24       		.byte	0x24
 7193 0290 08       		.byte	0x8
 7194 0291 FF       		.byte	0xff
 7195 0292 40       		.byte	0x40
 7196 0293 24       		.byte	0x24
 7197 0294 1A       		.byte	0x1a
 7198 0295 9F       		.byte	0x9f
 7199 0296 04       		.byte	0x4
 7200 0297 DB11     		.uleb128 .LVL292-.Ltext0
 7201 0299 E111     		.uleb128 .LVL293-.Ltext0
 7202 029b 0B       		.uleb128 0xb
 7203 029c A3       		.byte	0xa3
 7204 029d 01       		.uleb128 0x1
 7205 029e 55       		.byte	0x55
 7206 029f 38       		.byte	0x38
 7207 02a0 24       		.byte	0x24
 7208 02a1 08       		.byte	0x8
 7209 02a2 FF       		.byte	0xff
 7210 02a3 40       		.byte	0x40
 7211 02a4 24       		.byte	0x24
 7212 02a5 1A       		.byte	0x1a
 7213 02a6 9F       		.byte	0x9f
 7214 02a7 04       		.byte	0x4
 7215 02a8 E111     		.uleb128 .LVL293-.Ltext0
 7216 02aa E411     		.uleb128 .LFE77-.Ltext0
 7217 02ac 01       		.uleb128 0x1
 7218 02ad 55       		.byte	0x55
 7219 02ae 00       		.byte	0
 7220              	.LVUS175:
 7221 02af 06       		.uleb128 .LVU839
 7222 02b0 00       		.uleb128 .LVU842
 7223 02b1 00       		.uleb128 .LVU842
 7224 02b2 00       		.uleb128 .LVU844
 7225 02b3 00       		.uleb128 .LVU844
 7226 02b4 00       		.uleb128 .LVU848
 7227 02b5 00       		.uleb128 .LVU848
 7228 02b6 00       		.uleb128 0
 7229              	.LLST175:
 7230 02b7 04       		.byte	0x4
 7231 02b8 BF11     		.uleb128 .LVL286-.Ltext0
 7232 02ba C911     		.uleb128 .LVL288-.Ltext0
 7233 02bc 05       		.uleb128 0x5
 7234 02bd 75       		.byte	0x75
GAS LISTING /tmp/cceaV4lG.s 			page 156


 7235 02be 00       		.sleb128 0
 7236 02bf 48       		.byte	0x48
 7237 02c0 24       		.byte	0x24
 7238 02c1 9F       		.byte	0x9f
 7239 02c2 04       		.byte	0x4
 7240 02c3 C911     		.uleb128 .LVL288-.Ltext0
 7241 02c5 CD11     		.uleb128 .LVL290-.Ltext0
 7242 02c7 01       		.uleb128 0x1
 7243 02c8 51       		.byte	0x51
 7244 02c9 04       		.byte	0x4
 7245 02ca CD11     		.uleb128 .LVL290-.Ltext0
 7246 02cc DB11     		.uleb128 .LVL292-.Ltext0
 7247 02ce 05       		.uleb128 0x5
 7248 02cf 75       		.byte	0x75
 7249 02d0 00       		.sleb128 0
 7250 02d1 48       		.byte	0x48
 7251 02d2 24       		.byte	0x24
 7252 02d3 9F       		.byte	0x9f
 7253 02d4 04       		.byte	0x4
 7254 02d5 DB11     		.uleb128 .LVL292-.Ltext0
 7255 02d7 E411     		.uleb128 .LFE77-.Ltext0
 7256 02d9 06       		.uleb128 0x6
 7257 02da A3       		.byte	0xa3
 7258 02db 01       		.uleb128 0x1
 7259 02dc 55       		.byte	0x55
 7260 02dd 48       		.byte	0x48
 7261 02de 24       		.byte	0x24
 7262 02df 9F       		.byte	0x9f
 7263 02e0 00       		.byte	0
 7264              	.LVUS170:
 7265 02e1 03       		.uleb128 .LVU830
 7266 02e2 00       		.uleb128 0
 7267              	.LLST170:
 7268 02e3 04       		.byte	0x4
 7269 02e4 B811     		.uleb128 .LVL285-.Ltext0
 7270 02e6 BF11     		.uleb128 .LFE76-.Ltext0
 7271 02e8 05       		.uleb128 0x5
 7272 02e9 75       		.byte	0x75
 7273 02ea 00       		.sleb128 0
 7274 02eb 38       		.byte	0x38
 7275 02ec 24       		.byte	0x24
 7276 02ed 9F       		.byte	0x9f
 7277 02ee 00       		.byte	0
 7278              	.LVUS169:
 7279 02ef 00       		.uleb128 0
 7280 02f0 00       		.uleb128 .LVU825
 7281 02f1 00       		.uleb128 .LVU825
 7282 02f2 00       		.uleb128 0
 7283              	.LLST169:
 7284 02f3 04       		.byte	0x4
 7285 02f4 A911     		.uleb128 .LVL283-.Ltext0
 7286 02f6 B411     		.uleb128 .LVL284-.Ltext0
 7287 02f8 01       		.uleb128 0x1
 7288 02f9 55       		.byte	0x55
 7289 02fa 04       		.byte	0x4
 7290 02fb B411     		.uleb128 .LVL284-.Ltext0
 7291 02fd B811     		.uleb128 .LFE75-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 157


 7292 02ff 04       		.uleb128 0x4
 7293 0300 A3       		.byte	0xa3
 7294 0301 01       		.uleb128 0x1
 7295 0302 55       		.byte	0x55
 7296 0303 9F       		.byte	0x9f
 7297 0304 00       		.byte	0
 7298              	.LVUS168:
 7299 0305 00       		.uleb128 0
 7300 0306 00       		.uleb128 .LVU818
 7301 0307 00       		.uleb128 .LVU818
 7302 0308 00       		.uleb128 0
 7303              	.LLST168:
 7304 0309 04       		.byte	0x4
 7305 030a 8A11     		.uleb128 .LVL281-.Ltext0
 7306 030c A511     		.uleb128 .LVL282-.Ltext0
 7307 030e 01       		.uleb128 0x1
 7308 030f 55       		.byte	0x55
 7309 0310 04       		.byte	0x4
 7310 0311 A511     		.uleb128 .LVL282-.Ltext0
 7311 0313 A911     		.uleb128 .LFE74-.Ltext0
 7312 0315 04       		.uleb128 0x4
 7313 0316 A3       		.byte	0xa3
 7314 0317 01       		.uleb128 0x1
 7315 0318 55       		.byte	0x55
 7316 0319 9F       		.byte	0x9f
 7317 031a 00       		.byte	0
 7318              	.LVUS164:
 7319 031b 00       		.uleb128 0
 7320 031c 00       		.uleb128 .LVU791
 7321 031d 00       		.uleb128 .LVU791
 7322 031e 00       		.uleb128 0
 7323              	.LLST164:
 7324 031f 04       		.byte	0x4
 7325 0320 C210     		.uleb128 .LVL270-.Ltext0
 7326 0322 D010     		.uleb128 .LVL271-.Ltext0
 7327 0324 01       		.uleb128 0x1
 7328 0325 55       		.byte	0x55
 7329 0326 04       		.byte	0x4
 7330 0327 D010     		.uleb128 .LVL271-.Ltext0
 7331 0329 8A11     		.uleb128 .LFE73-.Ltext0
 7332 032b 01       		.uleb128 0x1
 7333 032c 52       		.byte	0x52
 7334 032d 00       		.byte	0
 7335              	.LVUS165:
 7336 032e 00       		.uleb128 0
 7337 032f 01       		.uleb128 .LVU799
 7338 0330 01       		.uleb128 .LVU799
 7339 0331 00       		.uleb128 .LVU809
 7340 0332 00       		.uleb128 .LVU809
 7341 0333 00       		.uleb128 0
 7342              	.LLST165:
 7343 0334 04       		.byte	0x4
 7344 0335 C210     		.uleb128 .LVL270-.Ltext0
 7345 0337 E310     		.uleb128 .LVL274-.Ltext0
 7346 0339 01       		.uleb128 0x1
 7347 033a 54       		.byte	0x54
 7348 033b 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 158


 7349 033c E310     		.uleb128 .LVL274-.Ltext0
 7350 033e 8111     		.uleb128 .LVL279-.Ltext0
 7351 0340 03       		.uleb128 0x3
 7352 0341 74       		.byte	0x74
 7353 0342 01       		.sleb128 1
 7354 0343 9F       		.byte	0x9f
 7355 0344 04       		.byte	0x4
 7356 0345 8111     		.uleb128 .LVL279-.Ltext0
 7357 0347 8A11     		.uleb128 .LFE73-.Ltext0
 7358 0349 01       		.uleb128 0x1
 7359 034a 54       		.byte	0x54
 7360 034b 00       		.byte	0
 7361              	.LVUS166:
 7362 034c 00       		.uleb128 0
 7363 034d 00       		.uleb128 .LVU791
 7364 034e 00       		.uleb128 .LVU791
 7365 034f 00       		.uleb128 0
 7366              	.LLST166:
 7367 0350 04       		.byte	0x4
 7368 0351 C210     		.uleb128 .LVL270-.Ltext0
 7369 0353 D010     		.uleb128 .LVL271-.Ltext0
 7370 0355 01       		.uleb128 0x1
 7371 0356 51       		.byte	0x51
 7372 0357 04       		.byte	0x4
 7373 0358 D010     		.uleb128 .LVL271-.Ltext0
 7374 035a 8A11     		.uleb128 .LFE73-.Ltext0
 7375 035c 04       		.uleb128 0x4
 7376 035d A3       		.byte	0xa3
 7377 035e 01       		.uleb128 0x1
 7378 035f 51       		.byte	0x51
 7379 0360 9F       		.byte	0x9f
 7380 0361 00       		.byte	0
 7381              	.LVUS167:
 7382 0362 01       		.uleb128 .LVU792
 7383 0363 00       		.uleb128 .LVU794
 7384 0364 00       		.uleb128 .LVU794
 7385 0365 00       		.uleb128 .LVU797
 7386 0366 00       		.uleb128 .LVU797
 7387 0367 00       		.uleb128 .LVU798
 7388 0368 00       		.uleb128 .LVU798
 7389 0369 00       		.uleb128 .LVU802
 7390 036a 00       		.uleb128 .LVU802
 7391 036b 00       		.uleb128 .LVU804
 7392 036c 00       		.uleb128 .LVU804
 7393 036d 00       		.uleb128 .LVU806
 7394 036e 00       		.uleb128 .LVU806
 7395 036f 00       		.uleb128 .LVU807
 7396 0370 00       		.uleb128 .LVU807
 7397 0371 00       		.uleb128 .LVU812
 7398              	.LLST167:
 7399 0372 04       		.byte	0x4
 7400 0373 D010     		.uleb128 .LVL271-.Ltext0
 7401 0375 D610     		.uleb128 .LVL272-.Ltext0
 7402 0377 02       		.uleb128 0x2
 7403 0378 72       		.byte	0x72
 7404 0379 00       		.sleb128 0
 7405 037a 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 159


 7406 037b D610     		.uleb128 .LVL272-.Ltext0
 7407 037d E010     		.uleb128 .LVL273-.Ltext0
 7408 037f 01       		.uleb128 0x1
 7409 0380 50       		.byte	0x50
 7410 0381 04       		.byte	0x4
 7411 0382 E010     		.uleb128 .LVL273-.Ltext0
 7412 0384 E310     		.uleb128 .LVL274-.Ltext0
 7413 0386 07       		.uleb128 0x7
 7414 0387 72       		.byte	0x72
 7415 0388 00       		.sleb128 0
 7416 0389 94       		.byte	0x94
 7417 038a 01       		.byte	0x1
 7418 038b 34       		.byte	0x34
 7419 038c 25       		.byte	0x25
 7420 038d 9F       		.byte	0x9f
 7421 038e 04       		.byte	0x4
 7422 038f E310     		.uleb128 .LVL274-.Ltext0
 7423 0391 E910     		.uleb128 .LVL275-.Ltext0
 7424 0393 01       		.uleb128 0x1
 7425 0394 50       		.byte	0x50
 7426 0395 04       		.byte	0x4
 7427 0396 E910     		.uleb128 .LVL275-.Ltext0
 7428 0398 F010     		.uleb128 .LVL276-.Ltext0
 7429 039a 02       		.uleb128 0x2
 7430 039b 72       		.byte	0x72
 7431 039c 7F       		.sleb128 -1
 7432 039d 04       		.byte	0x4
 7433 039e F010     		.uleb128 .LVL276-.Ltext0
 7434 03a0 FA10     		.uleb128 .LVL277-.Ltext0
 7435 03a2 01       		.uleb128 0x1
 7436 03a3 50       		.byte	0x50
 7437 03a4 04       		.byte	0x4
 7438 03a5 FA10     		.uleb128 .LVL277-.Ltext0
 7439 03a7 FD10     		.uleb128 .LVL278-.Ltext0
 7440 03a9 03       		.uleb128 0x3
 7441 03aa 71       		.byte	0x71
 7442 03ab 50       		.sleb128 -48
 7443 03ac 9F       		.byte	0x9f
 7444 03ad 04       		.byte	0x4
 7445 03ae FD10     		.uleb128 .LVL278-.Ltext0
 7446 03b0 8911     		.uleb128 .LVL280-.Ltext0
 7447 03b2 01       		.uleb128 0x1
 7448 03b3 50       		.byte	0x50
 7449 03b4 00       		.byte	0
 7450              	.LVUS156:
 7451 03b5 00       		.uleb128 0
 7452 03b6 00       		.uleb128 .LVU751
 7453 03b7 00       		.uleb128 .LVU751
 7454 03b8 00       		.uleb128 .LVU782
 7455 03b9 00       		.uleb128 .LVU782
 7456 03ba 00       		.uleb128 .LVU784
 7457 03bb 00       		.uleb128 .LVU784
 7458 03bc 00       		.uleb128 0
 7459              	.LLST156:
 7460 03bd 04       		.byte	0x4
 7461 03be AC0F     		.uleb128 .LVL255-.Ltext0
 7462 03c0 C50F     		.uleb128 .LVL257-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 160


 7463 03c2 01       		.uleb128 0x1
 7464 03c3 55       		.byte	0x55
 7465 03c4 04       		.byte	0x4
 7466 03c5 C50F     		.uleb128 .LVL257-.Ltext0
 7467 03c7 B510     		.uleb128 .LVL267-.Ltext0
 7468 03c9 01       		.uleb128 0x1
 7469 03ca 53       		.byte	0x53
 7470 03cb 04       		.byte	0x4
 7471 03cc B510     		.uleb128 .LVL267-.Ltext0
 7472 03ce BB10     		.uleb128 .LVL269-.Ltext0
 7473 03d0 04       		.uleb128 0x4
 7474 03d1 A3       		.byte	0xa3
 7475 03d2 01       		.uleb128 0x1
 7476 03d3 55       		.byte	0x55
 7477 03d4 9F       		.byte	0x9f
 7478 03d5 04       		.byte	0x4
 7479 03d6 BB10     		.uleb128 .LVL269-.Ltext0
 7480 03d8 C210     		.uleb128 .LFE72-.Ltext0
 7481 03da 01       		.uleb128 0x1
 7482 03db 53       		.byte	0x53
 7483 03dc 00       		.byte	0
 7484              	.LVUS157:
 7485 03dd 00       		.uleb128 0
 7486 03de 00       		.uleb128 .LVU752
 7487 03df 00       		.uleb128 .LVU752
 7488 03e0 00       		.uleb128 .LVU781
 7489 03e1 00       		.uleb128 .LVU781
 7490 03e2 00       		.uleb128 .LVU784
 7491 03e3 00       		.uleb128 .LVU784
 7492 03e4 00       		.uleb128 0
 7493              	.LLST157:
 7494 03e5 04       		.byte	0x4
 7495 03e6 AC0F     		.uleb128 .LVL255-.Ltext0
 7496 03e8 C90F     		.uleb128 .LVL258-1-.Ltext0
 7497 03ea 01       		.uleb128 0x1
 7498 03eb 54       		.byte	0x54
 7499 03ec 04       		.byte	0x4
 7500 03ed C90F     		.uleb128 .LVL258-1-.Ltext0
 7501 03ef AD10     		.uleb128 .LVL266-.Ltext0
 7502 03f1 01       		.uleb128 0x1
 7503 03f2 56       		.byte	0x56
 7504 03f3 04       		.byte	0x4
 7505 03f4 AD10     		.uleb128 .LVL266-.Ltext0
 7506 03f6 BB10     		.uleb128 .LVL269-.Ltext0
 7507 03f8 04       		.uleb128 0x4
 7508 03f9 A3       		.byte	0xa3
 7509 03fa 01       		.uleb128 0x1
 7510 03fb 54       		.byte	0x54
 7511 03fc 9F       		.byte	0x9f
 7512 03fd 04       		.byte	0x4
 7513 03fe BB10     		.uleb128 .LVL269-.Ltext0
 7514 0400 C210     		.uleb128 .LFE72-.Ltext0
 7515 0402 01       		.uleb128 0x1
 7516 0403 56       		.byte	0x56
 7517 0404 00       		.byte	0
 7518              	.LVUS158:
 7519 0405 00       		.uleb128 0
GAS LISTING /tmp/cceaV4lG.s 			page 161


 7520 0406 00       		.uleb128 .LVU752
 7521 0407 00       		.uleb128 .LVU752
 7522 0408 00       		.uleb128 .LVU783
 7523 0409 00       		.uleb128 .LVU783
 7524 040a 00       		.uleb128 .LVU784
 7525 040b 00       		.uleb128 .LVU784
 7526 040c 00       		.uleb128 0
 7527              	.LLST158:
 7528 040d 04       		.byte	0x4
 7529 040e AC0F     		.uleb128 .LVL255-.Ltext0
 7530 0410 C90F     		.uleb128 .LVL258-1-.Ltext0
 7531 0412 01       		.uleb128 0x1
 7532 0413 51       		.byte	0x51
 7533 0414 04       		.byte	0x4
 7534 0415 C90F     		.uleb128 .LVL258-1-.Ltext0
 7535 0417 BA10     		.uleb128 .LVL268-.Ltext0
 7536 0419 01       		.uleb128 0x1
 7537 041a 5D       		.byte	0x5d
 7538 041b 04       		.byte	0x4
 7539 041c BA10     		.uleb128 .LVL268-.Ltext0
 7540 041e BB10     		.uleb128 .LVL269-.Ltext0
 7541 0420 04       		.uleb128 0x4
 7542 0421 A3       		.byte	0xa3
 7543 0422 01       		.uleb128 0x1
 7544 0423 51       		.byte	0x51
 7545 0424 9F       		.byte	0x9f
 7546 0425 04       		.byte	0x4
 7547 0426 BB10     		.uleb128 .LVL269-.Ltext0
 7548 0428 C210     		.uleb128 .LFE72-.Ltext0
 7549 042a 01       		.uleb128 0x1
 7550 042b 5D       		.byte	0x5d
 7551 042c 00       		.byte	0
 7552              	.LVUS159:
 7553 042d 00       		.uleb128 0
 7554 042e 00       		.uleb128 .LVU752
 7555 042f 00       		.uleb128 .LVU752
 7556 0430 00       		.uleb128 0
 7557              	.LLST159:
 7558 0431 04       		.byte	0x4
 7559 0432 AC0F     		.uleb128 .LVL255-.Ltext0
 7560 0434 C90F     		.uleb128 .LVL258-1-.Ltext0
 7561 0436 01       		.uleb128 0x1
 7562 0437 52       		.byte	0x52
 7563 0438 04       		.byte	0x4
 7564 0439 C90F     		.uleb128 .LVL258-1-.Ltext0
 7565 043b C210     		.uleb128 .LFE72-.Ltext0
 7566 043d 04       		.uleb128 0x4
 7567 043e A3       		.byte	0xa3
 7568 043f 01       		.uleb128 0x1
 7569 0440 52       		.byte	0x52
 7570 0441 9F       		.byte	0x9f
 7571 0442 00       		.byte	0
 7572              	.LVUS160:
 7573 0443 00       		.uleb128 .LVU752
 7574 0444 00       		.uleb128 .LVU760
 7575 0445 00       		.uleb128 .LVU760
 7576 0446 00       		.uleb128 .LVU768
GAS LISTING /tmp/cceaV4lG.s 			page 162


 7577 0447 00       		.uleb128 .LVU784
 7578 0448 00       		.uleb128 0
 7579              	.LLST160:
 7580 0449 04       		.byte	0x4
 7581 044a CA0F     		.uleb128 .LVL258-.Ltext0
 7582 044c E20F     		.uleb128 .LVL260-.Ltext0
 7583 044e 01       		.uleb128 0x1
 7584 044f 50       		.byte	0x50
 7585 0450 04       		.byte	0x4
 7586 0451 E20F     		.uleb128 .LVL260-.Ltext0
 7587 0453 8810     		.uleb128 .LVL262-.Ltext0
 7588 0455 01       		.uleb128 0x1
 7589 0456 52       		.byte	0x52
 7590 0457 04       		.byte	0x4
 7591 0458 BB10     		.uleb128 .LVL269-.Ltext0
 7592 045a C210     		.uleb128 .LFE72-.Ltext0
 7593 045c 01       		.uleb128 0x1
 7594 045d 52       		.byte	0x52
 7595 045e 00       		.byte	0
 7596              	.LVUS161:
 7597 045f 00       		.uleb128 .LVU754
 7598 0460 00       		.uleb128 .LVU780
 7599 0461 00       		.uleb128 .LVU780
 7600 0462 00       		.uleb128 .LVU781
 7601 0463 00       		.uleb128 .LVU781
 7602 0464 00       		.uleb128 .LVU782
 7603 0465 00       		.uleb128 .LVU782
 7604 0466 00       		.uleb128 .LVU784
 7605 0467 00       		.uleb128 .LVU784
 7606 0468 00       		.uleb128 0
 7607              	.LLST161:
 7608 0469 04       		.byte	0x4
 7609 046a D00F     		.uleb128 .LVL259-.Ltext0
 7610 046c A910     		.uleb128 .LVL265-.Ltext0
 7611 046e 01       		.uleb128 0x1
 7612 046f 59       		.byte	0x59
 7613 0470 04       		.byte	0x4
 7614 0471 A910     		.uleb128 .LVL265-.Ltext0
 7615 0473 AD10     		.uleb128 .LVL266-.Ltext0
 7616 0475 06       		.uleb128 0x6
 7617 0476 76       		.byte	0x76
 7618 0477 00       		.sleb128 0
 7619 0478 73       		.byte	0x73
 7620 0479 00       		.sleb128 0
 7621 047a 1C       		.byte	0x1c
 7622 047b 9F       		.byte	0x9f
 7623 047c 04       		.byte	0x4
 7624 047d AD10     		.uleb128 .LVL266-.Ltext0
 7625 047f B510     		.uleb128 .LVL267-.Ltext0
 7626 0481 07       		.uleb128 0x7
 7627 0482 A3       		.byte	0xa3
 7628 0483 01       		.uleb128 0x1
 7629 0484 54       		.byte	0x54
 7630 0485 73       		.byte	0x73
 7631 0486 00       		.sleb128 0
 7632 0487 1C       		.byte	0x1c
 7633 0488 9F       		.byte	0x9f
GAS LISTING /tmp/cceaV4lG.s 			page 163


 7634 0489 04       		.byte	0x4
 7635 048a B510     		.uleb128 .LVL267-.Ltext0
 7636 048c BB10     		.uleb128 .LVL269-.Ltext0
 7637 048e 08       		.uleb128 0x8
 7638 048f A3       		.byte	0xa3
 7639 0490 01       		.uleb128 0x1
 7640 0491 54       		.byte	0x54
 7641 0492 A3       		.byte	0xa3
 7642 0493 01       		.uleb128 0x1
 7643 0494 55       		.byte	0x55
 7644 0495 1C       		.byte	0x1c
 7645 0496 9F       		.byte	0x9f
 7646 0497 04       		.byte	0x4
 7647 0498 BB10     		.uleb128 .LVL269-.Ltext0
 7648 049a C210     		.uleb128 .LFE72-.Ltext0
 7649 049c 01       		.uleb128 0x1
 7650 049d 59       		.byte	0x59
 7651 049e 00       		.byte	0
 7652              	.LVUS162:
 7653 049f 01       		.uleb128 .LVU764
 7654 04a0 00       		.uleb128 .LVU768
 7655 04a1 00       		.uleb128 .LVU768
 7656 04a2 00       		.uleb128 .LVU776
 7657 04a3 00       		.uleb128 .LVU784
 7658 04a4 00       		.uleb128 0
 7659              	.LLST162:
 7660 04a5 04       		.byte	0x4
 7661 04a6 F70F     		.uleb128 .LVL261-.Ltext0
 7662 04a8 8810     		.uleb128 .LVL262-.Ltext0
 7663 04aa 02       		.uleb128 0x2
 7664 04ab 30       		.byte	0x30
 7665 04ac 9F       		.byte	0x9f
 7666 04ad 04       		.byte	0x4
 7667 04ae 8810     		.uleb128 .LVL262-.Ltext0
 7668 04b0 9F10     		.uleb128 .LVL264-.Ltext0
 7669 04b2 01       		.uleb128 0x1
 7670 04b3 50       		.byte	0x50
 7671 04b4 04       		.byte	0x4
 7672 04b5 BB10     		.uleb128 .LVL269-.Ltext0
 7673 04b7 C210     		.uleb128 .LFE72-.Ltext0
 7674 04b9 02       		.uleb128 0x2
 7675 04ba 30       		.byte	0x30
 7676 04bb 9F       		.byte	0x9f
 7677 04bc 00       		.byte	0
 7678              	.LVUS163:
 7679 04bd 04       		.uleb128 .LVU749
 7680 04be 00       		.uleb128 .LVU763
 7681 04bf 00       		.uleb128 .LVU763
 7682 04c0 00       		.uleb128 .LVU781
 7683 04c1 00       		.uleb128 .LVU784
 7684 04c2 00       		.uleb128 0
 7685              	.LLST163:
 7686 04c3 04       		.byte	0x4
 7687 04c4 C20F     		.uleb128 .LVL256-.Ltext0
 7688 04c6 F70F     		.uleb128 .LVL261-.Ltext0
 7689 04c8 03       		.uleb128 0x3
 7690 04c9 08       		.byte	0x8
GAS LISTING /tmp/cceaV4lG.s 			page 164


 7691 04ca 30       		.byte	0x30
 7692 04cb 9F       		.byte	0x9f
 7693 04cc 04       		.byte	0x4
 7694 04cd F70F     		.uleb128 .LVL261-.Ltext0
 7695 04cf AD10     		.uleb128 .LVL266-.Ltext0
 7696 04d1 01       		.uleb128 0x1
 7697 04d2 55       		.byte	0x55
 7698 04d3 04       		.byte	0x4
 7699 04d4 BB10     		.uleb128 .LVL269-.Ltext0
 7700 04d6 C210     		.uleb128 .LFE72-.Ltext0
 7701 04d8 01       		.uleb128 0x1
 7702 04d9 55       		.byte	0x55
 7703 04da 00       		.byte	0
 7704              	.LVUS144:
 7705 04db 00       		.uleb128 0
 7706 04dc 00       		.uleb128 .LVU707
 7707 04dd 00       		.uleb128 .LVU707
 7708 04de 00       		.uleb128 .LVU717
 7709 04df 00       		.uleb128 .LVU717
 7710 04e0 00       		.uleb128 .LVU729
 7711 04e1 00       		.uleb128 .LVU729
 7712 04e2 00       		.uleb128 0
 7713              	.LLST144:
 7714 04e3 04       		.byte	0x4
 7715 04e4 990E     		.uleb128 .LVL239-.Ltext0
 7716 04e6 BA0E     		.uleb128 .LVL244-.Ltext0
 7717 04e8 01       		.uleb128 0x1
 7718 04e9 55       		.byte	0x55
 7719 04ea 04       		.byte	0x4
 7720 04eb BA0E     		.uleb128 .LVL244-.Ltext0
 7721 04ed E40E     		.uleb128 .LVL248-.Ltext0
 7722 04ef 04       		.uleb128 0x4
 7723 04f0 A3       		.byte	0xa3
 7724 04f1 01       		.uleb128 0x1
 7725 04f2 55       		.byte	0x55
 7726 04f3 9F       		.byte	0x9f
 7727 04f4 04       		.byte	0x4
 7728 04f5 E40E     		.uleb128 .LVL248-.Ltext0
 7729 04f7 F90E     		.uleb128 .LVL251-.Ltext0
 7730 04f9 01       		.uleb128 0x1
 7731 04fa 55       		.byte	0x55
 7732 04fb 04       		.byte	0x4
 7733 04fc F90E     		.uleb128 .LVL251-.Ltext0
 7734 04fe AC0F     		.uleb128 .LFE71-.Ltext0
 7735 0500 04       		.uleb128 0x4
 7736 0501 A3       		.byte	0xa3
 7737 0502 01       		.uleb128 0x1
 7738 0503 55       		.byte	0x55
 7739 0504 9F       		.byte	0x9f
 7740 0505 00       		.byte	0
 7741              	.LVUS145:
 7742 0506 00       		.uleb128 0
 7743 0507 00       		.uleb128 .LVU707
 7744 0508 00       		.uleb128 .LVU707
 7745 0509 00       		.uleb128 .LVU717
 7746 050a 00       		.uleb128 .LVU717
 7747 050b 00       		.uleb128 .LVU729
GAS LISTING /tmp/cceaV4lG.s 			page 165


 7748 050c 00       		.uleb128 .LVU729
 7749 050d 00       		.uleb128 0
 7750              	.LLST145:
 7751 050e 04       		.byte	0x4
 7752 050f 990E     		.uleb128 .LVL239-.Ltext0
 7753 0511 BA0E     		.uleb128 .LVL244-.Ltext0
 7754 0513 01       		.uleb128 0x1
 7755 0514 54       		.byte	0x54
 7756 0515 04       		.byte	0x4
 7757 0516 BA0E     		.uleb128 .LVL244-.Ltext0
 7758 0518 E40E     		.uleb128 .LVL248-.Ltext0
 7759 051a 04       		.uleb128 0x4
 7760 051b A3       		.byte	0xa3
 7761 051c 01       		.uleb128 0x1
 7762 051d 54       		.byte	0x54
 7763 051e 9F       		.byte	0x9f
 7764 051f 04       		.byte	0x4
 7765 0520 E40E     		.uleb128 .LVL248-.Ltext0
 7766 0522 F90E     		.uleb128 .LVL251-.Ltext0
 7767 0524 01       		.uleb128 0x1
 7768 0525 54       		.byte	0x54
 7769 0526 04       		.byte	0x4
 7770 0527 F90E     		.uleb128 .LVL251-.Ltext0
 7771 0529 AC0F     		.uleb128 .LFE71-.Ltext0
 7772 052b 04       		.uleb128 0x4
 7773 052c A3       		.byte	0xa3
 7774 052d 01       		.uleb128 0x1
 7775 052e 54       		.byte	0x54
 7776 052f 9F       		.byte	0x9f
 7777 0530 00       		.byte	0
 7778              	.LVUS146:
 7779 0531 01       		.uleb128 .LVU738
 7780 0532 00       		.uleb128 0
 7781              	.LLST146:
 7782 0533 04       		.byte	0x4
 7783 0534 A20F     		.uleb128 .LVL254-.Ltext0
 7784 0536 AC0F     		.uleb128 .LFE71-.Ltext0
 7785 0538 01       		.uleb128 0x1
 7786 0539 52       		.byte	0x52
 7787 053a 00       		.byte	0
 7788              	.LVUS147:
 7789 053b 01       		.uleb128 .LVU693
 7790 053c 00       		.uleb128 .LVU707
 7791 053d 00       		.uleb128 .LVU707
 7792 053e 00       		.uleb128 .LVU715
 7793              	.LLST147:
 7794 053f 04       		.byte	0x4
 7795 0540 9E0E     		.uleb128 .LVL240-.Ltext0
 7796 0542 BA0E     		.uleb128 .LVL244-.Ltext0
 7797 0544 01       		.uleb128 0x1
 7798 0545 54       		.byte	0x54
 7799 0546 04       		.byte	0x4
 7800 0547 BA0E     		.uleb128 .LVL244-.Ltext0
 7801 0549 E00E     		.uleb128 .LVL247-.Ltext0
 7802 054b 04       		.uleb128 0x4
 7803 054c A3       		.byte	0xa3
 7804 054d 01       		.uleb128 0x1
GAS LISTING /tmp/cceaV4lG.s 			page 166


 7805 054e 54       		.byte	0x54
 7806 054f 9F       		.byte	0x9f
 7807 0550 00       		.byte	0
 7808              	.LVUS148:
 7809 0551 01       		.uleb128 .LVU693
 7810 0552 00       		.uleb128 .LVU707
 7811 0553 00       		.uleb128 .LVU707
 7812 0554 00       		.uleb128 .LVU715
 7813              	.LLST148:
 7814 0555 04       		.byte	0x4
 7815 0556 9E0E     		.uleb128 .LVL240-.Ltext0
 7816 0558 BA0E     		.uleb128 .LVL244-.Ltext0
 7817 055a 01       		.uleb128 0x1
 7818 055b 55       		.byte	0x55
 7819 055c 04       		.byte	0x4
 7820 055d BA0E     		.uleb128 .LVL244-.Ltext0
 7821 055f E00E     		.uleb128 .LVL247-.Ltext0
 7822 0561 04       		.uleb128 0x4
 7823 0562 A3       		.byte	0xa3
 7824 0563 01       		.uleb128 0x1
 7825 0564 55       		.byte	0x55
 7826 0565 9F       		.byte	0x9f
 7827 0566 00       		.byte	0
 7828              	.LVUS149:
 7829 0567 03       		.uleb128 .LVU695
 7830 0568 00       		.uleb128 .LVU701
 7831 0569 00       		.uleb128 .LVU701
 7832 056a 00       		.uleb128 .LVU704
 7833 056b 00       		.uleb128 .LVU704
 7834 056c 00       		.uleb128 .LVU707
 7835 056d 00       		.uleb128 .LVU707
 7836 056e 00       		.uleb128 .LVU715
 7837              	.LLST149:
 7838 056f 04       		.byte	0x4
 7839 0570 9E0E     		.uleb128 .LVL240-.Ltext0
 7840 0572 A80E     		.uleb128 .LVL241-.Ltext0
 7841 0574 03       		.uleb128 0x3
 7842 0575 75       		.byte	0x75
 7843 0576 0B       		.sleb128 11
 7844 0577 9F       		.byte	0x9f
 7845 0578 04       		.byte	0x4
 7846 0579 A80E     		.uleb128 .LVL241-.Ltext0
 7847 057b AE0E     		.uleb128 .LVL243-.Ltext0
 7848 057d 01       		.uleb128 0x1
 7849 057e 58       		.byte	0x58
 7850 057f 04       		.byte	0x4
 7851 0580 AE0E     		.uleb128 .LVL243-.Ltext0
 7852 0582 BA0E     		.uleb128 .LVL244-.Ltext0
 7853 0584 03       		.uleb128 0x3
 7854 0585 75       		.byte	0x75
 7855 0586 0B       		.sleb128 11
 7856 0587 9F       		.byte	0x9f
 7857 0588 04       		.byte	0x4
 7858 0589 BA0E     		.uleb128 .LVL244-.Ltext0
 7859 058b E00E     		.uleb128 .LVL247-.Ltext0
 7860 058d 01       		.uleb128 0x1
 7861 058e 58       		.byte	0x58
GAS LISTING /tmp/cceaV4lG.s 			page 167


 7862 058f 00       		.byte	0
 7863              	.LVUS150:
 7864 0590 04       		.uleb128 .LVU696
 7865 0591 00       		.uleb128 .LVU703
 7866 0592 00       		.uleb128 .LVU703
 7867 0593 00       		.uleb128 .LVU704
 7868 0594 00       		.uleb128 .LVU704
 7869 0595 00       		.uleb128 .LVU707
 7870 0596 00       		.uleb128 .LVU707
 7871 0597 00       		.uleb128 .LVU714
 7872 0598 00       		.uleb128 .LVU714
 7873 0599 00       		.uleb128 .LVU715
 7874              	.LLST150:
 7875 059a 04       		.byte	0x4
 7876 059b 9E0E     		.uleb128 .LVL240-.Ltext0
 7877 059d AC0E     		.uleb128 .LVL242-.Ltext0
 7878 059f 07       		.uleb128 0x7
 7879 05a0 74       		.byte	0x74
 7880 05a1 00       		.sleb128 0
 7881 05a2 0A       		.byte	0xa
 7882 05a3 FFFF     		.value	0xffff
 7883 05a5 1A       		.byte	0x1a
 7884 05a6 9F       		.byte	0x9f
 7885 05a7 04       		.byte	0x4
 7886 05a8 AC0E     		.uleb128 .LVL242-.Ltext0
 7887 05aa AE0E     		.uleb128 .LVL243-.Ltext0
 7888 05ac 02       		.uleb128 0x2
 7889 05ad 30       		.byte	0x30
 7890 05ae 9F       		.byte	0x9f
 7891 05af 04       		.byte	0x4
 7892 05b0 AE0E     		.uleb128 .LVL243-.Ltext0
 7893 05b2 BA0E     		.uleb128 .LVL244-.Ltext0
 7894 05b4 07       		.uleb128 0x7
 7895 05b5 74       		.byte	0x74
 7896 05b6 00       		.sleb128 0
 7897 05b7 0A       		.byte	0xa
 7898 05b8 FFFF     		.value	0xffff
 7899 05ba 1A       		.byte	0x1a
 7900 05bb 9F       		.byte	0x9f
 7901 05bc 04       		.byte	0x4
 7902 05bd BA0E     		.uleb128 .LVL244-.Ltext0
 7903 05bf DB0E     		.uleb128 .LVL246-.Ltext0
 7904 05c1 01       		.uleb128 0x1
 7905 05c2 51       		.byte	0x51
 7906 05c3 04       		.byte	0x4
 7907 05c4 DB0E     		.uleb128 .LVL246-.Ltext0
 7908 05c6 E00E     		.uleb128 .LVL247-.Ltext0
 7909 05c8 01       		.uleb128 0x1
 7910 05c9 50       		.byte	0x50
 7911 05ca 00       		.byte	0
 7912              	.LVUS152:
 7913 05cb 01       		.uleb128 .LVU718
 7914 05cc 00       		.uleb128 .LVU729
 7915 05cd 00       		.uleb128 .LVU729
 7916 05ce 01       		.uleb128 .LVU738
 7917              	.LLST152:
 7918 05cf 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 168


 7919 05d0 E40E     		.uleb128 .LVL248-.Ltext0
 7920 05d2 F90E     		.uleb128 .LVL251-.Ltext0
 7921 05d4 04       		.uleb128 0x4
 7922 05d5 74       		.byte	0x74
 7923 05d6 00       		.sleb128 0
 7924 05d7 1F       		.byte	0x1f
 7925 05d8 9F       		.byte	0x9f
 7926 05d9 04       		.byte	0x4
 7927 05da F90E     		.uleb128 .LVL251-.Ltext0
 7928 05dc A20F     		.uleb128 .LVL254-.Ltext0
 7929 05de 05       		.uleb128 0x5
 7930 05df A3       		.byte	0xa3
 7931 05e0 01       		.uleb128 0x1
 7932 05e1 54       		.byte	0x54
 7933 05e2 1F       		.byte	0x1f
 7934 05e3 9F       		.byte	0x9f
 7935 05e4 00       		.byte	0
 7936              	.LVUS153:
 7937 05e5 01       		.uleb128 .LVU718
 7938 05e6 00       		.uleb128 .LVU729
 7939 05e7 00       		.uleb128 .LVU729
 7940 05e8 01       		.uleb128 .LVU738
 7941              	.LLST153:
 7942 05e9 04       		.byte	0x4
 7943 05ea E40E     		.uleb128 .LVL248-.Ltext0
 7944 05ec F90E     		.uleb128 .LVL251-.Ltext0
 7945 05ee 01       		.uleb128 0x1
 7946 05ef 55       		.byte	0x55
 7947 05f0 04       		.byte	0x4
 7948 05f1 F90E     		.uleb128 .LVL251-.Ltext0
 7949 05f3 A20F     		.uleb128 .LVL254-.Ltext0
 7950 05f5 04       		.uleb128 0x4
 7951 05f6 A3       		.byte	0xa3
 7952 05f7 01       		.uleb128 0x1
 7953 05f8 55       		.byte	0x55
 7954 05f9 9F       		.byte	0x9f
 7955 05fa 00       		.byte	0
 7956              	.LVUS154:
 7957 05fb 00       		.uleb128 .LVU721
 7958 05fc 01       		.uleb128 .LVU738
 7959              	.LLST154:
 7960 05fd 04       		.byte	0x4
 7961 05fe E80E     		.uleb128 .LVL249-.Ltext0
 7962 0600 A20F     		.uleb128 .LVL254-.Ltext0
 7963 0602 01       		.uleb128 0x1
 7964 0603 52       		.byte	0x52
 7965 0604 00       		.byte	0
 7966              	.LVUS155:
 7967 0605 00       		.uleb128 .LVU724
 7968 0606 00       		.uleb128 .LVU736
 7969 0607 00       		.uleb128 .LVU736
 7970 0608 01       		.uleb128 .LVU738
 7971              	.LLST155:
 7972 0609 04       		.byte	0x4
 7973 060a EF0E     		.uleb128 .LVL250-.Ltext0
 7974 060c 9D0F     		.uleb128 .LVL253-.Ltext0
 7975 060e 01       		.uleb128 0x1
GAS LISTING /tmp/cceaV4lG.s 			page 169


 7976 060f 51       		.byte	0x51
 7977 0610 04       		.byte	0x4
 7978 0611 9D0F     		.uleb128 .LVL253-.Ltext0
 7979 0613 A20F     		.uleb128 .LVL254-.Ltext0
 7980 0615 01       		.uleb128 0x1
 7981 0616 50       		.byte	0x50
 7982 0617 00       		.byte	0
 7983              	.LVUS141:
 7984 0618 00       		.uleb128 0
 7985 0619 00       		.uleb128 .LVU680
 7986 061a 00       		.uleb128 .LVU680
 7987 061b 00       		.uleb128 .LVU681
 7988 061c 00       		.uleb128 .LVU681
 7989 061d 00       		.uleb128 .LVU684
 7990 061e 00       		.uleb128 .LVU684
 7991 061f 00       		.uleb128 0
 7992              	.LLST141:
 7993 0620 04       		.byte	0x4
 7994 0621 FF0D     		.uleb128 .LVL233-.Ltext0
 7995 0623 870E     		.uleb128 .LVL234-1-.Ltext0
 7996 0625 01       		.uleb128 0x1
 7997 0626 55       		.byte	0x55
 7998 0627 04       		.byte	0x4
 7999 0628 870E     		.uleb128 .LVL234-1-.Ltext0
 8000 062a 890E     		.uleb128 .LVL235-.Ltext0
 8001 062c 04       		.uleb128 0x4
 8002 062d A3       		.byte	0xa3
 8003 062e 01       		.uleb128 0x1
 8004 062f 55       		.byte	0x55
 8005 0630 9F       		.byte	0x9f
 8006 0631 04       		.byte	0x4
 8007 0632 890E     		.uleb128 .LVL235-.Ltext0
 8008 0634 8F0E     		.uleb128 .LVL237-1-.Ltext0
 8009 0636 01       		.uleb128 0x1
 8010 0637 55       		.byte	0x55
 8011 0638 04       		.byte	0x4
 8012 0639 8F0E     		.uleb128 .LVL237-1-.Ltext0
 8013 063b 990E     		.uleb128 .LFE70-.Ltext0
 8014 063d 04       		.uleb128 0x4
 8015 063e A3       		.byte	0xa3
 8016 063f 01       		.uleb128 0x1
 8017 0640 55       		.byte	0x55
 8018 0641 9F       		.byte	0x9f
 8019 0642 00       		.byte	0
 8020              	.LVUS142:
 8021 0643 00       		.uleb128 0
 8022 0644 00       		.uleb128 .LVU680
 8023 0645 00       		.uleb128 .LVU680
 8024 0646 00       		.uleb128 .LVU681
 8025 0647 00       		.uleb128 .LVU681
 8026 0648 00       		.uleb128 .LVU683
 8027 0649 00       		.uleb128 .LVU683
 8028 064a 00       		.uleb128 .LVU684
 8029 064b 00       		.uleb128 .LVU684
 8030 064c 00       		.uleb128 0
 8031              	.LLST142:
 8032 064d 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 170


 8033 064e FF0D     		.uleb128 .LVL233-.Ltext0
 8034 0650 870E     		.uleb128 .LVL234-1-.Ltext0
 8035 0652 01       		.uleb128 0x1
 8036 0653 54       		.byte	0x54
 8037 0654 04       		.byte	0x4
 8038 0655 870E     		.uleb128 .LVL234-1-.Ltext0
 8039 0657 890E     		.uleb128 .LVL235-.Ltext0
 8040 0659 04       		.uleb128 0x4
 8041 065a A3       		.byte	0xa3
 8042 065b 01       		.uleb128 0x1
 8043 065c 54       		.byte	0x54
 8044 065d 9F       		.byte	0x9f
 8045 065e 04       		.byte	0x4
 8046 065f 890E     		.uleb128 .LVL235-.Ltext0
 8047 0661 8B0E     		.uleb128 .LVL236-.Ltext0
 8048 0663 01       		.uleb128 0x1
 8049 0664 54       		.byte	0x54
 8050 0665 04       		.byte	0x4
 8051 0666 8B0E     		.uleb128 .LVL236-.Ltext0
 8052 0668 8F0E     		.uleb128 .LVL237-1-.Ltext0
 8053 066a 04       		.uleb128 0x4
 8054 066b 74       		.byte	0x74
 8055 066c 00       		.sleb128 0
 8056 066d 1F       		.byte	0x1f
 8057 066e 9F       		.byte	0x9f
 8058 066f 04       		.byte	0x4
 8059 0670 8F0E     		.uleb128 .LVL237-1-.Ltext0
 8060 0672 990E     		.uleb128 .LFE70-.Ltext0
 8061 0674 04       		.uleb128 0x4
 8062 0675 A3       		.byte	0xa3
 8063 0676 01       		.uleb128 0x1
 8064 0677 54       		.byte	0x54
 8065 0678 9F       		.byte	0x9f
 8066 0679 00       		.byte	0
 8067              	.LVUS143:
 8068 067a 00       		.uleb128 .LVU684
 8069 067b 00       		.uleb128 .LVU688
 8070 067c 00       		.uleb128 .LVU688
 8071 067d 00       		.uleb128 0
 8072              	.LLST143:
 8073 067e 04       		.byte	0x4
 8074 067f 900E     		.uleb128 .LVL237-.Ltext0
 8075 0681 980E     		.uleb128 .LVL238-.Ltext0
 8076 0683 01       		.uleb128 0x1
 8077 0684 50       		.byte	0x50
 8078 0685 04       		.byte	0x4
 8079 0686 980E     		.uleb128 .LVL238-.Ltext0
 8080 0688 990E     		.uleb128 .LFE70-.Ltext0
 8081 068a 03       		.uleb128 0x3
 8082 068b 70       		.byte	0x70
 8083 068c 01       		.sleb128 1
 8084 068d 9F       		.byte	0x9f
 8085 068e 00       		.byte	0
 8086              	.LVUS139:
 8087 068f 00       		.uleb128 0
 8088 0690 00       		.uleb128 .LVU674
 8089 0691 00       		.uleb128 .LVU674
GAS LISTING /tmp/cceaV4lG.s 			page 171


 8090 0692 00       		.uleb128 0
 8091              	.LLST139:
 8092 0693 04       		.byte	0x4
 8093 0694 F90D     		.uleb128 .LVL231-.Ltext0
 8094 0696 FD0D     		.uleb128 .LVL232-1-.Ltext0
 8095 0698 01       		.uleb128 0x1
 8096 0699 55       		.byte	0x55
 8097 069a 04       		.byte	0x4
 8098 069b FD0D     		.uleb128 .LVL232-1-.Ltext0
 8099 069d FF0D     		.uleb128 .LFE69-.Ltext0
 8100 069f 04       		.uleb128 0x4
 8101 06a0 A3       		.byte	0xa3
 8102 06a1 01       		.uleb128 0x1
 8103 06a2 55       		.byte	0x55
 8104 06a3 9F       		.byte	0x9f
 8105 06a4 00       		.byte	0
 8106              	.LVUS140:
 8107 06a5 00       		.uleb128 0
 8108 06a6 00       		.uleb128 .LVU674
 8109 06a7 00       		.uleb128 .LVU674
 8110 06a8 00       		.uleb128 0
 8111              	.LLST140:
 8112 06a9 04       		.byte	0x4
 8113 06aa F90D     		.uleb128 .LVL231-.Ltext0
 8114 06ac FD0D     		.uleb128 .LVL232-1-.Ltext0
 8115 06ae 01       		.uleb128 0x1
 8116 06af 54       		.byte	0x54
 8117 06b0 04       		.byte	0x4
 8118 06b1 FD0D     		.uleb128 .LVL232-1-.Ltext0
 8119 06b3 FF0D     		.uleb128 .LFE69-.Ltext0
 8120 06b5 04       		.uleb128 0x4
 8121 06b6 A3       		.byte	0xa3
 8122 06b7 01       		.uleb128 0x1
 8123 06b8 54       		.byte	0x54
 8124 06b9 9F       		.byte	0x9f
 8125 06ba 00       		.byte	0
 8126              	.LVUS135:
 8127 06bb 00       		.uleb128 0
 8128 06bc 00       		.uleb128 .LVU652
 8129 06bd 00       		.uleb128 .LVU652
 8130 06be 00       		.uleb128 .LVU653
 8131 06bf 00       		.uleb128 .LVU653
 8132 06c0 00       		.uleb128 0
 8133              	.LLST135:
 8134 06c1 04       		.byte	0x4
 8135 06c2 A90D     		.uleb128 .LVL219-.Ltext0
 8136 06c4 C50D     		.uleb128 .LVL223-.Ltext0
 8137 06c6 01       		.uleb128 0x1
 8138 06c7 54       		.byte	0x54
 8139 06c8 04       		.byte	0x4
 8140 06c9 C50D     		.uleb128 .LVL223-.Ltext0
 8141 06cb C70D     		.uleb128 .LVL224-.Ltext0
 8142 06cd 01       		.uleb128 0x1
 8143 06ce 50       		.byte	0x50
 8144 06cf 04       		.byte	0x4
 8145 06d0 C70D     		.uleb128 .LVL224-.Ltext0
 8146 06d2 F90D     		.uleb128 .LFE68-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 172


 8147 06d4 04       		.uleb128 0x4
 8148 06d5 A3       		.byte	0xa3
 8149 06d6 01       		.uleb128 0x1
 8150 06d7 54       		.byte	0x54
 8151 06d8 9F       		.byte	0x9f
 8152 06d9 00       		.byte	0
 8153              	.LVUS136:
 8154 06da 01       		.uleb128 .LVU640
 8155 06db 00       		.uleb128 .LVU646
 8156 06dc 00       		.uleb128 .LVU646
 8157 06dd 01       		.uleb128 .LVU655
 8158 06de 01       		.uleb128 .LVU655
 8159 06df 00       		.uleb128 .LVU658
 8160 06e0 00       		.uleb128 .LVU658
 8161 06e1 01       		.uleb128 .LVU659
 8162 06e2 01       		.uleb128 .LVU659
 8163 06e3 00       		.uleb128 .LVU667
 8164 06e4 00       		.uleb128 .LVU667
 8165 06e5 00       		.uleb128 0
 8166              	.LLST136:
 8167 06e6 04       		.byte	0x4
 8168 06e7 AB0D     		.uleb128 .LVL220-.Ltext0
 8169 06e9 B30D     		.uleb128 .LVL221-.Ltext0
 8170 06eb 03       		.uleb128 0x3
 8171 06ec 75       		.byte	0x75
 8172 06ed 12       		.sleb128 18
 8173 06ee 9F       		.byte	0x9f
 8174 06ef 04       		.byte	0x4
 8175 06f0 B30D     		.uleb128 .LVL221-.Ltext0
 8176 06f2 CD0D     		.uleb128 .LVL225-.Ltext0
 8177 06f4 01       		.uleb128 0x1
 8178 06f5 52       		.byte	0x52
 8179 06f6 04       		.byte	0x4
 8180 06f7 CD0D     		.uleb128 .LVL225-.Ltext0
 8181 06f9 D50D     		.uleb128 .LVL226-.Ltext0
 8182 06fb 03       		.uleb128 0x3
 8183 06fc 72       		.byte	0x72
 8184 06fd 7F       		.sleb128 -1
 8185 06fe 9F       		.byte	0x9f
 8186 06ff 04       		.byte	0x4
 8187 0700 D50D     		.uleb128 .LVL226-.Ltext0
 8188 0702 D50D     		.uleb128 .LVL226-.Ltext0
 8189 0704 01       		.uleb128 0x1
 8190 0705 52       		.byte	0x52
 8191 0706 04       		.byte	0x4
 8192 0707 D50D     		.uleb128 .LVL226-.Ltext0
 8193 0709 EA0D     		.uleb128 .LVL229-.Ltext0
 8194 070b 03       		.uleb128 0x3
 8195 070c 72       		.byte	0x72
 8196 070d 7F       		.sleb128 -1
 8197 070e 9F       		.byte	0x9f
 8198 070f 04       		.byte	0x4
 8199 0710 EA0D     		.uleb128 .LVL229-.Ltext0
 8200 0712 F90D     		.uleb128 .LFE68-.Ltext0
 8201 0714 01       		.uleb128 0x1
 8202 0715 52       		.byte	0x52
 8203 0716 00       		.byte	0
GAS LISTING /tmp/cceaV4lG.s 			page 173


 8204              	.LVUS137:
 8205 0717 02       		.uleb128 .LVU641
 8206 0718 00       		.uleb128 .LVU652
 8207 0719 00       		.uleb128 .LVU652
 8208 071a 00       		.uleb128 .LVU658
 8209 071b 00       		.uleb128 .LVU664
 8210 071c 00       		.uleb128 .LVU668
 8211 071d 00       		.uleb128 .LVU668
 8212 071e 00       		.uleb128 0
 8213              	.LLST137:
 8214 071f 04       		.byte	0x4
 8215 0720 AB0D     		.uleb128 .LVL220-.Ltext0
 8216 0722 C50D     		.uleb128 .LVL223-.Ltext0
 8217 0724 01       		.uleb128 0x1
 8218 0725 54       		.byte	0x54
 8219 0726 04       		.byte	0x4
 8220 0727 C50D     		.uleb128 .LVL223-.Ltext0
 8221 0729 D50D     		.uleb128 .LVL226-.Ltext0
 8222 072b 01       		.uleb128 0x1
 8223 072c 50       		.byte	0x50
 8224 072d 04       		.byte	0x4
 8225 072e E30D     		.uleb128 .LVL227-.Ltext0
 8226 0730 EF0D     		.uleb128 .LVL230-.Ltext0
 8227 0732 01       		.uleb128 0x1
 8228 0733 50       		.byte	0x50
 8229 0734 04       		.byte	0x4
 8230 0735 EF0D     		.uleb128 .LVL230-.Ltext0
 8231 0737 F90D     		.uleb128 .LFE68-.Ltext0
 8232 0739 02       		.uleb128 0x2
 8233 073a 30       		.byte	0x30
 8234 073b 9F       		.byte	0x9f
 8235 073c 00       		.byte	0
 8236              	.LVUS138:
 8237 073d 03       		.uleb128 .LVU642
 8238 073e 00       		.uleb128 .LVU653
 8239 073f 01       		.uleb128 .LVU665
 8240 0740 00       		.uleb128 .LVU666
 8241              	.LLST138:
 8242 0741 04       		.byte	0x4
 8243 0742 AB0D     		.uleb128 .LVL220-.Ltext0
 8244 0744 C70D     		.uleb128 .LVL224-.Ltext0
 8245 0746 02       		.uleb128 0x2
 8246 0747 30       		.byte	0x30
 8247 0748 9F       		.byte	0x9f
 8248 0749 04       		.byte	0x4
 8249 074a E30D     		.uleb128 .LVL227-.Ltext0
 8250 074c E60D     		.uleb128 .LVL228-.Ltext0
 8251 074e 03       		.uleb128 0x3
 8252 074f 74       		.byte	0x74
 8253 0750 01       		.sleb128 1
 8254 0751 9F       		.byte	0x9f
 8255 0752 00       		.byte	0
 8256              	.LVUS0:
 8257 0753 00       		.uleb128 0
 8258 0754 00       		.uleb128 .LVU13
 8259 0755 00       		.uleb128 .LVU13
 8260 0756 00       		.uleb128 0
GAS LISTING /tmp/cceaV4lG.s 			page 174


 8261              	.LLST0:
 8262 0757 04       		.byte	0x4
 8263 0758 00       		.uleb128 .LVL0-.Ltext0
 8264 0759 1B       		.uleb128 .LVL4-.Ltext0
 8265 075a 01       		.uleb128 0x1
 8266 075b 55       		.byte	0x55
 8267 075c 04       		.byte	0x4
 8268 075d 1B       		.uleb128 .LVL4-.Ltext0
 8269 075e 45       		.uleb128 .LFE66-.Ltext0
 8270 075f 04       		.uleb128 0x4
 8271 0760 A3       		.byte	0xa3
 8272 0761 01       		.uleb128 0x1
 8273 0762 55       		.byte	0x55
 8274 0763 9F       		.byte	0x9f
 8275 0764 00       		.byte	0
 8276              	.LVUS1:
 8277 0765 00       		.uleb128 0
 8278 0766 00       		.uleb128 .LVU13
 8279 0767 00       		.uleb128 .LVU13
 8280 0768 00       		.uleb128 0
 8281              	.LLST1:
 8282 0769 04       		.byte	0x4
 8283 076a 00       		.uleb128 .LVL0-.Ltext0
 8284 076b 1B       		.uleb128 .LVL4-.Ltext0
 8285 076c 01       		.uleb128 0x1
 8286 076d 54       		.byte	0x54
 8287 076e 04       		.byte	0x4
 8288 076f 1B       		.uleb128 .LVL4-.Ltext0
 8289 0770 45       		.uleb128 .LFE66-.Ltext0
 8290 0771 04       		.uleb128 0x4
 8291 0772 A3       		.byte	0xa3
 8292 0773 01       		.uleb128 0x1
 8293 0774 54       		.byte	0x54
 8294 0775 9F       		.byte	0x9f
 8295 0776 00       		.byte	0
 8296              	.LVUS2:
 8297 0777 02       		.uleb128 .LVU2
 8298 0778 00       		.uleb128 .LVU8
 8299 0779 00       		.uleb128 .LVU8
 8300 077a 00       		.uleb128 .LVU11
 8301 077b 00       		.uleb128 .LVU11
 8302 077c 00       		.uleb128 .LVU13
 8303 077d 00       		.uleb128 .LVU13
 8304 077e 00       		.uleb128 0
 8305              	.LLST2:
 8306 077f 04       		.byte	0x4
 8307 0780 00       		.uleb128 .LVL0-.Ltext0
 8308 0781 0C       		.uleb128 .LVL1-.Ltext0
 8309 0782 03       		.uleb128 0x3
 8310 0783 75       		.byte	0x75
 8311 0784 0B       		.sleb128 11
 8312 0785 9F       		.byte	0x9f
 8313 0786 04       		.byte	0x4
 8314 0787 0C       		.uleb128 .LVL1-.Ltext0
 8315 0788 12       		.uleb128 .LVL3-.Ltext0
 8316 0789 01       		.uleb128 0x1
 8317 078a 58       		.byte	0x58
GAS LISTING /tmp/cceaV4lG.s 			page 175


 8318 078b 04       		.byte	0x4
 8319 078c 12       		.uleb128 .LVL3-.Ltext0
 8320 078d 1B       		.uleb128 .LVL4-.Ltext0
 8321 078e 03       		.uleb128 0x3
 8322 078f 75       		.byte	0x75
 8323 0790 0B       		.sleb128 11
 8324 0791 9F       		.byte	0x9f
 8325 0792 04       		.byte	0x4
 8326 0793 1B       		.uleb128 .LVL4-.Ltext0
 8327 0794 45       		.uleb128 .LFE66-.Ltext0
 8328 0795 01       		.uleb128 0x1
 8329 0796 58       		.byte	0x58
 8330 0797 00       		.byte	0
 8331              	.LVUS3:
 8332 0798 03       		.uleb128 .LVU3
 8333 0799 00       		.uleb128 .LVU10
 8334 079a 00       		.uleb128 .LVU10
 8335 079b 00       		.uleb128 .LVU11
 8336 079c 00       		.uleb128 .LVU11
 8337 079d 00       		.uleb128 .LVU20
 8338 079e 00       		.uleb128 .LVU20
 8339 079f 00       		.uleb128 .LVU21
 8340              	.LLST3:
 8341 07a0 04       		.byte	0x4
 8342 07a1 00       		.uleb128 .LVL0-.Ltext0
 8343 07a2 10       		.uleb128 .LVL2-.Ltext0
 8344 07a3 01       		.uleb128 0x1
 8345 07a4 54       		.byte	0x54
 8346 07a5 04       		.byte	0x4
 8347 07a6 10       		.uleb128 .LVL2-.Ltext0
 8348 07a7 12       		.uleb128 .LVL3-.Ltext0
 8349 07a8 02       		.uleb128 0x2
 8350 07a9 30       		.byte	0x30
 8351 07aa 9F       		.byte	0x9f
 8352 07ab 04       		.byte	0x4
 8353 07ac 12       		.uleb128 .LVL3-.Ltext0
 8354 07ad 3C       		.uleb128 .LVL6-.Ltext0
 8355 07ae 01       		.uleb128 0x1
 8356 07af 54       		.byte	0x54
 8357 07b0 04       		.byte	0x4
 8358 07b1 3C       		.uleb128 .LVL6-.Ltext0
 8359 07b2 41       		.uleb128 .LVL7-.Ltext0
 8360 07b3 01       		.uleb128 0x1
 8361 07b4 50       		.byte	0x50
 8362 07b5 00       		.byte	0
 8363              	.LVUS121:
 8364 07b6 00       		.uleb128 0
 8365 07b7 00       		.uleb128 .LVU624
 8366 07b8 00       		.uleb128 .LVU624
 8367 07b9 00       		.uleb128 .LVU635
 8368 07ba 00       		.uleb128 .LVU635
 8369 07bb 00       		.uleb128 0
 8370              	.LLST121:
 8371 07bc 04       		.byte	0x4
 8372 07bd CF0C     		.uleb128 .LVL204-.Ltext0
 8373 07bf 950D     		.uleb128 .LVL213-.Ltext0
 8374 07c1 01       		.uleb128 0x1
GAS LISTING /tmp/cceaV4lG.s 			page 176


 8375 07c2 55       		.byte	0x55
 8376 07c3 04       		.byte	0x4
 8377 07c4 950D     		.uleb128 .LVL213-.Ltext0
 8378 07c6 A80D     		.uleb128 .LVL218-.Ltext0
 8379 07c8 03       		.uleb128 0x3
 8380 07c9 70       		.byte	0x70
 8381 07ca 75       		.sleb128 -11
 8382 07cb 9F       		.byte	0x9f
 8383 07cc 04       		.byte	0x4
 8384 07cd A80D     		.uleb128 .LVL218-.Ltext0
 8385 07cf A90D     		.uleb128 .LFE65-.Ltext0
 8386 07d1 04       		.uleb128 0x4
 8387 07d2 A3       		.byte	0xa3
 8388 07d3 01       		.uleb128 0x1
 8389 07d4 55       		.byte	0x55
 8390 07d5 9F       		.byte	0x9f
 8391 07d6 00       		.byte	0
 8392              	.LVUS122:
 8393 07d7 00       		.uleb128 0
 8394 07d8 00       		.uleb128 .LVU608
 8395 07d9 00       		.uleb128 .LVU608
 8396 07da 00       		.uleb128 .LVU622
 8397 07db 00       		.uleb128 .LVU622
 8398 07dc 00       		.uleb128 .LVU623
 8399 07dd 00       		.uleb128 .LVU623
 8400 07de 00       		.uleb128 0
 8401              	.LLST122:
 8402 07df 04       		.byte	0x4
 8403 07e0 CF0C     		.uleb128 .LVL204-.Ltext0
 8404 07e2 EA0C     		.uleb128 .LVL206-.Ltext0
 8405 07e4 01       		.uleb128 0x1
 8406 07e5 54       		.byte	0x54
 8407 07e6 04       		.byte	0x4
 8408 07e7 EA0C     		.uleb128 .LVL206-.Ltext0
 8409 07e9 880D     		.uleb128 .LVL211-.Ltext0
 8410 07eb 04       		.uleb128 0x4
 8411 07ec A3       		.byte	0xa3
 8412 07ed 01       		.uleb128 0x1
 8413 07ee 54       		.byte	0x54
 8414 07ef 9F       		.byte	0x9f
 8415 07f0 04       		.byte	0x4
 8416 07f1 880D     		.uleb128 .LVL211-.Ltext0
 8417 07f3 920D     		.uleb128 .LVL212-.Ltext0
 8418 07f5 01       		.uleb128 0x1
 8419 07f6 54       		.byte	0x54
 8420 07f7 04       		.byte	0x4
 8421 07f8 920D     		.uleb128 .LVL212-.Ltext0
 8422 07fa A90D     		.uleb128 .LFE65-.Ltext0
 8423 07fc 04       		.uleb128 0x4
 8424 07fd A3       		.byte	0xa3
 8425 07fe 01       		.uleb128 0x1
 8426 07ff 54       		.byte	0x54
 8427 0800 9F       		.byte	0x9f
 8428 0801 00       		.byte	0
 8429              	.LVUS123:
 8430 0802 00       		.uleb128 0
 8431 0803 00       		.uleb128 .LVU608
GAS LISTING /tmp/cceaV4lG.s 			page 177


 8432 0804 00       		.uleb128 .LVU608
 8433 0805 00       		.uleb128 .LVU622
 8434 0806 00       		.uleb128 .LVU622
 8435 0807 00       		.uleb128 .LVU634
 8436 0808 00       		.uleb128 .LVU634
 8437 0809 00       		.uleb128 0
 8438              	.LLST123:
 8439 080a 04       		.byte	0x4
 8440 080b CF0C     		.uleb128 .LVL204-.Ltext0
 8441 080d EA0C     		.uleb128 .LVL206-.Ltext0
 8442 080f 01       		.uleb128 0x1
 8443 0810 51       		.byte	0x51
 8444 0811 04       		.byte	0x4
 8445 0812 EA0C     		.uleb128 .LVL206-.Ltext0
 8446 0814 880D     		.uleb128 .LVL211-.Ltext0
 8447 0816 01       		.uleb128 0x1
 8448 0817 59       		.byte	0x59
 8449 0818 04       		.byte	0x4
 8450 0819 880D     		.uleb128 .LVL211-.Ltext0
 8451 081b A50D     		.uleb128 .LVL217-.Ltext0
 8452 081d 01       		.uleb128 0x1
 8453 081e 51       		.byte	0x51
 8454 081f 04       		.byte	0x4
 8455 0820 A50D     		.uleb128 .LVL217-.Ltext0
 8456 0822 A90D     		.uleb128 .LFE65-.Ltext0
 8457 0824 01       		.uleb128 0x1
 8458 0825 59       		.byte	0x59
 8459 0826 00       		.byte	0
 8460              	.LVUS124:
 8461 0827 00       		.uleb128 .LVU599
 8462 0828 00       		.uleb128 0
 8463              	.LLST124:
 8464 0829 04       		.byte	0x4
 8465 082a D60C     		.uleb128 .LVL205-.Ltext0
 8466 082c A90D     		.uleb128 .LFE65-.Ltext0
 8467 082e 01       		.uleb128 0x1
 8468 082f 50       		.byte	0x50
 8469 0830 00       		.byte	0
 8470              	.LVUS125:
 8471 0831 01       		.uleb128 .LVU600
 8472 0832 02       		.uleb128 .LVU617
 8473 0833 02       		.uleb128 .LVU617
 8474 0834 00       		.uleb128 .LVU620
 8475 0835 00       		.uleb128 .LVU620
 8476 0836 00       		.uleb128 .LVU623
 8477 0837 00       		.uleb128 .LVU623
 8478 0838 00       		.uleb128 0
 8479              	.LLST125:
 8480 0839 04       		.byte	0x4
 8481 083a D60C     		.uleb128 .LVL205-.Ltext0
 8482 083c FA0C     		.uleb128 .LVL208-.Ltext0
 8483 083e 01       		.uleb128 0x1
 8484 083f 54       		.byte	0x54
 8485 0840 04       		.byte	0x4
 8486 0841 FA0C     		.uleb128 .LVL208-.Ltext0
 8487 0843 800D     		.uleb128 .LVL210-.Ltext0
 8488 0845 05       		.uleb128 0x5
GAS LISTING /tmp/cceaV4lG.s 			page 178


 8489 0846 74       		.byte	0x74
 8490 0847 00       		.sleb128 0
 8491 0848 34       		.byte	0x34
 8492 0849 25       		.byte	0x25
 8493 084a 9F       		.byte	0x9f
 8494 084b 04       		.byte	0x4
 8495 084c 800D     		.uleb128 .LVL210-.Ltext0
 8496 084e 920D     		.uleb128 .LVL212-.Ltext0
 8497 0850 01       		.uleb128 0x1
 8498 0851 54       		.byte	0x54
 8499 0852 04       		.byte	0x4
 8500 0853 920D     		.uleb128 .LVL212-.Ltext0
 8501 0855 A90D     		.uleb128 .LFE65-.Ltext0
 8502 0857 04       		.uleb128 0x4
 8503 0858 A3       		.byte	0xa3
 8504 0859 01       		.uleb128 0x1
 8505 085a 54       		.byte	0x54
 8506 085b 9F       		.byte	0x9f
 8507 085c 00       		.byte	0
 8508              	.LVUS126:
 8509 085d 02       		.uleb128 .LVU601
 8510 085e 00       		.uleb128 .LVU608
 8511 085f 00       		.uleb128 .LVU608
 8512 0860 00       		.uleb128 .LVU622
 8513 0861 00       		.uleb128 .LVU622
 8514 0862 00       		.uleb128 0
 8515              	.LLST126:
 8516 0863 04       		.byte	0x4
 8517 0864 D60C     		.uleb128 .LVL205-.Ltext0
 8518 0866 EA0C     		.uleb128 .LVL206-.Ltext0
 8519 0868 02       		.uleb128 0x2
 8520 0869 30       		.byte	0x30
 8521 086a 9F       		.byte	0x9f
 8522 086b 04       		.byte	0x4
 8523 086c EA0C     		.uleb128 .LVL206-.Ltext0
 8524 086e 880D     		.uleb128 .LVL211-.Ltext0
 8525 0870 01       		.uleb128 0x1
 8526 0871 52       		.byte	0x52
 8527 0872 04       		.byte	0x4
 8528 0873 880D     		.uleb128 .LVL211-.Ltext0
 8529 0875 A90D     		.uleb128 .LFE65-.Ltext0
 8530 0877 02       		.uleb128 0x2
 8531 0878 30       		.byte	0x30
 8532 0879 9F       		.byte	0x9f
 8533 087a 00       		.byte	0
 8534              	.LVUS127:
 8535 087b 03       		.uleb128 .LVU602
 8536 087c 00       		.uleb128 .LVU624
 8537 087d 00       		.uleb128 .LVU624
 8538 087e 02       		.uleb128 .LVU630
 8539 087f 02       		.uleb128 .LVU630
 8540 0880 00       		.uleb128 .LVU631
 8541              	.LLST127:
 8542 0881 04       		.byte	0x4
 8543 0882 D60C     		.uleb128 .LVL205-.Ltext0
 8544 0884 950D     		.uleb128 .LVL213-.Ltext0
 8545 0886 02       		.uleb128 0x2
GAS LISTING /tmp/cceaV4lG.s 			page 179


 8546 0887 30       		.byte	0x30
 8547 0888 9F       		.byte	0x9f
 8548 0889 04       		.byte	0x4
 8549 088a 950D     		.uleb128 .LVL213-.Ltext0
 8550 088c 990D     		.uleb128 .LVL214-.Ltext0
 8551 088e 08       		.uleb128 0x8
 8552 088f 70       		.byte	0x70
 8553 0890 00       		.sleb128 0
 8554 0891 72       		.byte	0x72
 8555 0892 00       		.sleb128 0
 8556 0893 1C       		.byte	0x1c
 8557 0894 3B       		.byte	0x3b
 8558 0895 1C       		.byte	0x1c
 8559 0896 9F       		.byte	0x9f
 8560 0897 04       		.byte	0x4
 8561 0898 990D     		.uleb128 .LVL214-.Ltext0
 8562 089a 9D0D     		.uleb128 .LVL215-.Ltext0
 8563 089c 08       		.uleb128 0x8
 8564 089d 70       		.byte	0x70
 8565 089e 00       		.sleb128 0
 8566 089f 72       		.byte	0x72
 8567 08a0 00       		.sleb128 0
 8568 08a1 1C       		.byte	0x1c
 8569 08a2 3A       		.byte	0x3a
 8570 08a3 1C       		.byte	0x1c
 8571 08a4 9F       		.byte	0x9f
 8572 08a5 00       		.byte	0
 8573              	.LVUS129:
 8574 08a6 01       		.uleb128 .LVU611
 8575 08a7 00       		.uleb128 .LVU615
 8576              	.LLST129:
 8577 08a8 04       		.byte	0x4
 8578 08a9 EE0C     		.uleb128 .LVL207-.Ltext0
 8579 08ab FA0C     		.uleb128 .LVL208-.Ltext0
 8580 08ad 02       		.uleb128 0x2
 8581 08ae 31       		.byte	0x31
 8582 08af 9F       		.byte	0x9f
 8583 08b0 00       		.byte	0
 8584              	.LVUS130:
 8585 08b1 01       		.uleb128 .LVU611
 8586 08b2 00       		.uleb128 .LVU615
 8587              	.LLST130:
 8588 08b3 04       		.byte	0x4
 8589 08b4 EE0C     		.uleb128 .LVL207-.Ltext0
 8590 08b6 FA0C     		.uleb128 .LVL208-.Ltext0
 8591 08b8 17       		.uleb128 0x17
 8592 08b9 74       		.byte	0x74
 8593 08ba 00       		.sleb128 0
 8594 08bb 3F       		.byte	0x3f
 8595 08bc 1A       		.byte	0x1a
 8596 08bd 0C       		.byte	0xc
 8597 08be FFFFFFFF 		.long	0xffffffff
 8598 08c2 1A       		.byte	0x1a
 8599 08c3 31       		.byte	0x31
 8600 08c4 24       		.byte	0x24
 8601 08c5 03       		.byte	0x3
 8602 08c6 00000000 		.quad	_ZL14caps_hex_ascii
GAS LISTING /tmp/cceaV4lG.s 			page 180


 8602      00000000 
 8603 08ce 22       		.byte	0x22
 8604 08cf 9F       		.byte	0x9f
 8605 08d0 00       		.byte	0
 8606              	.LVUS131:
 8607 08d1 01       		.uleb128 .LVU611
 8608 08d2 00       		.uleb128 .LVU615
 8609              	.LLST131:
 8610 08d3 04       		.byte	0x4
 8611 08d4 EE0C     		.uleb128 .LVL207-.Ltext0
 8612 08d6 FA0C     		.uleb128 .LVL208-.Ltext0
 8613 08d8 01       		.uleb128 0x1
 8614 08d9 50       		.byte	0x50
 8615 08da 00       		.byte	0
 8616              	.LVUS132:
 8617 08db 01       		.uleb128 .LVU625
 8618 08dc 00       		.uleb128 .LVU628
 8619              	.LLST132:
 8620 08dd 04       		.byte	0x4
 8621 08de 950D     		.uleb128 .LVL213-.Ltext0
 8622 08e0 990D     		.uleb128 .LVL214-.Ltext0
 8623 08e2 02       		.uleb128 0x2
 8624 08e3 31       		.byte	0x31
 8625 08e4 9F       		.byte	0x9f
 8626 08e5 00       		.byte	0
 8627              	.LVUS133:
 8628 08e6 01       		.uleb128 .LVU625
 8629 08e7 00       		.uleb128 .LVU628
 8630              	.LLST133:
 8631 08e8 04       		.byte	0x4
 8632 08e9 950D     		.uleb128 .LVL213-.Ltext0
 8633 08eb 990D     		.uleb128 .LVL214-.Ltext0
 8634 08ed 0A       		.uleb128 0xa
 8635 08ee 03       		.byte	0x3
 8636 08ef 00000000 		.quad	_ZL14caps_hex_ascii
 8636      00000000 
 8637 08f7 9F       		.byte	0x9f
 8638 08f8 00       		.byte	0
 8639              	.LVUS134:
 8640 08f9 01       		.uleb128 .LVU625
 8641 08fa 00       		.uleb128 .LVU628
 8642              	.LLST134:
 8643 08fb 04       		.byte	0x4
 8644 08fc 950D     		.uleb128 .LVL213-.Ltext0
 8645 08fe 990D     		.uleb128 .LVL214-.Ltext0
 8646 0900 03       		.uleb128 0x3
 8647 0901 72       		.byte	0x72
 8648 0902 0A       		.sleb128 10
 8649 0903 9F       		.byte	0x9f
 8650 0904 00       		.byte	0
 8651              	.LVUS112:
 8652 0905 00       		.uleb128 0
 8653 0906 00       		.uleb128 .LVU568
 8654 0907 00       		.uleb128 .LVU568
 8655 0908 00       		.uleb128 0
 8656              	.LLST112:
 8657 0909 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 181


 8658 090a 810C     		.uleb128 .LVL193-.Ltext0
 8659 090c 8D0C     		.uleb128 .LVL195-.Ltext0
 8660 090e 01       		.uleb128 0x1
 8661 090f 55       		.byte	0x55
 8662 0910 04       		.byte	0x4
 8663 0911 8D0C     		.uleb128 .LVL195-.Ltext0
 8664 0913 CF0C     		.uleb128 .LFE64-.Ltext0
 8665 0915 03       		.uleb128 0x3
 8666 0916 75       		.byte	0x75
 8667 0917 7D       		.sleb128 -3
 8668 0918 9F       		.byte	0x9f
 8669 0919 00       		.byte	0
 8670              	.LVUS113:
 8671 091a 00       		.uleb128 0
 8672 091b 00       		.uleb128 .LVU578
 8673 091c 00       		.uleb128 .LVU578
 8674 091d 00       		.uleb128 0
 8675              	.LLST113:
 8676 091e 04       		.byte	0x4
 8677 091f 810C     		.uleb128 .LVL193-.Ltext0
 8678 0921 AB0C     		.uleb128 .LVL199-.Ltext0
 8679 0923 01       		.uleb128 0x1
 8680 0924 54       		.byte	0x54
 8681 0925 04       		.byte	0x4
 8682 0926 AB0C     		.uleb128 .LVL199-.Ltext0
 8683 0928 CF0C     		.uleb128 .LFE64-.Ltext0
 8684 092a 04       		.uleb128 0x4
 8685 092b A3       		.byte	0xa3
 8686 092c 01       		.uleb128 0x1
 8687 092d 54       		.byte	0x54
 8688 092e 9F       		.byte	0x9f
 8689 092f 00       		.byte	0
 8690              	.LVUS114:
 8691 0930 00       		.uleb128 .LVU562
 8692 0931 00       		.uleb128 .LVU568
 8693 0932 00       		.uleb128 .LVU568
 8694 0933 00       		.uleb128 .LVU578
 8695 0934 00       		.uleb128 .LVU578
 8696 0935 00       		.uleb128 .LVU594
 8697              	.LLST114:
 8698 0936 04       		.byte	0x4
 8699 0937 850C     		.uleb128 .LVL194-.Ltext0
 8700 0939 8D0C     		.uleb128 .LVL195-.Ltext0
 8701 093b 01       		.uleb128 0x1
 8702 093c 51       		.byte	0x51
 8703 093d 04       		.byte	0x4
 8704 093e 8D0C     		.uleb128 .LVL195-.Ltext0
 8705 0940 AB0C     		.uleb128 .LVL199-.Ltext0
 8706 0942 01       		.uleb128 0x1
 8707 0943 55       		.byte	0x55
 8708 0944 04       		.byte	0x4
 8709 0945 AB0C     		.uleb128 .LVL199-.Ltext0
 8710 0947 CE0C     		.uleb128 .LVL203-.Ltext0
 8711 0949 01       		.uleb128 0x1
 8712 094a 50       		.byte	0x50
 8713 094b 00       		.byte	0
 8714              	.LVUS115:
GAS LISTING /tmp/cceaV4lG.s 			page 182


 8715 094c 01       		.uleb128 .LVU563
 8716 094d 00       		.uleb128 0
 8717              	.LLST115:
 8718 094e 04       		.byte	0x4
 8719 094f 850C     		.uleb128 .LVL194-.Ltext0
 8720 0951 CF0C     		.uleb128 .LFE64-.Ltext0
 8721 0953 01       		.uleb128 0x1
 8722 0954 54       		.byte	0x54
 8723 0955 00       		.byte	0
 8724              	.LVUS116:
 8725 0956 02       		.uleb128 .LVU564
 8726 0957 00       		.uleb128 .LVU570
 8727 0958 00       		.uleb128 .LVU570
 8728 0959 01       		.uleb128 .LVU573
 8729 095a 01       		.uleb128 .LVU573
 8730 095b 00       		.uleb128 .LVU574
 8731              	.LLST116:
 8732 095c 04       		.byte	0x4
 8733 095d 850C     		.uleb128 .LVL194-.Ltext0
 8734 095f 900C     		.uleb128 .LVL196-.Ltext0
 8735 0961 02       		.uleb128 0x2
 8736 0962 30       		.byte	0x30
 8737 0963 9F       		.byte	0x9f
 8738 0964 04       		.byte	0x4
 8739 0965 900C     		.uleb128 .LVL196-.Ltext0
 8740 0967 930C     		.uleb128 .LVL197-.Ltext0
 8741 0969 06       		.uleb128 0x6
 8742 096a 70       		.byte	0x70
 8743 096b 00       		.sleb128 0
 8744 096c 75       		.byte	0x75
 8745 096d 00       		.sleb128 0
 8746 096e 1C       		.byte	0x1c
 8747 096f 9F       		.byte	0x9f
 8748 0970 04       		.byte	0x4
 8749 0971 930C     		.uleb128 .LVL197-.Ltext0
 8750 0973 970C     		.uleb128 .LVL198-.Ltext0
 8751 0975 08       		.uleb128 0x8
 8752 0976 70       		.byte	0x70
 8753 0977 00       		.sleb128 0
 8754 0978 75       		.byte	0x75
 8755 0979 00       		.sleb128 0
 8756 097a 1C       		.byte	0x1c
 8757 097b 23       		.byte	0x23
 8758 097c 01       		.uleb128 0x1
 8759 097d 9F       		.byte	0x9f
 8760 097e 00       		.byte	0
 8761              	.LVUS118:
 8762 097f 01       		.uleb128 .LVU582
 8763 0980 00       		.uleb128 .LVU586
 8764              	.LLST118:
 8765 0981 04       		.byte	0x4
 8766 0982 AF0C     		.uleb128 .LVL200-.Ltext0
 8767 0984 BB0C     		.uleb128 .LVL201-.Ltext0
 8768 0986 02       		.uleb128 0x2
 8769 0987 31       		.byte	0x31
 8770 0988 9F       		.byte	0x9f
 8771 0989 00       		.byte	0
GAS LISTING /tmp/cceaV4lG.s 			page 183


 8772              	.LVUS119:
 8773 098a 01       		.uleb128 .LVU582
 8774 098b 00       		.uleb128 .LVU586
 8775              	.LLST119:
 8776 098c 04       		.byte	0x4
 8777 098d AF0C     		.uleb128 .LVL200-.Ltext0
 8778 098f BB0C     		.uleb128 .LVL201-.Ltext0
 8779 0991 17       		.uleb128 0x17
 8780 0992 74       		.byte	0x74
 8781 0993 00       		.sleb128 0
 8782 0994 3F       		.byte	0x3f
 8783 0995 1A       		.byte	0x1a
 8784 0996 0C       		.byte	0xc
 8785 0997 FFFFFFFF 		.long	0xffffffff
 8786 099b 1A       		.byte	0x1a
 8787 099c 31       		.byte	0x31
 8788 099d 24       		.byte	0x24
 8789 099e 03       		.byte	0x3
 8790 099f 00000000 		.quad	_ZL9hex_ascii
 8790      00000000 
 8791 09a7 22       		.byte	0x22
 8792 09a8 9F       		.byte	0x9f
 8793 09a9 00       		.byte	0
 8794              	.LVUS120:
 8795 09aa 01       		.uleb128 .LVU582
 8796 09ab 00       		.uleb128 .LVU586
 8797              	.LLST120:
 8798 09ac 04       		.byte	0x4
 8799 09ad AF0C     		.uleb128 .LVL200-.Ltext0
 8800 09af BB0C     		.uleb128 .LVL201-.Ltext0
 8801 09b1 01       		.uleb128 0x1
 8802 09b2 50       		.byte	0x50
 8803 09b3 00       		.byte	0
 8804              	.LVUS84:
 8805 09b4 00       		.uleb128 0
 8806 09b5 00       		.uleb128 .LVU505
 8807 09b6 00       		.uleb128 .LVU505
 8808 09b7 00       		.uleb128 .LVU522
 8809 09b8 00       		.uleb128 .LVU522
 8810 09b9 00       		.uleb128 .LVU546
 8811 09ba 00       		.uleb128 .LVU546
 8812 09bb 00       		.uleb128 0
 8813              	.LLST84:
 8814 09bc 04       		.byte	0x4
 8815 09bd 910B     		.uleb128 .LVL174-.Ltext0
 8816 09bf AB0B     		.uleb128 .LVL176-.Ltext0
 8817 09c1 01       		.uleb128 0x1
 8818 09c2 55       		.byte	0x55
 8819 09c3 04       		.byte	0x4
 8820 09c4 AB0B     		.uleb128 .LVL176-.Ltext0
 8821 09c6 D60B     		.uleb128 .LVL183-.Ltext0
 8822 09c8 04       		.uleb128 0x4
 8823 09c9 A3       		.byte	0xa3
 8824 09ca 01       		.uleb128 0x1
 8825 09cb 55       		.byte	0x55
 8826 09cc 9F       		.byte	0x9f
 8827 09cd 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 184


 8828 09ce D60B     		.uleb128 .LVL183-.Ltext0
 8829 09d0 EC0B     		.uleb128 .LVL189-.Ltext0
 8830 09d2 01       		.uleb128 0x1
 8831 09d3 55       		.byte	0x55
 8832 09d4 04       		.byte	0x4
 8833 09d5 EC0B     		.uleb128 .LVL189-.Ltext0
 8834 09d7 810C     		.uleb128 .LFE63-.Ltext0
 8835 09d9 04       		.uleb128 0x4
 8836 09da A3       		.byte	0xa3
 8837 09db 01       		.uleb128 0x1
 8838 09dc 55       		.byte	0x55
 8839 09dd 9F       		.byte	0x9f
 8840 09de 00       		.byte	0
 8841              	.LVUS85:
 8842 09df 00       		.uleb128 0
 8843 09e0 00       		.uleb128 .LVU522
 8844 09e1 00       		.uleb128 .LVU522
 8845 09e2 00       		.uleb128 .LVU546
 8846 09e3 00       		.uleb128 .LVU546
 8847 09e4 00       		.uleb128 0
 8848              	.LLST85:
 8849 09e5 04       		.byte	0x4
 8850 09e6 910B     		.uleb128 .LVL174-.Ltext0
 8851 09e8 D60B     		.uleb128 .LVL183-.Ltext0
 8852 09ea 01       		.uleb128 0x1
 8853 09eb 54       		.byte	0x54
 8854 09ec 04       		.byte	0x4
 8855 09ed D60B     		.uleb128 .LVL183-.Ltext0
 8856 09ef EC0B     		.uleb128 .LVL189-.Ltext0
 8857 09f1 01       		.uleb128 0x1
 8858 09f2 50       		.byte	0x50
 8859 09f3 04       		.byte	0x4
 8860 09f4 EC0B     		.uleb128 .LVL189-.Ltext0
 8861 09f6 810C     		.uleb128 .LFE63-.Ltext0
 8862 09f8 01       		.uleb128 0x1
 8863 09f9 54       		.byte	0x54
 8864 09fa 00       		.byte	0
 8865              	.LVUS86:
 8866 09fb 00       		.uleb128 .LVU496
 8867 09fc 00       		.uleb128 .LVU505
 8868 09fd 00       		.uleb128 .LVU507
 8869 09fe 00       		.uleb128 .LVU520
 8870 09ff 00       		.uleb128 .LVU522
 8871 0a00 00       		.uleb128 .LVU524
 8872 0a01 00       		.uleb128 .LVU524
 8873 0a02 01       		.uleb128 .LVU548
 8874 0a03 01       		.uleb128 .LVU548
 8875 0a04 00       		.uleb128 .LVU558
 8876              	.LLST86:
 8877 0a05 04       		.byte	0x4
 8878 0a06 950B     		.uleb128 .LVL175-.Ltext0
 8879 0a08 AB0B     		.uleb128 .LVL176-.Ltext0
 8880 0a0a 01       		.uleb128 0x1
 8881 0a0b 52       		.byte	0x52
 8882 0a0c 04       		.byte	0x4
 8883 0a0d AF0B     		.uleb128 .LVL177-.Ltext0
 8884 0a0f D20B     		.uleb128 .LVL181-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 185


 8885 0a11 01       		.uleb128 0x1
 8886 0a12 58       		.byte	0x58
 8887 0a13 04       		.byte	0x4
 8888 0a14 D60B     		.uleb128 .LVL183-.Ltext0
 8889 0a16 DA0B     		.uleb128 .LVL184-.Ltext0
 8890 0a18 01       		.uleb128 0x1
 8891 0a19 52       		.byte	0x52
 8892 0a1a 04       		.byte	0x4
 8893 0a1b DA0B     		.uleb128 .LVL184-.Ltext0
 8894 0a1d F10B     		.uleb128 .LVL190-.Ltext0
 8895 0a1f 01       		.uleb128 0x1
 8896 0a20 58       		.byte	0x58
 8897 0a21 04       		.byte	0x4
 8898 0a22 F10B     		.uleb128 .LVL190-.Ltext0
 8899 0a24 FF0B     		.uleb128 .LVL192-.Ltext0
 8900 0a26 03       		.uleb128 0x3
 8901 0a27 72       		.byte	0x72
 8902 0a28 7D       		.sleb128 -3
 8903 0a29 9F       		.byte	0x9f
 8904 0a2a 00       		.byte	0
 8905              	.LVUS87:
 8906 0a2b 01       		.uleb128 .LVU497
 8907 0a2c 00       		.uleb128 .LVU505
 8908 0a2d 02       		.uleb128 .LVU514
 8909 0a2e 00       		.uleb128 .LVU517
 8910 0a2f 00       		.uleb128 .LVU517
 8911 0a30 00       		.uleb128 .LVU521
 8912 0a31 00       		.uleb128 .LVU522
 8913 0a32 00       		.uleb128 0
 8914              	.LLST87:
 8915 0a33 04       		.byte	0x4
 8916 0a34 950B     		.uleb128 .LVL175-.Ltext0
 8917 0a36 AB0B     		.uleb128 .LVL176-.Ltext0
 8918 0a38 01       		.uleb128 0x1
 8919 0a39 54       		.byte	0x54
 8920 0a3a 04       		.byte	0x4
 8921 0a3b BD0B     		.uleb128 .LVL178-.Ltext0
 8922 0a3d C30B     		.uleb128 .LVL180-.Ltext0
 8923 0a3f 05       		.uleb128 0x5
 8924 0a40 70       		.byte	0x70
 8925 0a41 00       		.sleb128 0
 8926 0a42 34       		.byte	0x34
 8927 0a43 25       		.byte	0x25
 8928 0a44 9F       		.byte	0x9f
 8929 0a45 04       		.byte	0x4
 8930 0a46 C30B     		.uleb128 .LVL180-.Ltext0
 8931 0a48 D50B     		.uleb128 .LVL182-.Ltext0
 8932 0a4a 01       		.uleb128 0x1
 8933 0a4b 50       		.byte	0x50
 8934 0a4c 04       		.byte	0x4
 8935 0a4d D60B     		.uleb128 .LVL183-.Ltext0
 8936 0a4f 810C     		.uleb128 .LFE63-.Ltext0
 8937 0a51 01       		.uleb128 0x1
 8938 0a52 50       		.byte	0x50
 8939 0a53 00       		.byte	0
 8940              	.LVUS88:
 8941 0a54 02       		.uleb128 .LVU498
GAS LISTING /tmp/cceaV4lG.s 			page 186


 8942 0a55 00       		.uleb128 .LVU505
 8943 0a56 00       		.uleb128 .LVU516
 8944 0a57 00       		.uleb128 .LVU520
 8945 0a58 00       		.uleb128 .LVU522
 8946 0a59 00       		.uleb128 .LVU546
 8947 0a5a 00       		.uleb128 .LVU546
 8948 0a5b 00       		.uleb128 0
 8949              	.LLST88:
 8950 0a5c 04       		.byte	0x4
 8951 0a5d 950B     		.uleb128 .LVL175-.Ltext0
 8952 0a5f AB0B     		.uleb128 .LVL176-.Ltext0
 8953 0a61 02       		.uleb128 0x2
 8954 0a62 30       		.byte	0x30
 8955 0a63 9F       		.byte	0x9f
 8956 0a64 04       		.byte	0x4
 8957 0a65 C00B     		.uleb128 .LVL179-.Ltext0
 8958 0a67 D20B     		.uleb128 .LVL181-.Ltext0
 8959 0a69 01       		.uleb128 0x1
 8960 0a6a 51       		.byte	0x51
 8961 0a6b 04       		.byte	0x4
 8962 0a6c D60B     		.uleb128 .LVL183-.Ltext0
 8963 0a6e EC0B     		.uleb128 .LVL189-.Ltext0
 8964 0a70 02       		.uleb128 0x2
 8965 0a71 30       		.byte	0x30
 8966 0a72 9F       		.byte	0x9f
 8967 0a73 04       		.byte	0x4
 8968 0a74 EC0B     		.uleb128 .LVL189-.Ltext0
 8969 0a76 810C     		.uleb128 .LFE63-.Ltext0
 8970 0a78 01       		.uleb128 0x1
 8971 0a79 51       		.byte	0x51
 8972 0a7a 00       		.byte	0
 8973              	.LVUS90:
 8974 0a7b 01       		.uleb128 .LVU508
 8975 0a7c 00       		.uleb128 .LVU512
 8976              	.LLST90:
 8977 0a7d 04       		.byte	0x4
 8978 0a7e AF0B     		.uleb128 .LVL177-.Ltext0
 8979 0a80 BD0B     		.uleb128 .LVL178-.Ltext0
 8980 0a82 02       		.uleb128 0x2
 8981 0a83 31       		.byte	0x31
 8982 0a84 9F       		.byte	0x9f
 8983 0a85 00       		.byte	0
 8984              	.LVUS91:
 8985 0a86 01       		.uleb128 .LVU508
 8986 0a87 00       		.uleb128 .LVU512
 8987              	.LLST91:
 8988 0a88 04       		.byte	0x4
 8989 0a89 AF0B     		.uleb128 .LVL177-.Ltext0
 8990 0a8b BD0B     		.uleb128 .LVL178-.Ltext0
 8991 0a8d 17       		.uleb128 0x17
 8992 0a8e 70       		.byte	0x70
 8993 0a8f 00       		.sleb128 0
 8994 0a90 3F       		.byte	0x3f
 8995 0a91 1A       		.byte	0x1a
 8996 0a92 0C       		.byte	0xc
 8997 0a93 FFFFFFFF 		.long	0xffffffff
 8998 0a97 1A       		.byte	0x1a
GAS LISTING /tmp/cceaV4lG.s 			page 187


 8999 0a98 31       		.byte	0x31
 9000 0a99 24       		.byte	0x24
 9001 0a9a 03       		.byte	0x3
 9002 0a9b 00000000 		.quad	_ZL9hex_ascii
 9002      00000000 
 9003 0aa3 22       		.byte	0x22
 9004 0aa4 9F       		.byte	0x9f
 9005 0aa5 00       		.byte	0
 9006              	.LVUS92:
 9007 0aa6 01       		.uleb128 .LVU508
 9008 0aa7 00       		.uleb128 .LVU512
 9009              	.LLST92:
 9010 0aa8 04       		.byte	0x4
 9011 0aa9 AF0B     		.uleb128 .LVL177-.Ltext0
 9012 0aab BD0B     		.uleb128 .LVL178-.Ltext0
 9013 0aad 01       		.uleb128 0x1
 9014 0aae 58       		.byte	0x58
 9015 0aaf 00       		.byte	0
 9016              	.LVUS93:
 9017 0ab0 01       		.uleb128 .LVU525
 9018 0ab1 00       		.uleb128 .LVU528
 9019              	.LLST93:
 9020 0ab2 04       		.byte	0x4
 9021 0ab3 DA0B     		.uleb128 .LVL184-.Ltext0
 9022 0ab5 DE0B     		.uleb128 .LVL185-.Ltext0
 9023 0ab7 02       		.uleb128 0x2
 9024 0ab8 31       		.byte	0x31
 9025 0ab9 9F       		.byte	0x9f
 9026 0aba 00       		.byte	0
 9027              	.LVUS94:
 9028 0abb 01       		.uleb128 .LVU525
 9029 0abc 00       		.uleb128 .LVU528
 9030              	.LLST94:
 9031 0abd 04       		.byte	0x4
 9032 0abe DA0B     		.uleb128 .LVL184-.Ltext0
 9033 0ac0 DE0B     		.uleb128 .LVL185-.Ltext0
 9034 0ac2 0A       		.uleb128 0xa
 9035 0ac3 03       		.byte	0x3
 9036 0ac4 00000000 		.quad	_ZL9hex_ascii
 9036      00000000 
 9037 0acc 9F       		.byte	0x9f
 9038 0acd 00       		.byte	0
 9039              	.LVUS95:
 9040 0ace 01       		.uleb128 .LVU525
 9041 0acf 00       		.uleb128 .LVU528
 9042              	.LLST95:
 9043 0ad0 04       		.byte	0x4
 9044 0ad1 DA0B     		.uleb128 .LVL184-.Ltext0
 9045 0ad3 DE0B     		.uleb128 .LVL185-.Ltext0
 9046 0ad5 01       		.uleb128 0x1
 9047 0ad6 58       		.byte	0x58
 9048 0ad7 00       		.byte	0
 9049              	.LVUS96:
 9050 0ad8 02       		.uleb128 .LVU530
 9051 0ad9 00       		.uleb128 .LVU533
 9052              	.LLST96:
 9053 0ada 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 188


 9054 0adb DE0B     		.uleb128 .LVL185-.Ltext0
 9055 0add E20B     		.uleb128 .LVL186-.Ltext0
 9056 0adf 02       		.uleb128 0x2
 9057 0ae0 31       		.byte	0x31
 9058 0ae1 9F       		.byte	0x9f
 9059 0ae2 00       		.byte	0
 9060              	.LVUS97:
 9061 0ae3 02       		.uleb128 .LVU530
 9062 0ae4 00       		.uleb128 .LVU533
 9063              	.LLST97:
 9064 0ae5 04       		.byte	0x4
 9065 0ae6 DE0B     		.uleb128 .LVL185-.Ltext0
 9066 0ae8 E20B     		.uleb128 .LVL186-.Ltext0
 9067 0aea 0A       		.uleb128 0xa
 9068 0aeb 03       		.byte	0x3
 9069 0aec 00000000 		.quad	_ZL9hex_ascii
 9069      00000000 
 9070 0af4 9F       		.byte	0x9f
 9071 0af5 00       		.byte	0
 9072              	.LVUS98:
 9073 0af6 02       		.uleb128 .LVU530
 9074 0af7 00       		.uleb128 .LVU533
 9075              	.LLST98:
 9076 0af8 04       		.byte	0x4
 9077 0af9 DE0B     		.uleb128 .LVL185-.Ltext0
 9078 0afb E20B     		.uleb128 .LVL186-.Ltext0
 9079 0afd 03       		.uleb128 0x3
 9080 0afe 75       		.byte	0x75
 9081 0aff 08       		.sleb128 8
 9082 0b00 9F       		.byte	0x9f
 9083 0b01 00       		.byte	0
 9084              	.LVUS99:
 9085 0b02 02       		.uleb128 .LVU535
 9086 0b03 00       		.uleb128 .LVU538
 9087              	.LLST99:
 9088 0b04 04       		.byte	0x4
 9089 0b05 E20B     		.uleb128 .LVL186-.Ltext0
 9090 0b07 E60B     		.uleb128 .LVL187-.Ltext0
 9091 0b09 02       		.uleb128 0x2
 9092 0b0a 31       		.byte	0x31
 9093 0b0b 9F       		.byte	0x9f
 9094 0b0c 00       		.byte	0
 9095              	.LVUS100:
 9096 0b0d 02       		.uleb128 .LVU535
 9097 0b0e 00       		.uleb128 .LVU538
 9098              	.LLST100:
 9099 0b0f 04       		.byte	0x4
 9100 0b10 E20B     		.uleb128 .LVL186-.Ltext0
 9101 0b12 E60B     		.uleb128 .LVL187-.Ltext0
 9102 0b14 0A       		.uleb128 0xa
 9103 0b15 03       		.byte	0x3
 9104 0b16 00000000 		.quad	_ZL9hex_ascii
 9104      00000000 
 9105 0b1e 9F       		.byte	0x9f
 9106 0b1f 00       		.byte	0
 9107              	.LVUS101:
 9108 0b20 02       		.uleb128 .LVU535
GAS LISTING /tmp/cceaV4lG.s 			page 189


 9109 0b21 00       		.uleb128 .LVU538
 9110              	.LLST101:
 9111 0b22 04       		.byte	0x4
 9112 0b23 E20B     		.uleb128 .LVL186-.Ltext0
 9113 0b25 E60B     		.uleb128 .LVL187-.Ltext0
 9114 0b27 03       		.uleb128 0x3
 9115 0b28 75       		.byte	0x75
 9116 0b29 09       		.sleb128 9
 9117 0b2a 9F       		.byte	0x9f
 9118 0b2b 00       		.byte	0
 9119              	.LVUS102:
 9120 0b2c 02       		.uleb128 .LVU540
 9121 0b2d 00       		.uleb128 .LVU543
 9122              	.LLST102:
 9123 0b2e 04       		.byte	0x4
 9124 0b2f E60B     		.uleb128 .LVL187-.Ltext0
 9125 0b31 EA0B     		.uleb128 .LVL188-.Ltext0
 9126 0b33 02       		.uleb128 0x2
 9127 0b34 31       		.byte	0x31
 9128 0b35 9F       		.byte	0x9f
 9129 0b36 00       		.byte	0
 9130              	.LVUS103:
 9131 0b37 02       		.uleb128 .LVU540
 9132 0b38 00       		.uleb128 .LVU543
 9133              	.LLST103:
 9134 0b39 04       		.byte	0x4
 9135 0b3a E60B     		.uleb128 .LVL187-.Ltext0
 9136 0b3c EA0B     		.uleb128 .LVL188-.Ltext0
 9137 0b3e 0A       		.uleb128 0xa
 9138 0b3f 03       		.byte	0x3
 9139 0b40 00000000 		.quad	_ZL9hex_ascii
 9139      00000000 
 9140 0b48 9F       		.byte	0x9f
 9141 0b49 00       		.byte	0
 9142              	.LVUS104:
 9143 0b4a 02       		.uleb128 .LVU540
 9144 0b4b 00       		.uleb128 .LVU543
 9145              	.LLST104:
 9146 0b4c 04       		.byte	0x4
 9147 0b4d E60B     		.uleb128 .LVL187-.Ltext0
 9148 0b4f EA0B     		.uleb128 .LVL188-.Ltext0
 9149 0b51 03       		.uleb128 0x3
 9150 0b52 75       		.byte	0x75
 9151 0b53 0A       		.sleb128 10
 9152 0b54 9F       		.byte	0x9f
 9153 0b55 00       		.byte	0
 9154              	.LVUS105:
 9155 0b56 02       		.uleb128 .LVU549
 9156 0b57 00       		.uleb128 .LVU552
 9157              	.LLST105:
 9158 0b58 04       		.byte	0x4
 9159 0b59 F10B     		.uleb128 .LVL190-.Ltext0
 9160 0b5b F60B     		.uleb128 .LVL191-.Ltext0
 9161 0b5d 02       		.uleb128 0x2
 9162 0b5e 31       		.byte	0x31
 9163 0b5f 9F       		.byte	0x9f
 9164 0b60 00       		.byte	0
GAS LISTING /tmp/cceaV4lG.s 			page 190


 9165              	.LVUS106:
 9166 0b61 02       		.uleb128 .LVU549
 9167 0b62 00       		.uleb128 .LVU552
 9168              	.LLST106:
 9169 0b63 04       		.byte	0x4
 9170 0b64 F10B     		.uleb128 .LVL190-.Ltext0
 9171 0b66 F60B     		.uleb128 .LVL191-.Ltext0
 9172 0b68 0A       		.uleb128 0xa
 9173 0b69 03       		.byte	0x3
 9174 0b6a 00000000 		.quad	_ZL9hex_ascii
 9174      00000000 
 9175 0b72 9F       		.byte	0x9f
 9176 0b73 00       		.byte	0
 9177              	.LVUS107:
 9178 0b74 02       		.uleb128 .LVU549
 9179 0b75 00       		.uleb128 .LVU552
 9180              	.LLST107:
 9181 0b76 04       		.byte	0x4
 9182 0b77 F10B     		.uleb128 .LVL190-.Ltext0
 9183 0b79 F60B     		.uleb128 .LVL191-.Ltext0
 9184 0b7b 03       		.uleb128 0x3
 9185 0b7c 72       		.byte	0x72
 9186 0b7d 7D       		.sleb128 -3
 9187 0b7e 9F       		.byte	0x9f
 9188 0b7f 00       		.byte	0
 9189              	.LVUS109:
 9190 0b80 02       		.uleb128 .LVU554
 9191 0b81 00       		.uleb128 .LVU558
 9192              	.LLST109:
 9193 0b82 04       		.byte	0x4
 9194 0b83 F60B     		.uleb128 .LVL191-.Ltext0
 9195 0b85 FF0B     		.uleb128 .LVL192-.Ltext0
 9196 0b87 02       		.uleb128 0x2
 9197 0b88 31       		.byte	0x31
 9198 0b89 9F       		.byte	0x9f
 9199 0b8a 00       		.byte	0
 9200              	.LVUS110:
 9201 0b8b 02       		.uleb128 .LVU554
 9202 0b8c 00       		.uleb128 .LVU558
 9203              	.LLST110:
 9204 0b8d 04       		.byte	0x4
 9205 0b8e F60B     		.uleb128 .LVL191-.Ltext0
 9206 0b90 FF0B     		.uleb128 .LVL192-.Ltext0
 9207 0b92 0A       		.uleb128 0xa
 9208 0b93 03       		.byte	0x3
 9209 0b94 00000000 		.quad	_ZL9hex_ascii
 9209      00000000 
 9210 0b9c 9F       		.byte	0x9f
 9211 0b9d 00       		.byte	0
 9212              	.LVUS111:
 9213 0b9e 02       		.uleb128 .LVU554
 9214 0b9f 00       		.uleb128 .LVU558
 9215              	.LLST111:
 9216 0ba0 04       		.byte	0x4
 9217 0ba1 F60B     		.uleb128 .LVL191-.Ltext0
 9218 0ba3 FF0B     		.uleb128 .LVL192-.Ltext0
 9219 0ba5 03       		.uleb128 0x3
GAS LISTING /tmp/cceaV4lG.s 			page 191


 9220 0ba6 78       		.byte	0x78
 9221 0ba7 7F       		.sleb128 -1
 9222 0ba8 9F       		.byte	0x9f
 9223 0ba9 00       		.byte	0
 9224              	.LVUS70:
 9225 0baa 00       		.uleb128 0
 9226 0bab 00       		.uleb128 .LVU477
 9227 0bac 00       		.uleb128 .LVU477
 9228 0bad 00       		.uleb128 0
 9229              	.LLST70:
 9230 0bae 04       		.byte	0x4
 9231 0baf CA0A     		.uleb128 .LVL165-.Ltext0
 9232 0bb1 F00A     		.uleb128 .LVL169-.Ltext0
 9233 0bb3 01       		.uleb128 0x1
 9234 0bb4 54       		.byte	0x54
 9235 0bb5 04       		.byte	0x4
 9236 0bb6 F00A     		.uleb128 .LVL169-.Ltext0
 9237 0bb8 910B     		.uleb128 .LFE62-.Ltext0
 9238 0bba 04       		.uleb128 0x4
 9239 0bbb A3       		.byte	0xa3
 9240 0bbc 01       		.uleb128 0x1
 9241 0bbd 54       		.byte	0x54
 9242 0bbe 9F       		.byte	0x9f
 9243 0bbf 00       		.byte	0
 9244              	.LVUS71:
 9245 0bc0 02       		.uleb128 .LVU455
 9246 0bc1 00       		.uleb128 .LVU461
 9247 0bc2 00       		.uleb128 .LVU461
 9248 0bc3 00       		.uleb128 .LVU477
 9249 0bc4 00       		.uleb128 .LVU477
 9250 0bc5 00       		.uleb128 0
 9251              	.LLST71:
 9252 0bc6 04       		.byte	0x4
 9253 0bc7 CA0A     		.uleb128 .LVL165-.Ltext0
 9254 0bc9 D20A     		.uleb128 .LVL166-.Ltext0
 9255 0bcb 03       		.uleb128 0x3
 9256 0bcc 75       		.byte	0x75
 9257 0bcd 0B       		.sleb128 11
 9258 0bce 9F       		.byte	0x9f
 9259 0bcf 04       		.byte	0x4
 9260 0bd0 D20A     		.uleb128 .LVL166-.Ltext0
 9261 0bd2 F00A     		.uleb128 .LVL169-.Ltext0
 9262 0bd4 01       		.uleb128 0x1
 9263 0bd5 58       		.byte	0x58
 9264 0bd6 04       		.byte	0x4
 9265 0bd7 F00A     		.uleb128 .LVL169-.Ltext0
 9266 0bd9 910B     		.uleb128 .LFE62-.Ltext0
 9267 0bdb 01       		.uleb128 0x1
 9268 0bdc 50       		.byte	0x50
 9269 0bdd 00       		.byte	0
 9270              	.LVUS72:
 9271 0bde 03       		.uleb128 .LVU456
 9272 0bdf 00       		.uleb128 .LVU477
 9273 0be0 00       		.uleb128 .LVU488
 9274 0be1 00       		.uleb128 .LVU490
 9275 0be2 00       		.uleb128 .LVU490
 9276 0be3 00       		.uleb128 0
GAS LISTING /tmp/cceaV4lG.s 			page 192


 9277              	.LLST72:
 9278 0be4 04       		.byte	0x4
 9279 0be5 CA0A     		.uleb128 .LVL165-.Ltext0
 9280 0be7 F00A     		.uleb128 .LVL169-.Ltext0
 9281 0be9 01       		.uleb128 0x1
 9282 0bea 54       		.byte	0x54
 9283 0beb 04       		.byte	0x4
 9284 0bec 820B     		.uleb128 .LVL172-.Ltext0
 9285 0bee 860B     		.uleb128 .LVL173-.Ltext0
 9286 0bf0 01       		.uleb128 0x1
 9287 0bf1 54       		.byte	0x54
 9288 0bf2 04       		.byte	0x4
 9289 0bf3 860B     		.uleb128 .LVL173-.Ltext0
 9290 0bf5 910B     		.uleb128 .LFE62-.Ltext0
 9291 0bf7 02       		.uleb128 0x2
 9292 0bf8 30       		.byte	0x30
 9293 0bf9 9F       		.byte	0x9f
 9294 0bfa 00       		.byte	0
 9295              	.LVUS73:
 9296 0bfb 04       		.uleb128 .LVU457
 9297 0bfc 00       		.uleb128 .LVU477
 9298 0bfd 00       		.uleb128 .LVU477
 9299 0bfe 00       		.uleb128 .LVU480
 9300 0bff 01       		.uleb128 .LVU489
 9301 0c00 00       		.uleb128 0
 9302              	.LLST73:
 9303 0c01 04       		.byte	0x4
 9304 0c02 CA0A     		.uleb128 .LVL165-.Ltext0
 9305 0c04 F00A     		.uleb128 .LVL169-.Ltext0
 9306 0c06 02       		.uleb128 0x2
 9307 0c07 30       		.byte	0x30
 9308 0c08 9F       		.byte	0x9f
 9309 0c09 04       		.byte	0x4
 9310 0c0a F00A     		.uleb128 .LVL169-.Ltext0
 9311 0c0c F40A     		.uleb128 .LVL170-.Ltext0
 9312 0c0e 06       		.uleb128 0x6
 9313 0c0f 78       		.byte	0x78
 9314 0c10 00       		.sleb128 0
 9315 0c11 70       		.byte	0x70
 9316 0c12 00       		.sleb128 0
 9317 0c13 1C       		.byte	0x1c
 9318 0c14 9F       		.byte	0x9f
 9319 0c15 04       		.byte	0x4
 9320 0c16 820B     		.uleb128 .LVL172-.Ltext0
 9321 0c18 910B     		.uleb128 .LFE62-.Ltext0
 9322 0c1a 06       		.uleb128 0x6
 9323 0c1b 78       		.byte	0x78
 9324 0c1c 00       		.sleb128 0
 9325 0c1d 70       		.byte	0x70
 9326 0c1e 00       		.sleb128 0
 9327 0c1f 1C       		.byte	0x1c
 9328 0c20 9F       		.byte	0x9f
 9329 0c21 00       		.byte	0
 9330              	.LVUS75:
 9331 0c22 01       		.uleb128 .LVU481
 9332 0c23 00       		.uleb128 .LVU485
 9333              	.LLST75:
GAS LISTING /tmp/cceaV4lG.s 			page 193


 9334 0c24 04       		.byte	0x4
 9335 0c25 F40A     		.uleb128 .LVL170-.Ltext0
 9336 0c27 FF0A     		.uleb128 .LVL171-.Ltext0
 9337 0c29 02       		.uleb128 0x2
 9338 0c2a 31       		.byte	0x31
 9339 0c2b 9F       		.byte	0x9f
 9340 0c2c 00       		.byte	0
 9341              	.LVUS76:
 9342 0c2d 01       		.uleb128 .LVU481
 9343 0c2e 00       		.uleb128 .LVU485
 9344              	.LLST76:
 9345 0c2f 04       		.byte	0x4
 9346 0c30 F40A     		.uleb128 .LVL170-.Ltext0
 9347 0c32 FF0A     		.uleb128 .LVL171-.Ltext0
 9348 0c34 17       		.uleb128 0x17
 9349 0c35 74       		.byte	0x74
 9350 0c36 00       		.sleb128 0
 9351 0c37 3F       		.byte	0x3f
 9352 0c38 1A       		.byte	0x1a
 9353 0c39 0C       		.byte	0xc
 9354 0c3a FFFFFFFF 		.long	0xffffffff
 9355 0c3e 1A       		.byte	0x1a
 9356 0c3f 31       		.byte	0x31
 9357 0c40 24       		.byte	0x24
 9358 0c41 03       		.byte	0x3
 9359 0c42 00000000 		.quad	_ZL9hex_ascii
 9359      00000000 
 9360 0c4a 22       		.byte	0x22
 9361 0c4b 9F       		.byte	0x9f
 9362 0c4c 00       		.byte	0
 9363              	.LVUS77:
 9364 0c4d 01       		.uleb128 .LVU481
 9365 0c4e 00       		.uleb128 .LVU485
 9366              	.LLST77:
 9367 0c4f 04       		.byte	0x4
 9368 0c50 F40A     		.uleb128 .LVL170-.Ltext0
 9369 0c52 FF0A     		.uleb128 .LVL171-.Ltext0
 9370 0c54 01       		.uleb128 0x1
 9371 0c55 50       		.byte	0x50
 9372 0c56 00       		.byte	0
 9373              	.LVUS78:
 9374 0c57 01       		.uleb128 .LVU468
 9375 0c58 00       		.uleb128 .LVU471
 9376              	.LLST78:
 9377 0c59 04       		.byte	0x4
 9378 0c5a E60A     		.uleb128 .LVL167-.Ltext0
 9379 0c5c EA0A     		.uleb128 .LVL168-.Ltext0
 9380 0c5e 02       		.uleb128 0x2
 9381 0c5f 31       		.byte	0x31
 9382 0c60 9F       		.byte	0x9f
 9383 0c61 00       		.byte	0
 9384              	.LVUS79:
 9385 0c62 01       		.uleb128 .LVU468
 9386 0c63 00       		.uleb128 .LVU471
 9387              	.LLST79:
 9388 0c64 04       		.byte	0x4
 9389 0c65 E60A     		.uleb128 .LVL167-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 194


 9390 0c67 EA0A     		.uleb128 .LVL168-.Ltext0
 9391 0c69 0A       		.uleb128 0xa
 9392 0c6a 03       		.byte	0x3
 9393 0c6b 00000000 		.quad	_ZL9hex_ascii
 9393      00000000 
 9394 0c73 9F       		.byte	0x9f
 9395 0c74 00       		.byte	0
 9396              	.LVUS80:
 9397 0c75 01       		.uleb128 .LVU468
 9398 0c76 00       		.uleb128 .LVU471
 9399              	.LLST80:
 9400 0c77 04       		.byte	0x4
 9401 0c78 E60A     		.uleb128 .LVL167-.Ltext0
 9402 0c7a EA0A     		.uleb128 .LVL168-.Ltext0
 9403 0c7c 01       		.uleb128 0x1
 9404 0c7d 58       		.byte	0x58
 9405 0c7e 00       		.byte	0
 9406              	.LVUS81:
 9407 0c7f 02       		.uleb128 .LVU473
 9408 0c80 00       		.uleb128 .LVU477
 9409              	.LLST81:
 9410 0c81 04       		.byte	0x4
 9411 0c82 EA0A     		.uleb128 .LVL168-.Ltext0
 9412 0c84 F00A     		.uleb128 .LVL169-.Ltext0
 9413 0c86 02       		.uleb128 0x2
 9414 0c87 31       		.byte	0x31
 9415 0c88 9F       		.byte	0x9f
 9416 0c89 00       		.byte	0
 9417              	.LVUS82:
 9418 0c8a 02       		.uleb128 .LVU473
 9419 0c8b 00       		.uleb128 .LVU477
 9420              	.LLST82:
 9421 0c8c 04       		.byte	0x4
 9422 0c8d EA0A     		.uleb128 .LVL168-.Ltext0
 9423 0c8f F00A     		.uleb128 .LVL169-.Ltext0
 9424 0c91 0A       		.uleb128 0xa
 9425 0c92 03       		.byte	0x3
 9426 0c93 00000000 		.quad	_ZL9hex_ascii
 9426      00000000 
 9427 0c9b 9F       		.byte	0x9f
 9428 0c9c 00       		.byte	0
 9429              	.LVUS83:
 9430 0c9d 02       		.uleb128 .LVU473
 9431 0c9e 00       		.uleb128 .LVU477
 9432              	.LLST83:
 9433 0c9f 04       		.byte	0x4
 9434 0ca0 EA0A     		.uleb128 .LVL168-.Ltext0
 9435 0ca2 F00A     		.uleb128 .LVL169-.Ltext0
 9436 0ca4 03       		.uleb128 0x3
 9437 0ca5 75       		.byte	0x75
 9438 0ca6 0A       		.sleb128 10
 9439 0ca7 9F       		.byte	0x9f
 9440 0ca8 00       		.byte	0
 9441              	.LVUS56:
 9442 0ca9 00       		.uleb128 0
 9443 0caa 00       		.uleb128 .LVU429
 9444 0cab 00       		.uleb128 .LVU429
GAS LISTING /tmp/cceaV4lG.s 			page 195


 9445 0cac 00       		.uleb128 0
 9446              	.LLST56:
 9447 0cad 04       		.byte	0x4
 9448 0cae FA09     		.uleb128 .LVL154-.Ltext0
 9449 0cb0 9C0A     		.uleb128 .LVL157-.Ltext0
 9450 0cb2 01       		.uleb128 0x1
 9451 0cb3 54       		.byte	0x54
 9452 0cb4 04       		.byte	0x4
 9453 0cb5 9C0A     		.uleb128 .LVL157-.Ltext0
 9454 0cb7 CA0A     		.uleb128 .LFE61-.Ltext0
 9455 0cb9 04       		.uleb128 0x4
 9456 0cba A3       		.byte	0xa3
 9457 0cbb 01       		.uleb128 0x1
 9458 0cbc 54       		.byte	0x54
 9459 0cbd 9F       		.byte	0x9f
 9460 0cbe 00       		.byte	0
 9461              	.LVUS57:
 9462 0cbf 02       		.uleb128 .LVU412
 9463 0cc0 00       		.uleb128 .LVU418
 9464 0cc1 00       		.uleb128 .LVU418
 9465 0cc2 00       		.uleb128 .LVU429
 9466 0cc3 00       		.uleb128 .LVU429
 9467 0cc4 00       		.uleb128 .LVU445
 9468 0cc5 00       		.uleb128 .LVU445
 9469 0cc6 00       		.uleb128 0
 9470              	.LLST57:
 9471 0cc7 04       		.byte	0x4
 9472 0cc8 FA09     		.uleb128 .LVL154-.Ltext0
 9473 0cca 820A     		.uleb128 .LVL155-.Ltext0
 9474 0ccc 03       		.uleb128 0x3
 9475 0ccd 75       		.byte	0x75
 9476 0cce 0B       		.sleb128 11
 9477 0ccf 9F       		.byte	0x9f
 9478 0cd0 04       		.byte	0x4
 9479 0cd1 820A     		.uleb128 .LVL155-.Ltext0
 9480 0cd3 9C0A     		.uleb128 .LVL157-.Ltext0
 9481 0cd5 01       		.uleb128 0x1
 9482 0cd6 58       		.byte	0x58
 9483 0cd7 04       		.byte	0x4
 9484 0cd8 9C0A     		.uleb128 .LVL157-.Ltext0
 9485 0cda C00A     		.uleb128 .LVL162-.Ltext0
 9486 0cdc 01       		.uleb128 0x1
 9487 0cdd 50       		.byte	0x50
 9488 0cde 04       		.byte	0x4
 9489 0cdf C00A     		.uleb128 .LVL162-.Ltext0
 9490 0ce1 CA0A     		.uleb128 .LFE61-.Ltext0
 9491 0ce3 01       		.uleb128 0x1
 9492 0ce4 51       		.byte	0x51
 9493 0ce5 00       		.byte	0
 9494              	.LVUS58:
 9495 0ce6 03       		.uleb128 .LVU413
 9496 0ce7 00       		.uleb128 .LVU429
 9497 0ce8 00       		.uleb128 .LVU440
 9498 0ce9 00       		.uleb128 .LVU442
 9499 0cea 00       		.uleb128 .LVU442
 9500 0ceb 00       		.uleb128 0
 9501              	.LLST58:
GAS LISTING /tmp/cceaV4lG.s 			page 196


 9502 0cec 04       		.byte	0x4
 9503 0ced FA09     		.uleb128 .LVL154-.Ltext0
 9504 0cef 9C0A     		.uleb128 .LVL157-.Ltext0
 9505 0cf1 01       		.uleb128 0x1
 9506 0cf2 54       		.byte	0x54
 9507 0cf3 04       		.byte	0x4
 9508 0cf4 AE0A     		.uleb128 .LVL160-.Ltext0
 9509 0cf6 B20A     		.uleb128 .LVL161-.Ltext0
 9510 0cf8 01       		.uleb128 0x1
 9511 0cf9 54       		.byte	0x54
 9512 0cfa 04       		.byte	0x4
 9513 0cfb B20A     		.uleb128 .LVL161-.Ltext0
 9514 0cfd CA0A     		.uleb128 .LFE61-.Ltext0
 9515 0cff 02       		.uleb128 0x2
 9516 0d00 30       		.byte	0x30
 9517 0d01 9F       		.byte	0x9f
 9518 0d02 00       		.byte	0
 9519              	.LVUS59:
 9520 0d03 04       		.uleb128 .LVU414
 9521 0d04 00       		.uleb128 .LVU429
 9522 0d05 00       		.uleb128 .LVU429
 9523 0d06 00       		.uleb128 .LVU432
 9524 0d07 01       		.uleb128 .LVU441
 9525 0d08 00       		.uleb128 .LVU452
 9526              	.LLST59:
 9527 0d09 04       		.byte	0x4
 9528 0d0a FA09     		.uleb128 .LVL154-.Ltext0
 9529 0d0c 9C0A     		.uleb128 .LVL157-.Ltext0
 9530 0d0e 02       		.uleb128 0x2
 9531 0d0f 30       		.byte	0x30
 9532 0d10 9F       		.byte	0x9f
 9533 0d11 04       		.byte	0x4
 9534 0d12 9C0A     		.uleb128 .LVL157-.Ltext0
 9535 0d14 A00A     		.uleb128 .LVL158-.Ltext0
 9536 0d16 06       		.uleb128 0x6
 9537 0d17 78       		.byte	0x78
 9538 0d18 00       		.sleb128 0
 9539 0d19 70       		.byte	0x70
 9540 0d1a 00       		.sleb128 0
 9541 0d1b 1C       		.byte	0x1c
 9542 0d1c 9F       		.byte	0x9f
 9543 0d1d 04       		.byte	0x4
 9544 0d1e AE0A     		.uleb128 .LVL160-.Ltext0
 9545 0d20 C90A     		.uleb128 .LVL164-.Ltext0
 9546 0d22 06       		.uleb128 0x6
 9547 0d23 78       		.byte	0x78
 9548 0d24 00       		.sleb128 0
 9549 0d25 70       		.byte	0x70
 9550 0d26 00       		.sleb128 0
 9551 0d27 1C       		.byte	0x1c
 9552 0d28 9F       		.byte	0x9f
 9553 0d29 00       		.byte	0
 9554              	.LVUS61:
 9555 0d2a 01       		.uleb128 .LVU433
 9556 0d2b 00       		.uleb128 .LVU437
 9557              	.LLST61:
 9558 0d2c 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 197


 9559 0d2d A00A     		.uleb128 .LVL158-.Ltext0
 9560 0d2f AB0A     		.uleb128 .LVL159-.Ltext0
 9561 0d31 02       		.uleb128 0x2
 9562 0d32 31       		.byte	0x31
 9563 0d33 9F       		.byte	0x9f
 9564 0d34 00       		.byte	0
 9565              	.LVUS62:
 9566 0d35 01       		.uleb128 .LVU433
 9567 0d36 00       		.uleb128 .LVU437
 9568              	.LLST62:
 9569 0d37 04       		.byte	0x4
 9570 0d38 A00A     		.uleb128 .LVL158-.Ltext0
 9571 0d3a AB0A     		.uleb128 .LVL159-.Ltext0
 9572 0d3c 17       		.uleb128 0x17
 9573 0d3d 74       		.byte	0x74
 9574 0d3e 00       		.sleb128 0
 9575 0d3f 3F       		.byte	0x3f
 9576 0d40 1A       		.byte	0x1a
 9577 0d41 0C       		.byte	0xc
 9578 0d42 FFFFFFFF 		.long	0xffffffff
 9579 0d46 1A       		.byte	0x1a
 9580 0d47 31       		.byte	0x31
 9581 0d48 24       		.byte	0x24
 9582 0d49 03       		.byte	0x3
 9583 0d4a 00000000 		.quad	_ZL9hex_ascii
 9583      00000000 
 9584 0d52 22       		.byte	0x22
 9585 0d53 9F       		.byte	0x9f
 9586 0d54 00       		.byte	0
 9587              	.LVUS63:
 9588 0d55 01       		.uleb128 .LVU433
 9589 0d56 00       		.uleb128 .LVU437
 9590              	.LLST63:
 9591 0d57 04       		.byte	0x4
 9592 0d58 A00A     		.uleb128 .LVL158-.Ltext0
 9593 0d5a AB0A     		.uleb128 .LVL159-.Ltext0
 9594 0d5c 01       		.uleb128 0x1
 9595 0d5d 50       		.byte	0x50
 9596 0d5e 00       		.byte	0
 9597              	.LVUS64:
 9598 0d5f 01       		.uleb128 .LVU425
 9599 0d60 00       		.uleb128 .LVU429
 9600              	.LLST64:
 9601 0d61 04       		.byte	0x4
 9602 0d62 960A     		.uleb128 .LVL156-.Ltext0
 9603 0d64 9C0A     		.uleb128 .LVL157-.Ltext0
 9604 0d66 02       		.uleb128 0x2
 9605 0d67 31       		.byte	0x31
 9606 0d68 9F       		.byte	0x9f
 9607 0d69 00       		.byte	0
 9608              	.LVUS65:
 9609 0d6a 01       		.uleb128 .LVU425
 9610 0d6b 00       		.uleb128 .LVU429
 9611              	.LLST65:
 9612 0d6c 04       		.byte	0x4
 9613 0d6d 960A     		.uleb128 .LVL156-.Ltext0
 9614 0d6f 9C0A     		.uleb128 .LVL157-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 198


 9615 0d71 0A       		.uleb128 0xa
 9616 0d72 03       		.byte	0x3
 9617 0d73 00000000 		.quad	_ZL9hex_ascii
 9617      00000000 
 9618 0d7b 9F       		.byte	0x9f
 9619 0d7c 00       		.byte	0
 9620              	.LVUS66:
 9621 0d7d 01       		.uleb128 .LVU425
 9622 0d7e 00       		.uleb128 .LVU429
 9623              	.LLST66:
 9624 0d7f 04       		.byte	0x4
 9625 0d80 960A     		.uleb128 .LVL156-.Ltext0
 9626 0d82 9C0A     		.uleb128 .LVL157-.Ltext0
 9627 0d84 01       		.uleb128 0x1
 9628 0d85 58       		.byte	0x58
 9629 0d86 00       		.byte	0
 9630              	.LVUS67:
 9631 0d87 01       		.uleb128 .LVU446
 9632 0d88 00       		.uleb128 .LVU449
 9633              	.LLST67:
 9634 0d89 04       		.byte	0x4
 9635 0d8a C00A     		.uleb128 .LVL162-.Ltext0
 9636 0d8c C60A     		.uleb128 .LVL163-.Ltext0
 9637 0d8e 02       		.uleb128 0x2
 9638 0d8f 32       		.byte	0x32
 9639 0d90 9F       		.byte	0x9f
 9640 0d91 00       		.byte	0
 9641              	.LVUS68:
 9642 0d92 01       		.uleb128 .LVU446
 9643 0d93 00       		.uleb128 .LVU449
 9644              	.LLST68:
 9645 0d94 04       		.byte	0x4
 9646 0d95 C00A     		.uleb128 .LVL162-.Ltext0
 9647 0d97 C60A     		.uleb128 .LVL163-.Ltext0
 9648 0d99 06       		.uleb128 0x6
 9649 0d9a A0       		.byte	0xa0
 9650 0d9b 00000000 		.long	.Ldebug_info0+7167
 9651 0d9f 00       		.sleb128 0
 9652 0da0 00       		.byte	0
 9653              	.LVUS69:
 9654 0da1 01       		.uleb128 .LVU446
 9655 0da2 00       		.uleb128 .LVU449
 9656              	.LLST69:
 9657 0da3 04       		.byte	0x4
 9658 0da4 C00A     		.uleb128 .LVL162-.Ltext0
 9659 0da6 C60A     		.uleb128 .LVL163-.Ltext0
 9660 0da8 01       		.uleb128 0x1
 9661 0da9 51       		.byte	0x51
 9662 0daa 00       		.byte	0
 9663              	.LVUS50:
 9664 0dab 00       		.uleb128 0
 9665 0dac 00       		.uleb128 .LVU353
 9666 0dad 00       		.uleb128 .LVU353
 9667 0dae 00       		.uleb128 0
 9668              	.LLST50:
 9669 0daf 04       		.byte	0x4
 9670 0db0 D708     		.uleb128 .LVL135-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 199


 9671 0db2 DF08     		.uleb128 .LVL136-.Ltext0
 9672 0db4 01       		.uleb128 0x1
 9673 0db5 54       		.byte	0x54
 9674 0db6 04       		.byte	0x4
 9675 0db7 DF08     		.uleb128 .LVL136-.Ltext0
 9676 0db9 FA09     		.uleb128 .LFE60-.Ltext0
 9677 0dbb 01       		.uleb128 0x1
 9678 0dbc 5A       		.byte	0x5a
 9679 0dbd 00       		.byte	0
 9680              	.LVUS51:
 9681 0dbe 00       		.uleb128 0
 9682 0dbf 00       		.uleb128 .LVU361
 9683 0dc0 00       		.uleb128 .LVU361
 9684 0dc1 00       		.uleb128 .LVU368
 9685 0dc2 00       		.uleb128 .LVU368
 9686 0dc3 00       		.uleb128 .LVU369
 9687 0dc4 00       		.uleb128 .LVU369
 9688 0dc5 00       		.uleb128 .LVU370
 9689 0dc6 00       		.uleb128 .LVU370
 9690 0dc7 00       		.uleb128 .LVU402
 9691 0dc8 00       		.uleb128 .LVU402
 9692 0dc9 00       		.uleb128 .LVU403
 9693 0dca 00       		.uleb128 .LVU403
 9694 0dcb 00       		.uleb128 0
 9695              	.LLST51:
 9696 0dcc 04       		.byte	0x4
 9697 0dcd D708     		.uleb128 .LVL135-.Ltext0
 9698 0dcf ED08     		.uleb128 .LVL138-.Ltext0
 9699 0dd1 01       		.uleb128 0x1
 9700 0dd2 51       		.byte	0x51
 9701 0dd3 04       		.byte	0x4
 9702 0dd4 ED08     		.uleb128 .LVL138-.Ltext0
 9703 0dd6 8309     		.uleb128 .LVL143-.Ltext0
 9704 0dd8 01       		.uleb128 0x1
 9705 0dd9 54       		.byte	0x54
 9706 0dda 04       		.byte	0x4
 9707 0ddb 8309     		.uleb128 .LVL143-.Ltext0
 9708 0ddd 8809     		.uleb128 .LVL144-.Ltext0
 9709 0ddf 01       		.uleb128 0x1
 9710 0de0 51       		.byte	0x51
 9711 0de1 04       		.byte	0x4
 9712 0de2 8809     		.uleb128 .LVL144-.Ltext0
 9713 0de4 8A09     		.uleb128 .LVL145-.Ltext0
 9714 0de6 01       		.uleb128 0x1
 9715 0de7 54       		.byte	0x54
 9716 0de8 04       		.byte	0x4
 9717 0de9 8A09     		.uleb128 .LVL145-.Ltext0
 9718 0deb DA09     		.uleb128 .LVL152-.Ltext0
 9719 0ded 04       		.uleb128 0x4
 9720 0dee A3       		.byte	0xa3
 9721 0def 01       		.uleb128 0x1
 9722 0df0 51       		.byte	0x51
 9723 0df1 9F       		.byte	0x9f
 9724 0df2 04       		.byte	0x4
 9725 0df3 DA09     		.uleb128 .LVL152-.Ltext0
 9726 0df5 DF09     		.uleb128 .LVL153-.Ltext0
 9727 0df7 01       		.uleb128 0x1
GAS LISTING /tmp/cceaV4lG.s 			page 200


 9728 0df8 54       		.byte	0x54
 9729 0df9 04       		.byte	0x4
 9730 0dfa DF09     		.uleb128 .LVL153-.Ltext0
 9731 0dfc FA09     		.uleb128 .LFE60-.Ltext0
 9732 0dfe 04       		.uleb128 0x4
 9733 0dff A3       		.byte	0xa3
 9734 0e00 01       		.uleb128 0x1
 9735 0e01 51       		.byte	0x51
 9736 0e02 9F       		.byte	0x9f
 9737 0e03 00       		.byte	0
 9738              	.LVUS52:
 9739 0e04 00       		.uleb128 0
 9740 0e05 00       		.uleb128 .LVU367
 9741 0e06 00       		.uleb128 .LVU367
 9742 0e07 00       		.uleb128 .LVU368
 9743 0e08 00       		.uleb128 .LVU368
 9744 0e09 00       		.uleb128 .LVU370
 9745 0e0a 00       		.uleb128 .LVU370
 9746 0e0b 00       		.uleb128 .LVU402
 9747 0e0c 00       		.uleb128 .LVU402
 9748 0e0d 00       		.uleb128 .LVU403
 9749 0e0e 00       		.uleb128 .LVU403
 9750 0e0f 00       		.uleb128 0
 9751              	.LLST52:
 9752 0e10 04       		.byte	0x4
 9753 0e11 D708     		.uleb128 .LVL135-.Ltext0
 9754 0e13 8109     		.uleb128 .LVL142-.Ltext0
 9755 0e15 01       		.uleb128 0x1
 9756 0e16 52       		.byte	0x52
 9757 0e17 04       		.byte	0x4
 9758 0e18 8109     		.uleb128 .LVL142-.Ltext0
 9759 0e1a 8309     		.uleb128 .LVL143-.Ltext0
 9760 0e1c 01       		.uleb128 0x1
 9761 0e1d 5B       		.byte	0x5b
 9762 0e1e 04       		.byte	0x4
 9763 0e1f 8309     		.uleb128 .LVL143-.Ltext0
 9764 0e21 8A09     		.uleb128 .LVL145-.Ltext0
 9765 0e23 01       		.uleb128 0x1
 9766 0e24 52       		.byte	0x52
 9767 0e25 04       		.byte	0x4
 9768 0e26 8A09     		.uleb128 .LVL145-.Ltext0
 9769 0e28 DA09     		.uleb128 .LVL152-.Ltext0
 9770 0e2a 01       		.uleb128 0x1
 9771 0e2b 5B       		.byte	0x5b
 9772 0e2c 04       		.byte	0x4
 9773 0e2d DA09     		.uleb128 .LVL152-.Ltext0
 9774 0e2f DF09     		.uleb128 .LVL153-.Ltext0
 9775 0e31 01       		.uleb128 0x1
 9776 0e32 52       		.byte	0x52
 9777 0e33 04       		.byte	0x4
 9778 0e34 DF09     		.uleb128 .LVL153-.Ltext0
 9779 0e36 FA09     		.uleb128 .LFE60-.Ltext0
 9780 0e38 01       		.uleb128 0x1
 9781 0e39 5B       		.byte	0x5b
 9782 0e3a 00       		.byte	0
 9783              	.LVUS53:
 9784 0e3b 01       		.uleb128 .LVU355
GAS LISTING /tmp/cceaV4lG.s 			page 201


 9785 0e3c 00       		.uleb128 .LVU370
 9786 0e3d 00       		.uleb128 .LVU370
 9787 0e3e 00       		.uleb128 .LVU402
 9788 0e3f 00       		.uleb128 .LVU402
 9789 0e40 00       		.uleb128 .LVU403
 9790              	.LLST53:
 9791 0e41 04       		.byte	0x4
 9792 0e42 E208     		.uleb128 .LVL137-.Ltext0
 9793 0e44 8A09     		.uleb128 .LVL145-.Ltext0
 9794 0e46 02       		.uleb128 0x2
 9795 0e47 30       		.byte	0x30
 9796 0e48 9F       		.byte	0x9f
 9797 0e49 04       		.byte	0x4
 9798 0e4a 8A09     		.uleb128 .LVL145-.Ltext0
 9799 0e4c DA09     		.uleb128 .LVL152-.Ltext0
 9800 0e4e 01       		.uleb128 0x1
 9801 0e4f 52       		.byte	0x52
 9802 0e50 04       		.byte	0x4
 9803 0e51 DA09     		.uleb128 .LVL152-.Ltext0
 9804 0e53 DF09     		.uleb128 .LVL153-.Ltext0
 9805 0e55 02       		.uleb128 0x2
 9806 0e56 30       		.byte	0x30
 9807 0e57 9F       		.byte	0x9f
 9808 0e58 00       		.byte	0
 9809              	.LVUS54:
 9810 0e59 02       		.uleb128 .LVU356
 9811 0e5a 00       		.uleb128 .LVU361
 9812 0e5b 00       		.uleb128 .LVU361
 9813 0e5c 00       		.uleb128 .LVU368
 9814 0e5d 00       		.uleb128 .LVU368
 9815 0e5e 00       		.uleb128 .LVU370
 9816 0e5f 00       		.uleb128 .LVU370
 9817 0e60 00       		.uleb128 .LVU403
 9818              	.LLST54:
 9819 0e61 04       		.byte	0x4
 9820 0e62 E208     		.uleb128 .LVL137-.Ltext0
 9821 0e64 ED08     		.uleb128 .LVL138-.Ltext0
 9822 0e66 02       		.uleb128 0x2
 9823 0e67 31       		.byte	0x31
 9824 0e68 9F       		.byte	0x9f
 9825 0e69 04       		.byte	0x4
 9826 0e6a ED08     		.uleb128 .LVL138-.Ltext0
 9827 0e6c 8309     		.uleb128 .LVL143-.Ltext0
 9828 0e6e 01       		.uleb128 0x1
 9829 0e6f 51       		.byte	0x51
 9830 0e70 04       		.byte	0x4
 9831 0e71 8309     		.uleb128 .LVL143-.Ltext0
 9832 0e73 8A09     		.uleb128 .LVL145-.Ltext0
 9833 0e75 02       		.uleb128 0x2
 9834 0e76 31       		.byte	0x31
 9835 0e77 9F       		.byte	0x9f
 9836 0e78 04       		.byte	0x4
 9837 0e79 8A09     		.uleb128 .LVL145-.Ltext0
 9838 0e7b DF09     		.uleb128 .LVL153-.Ltext0
 9839 0e7d 01       		.uleb128 0x1
 9840 0e7e 51       		.byte	0x51
 9841 0e7f 00       		.byte	0
GAS LISTING /tmp/cceaV4lG.s 			page 202


 9842              	.LVUS55:
 9843 0e80 04       		.uleb128 .LVU358
 9844 0e81 00       		.uleb128 .LVU361
 9845 0e82 00       		.uleb128 .LVU361
 9846 0e83 00       		.uleb128 .LVU365
 9847 0e84 00       		.uleb128 .LVU365
 9848 0e85 00       		.uleb128 .LVU368
 9849 0e86 00       		.uleb128 .LVU368
 9850 0e87 00       		.uleb128 .LVU369
 9851 0e88 00       		.uleb128 .LVU369
 9852 0e89 00       		.uleb128 .LVU402
 9853 0e8a 00       		.uleb128 .LVU402
 9854 0e8b 00       		.uleb128 .LVU403
 9855              	.LLST55:
 9856 0e8c 04       		.byte	0x4
 9857 0e8d E208     		.uleb128 .LVL137-.Ltext0
 9858 0e8f ED08     		.uleb128 .LVL138-.Ltext0
 9859 0e91 01       		.uleb128 0x1
 9860 0e92 51       		.byte	0x51
 9861 0e93 04       		.byte	0x4
 9862 0e94 ED08     		.uleb128 .LVL138-.Ltext0
 9863 0e96 F808     		.uleb128 .LVL141-.Ltext0
 9864 0e98 01       		.uleb128 0x1
 9865 0e99 50       		.byte	0x50
 9866 0e9a 04       		.byte	0x4
 9867 0e9b F808     		.uleb128 .LVL141-.Ltext0
 9868 0e9d 8309     		.uleb128 .LVL143-.Ltext0
 9869 0e9f 01       		.uleb128 0x1
 9870 0ea0 53       		.byte	0x53
 9871 0ea1 04       		.byte	0x4
 9872 0ea2 8309     		.uleb128 .LVL143-.Ltext0
 9873 0ea4 8809     		.uleb128 .LVL144-.Ltext0
 9874 0ea6 01       		.uleb128 0x1
 9875 0ea7 51       		.byte	0x51
 9876 0ea8 04       		.byte	0x4
 9877 0ea9 8809     		.uleb128 .LVL144-.Ltext0
 9878 0eab DA09     		.uleb128 .LVL152-.Ltext0
 9879 0ead 01       		.uleb128 0x1
 9880 0eae 54       		.byte	0x54
 9881 0eaf 04       		.byte	0x4
 9882 0eb0 DA09     		.uleb128 .LVL152-.Ltext0
 9883 0eb2 DF09     		.uleb128 .LVL153-.Ltext0
 9884 0eb4 01       		.uleb128 0x1
 9885 0eb5 53       		.byte	0x53
 9886 0eb6 00       		.byte	0
 9887              	.LVUS44:
 9888 0eb7 00       		.uleb128 0
 9889 0eb8 00       		.uleb128 .LVU297
 9890 0eb9 00       		.uleb128 .LVU297
 9891 0eba 00       		.uleb128 0
 9892              	.LLST44:
 9893 0ebb 04       		.byte	0x4
 9894 0ebc B107     		.uleb128 .LVL116-.Ltext0
 9895 0ebe B907     		.uleb128 .LVL117-.Ltext0
 9896 0ec0 01       		.uleb128 0x1
 9897 0ec1 54       		.byte	0x54
 9898 0ec2 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 203


 9899 0ec3 B907     		.uleb128 .LVL117-.Ltext0
 9900 0ec5 D708     		.uleb128 .LFE59-.Ltext0
 9901 0ec7 01       		.uleb128 0x1
 9902 0ec8 5A       		.byte	0x5a
 9903 0ec9 00       		.byte	0
 9904              	.LVUS45:
 9905 0eca 00       		.uleb128 0
 9906 0ecb 00       		.uleb128 .LVU305
 9907 0ecc 00       		.uleb128 .LVU305
 9908 0ecd 00       		.uleb128 .LVU312
 9909 0ece 00       		.uleb128 .LVU312
 9910 0ecf 00       		.uleb128 .LVU313
 9911 0ed0 00       		.uleb128 .LVU313
 9912 0ed1 00       		.uleb128 .LVU314
 9913 0ed2 00       		.uleb128 .LVU314
 9914 0ed3 00       		.uleb128 .LVU343
 9915 0ed4 00       		.uleb128 .LVU343
 9916 0ed5 00       		.uleb128 .LVU344
 9917 0ed6 00       		.uleb128 .LVU344
 9918 0ed7 00       		.uleb128 0
 9919              	.LLST45:
 9920 0ed8 04       		.byte	0x4
 9921 0ed9 B107     		.uleb128 .LVL116-.Ltext0
 9922 0edb C707     		.uleb128 .LVL119-.Ltext0
 9923 0edd 01       		.uleb128 0x1
 9924 0ede 51       		.byte	0x51
 9925 0edf 04       		.byte	0x4
 9926 0ee0 C707     		.uleb128 .LVL119-.Ltext0
 9927 0ee2 DD07     		.uleb128 .LVL124-.Ltext0
 9928 0ee4 01       		.uleb128 0x1
 9929 0ee5 54       		.byte	0x54
 9930 0ee6 04       		.byte	0x4
 9931 0ee7 DD07     		.uleb128 .LVL124-.Ltext0
 9932 0ee9 E207     		.uleb128 .LVL125-.Ltext0
 9933 0eeb 01       		.uleb128 0x1
 9934 0eec 51       		.byte	0x51
 9935 0eed 04       		.byte	0x4
 9936 0eee E207     		.uleb128 .LVL125-.Ltext0
 9937 0ef0 E407     		.uleb128 .LVL126-.Ltext0
 9938 0ef2 01       		.uleb128 0x1
 9939 0ef3 54       		.byte	0x54
 9940 0ef4 04       		.byte	0x4
 9941 0ef5 E407     		.uleb128 .LVL126-.Ltext0
 9942 0ef7 B408     		.uleb128 .LVL133-.Ltext0
 9943 0ef9 04       		.uleb128 0x4
 9944 0efa A3       		.byte	0xa3
 9945 0efb 01       		.uleb128 0x1
 9946 0efc 51       		.byte	0x51
 9947 0efd 9F       		.byte	0x9f
 9948 0efe 04       		.byte	0x4
 9949 0eff B408     		.uleb128 .LVL133-.Ltext0
 9950 0f01 B908     		.uleb128 .LVL134-.Ltext0
 9951 0f03 01       		.uleb128 0x1
 9952 0f04 54       		.byte	0x54
 9953 0f05 04       		.byte	0x4
 9954 0f06 B908     		.uleb128 .LVL134-.Ltext0
 9955 0f08 D708     		.uleb128 .LFE59-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 204


 9956 0f0a 04       		.uleb128 0x4
 9957 0f0b A3       		.byte	0xa3
 9958 0f0c 01       		.uleb128 0x1
 9959 0f0d 51       		.byte	0x51
 9960 0f0e 9F       		.byte	0x9f
 9961 0f0f 00       		.byte	0
 9962              	.LVUS46:
 9963 0f10 00       		.uleb128 0
 9964 0f11 00       		.uleb128 .LVU311
 9965 0f12 00       		.uleb128 .LVU311
 9966 0f13 00       		.uleb128 .LVU312
 9967 0f14 00       		.uleb128 .LVU312
 9968 0f15 00       		.uleb128 .LVU314
 9969 0f16 00       		.uleb128 .LVU314
 9970 0f17 00       		.uleb128 .LVU343
 9971 0f18 00       		.uleb128 .LVU343
 9972 0f19 00       		.uleb128 .LVU344
 9973 0f1a 00       		.uleb128 .LVU344
 9974 0f1b 00       		.uleb128 0
 9975              	.LLST46:
 9976 0f1c 04       		.byte	0x4
 9977 0f1d B107     		.uleb128 .LVL116-.Ltext0
 9978 0f1f DB07     		.uleb128 .LVL123-.Ltext0
 9979 0f21 01       		.uleb128 0x1
 9980 0f22 52       		.byte	0x52
 9981 0f23 04       		.byte	0x4
 9982 0f24 DB07     		.uleb128 .LVL123-.Ltext0
 9983 0f26 DD07     		.uleb128 .LVL124-.Ltext0
 9984 0f28 01       		.uleb128 0x1
 9985 0f29 5B       		.byte	0x5b
 9986 0f2a 04       		.byte	0x4
 9987 0f2b DD07     		.uleb128 .LVL124-.Ltext0
 9988 0f2d E407     		.uleb128 .LVL126-.Ltext0
 9989 0f2f 01       		.uleb128 0x1
 9990 0f30 52       		.byte	0x52
 9991 0f31 04       		.byte	0x4
 9992 0f32 E407     		.uleb128 .LVL126-.Ltext0
 9993 0f34 B408     		.uleb128 .LVL133-.Ltext0
 9994 0f36 01       		.uleb128 0x1
 9995 0f37 5B       		.byte	0x5b
 9996 0f38 04       		.byte	0x4
 9997 0f39 B408     		.uleb128 .LVL133-.Ltext0
 9998 0f3b B908     		.uleb128 .LVL134-.Ltext0
 9999 0f3d 01       		.uleb128 0x1
 10000 0f3e 52       		.byte	0x52
 10001 0f3f 04       		.byte	0x4
 10002 0f40 B908     		.uleb128 .LVL134-.Ltext0
 10003 0f42 D708     		.uleb128 .LFE59-.Ltext0
 10004 0f44 01       		.uleb128 0x1
 10005 0f45 5B       		.byte	0x5b
 10006 0f46 00       		.byte	0
 10007              	.LVUS47:
 10008 0f47 01       		.uleb128 .LVU299
 10009 0f48 00       		.uleb128 .LVU314
 10010 0f49 00       		.uleb128 .LVU314
 10011 0f4a 00       		.uleb128 .LVU343
 10012 0f4b 00       		.uleb128 .LVU343
GAS LISTING /tmp/cceaV4lG.s 			page 205


 10013 0f4c 00       		.uleb128 .LVU344
 10014              	.LLST47:
 10015 0f4d 04       		.byte	0x4
 10016 0f4e BC07     		.uleb128 .LVL118-.Ltext0
 10017 0f50 E407     		.uleb128 .LVL126-.Ltext0
 10018 0f52 02       		.uleb128 0x2
 10019 0f53 30       		.byte	0x30
 10020 0f54 9F       		.byte	0x9f
 10021 0f55 04       		.byte	0x4
 10022 0f56 E407     		.uleb128 .LVL126-.Ltext0
 10023 0f58 B408     		.uleb128 .LVL133-.Ltext0
 10024 0f5a 01       		.uleb128 0x1
 10025 0f5b 52       		.byte	0x52
 10026 0f5c 04       		.byte	0x4
 10027 0f5d B408     		.uleb128 .LVL133-.Ltext0
 10028 0f5f B908     		.uleb128 .LVL134-.Ltext0
 10029 0f61 02       		.uleb128 0x2
 10030 0f62 30       		.byte	0x30
 10031 0f63 9F       		.byte	0x9f
 10032 0f64 00       		.byte	0
 10033              	.LVUS48:
 10034 0f65 02       		.uleb128 .LVU300
 10035 0f66 00       		.uleb128 .LVU305
 10036 0f67 00       		.uleb128 .LVU305
 10037 0f68 00       		.uleb128 .LVU312
 10038 0f69 00       		.uleb128 .LVU312
 10039 0f6a 00       		.uleb128 .LVU314
 10040 0f6b 00       		.uleb128 .LVU314
 10041 0f6c 00       		.uleb128 .LVU344
 10042              	.LLST48:
 10043 0f6d 04       		.byte	0x4
 10044 0f6e BC07     		.uleb128 .LVL118-.Ltext0
 10045 0f70 C707     		.uleb128 .LVL119-.Ltext0
 10046 0f72 02       		.uleb128 0x2
 10047 0f73 31       		.byte	0x31
 10048 0f74 9F       		.byte	0x9f
 10049 0f75 04       		.byte	0x4
 10050 0f76 C707     		.uleb128 .LVL119-.Ltext0
 10051 0f78 DD07     		.uleb128 .LVL124-.Ltext0
 10052 0f7a 01       		.uleb128 0x1
 10053 0f7b 51       		.byte	0x51
 10054 0f7c 04       		.byte	0x4
 10055 0f7d DD07     		.uleb128 .LVL124-.Ltext0
 10056 0f7f E407     		.uleb128 .LVL126-.Ltext0
 10057 0f81 02       		.uleb128 0x2
 10058 0f82 31       		.byte	0x31
 10059 0f83 9F       		.byte	0x9f
 10060 0f84 04       		.byte	0x4
 10061 0f85 E407     		.uleb128 .LVL126-.Ltext0
 10062 0f87 B908     		.uleb128 .LVL134-.Ltext0
 10063 0f89 01       		.uleb128 0x1
 10064 0f8a 51       		.byte	0x51
 10065 0f8b 00       		.byte	0
 10066              	.LVUS49:
 10067 0f8c 04       		.uleb128 .LVU302
 10068 0f8d 00       		.uleb128 .LVU305
 10069 0f8e 00       		.uleb128 .LVU305
GAS LISTING /tmp/cceaV4lG.s 			page 206


 10070 0f8f 00       		.uleb128 .LVU309
 10071 0f90 00       		.uleb128 .LVU309
 10072 0f91 00       		.uleb128 .LVU312
 10073 0f92 00       		.uleb128 .LVU312
 10074 0f93 00       		.uleb128 .LVU313
 10075 0f94 00       		.uleb128 .LVU313
 10076 0f95 00       		.uleb128 .LVU343
 10077 0f96 00       		.uleb128 .LVU343
 10078 0f97 00       		.uleb128 .LVU344
 10079              	.LLST49:
 10080 0f98 04       		.byte	0x4
 10081 0f99 BC07     		.uleb128 .LVL118-.Ltext0
 10082 0f9b C707     		.uleb128 .LVL119-.Ltext0
 10083 0f9d 01       		.uleb128 0x1
 10084 0f9e 51       		.byte	0x51
 10085 0f9f 04       		.byte	0x4
 10086 0fa0 C707     		.uleb128 .LVL119-.Ltext0
 10087 0fa2 D207     		.uleb128 .LVL122-.Ltext0
 10088 0fa4 01       		.uleb128 0x1
 10089 0fa5 50       		.byte	0x50
 10090 0fa6 04       		.byte	0x4
 10091 0fa7 D207     		.uleb128 .LVL122-.Ltext0
 10092 0fa9 DD07     		.uleb128 .LVL124-.Ltext0
 10093 0fab 01       		.uleb128 0x1
 10094 0fac 53       		.byte	0x53
 10095 0fad 04       		.byte	0x4
 10096 0fae DD07     		.uleb128 .LVL124-.Ltext0
 10097 0fb0 E207     		.uleb128 .LVL125-.Ltext0
 10098 0fb2 01       		.uleb128 0x1
 10099 0fb3 51       		.byte	0x51
 10100 0fb4 04       		.byte	0x4
 10101 0fb5 E207     		.uleb128 .LVL125-.Ltext0
 10102 0fb7 B408     		.uleb128 .LVL133-.Ltext0
 10103 0fb9 01       		.uleb128 0x1
 10104 0fba 54       		.byte	0x54
 10105 0fbb 04       		.byte	0x4
 10106 0fbc B408     		.uleb128 .LVL133-.Ltext0
 10107 0fbe B908     		.uleb128 .LVL134-.Ltext0
 10108 0fc0 01       		.uleb128 0x1
 10109 0fc1 53       		.byte	0x53
 10110 0fc2 00       		.byte	0
 10111              	.LVUS36:
 10112 0fc3 00       		.uleb128 0
 10113 0fc4 00       		.uleb128 .LVU237
 10114 0fc5 00       		.uleb128 .LVU237
 10115 0fc6 00       		.uleb128 0
 10116              	.LLST36:
 10117 0fc7 04       		.byte	0x4
 10118 0fc8 8706     		.uleb128 .LVL93-.Ltext0
 10119 0fca 8F06     		.uleb128 .LVL94-.Ltext0
 10120 0fcc 01       		.uleb128 0x1
 10121 0fcd 54       		.byte	0x54
 10122 0fce 04       		.byte	0x4
 10123 0fcf 8F06     		.uleb128 .LVL94-.Ltext0
 10124 0fd1 B107     		.uleb128 .LFE58-.Ltext0
 10125 0fd3 01       		.uleb128 0x1
 10126 0fd4 5A       		.byte	0x5a
GAS LISTING /tmp/cceaV4lG.s 			page 207


 10127 0fd5 00       		.byte	0
 10128              	.LVUS37:
 10129 0fd6 00       		.uleb128 0
 10130 0fd7 00       		.uleb128 .LVU245
 10131 0fd8 00       		.uleb128 .LVU245
 10132 0fd9 00       		.uleb128 .LVU252
 10133 0fda 00       		.uleb128 .LVU252
 10134 0fdb 00       		.uleb128 .LVU253
 10135 0fdc 00       		.uleb128 .LVU253
 10136 0fdd 00       		.uleb128 .LVU254
 10137 0fde 00       		.uleb128 .LVU254
 10138 0fdf 00       		.uleb128 .LVU287
 10139 0fe0 00       		.uleb128 .LVU287
 10140 0fe1 00       		.uleb128 .LVU290
 10141 0fe2 00       		.uleb128 .LVU290
 10142 0fe3 00       		.uleb128 .LVU294
 10143 0fe4 00       		.uleb128 .LVU294
 10144 0fe5 00       		.uleb128 0
 10145              	.LLST37:
 10146 0fe6 04       		.byte	0x4
 10147 0fe7 8706     		.uleb128 .LVL93-.Ltext0
 10148 0fe9 9D06     		.uleb128 .LVL96-.Ltext0
 10149 0feb 01       		.uleb128 0x1
 10150 0fec 51       		.byte	0x51
 10151 0fed 04       		.byte	0x4
 10152 0fee 9D06     		.uleb128 .LVL96-.Ltext0
 10153 0ff0 B306     		.uleb128 .LVL101-.Ltext0
 10154 0ff2 01       		.uleb128 0x1
 10155 0ff3 54       		.byte	0x54
 10156 0ff4 04       		.byte	0x4
 10157 0ff5 B306     		.uleb128 .LVL101-.Ltext0
 10158 0ff7 B806     		.uleb128 .LVL102-.Ltext0
 10159 0ff9 01       		.uleb128 0x1
 10160 0ffa 51       		.byte	0x51
 10161 0ffb 04       		.byte	0x4
 10162 0ffc B806     		.uleb128 .LVL102-.Ltext0
 10163 0ffe BA06     		.uleb128 .LVL103-.Ltext0
 10164 1000 01       		.uleb128 0x1
 10165 1001 54       		.byte	0x54
 10166 1002 04       		.byte	0x4
 10167 1003 BA06     		.uleb128 .LVL103-.Ltext0
 10168 1005 9807     		.uleb128 .LVL112-.Ltext0
 10169 1007 04       		.uleb128 0x4
 10170 1008 A3       		.byte	0xa3
 10171 1009 01       		.uleb128 0x1
 10172 100a 51       		.byte	0x51
 10173 100b 9F       		.byte	0x9f
 10174 100c 04       		.byte	0x4
 10175 100d 9807     		.uleb128 .LVL112-.Ltext0
 10176 100f A007     		.uleb128 .LVL114-.Ltext0
 10177 1011 01       		.uleb128 0x1
 10178 1012 54       		.byte	0x54
 10179 1013 04       		.byte	0x4
 10180 1014 A007     		.uleb128 .LVL114-.Ltext0
 10181 1016 AA07     		.uleb128 .LVL115-.Ltext0
 10182 1018 04       		.uleb128 0x4
 10183 1019 A3       		.byte	0xa3
GAS LISTING /tmp/cceaV4lG.s 			page 208


 10184 101a 01       		.uleb128 0x1
 10185 101b 51       		.byte	0x51
 10186 101c 9F       		.byte	0x9f
 10187 101d 04       		.byte	0x4
 10188 101e AA07     		.uleb128 .LVL115-.Ltext0
 10189 1020 B107     		.uleb128 .LFE58-.Ltext0
 10190 1022 01       		.uleb128 0x1
 10191 1023 54       		.byte	0x54
 10192 1024 00       		.byte	0
 10193              	.LVUS38:
 10194 1025 00       		.uleb128 0
 10195 1026 00       		.uleb128 .LVU251
 10196 1027 00       		.uleb128 .LVU251
 10197 1028 00       		.uleb128 .LVU252
 10198 1029 00       		.uleb128 .LVU252
 10199 102a 00       		.uleb128 .LVU254
 10200 102b 00       		.uleb128 .LVU254
 10201 102c 00       		.uleb128 .LVU287
 10202 102d 00       		.uleb128 .LVU287
 10203 102e 00       		.uleb128 .LVU289
 10204 102f 00       		.uleb128 .LVU289
 10205 1030 00       		.uleb128 0
 10206              	.LLST38:
 10207 1031 04       		.byte	0x4
 10208 1032 8706     		.uleb128 .LVL93-.Ltext0
 10209 1034 B106     		.uleb128 .LVL100-.Ltext0
 10210 1036 01       		.uleb128 0x1
 10211 1037 52       		.byte	0x52
 10212 1038 04       		.byte	0x4
 10213 1039 B106     		.uleb128 .LVL100-.Ltext0
 10214 103b B306     		.uleb128 .LVL101-.Ltext0
 10215 103d 01       		.uleb128 0x1
 10216 103e 5B       		.byte	0x5b
 10217 103f 04       		.byte	0x4
 10218 1040 B306     		.uleb128 .LVL101-.Ltext0
 10219 1042 BA06     		.uleb128 .LVL103-.Ltext0
 10220 1044 01       		.uleb128 0x1
 10221 1045 52       		.byte	0x52
 10222 1046 04       		.byte	0x4
 10223 1047 BA06     		.uleb128 .LVL103-.Ltext0
 10224 1049 9807     		.uleb128 .LVL112-.Ltext0
 10225 104b 01       		.uleb128 0x1
 10226 104c 5B       		.byte	0x5b
 10227 104d 04       		.byte	0x4
 10228 104e 9807     		.uleb128 .LVL112-.Ltext0
 10229 1050 9B07     		.uleb128 .LVL113-.Ltext0
 10230 1052 01       		.uleb128 0x1
 10231 1053 52       		.byte	0x52
 10232 1054 04       		.byte	0x4
 10233 1055 9B07     		.uleb128 .LVL113-.Ltext0
 10234 1057 B107     		.uleb128 .LFE58-.Ltext0
 10235 1059 01       		.uleb128 0x1
 10236 105a 5B       		.byte	0x5b
 10237 105b 00       		.byte	0
 10238              	.LVUS39:
 10239 105c 00       		.uleb128 0
 10240 105d 00       		.uleb128 .LVU294
GAS LISTING /tmp/cceaV4lG.s 			page 209


 10241 105e 00       		.uleb128 .LVU294
 10242 105f 00       		.uleb128 0
 10243              	.LLST39:
 10244 1060 04       		.byte	0x4
 10245 1061 8706     		.uleb128 .LVL93-.Ltext0
 10246 1063 AA07     		.uleb128 .LVL115-.Ltext0
 10247 1065 01       		.uleb128 0x1
 10248 1066 58       		.byte	0x58
 10249 1067 04       		.byte	0x4
 10250 1068 AA07     		.uleb128 .LVL115-.Ltext0
 10251 106a B107     		.uleb128 .LFE58-.Ltext0
 10252 106c 01       		.uleb128 0x1
 10253 106d 52       		.byte	0x52
 10254 106e 00       		.byte	0
 10255              	.LVUS40:
 10256 106f 00       		.uleb128 0
 10257 1070 00       		.uleb128 .LVU286
 10258 1071 00       		.uleb128 .LVU286
 10259 1072 00       		.uleb128 .LVU287
 10260 1073 00       		.uleb128 .LVU287
 10261 1074 00       		.uleb128 .LVU290
 10262 1075 00       		.uleb128 .LVU290
 10263 1076 00       		.uleb128 .LVU294
 10264 1077 00       		.uleb128 .LVU294
 10265 1078 00       		.uleb128 0
 10266              	.LLST40:
 10267 1079 04       		.byte	0x4
 10268 107a 8706     		.uleb128 .LVL93-.Ltext0
 10269 107c 9607     		.uleb128 .LVL111-.Ltext0
 10270 107e 01       		.uleb128 0x1
 10271 107f 59       		.byte	0x59
 10272 1080 04       		.byte	0x4
 10273 1081 9607     		.uleb128 .LVL111-.Ltext0
 10274 1083 9807     		.uleb128 .LVL112-.Ltext0
 10275 1085 04       		.uleb128 0x4
 10276 1086 A3       		.byte	0xa3
 10277 1087 01       		.uleb128 0x1
 10278 1088 59       		.byte	0x59
 10279 1089 9F       		.byte	0x9f
 10280 108a 04       		.byte	0x4
 10281 108b 9807     		.uleb128 .LVL112-.Ltext0
 10282 108d A007     		.uleb128 .LVL114-.Ltext0
 10283 108f 01       		.uleb128 0x1
 10284 1090 59       		.byte	0x59
 10285 1091 04       		.byte	0x4
 10286 1092 A007     		.uleb128 .LVL114-.Ltext0
 10287 1094 AA07     		.uleb128 .LVL115-.Ltext0
 10288 1096 04       		.uleb128 0x4
 10289 1097 A3       		.byte	0xa3
 10290 1098 01       		.uleb128 0x1
 10291 1099 59       		.byte	0x59
 10292 109a 9F       		.byte	0x9f
 10293 109b 04       		.byte	0x4
 10294 109c AA07     		.uleb128 .LVL115-.Ltext0
 10295 109e B107     		.uleb128 .LFE58-.Ltext0
 10296 10a0 01       		.uleb128 0x1
 10297 10a1 59       		.byte	0x59
GAS LISTING /tmp/cceaV4lG.s 			page 210


 10298 10a2 00       		.byte	0
 10299              	.LVUS41:
 10300 10a3 01       		.uleb128 .LVU239
 10301 10a4 00       		.uleb128 .LVU254
 10302 10a5 00       		.uleb128 .LVU254
 10303 10a6 00       		.uleb128 .LVU286
 10304 10a7 00       		.uleb128 .LVU287
 10305 10a8 00       		.uleb128 .LVU290
 10306 10a9 00       		.uleb128 .LVU294
 10307 10aa 00       		.uleb128 0
 10308              	.LLST41:
 10309 10ab 04       		.byte	0x4
 10310 10ac 9206     		.uleb128 .LVL95-.Ltext0
 10311 10ae BA06     		.uleb128 .LVL103-.Ltext0
 10312 10b0 02       		.uleb128 0x2
 10313 10b1 30       		.byte	0x30
 10314 10b2 9F       		.byte	0x9f
 10315 10b3 04       		.byte	0x4
 10316 10b4 BA06     		.uleb128 .LVL103-.Ltext0
 10317 10b6 9607     		.uleb128 .LVL111-.Ltext0
 10318 10b8 01       		.uleb128 0x1
 10319 10b9 52       		.byte	0x52
 10320 10ba 04       		.byte	0x4
 10321 10bb 9807     		.uleb128 .LVL112-.Ltext0
 10322 10bd A007     		.uleb128 .LVL114-.Ltext0
 10323 10bf 02       		.uleb128 0x2
 10324 10c0 30       		.byte	0x30
 10325 10c1 9F       		.byte	0x9f
 10326 10c2 04       		.byte	0x4
 10327 10c3 AA07     		.uleb128 .LVL115-.Ltext0
 10328 10c5 B107     		.uleb128 .LFE58-.Ltext0
 10329 10c7 02       		.uleb128 0x2
 10330 10c8 30       		.byte	0x30
 10331 10c9 9F       		.byte	0x9f
 10332 10ca 00       		.byte	0
 10333              	.LVUS42:
 10334 10cb 02       		.uleb128 .LVU240
 10335 10cc 00       		.uleb128 .LVU245
 10336 10cd 00       		.uleb128 .LVU245
 10337 10ce 00       		.uleb128 .LVU252
 10338 10cf 00       		.uleb128 .LVU252
 10339 10d0 00       		.uleb128 .LVU254
 10340 10d1 00       		.uleb128 .LVU254
 10341 10d2 00       		.uleb128 .LVU284
 10342 10d3 00       		.uleb128 .LVU287
 10343 10d4 00       		.uleb128 .LVU290
 10344 10d5 00       		.uleb128 .LVU294
 10345 10d6 00       		.uleb128 0
 10346              	.LLST42:
 10347 10d7 04       		.byte	0x4
 10348 10d8 9206     		.uleb128 .LVL95-.Ltext0
 10349 10da 9D06     		.uleb128 .LVL96-.Ltext0
 10350 10dc 02       		.uleb128 0x2
 10351 10dd 31       		.byte	0x31
 10352 10de 9F       		.byte	0x9f
 10353 10df 04       		.byte	0x4
 10354 10e0 9D06     		.uleb128 .LVL96-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 211


 10355 10e2 B306     		.uleb128 .LVL101-.Ltext0
 10356 10e4 01       		.uleb128 0x1
 10357 10e5 51       		.byte	0x51
 10358 10e6 04       		.byte	0x4
 10359 10e7 B306     		.uleb128 .LVL101-.Ltext0
 10360 10e9 BA06     		.uleb128 .LVL103-.Ltext0
 10361 10eb 02       		.uleb128 0x2
 10362 10ec 31       		.byte	0x31
 10363 10ed 9F       		.byte	0x9f
 10364 10ee 04       		.byte	0x4
 10365 10ef BA06     		.uleb128 .LVL103-.Ltext0
 10366 10f1 8D07     		.uleb128 .LVL110-.Ltext0
 10367 10f3 01       		.uleb128 0x1
 10368 10f4 51       		.byte	0x51
 10369 10f5 04       		.byte	0x4
 10370 10f6 9807     		.uleb128 .LVL112-.Ltext0
 10371 10f8 A007     		.uleb128 .LVL114-.Ltext0
 10372 10fa 01       		.uleb128 0x1
 10373 10fb 51       		.byte	0x51
 10374 10fc 04       		.byte	0x4
 10375 10fd AA07     		.uleb128 .LVL115-.Ltext0
 10376 10ff B107     		.uleb128 .LFE58-.Ltext0
 10377 1101 01       		.uleb128 0x1
 10378 1102 51       		.byte	0x51
 10379 1103 00       		.byte	0
 10380              	.LVUS43:
 10381 1104 04       		.uleb128 .LVU242
 10382 1105 00       		.uleb128 .LVU245
 10383 1106 00       		.uleb128 .LVU245
 10384 1107 00       		.uleb128 .LVU249
 10385 1108 00       		.uleb128 .LVU249
 10386 1109 00       		.uleb128 .LVU252
 10387 110a 00       		.uleb128 .LVU252
 10388 110b 00       		.uleb128 .LVU253
 10389 110c 00       		.uleb128 .LVU253
 10390 110d 00       		.uleb128 .LVU286
 10391 110e 00       		.uleb128 .LVU287
 10392 110f 00       		.uleb128 .LVU290
 10393 1110 00       		.uleb128 .LVU294
 10394 1111 00       		.uleb128 0
 10395              	.LLST43:
 10396 1112 04       		.byte	0x4
 10397 1113 9206     		.uleb128 .LVL95-.Ltext0
 10398 1115 9D06     		.uleb128 .LVL96-.Ltext0
 10399 1117 01       		.uleb128 0x1
 10400 1118 51       		.byte	0x51
 10401 1119 04       		.byte	0x4
 10402 111a 9D06     		.uleb128 .LVL96-.Ltext0
 10403 111c A806     		.uleb128 .LVL99-.Ltext0
 10404 111e 01       		.uleb128 0x1
 10405 111f 50       		.byte	0x50
 10406 1120 04       		.byte	0x4
 10407 1121 A806     		.uleb128 .LVL99-.Ltext0
 10408 1123 B306     		.uleb128 .LVL101-.Ltext0
 10409 1125 01       		.uleb128 0x1
 10410 1126 53       		.byte	0x53
 10411 1127 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 212


 10412 1128 B306     		.uleb128 .LVL101-.Ltext0
 10413 112a B806     		.uleb128 .LVL102-.Ltext0
 10414 112c 01       		.uleb128 0x1
 10415 112d 51       		.byte	0x51
 10416 112e 04       		.byte	0x4
 10417 112f B806     		.uleb128 .LVL102-.Ltext0
 10418 1131 9607     		.uleb128 .LVL111-.Ltext0
 10419 1133 01       		.uleb128 0x1
 10420 1134 54       		.byte	0x54
 10421 1135 04       		.byte	0x4
 10422 1136 9807     		.uleb128 .LVL112-.Ltext0
 10423 1138 A007     		.uleb128 .LVL114-.Ltext0
 10424 113a 01       		.uleb128 0x1
 10425 113b 53       		.byte	0x53
 10426 113c 04       		.byte	0x4
 10427 113d AA07     		.uleb128 .LVL115-.Ltext0
 10428 113f B107     		.uleb128 .LFE58-.Ltext0
 10429 1141 01       		.uleb128 0x1
 10430 1142 53       		.byte	0x53
 10431 1143 00       		.byte	0
 10432              	.LVUS28:
 10433 1144 00       		.uleb128 0
 10434 1145 00       		.uleb128 .LVU174
 10435 1146 00       		.uleb128 .LVU174
 10436 1147 00       		.uleb128 .LVU195
 10437 1148 00       		.uleb128 .LVU195
 10438 1149 00       		.uleb128 .LVU199
 10439 114a 00       		.uleb128 .LVU199
 10440 114b 00       		.uleb128 .LVU201
 10441 114c 00       		.uleb128 .LVU201
 10442 114d 00       		.uleb128 .LVU210
 10443 114e 00       		.uleb128 .LVU210
 10444 114f 00       		.uleb128 .LVU211
 10445 1150 00       		.uleb128 .LVU211
 10446 1151 00       		.uleb128 0
 10447              	.LLST28:
 10448 1152 04       		.byte	0x4
 10449 1153 A404     		.uleb128 .LVL70-.Ltext0
 10450 1155 B204     		.uleb128 .LVL71-.Ltext0
 10451 1157 01       		.uleb128 0x1
 10452 1158 55       		.byte	0x55
 10453 1159 04       		.byte	0x4
 10454 115a B204     		.uleb128 .LVL71-.Ltext0
 10455 115c ED04     		.uleb128 .LVL79-.Ltext0
 10456 115e 01       		.uleb128 0x1
 10457 115f 53       		.byte	0x53
 10458 1160 04       		.byte	0x4
 10459 1161 ED04     		.uleb128 .LVL79-.Ltext0
 10460 1163 FF04     		.uleb128 .LVL81-.Ltext0
 10461 1165 04       		.uleb128 0x4
 10462 1166 A3       		.byte	0xa3
 10463 1167 01       		.uleb128 0x1
 10464 1168 55       		.byte	0x55
 10465 1169 9F       		.byte	0x9f
 10466 116a 04       		.byte	0x4
 10467 116b FF04     		.uleb128 .LVL81-.Ltext0
 10468 116d 8805     		.uleb128 .LVL82-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 213


 10469 116f 01       		.uleb128 0x1
 10470 1170 53       		.byte	0x53
 10471 1171 04       		.byte	0x4
 10472 1172 8805     		.uleb128 .LVL82-.Ltext0
 10473 1174 AA05     		.uleb128 .LVL84-.Ltext0
 10474 1176 04       		.uleb128 0x4
 10475 1177 A3       		.byte	0xa3
 10476 1178 01       		.uleb128 0x1
 10477 1179 55       		.byte	0x55
 10478 117a 9F       		.byte	0x9f
 10479 117b 04       		.byte	0x4
 10480 117c AA05     		.uleb128 .LVL84-.Ltext0
 10481 117e B105     		.uleb128 .LVL85-.Ltext0
 10482 1180 01       		.uleb128 0x1
 10483 1181 53       		.byte	0x53
 10484 1182 04       		.byte	0x4
 10485 1183 B105     		.uleb128 .LVL85-.Ltext0
 10486 1185 8706     		.uleb128 .LFE57-.Ltext0
 10487 1187 04       		.uleb128 0x4
 10488 1188 A3       		.byte	0xa3
 10489 1189 01       		.uleb128 0x1
 10490 118a 55       		.byte	0x55
 10491 118b 9F       		.byte	0x9f
 10492 118c 00       		.byte	0
 10493              	.LVUS29:
 10494 118d 00       		.uleb128 0
 10495 118e 00       		.uleb128 .LVU185
 10496 118f 00       		.uleb128 .LVU185
 10497 1190 00       		.uleb128 .LVU199
 10498 1191 00       		.uleb128 .LVU199
 10499 1192 00       		.uleb128 .LVU202
 10500 1193 00       		.uleb128 .LVU202
 10501 1194 00       		.uleb128 .LVU210
 10502 1195 00       		.uleb128 .LVU210
 10503 1196 00       		.uleb128 .LVU211
 10504 1197 00       		.uleb128 .LVU211
 10505 1198 00       		.uleb128 0
 10506              	.LLST29:
 10507 1199 04       		.byte	0x4
 10508 119a A404     		.uleb128 .LVL70-.Ltext0
 10509 119c C904     		.uleb128 .LVL73-.Ltext0
 10510 119e 01       		.uleb128 0x1
 10511 119f 54       		.byte	0x54
 10512 11a0 04       		.byte	0x4
 10513 11a1 C904     		.uleb128 .LVL73-.Ltext0
 10514 11a3 FF04     		.uleb128 .LVL81-.Ltext0
 10515 11a5 01       		.uleb128 0x1
 10516 11a6 5B       		.byte	0x5b
 10517 11a7 04       		.byte	0x4
 10518 11a8 FF04     		.uleb128 .LVL81-.Ltext0
 10519 11aa 8D05     		.uleb128 .LVL83-.Ltext0
 10520 11ac 01       		.uleb128 0x1
 10521 11ad 54       		.byte	0x54
 10522 11ae 04       		.byte	0x4
 10523 11af 8D05     		.uleb128 .LVL83-.Ltext0
 10524 11b1 AA05     		.uleb128 .LVL84-.Ltext0
 10525 11b3 01       		.uleb128 0x1
GAS LISTING /tmp/cceaV4lG.s 			page 214


 10526 11b4 5B       		.byte	0x5b
 10527 11b5 04       		.byte	0x4
 10528 11b6 AA05     		.uleb128 .LVL84-.Ltext0
 10529 11b8 B105     		.uleb128 .LVL85-.Ltext0
 10530 11ba 01       		.uleb128 0x1
 10531 11bb 54       		.byte	0x54
 10532 11bc 04       		.byte	0x4
 10533 11bd B105     		.uleb128 .LVL85-.Ltext0
 10534 11bf 8706     		.uleb128 .LFE57-.Ltext0
 10535 11c1 01       		.uleb128 0x1
 10536 11c2 5B       		.byte	0x5b
 10537 11c3 00       		.byte	0
 10538              	.LVUS30:
 10539 11c4 00       		.uleb128 0
 10540 11c5 00       		.uleb128 .LVU184
 10541 11c6 00       		.uleb128 .LVU184
 10542 11c7 00       		.uleb128 .LVU199
 10543 11c8 00       		.uleb128 .LVU199
 10544 11c9 00       		.uleb128 .LVU202
 10545 11ca 00       		.uleb128 .LVU202
 10546 11cb 00       		.uleb128 .LVU210
 10547 11cc 00       		.uleb128 .LVU210
 10548 11cd 00       		.uleb128 .LVU211
 10549 11ce 00       		.uleb128 .LVU211
 10550 11cf 00       		.uleb128 0
 10551              	.LLST30:
 10552 11d0 04       		.byte	0x4
 10553 11d1 A404     		.uleb128 .LVL70-.Ltext0
 10554 11d3 C404     		.uleb128 .LVL72-.Ltext0
 10555 11d5 01       		.uleb128 0x1
 10556 11d6 51       		.byte	0x51
 10557 11d7 04       		.byte	0x4
 10558 11d8 C404     		.uleb128 .LVL72-.Ltext0
 10559 11da FF04     		.uleb128 .LVL81-.Ltext0
 10560 11dc 04       		.uleb128 0x4
 10561 11dd A3       		.byte	0xa3
 10562 11de 01       		.uleb128 0x1
 10563 11df 51       		.byte	0x51
 10564 11e0 9F       		.byte	0x9f
 10565 11e1 04       		.byte	0x4
 10566 11e2 FF04     		.uleb128 .LVL81-.Ltext0
 10567 11e4 8D05     		.uleb128 .LVL83-.Ltext0
 10568 11e6 01       		.uleb128 0x1
 10569 11e7 51       		.byte	0x51
 10570 11e8 04       		.byte	0x4
 10571 11e9 8D05     		.uleb128 .LVL83-.Ltext0
 10572 11eb AA05     		.uleb128 .LVL84-.Ltext0
 10573 11ed 04       		.uleb128 0x4
 10574 11ee A3       		.byte	0xa3
 10575 11ef 01       		.uleb128 0x1
 10576 11f0 51       		.byte	0x51
 10577 11f1 9F       		.byte	0x9f
 10578 11f2 04       		.byte	0x4
 10579 11f3 AA05     		.uleb128 .LVL84-.Ltext0
 10580 11f5 B105     		.uleb128 .LVL85-.Ltext0
 10581 11f7 01       		.uleb128 0x1
 10582 11f8 51       		.byte	0x51
GAS LISTING /tmp/cceaV4lG.s 			page 215


 10583 11f9 04       		.byte	0x4
 10584 11fa B105     		.uleb128 .LVL85-.Ltext0
 10585 11fc 8706     		.uleb128 .LFE57-.Ltext0
 10586 11fe 04       		.uleb128 0x4
 10587 11ff A3       		.byte	0xa3
 10588 1200 01       		.uleb128 0x1
 10589 1201 51       		.byte	0x51
 10590 1202 9F       		.byte	0x9f
 10591 1203 00       		.byte	0
 10592              	.LVUS31:
 10593 1204 00       		.uleb128 0
 10594 1205 00       		.uleb128 .LVU193
 10595 1206 00       		.uleb128 .LVU193
 10596 1207 00       		.uleb128 .LVU198
 10597 1208 00       		.uleb128 .LVU198
 10598 1209 00       		.uleb128 .LVU199
 10599 120a 00       		.uleb128 .LVU199
 10600 120b 00       		.uleb128 .LVU202
 10601 120c 00       		.uleb128 .LVU202
 10602 120d 00       		.uleb128 .LVU210
 10603 120e 00       		.uleb128 .LVU210
 10604 120f 00       		.uleb128 .LVU211
 10605 1210 00       		.uleb128 .LVU211
 10606 1211 00       		.uleb128 0
 10607              	.LLST31:
 10608 1212 04       		.byte	0x4
 10609 1213 A404     		.uleb128 .LVL70-.Ltext0
 10610 1215 E104     		.uleb128 .LVL78-.Ltext0
 10611 1217 01       		.uleb128 0x1
 10612 1218 52       		.byte	0x52
 10613 1219 04       		.byte	0x4
 10614 121a E104     		.uleb128 .LVL78-.Ltext0
 10615 121c FD04     		.uleb128 .LVL80-.Ltext0
 10616 121e 03       		.uleb128 0x3
 10617 121f 7A       		.byte	0x7a
 10618 1220 01       		.sleb128 1
 10619 1221 9F       		.byte	0x9f
 10620 1222 04       		.byte	0x4
 10621 1223 FD04     		.uleb128 .LVL80-.Ltext0
 10622 1225 FF04     		.uleb128 .LVL81-.Ltext0
 10623 1227 04       		.uleb128 0x4
 10624 1228 A3       		.byte	0xa3
 10625 1229 01       		.uleb128 0x1
 10626 122a 52       		.byte	0x52
 10627 122b 9F       		.byte	0x9f
 10628 122c 04       		.byte	0x4
 10629 122d FF04     		.uleb128 .LVL81-.Ltext0
 10630 122f 8D05     		.uleb128 .LVL83-.Ltext0
 10631 1231 01       		.uleb128 0x1
 10632 1232 52       		.byte	0x52
 10633 1233 04       		.byte	0x4
 10634 1234 8D05     		.uleb128 .LVL83-.Ltext0
 10635 1236 AA05     		.uleb128 .LVL84-.Ltext0
 10636 1238 04       		.uleb128 0x4
 10637 1239 A3       		.byte	0xa3
 10638 123a 01       		.uleb128 0x1
 10639 123b 52       		.byte	0x52
GAS LISTING /tmp/cceaV4lG.s 			page 216


 10640 123c 9F       		.byte	0x9f
 10641 123d 04       		.byte	0x4
 10642 123e AA05     		.uleb128 .LVL84-.Ltext0
 10643 1240 B105     		.uleb128 .LVL85-.Ltext0
 10644 1242 01       		.uleb128 0x1
 10645 1243 52       		.byte	0x52
 10646 1244 04       		.byte	0x4
 10647 1245 B105     		.uleb128 .LVL85-.Ltext0
 10648 1247 8706     		.uleb128 .LFE57-.Ltext0
 10649 1249 04       		.uleb128 0x4
 10650 124a A3       		.byte	0xa3
 10651 124b 01       		.uleb128 0x1
 10652 124c 52       		.byte	0x52
 10653 124d 9F       		.byte	0x9f
 10654 124e 00       		.byte	0
 10655              	.LVUS32:
 10656 124f 01       		.uleb128 .LVU175
 10657 1250 00       		.uleb128 .LVU202
 10658 1251 00       		.uleb128 .LVU210
 10659 1252 00       		.uleb128 .LVU211
 10660 1253 00       		.uleb128 .LVU211
 10661 1254 00       		.uleb128 .LVU214
 10662 1255 00       		.uleb128 .LVU215
 10663 1256 00       		.uleb128 .LVU234
 10664              	.LLST32:
 10665 1257 04       		.byte	0x4
 10666 1258 B204     		.uleb128 .LVL71-.Ltext0
 10667 125a 8D05     		.uleb128 .LVL83-.Ltext0
 10668 125c 02       		.uleb128 0x2
 10669 125d 30       		.byte	0x30
 10670 125e 9F       		.byte	0x9f
 10671 125f 04       		.byte	0x4
 10672 1260 AA05     		.uleb128 .LVL84-.Ltext0
 10673 1262 B105     		.uleb128 .LVL85-.Ltext0
 10674 1264 02       		.uleb128 0x2
 10675 1265 30       		.byte	0x30
 10676 1266 9F       		.byte	0x9f
 10677 1267 04       		.byte	0x4
 10678 1268 B105     		.uleb128 .LVL85-.Ltext0
 10679 126a C705     		.uleb128 .LVL86-.Ltext0
 10680 126c 01       		.uleb128 0x1
 10681 126d 54       		.byte	0x54
 10682 126e 04       		.byte	0x4
 10683 126f CF05     		.uleb128 .LVL87-.Ltext0
 10684 1271 8006     		.uleb128 .LVL92-.Ltext0
 10685 1273 01       		.uleb128 0x1
 10686 1274 54       		.byte	0x54
 10687 1275 00       		.byte	0
 10688              	.LVUS33:
 10689 1276 02       		.uleb128 .LVU176
 10690 1277 00       		.uleb128 .LVU185
 10691 1278 00       		.uleb128 .LVU185
 10692 1279 00       		.uleb128 .LVU187
 10693 127a 00       		.uleb128 .LVU188
 10694 127b 00       		.uleb128 .LVU199
 10695 127c 00       		.uleb128 .LVU199
 10696 127d 00       		.uleb128 .LVU202
GAS LISTING /tmp/cceaV4lG.s 			page 217


 10697 127e 00       		.uleb128 .LVU210
 10698 127f 00       		.uleb128 .LVU211
 10699 1280 00       		.uleb128 .LVU211
 10700 1281 00       		.uleb128 .LVU218
 10701 1282 00       		.uleb128 .LVU222
 10702 1283 00       		.uleb128 .LVU234
 10703              	.LLST33:
 10704 1284 04       		.byte	0x4
 10705 1285 B204     		.uleb128 .LVL71-.Ltext0
 10706 1287 C904     		.uleb128 .LVL73-.Ltext0
 10707 1289 02       		.uleb128 0x2
 10708 128a 31       		.byte	0x31
 10709 128b 9F       		.byte	0x9f
 10710 128c 04       		.byte	0x4
 10711 128d C904     		.uleb128 .LVL73-.Ltext0
 10712 128f CC04     		.uleb128 .LVL74-.Ltext0
 10713 1291 01       		.uleb128 0x1
 10714 1292 50       		.byte	0x50
 10715 1293 04       		.byte	0x4
 10716 1294 CE04     		.uleb128 .LVL75-.Ltext0
 10717 1296 FF04     		.uleb128 .LVL81-.Ltext0
 10718 1298 01       		.uleb128 0x1
 10719 1299 50       		.byte	0x50
 10720 129a 04       		.byte	0x4
 10721 129b FF04     		.uleb128 .LVL81-.Ltext0
 10722 129d 8D05     		.uleb128 .LVL83-.Ltext0
 10723 129f 02       		.uleb128 0x2
 10724 12a0 31       		.byte	0x31
 10725 12a1 9F       		.byte	0x9f
 10726 12a2 04       		.byte	0x4
 10727 12a3 AA05     		.uleb128 .LVL84-.Ltext0
 10728 12a5 B105     		.uleb128 .LVL85-.Ltext0
 10729 12a7 02       		.uleb128 0x2
 10730 12a8 31       		.byte	0x31
 10731 12a9 9F       		.byte	0x9f
 10732 12aa 04       		.byte	0x4
 10733 12ab B105     		.uleb128 .LVL85-.Ltext0
 10734 12ad D505     		.uleb128 .LVL88-.Ltext0
 10735 12af 01       		.uleb128 0x1
 10736 12b0 50       		.byte	0x50
 10737 12b1 04       		.byte	0x4
 10738 12b2 E205     		.uleb128 .LVL89-.Ltext0
 10739 12b4 8006     		.uleb128 .LVL92-.Ltext0
 10740 12b6 01       		.uleb128 0x1
 10741 12b7 50       		.byte	0x50
 10742 12b8 00       		.byte	0
 10743              	.LVUS34:
 10744 12b9 05       		.uleb128 .LVU179
 10745 12ba 00       		.uleb128 .LVU185
 10746 12bb 00       		.uleb128 .LVU185
 10747 12bc 00       		.uleb128 .LVU192
 10748 12bd 00       		.uleb128 .LVU192
 10749 12be 00       		.uleb128 .LVU202
 10750 12bf 00       		.uleb128 .LVU210
 10751 12c0 00       		.uleb128 .LVU211
 10752              	.LLST34:
 10753 12c1 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 218


 10754 12c2 B204     		.uleb128 .LVL71-.Ltext0
 10755 12c4 C904     		.uleb128 .LVL73-.Ltext0
 10756 12c6 02       		.uleb128 0x2
 10757 12c7 30       		.byte	0x30
 10758 12c8 9F       		.byte	0x9f
 10759 12c9 04       		.byte	0x4
 10760 12ca C904     		.uleb128 .LVL73-.Ltext0
 10761 12cc D904     		.uleb128 .LVL77-.Ltext0
 10762 12ce 01       		.uleb128 0x1
 10763 12cf 51       		.byte	0x51
 10764 12d0 04       		.byte	0x4
 10765 12d1 D904     		.uleb128 .LVL77-.Ltext0
 10766 12d3 8D05     		.uleb128 .LVL83-.Ltext0
 10767 12d5 02       		.uleb128 0x2
 10768 12d6 30       		.byte	0x30
 10769 12d7 9F       		.byte	0x9f
 10770 12d8 04       		.byte	0x4
 10771 12d9 AA05     		.uleb128 .LVL84-.Ltext0
 10772 12db B105     		.uleb128 .LVL85-.Ltext0
 10773 12dd 02       		.uleb128 0x2
 10774 12de 30       		.byte	0x30
 10775 12df 9F       		.byte	0x9f
 10776 12e0 00       		.byte	0
 10777              	.LVUS35:
 10778 12e1 04       		.uleb128 .LVU178
 10779 12e2 00       		.uleb128 .LVU202
 10780 12e3 00       		.uleb128 .LVU210
 10781 12e4 00       		.uleb128 .LVU211
 10782 12e5 00       		.uleb128 .LVU211
 10783 12e6 00       		.uleb128 .LVU233
 10784              	.LLST35:
 10785 12e7 04       		.byte	0x4
 10786 12e8 B204     		.uleb128 .LVL71-.Ltext0
 10787 12ea 8D05     		.uleb128 .LVL83-.Ltext0
 10788 12ec 02       		.uleb128 0x2
 10789 12ed 31       		.byte	0x31
 10790 12ee 9F       		.byte	0x9f
 10791 12ef 04       		.byte	0x4
 10792 12f0 AA05     		.uleb128 .LVL84-.Ltext0
 10793 12f2 B105     		.uleb128 .LVL85-.Ltext0
 10794 12f4 02       		.uleb128 0x2
 10795 12f5 31       		.byte	0x31
 10796 12f6 9F       		.byte	0x9f
 10797 12f7 04       		.byte	0x4
 10798 12f8 B105     		.uleb128 .LVL85-.Ltext0
 10799 12fa FE05     		.uleb128 .LVL91-.Ltext0
 10800 12fc 01       		.uleb128 0x1
 10801 12fd 53       		.byte	0x53
 10802 12fe 00       		.byte	0
 10803              	.LVUS21:
 10804 12ff 00       		.uleb128 0
 10805 1300 00       		.uleb128 .LVU119
 10806 1301 00       		.uleb128 .LVU119
 10807 1302 00       		.uleb128 .LVU143
 10808 1303 00       		.uleb128 .LVU143
 10809 1304 00       		.uleb128 .LVU149
 10810 1305 00       		.uleb128 .LVU149
GAS LISTING /tmp/cceaV4lG.s 			page 219


 10811 1306 00       		.uleb128 .LVU150
 10812 1307 00       		.uleb128 .LVU150
 10813 1308 00       		.uleb128 0
 10814              	.LLST21:
 10815 1309 04       		.byte	0x4
 10816 130a F702     		.uleb128 .LVL49-.Ltext0
 10817 130c FE02     		.uleb128 .LVL50-.Ltext0
 10818 130e 01       		.uleb128 0x1
 10819 130f 55       		.byte	0x55
 10820 1310 04       		.byte	0x4
 10821 1311 FE02     		.uleb128 .LVL50-.Ltext0
 10822 1313 CE03     		.uleb128 .LVL61-.Ltext0
 10823 1315 01       		.uleb128 0x1
 10824 1316 53       		.byte	0x53
 10825 1317 04       		.byte	0x4
 10826 1318 CE03     		.uleb128 .LVL61-.Ltext0
 10827 131a E103     		.uleb128 .LVL62-.Ltext0
 10828 131c 04       		.uleb128 0x4
 10829 131d A3       		.byte	0xa3
 10830 131e 01       		.uleb128 0x1
 10831 131f 55       		.byte	0x55
 10832 1320 9F       		.byte	0x9f
 10833 1321 04       		.byte	0x4
 10834 1322 E103     		.uleb128 .LVL62-.Ltext0
 10835 1324 E803     		.uleb128 .LVL63-.Ltext0
 10836 1326 01       		.uleb128 0x1
 10837 1327 53       		.byte	0x53
 10838 1328 04       		.byte	0x4
 10839 1329 E803     		.uleb128 .LVL63-.Ltext0
 10840 132b A404     		.uleb128 .LFE56-.Ltext0
 10841 132d 04       		.uleb128 0x4
 10842 132e A3       		.byte	0xa3
 10843 132f 01       		.uleb128 0x1
 10844 1330 55       		.byte	0x55
 10845 1331 9F       		.byte	0x9f
 10846 1332 00       		.byte	0
 10847              	.LVUS22:
 10848 1333 00       		.uleb128 0
 10849 1334 00       		.uleb128 .LVU120
 10850 1335 00       		.uleb128 .LVU120
 10851 1336 00       		.uleb128 0
 10852              	.LLST22:
 10853 1337 04       		.byte	0x4
 10854 1338 F702     		.uleb128 .LVL49-.Ltext0
 10855 133a 8003     		.uleb128 .LVL51-.Ltext0
 10856 133c 01       		.uleb128 0x1
 10857 133d 54       		.byte	0x54
 10858 133e 04       		.byte	0x4
 10859 133f 8003     		.uleb128 .LVL51-.Ltext0
 10860 1341 A404     		.uleb128 .LFE56-.Ltext0
 10861 1343 01       		.uleb128 0x1
 10862 1344 55       		.byte	0x55
 10863 1345 00       		.byte	0
 10864              	.LVUS23:
 10865 1346 00       		.uleb128 0
 10866 1347 00       		.uleb128 .LVU129
 10867 1348 00       		.uleb128 .LVU129
GAS LISTING /tmp/cceaV4lG.s 			page 220


 10868 1349 00       		.uleb128 .LVU141
 10869 134a 00       		.uleb128 .LVU141
 10870 134b 00       		.uleb128 .LVU143
 10871 134c 00       		.uleb128 .LVU143
 10872 134d 00       		.uleb128 .LVU149
 10873 134e 00       		.uleb128 .LVU149
 10874 134f 00       		.uleb128 .LVU150
 10875 1350 00       		.uleb128 .LVU150
 10876 1351 00       		.uleb128 0
 10877              	.LLST23:
 10878 1352 04       		.byte	0x4
 10879 1353 F702     		.uleb128 .LVL49-.Ltext0
 10880 1355 9503     		.uleb128 .LVL53-.Ltext0
 10881 1357 01       		.uleb128 0x1
 10882 1358 51       		.byte	0x51
 10883 1359 04       		.byte	0x4
 10884 135a 9503     		.uleb128 .LVL53-.Ltext0
 10885 135c C503     		.uleb128 .LVL60-.Ltext0
 10886 135e 04       		.uleb128 0x4
 10887 135f A3       		.byte	0xa3
 10888 1360 01       		.uleb128 0x1
 10889 1361 51       		.byte	0x51
 10890 1362 9F       		.byte	0x9f
 10891 1363 04       		.byte	0x4
 10892 1364 C503     		.uleb128 .LVL60-.Ltext0
 10893 1366 CE03     		.uleb128 .LVL61-.Ltext0
 10894 1368 01       		.uleb128 0x1
 10895 1369 51       		.byte	0x51
 10896 136a 04       		.byte	0x4
 10897 136b CE03     		.uleb128 .LVL61-.Ltext0
 10898 136d E103     		.uleb128 .LVL62-.Ltext0
 10899 136f 04       		.uleb128 0x4
 10900 1370 A3       		.byte	0xa3
 10901 1371 01       		.uleb128 0x1
 10902 1372 51       		.byte	0x51
 10903 1373 9F       		.byte	0x9f
 10904 1374 04       		.byte	0x4
 10905 1375 E103     		.uleb128 .LVL62-.Ltext0
 10906 1377 E803     		.uleb128 .LVL63-.Ltext0
 10907 1379 01       		.uleb128 0x1
 10908 137a 51       		.byte	0x51
 10909 137b 04       		.byte	0x4
 10910 137c E803     		.uleb128 .LVL63-.Ltext0
 10911 137e A404     		.uleb128 .LFE56-.Ltext0
 10912 1380 04       		.uleb128 0x4
 10913 1381 A3       		.byte	0xa3
 10914 1382 01       		.uleb128 0x1
 10915 1383 51       		.byte	0x51
 10916 1384 9F       		.byte	0x9f
 10917 1385 00       		.byte	0
 10918              	.LVUS24:
 10919 1386 00       		.uleb128 0
 10920 1387 00       		.uleb128 .LVU130
 10921 1388 00       		.uleb128 .LVU130
 10922 1389 00       		.uleb128 .LVU140
 10923 138a 00       		.uleb128 .LVU140
 10924 138b 00       		.uleb128 .LVU141
GAS LISTING /tmp/cceaV4lG.s 			page 221


 10925 138c 00       		.uleb128 .LVU141
 10926 138d 00       		.uleb128 .LVU143
 10927 138e 00       		.uleb128 .LVU143
 10928 138f 00       		.uleb128 .LVU149
 10929 1390 00       		.uleb128 .LVU149
 10930 1391 00       		.uleb128 .LVU150
 10931 1392 00       		.uleb128 .LVU150
 10932 1393 00       		.uleb128 0
 10933              	.LLST24:
 10934 1394 04       		.byte	0x4
 10935 1395 F702     		.uleb128 .LVL49-.Ltext0
 10936 1397 9A03     		.uleb128 .LVL54-.Ltext0
 10937 1399 01       		.uleb128 0x1
 10938 139a 52       		.byte	0x52
 10939 139b 04       		.byte	0x4
 10940 139c 9A03     		.uleb128 .LVL54-.Ltext0
 10941 139e C303     		.uleb128 .LVL59-.Ltext0
 10942 13a0 03       		.uleb128 0x3
 10943 13a1 7B       		.byte	0x7b
 10944 13a2 01       		.sleb128 1
 10945 13a3 9F       		.byte	0x9f
 10946 13a4 04       		.byte	0x4
 10947 13a5 C303     		.uleb128 .LVL59-.Ltext0
 10948 13a7 C503     		.uleb128 .LVL60-.Ltext0
 10949 13a9 04       		.uleb128 0x4
 10950 13aa A3       		.byte	0xa3
 10951 13ab 01       		.uleb128 0x1
 10952 13ac 52       		.byte	0x52
 10953 13ad 9F       		.byte	0x9f
 10954 13ae 04       		.byte	0x4
 10955 13af C503     		.uleb128 .LVL60-.Ltext0
 10956 13b1 CE03     		.uleb128 .LVL61-.Ltext0
 10957 13b3 01       		.uleb128 0x1
 10958 13b4 52       		.byte	0x52
 10959 13b5 04       		.byte	0x4
 10960 13b6 CE03     		.uleb128 .LVL61-.Ltext0
 10961 13b8 E103     		.uleb128 .LVL62-.Ltext0
 10962 13ba 04       		.uleb128 0x4
 10963 13bb A3       		.byte	0xa3
 10964 13bc 01       		.uleb128 0x1
 10965 13bd 52       		.byte	0x52
 10966 13be 9F       		.byte	0x9f
 10967 13bf 04       		.byte	0x4
 10968 13c0 E103     		.uleb128 .LVL62-.Ltext0
 10969 13c2 E803     		.uleb128 .LVL63-.Ltext0
 10970 13c4 01       		.uleb128 0x1
 10971 13c5 52       		.byte	0x52
 10972 13c6 04       		.byte	0x4
 10973 13c7 E803     		.uleb128 .LVL63-.Ltext0
 10974 13c9 A404     		.uleb128 .LFE56-.Ltext0
 10975 13cb 04       		.uleb128 0x4
 10976 13cc A3       		.byte	0xa3
 10977 13cd 01       		.uleb128 0x1
 10978 13ce 52       		.byte	0x52
 10979 13cf 9F       		.byte	0x9f
 10980 13d0 00       		.byte	0
 10981              	.LVUS25:
GAS LISTING /tmp/cceaV4lG.s 			page 222


 10982 13d1 01       		.uleb128 .LVU122
 10983 13d2 00       		.uleb128 .LVU143
 10984 13d3 00       		.uleb128 .LVU149
 10985 13d4 00       		.uleb128 .LVU150
 10986 13d5 00       		.uleb128 .LVU150
 10987 13d6 00       		.uleb128 .LVU153
 10988 13d7 00       		.uleb128 .LVU154
 10989 13d8 00       		.uleb128 .LVU171
 10990              	.LLST25:
 10991 13d9 04       		.byte	0x4
 10992 13da 8303     		.uleb128 .LVL52-.Ltext0
 10993 13dc CE03     		.uleb128 .LVL61-.Ltext0
 10994 13de 02       		.uleb128 0x2
 10995 13df 30       		.byte	0x30
 10996 13e0 9F       		.byte	0x9f
 10997 13e1 04       		.byte	0x4
 10998 13e2 E103     		.uleb128 .LVL62-.Ltext0
 10999 13e4 E803     		.uleb128 .LVL63-.Ltext0
 11000 13e6 02       		.uleb128 0x2
 11001 13e7 30       		.byte	0x30
 11002 13e8 9F       		.byte	0x9f
 11003 13e9 04       		.byte	0x4
 11004 13ea E803     		.uleb128 .LVL63-.Ltext0
 11005 13ec EE03     		.uleb128 .LVL64-.Ltext0
 11006 13ee 01       		.uleb128 0x1
 11007 13ef 52       		.byte	0x52
 11008 13f0 04       		.byte	0x4
 11009 13f1 F203     		.uleb128 .LVL65-.Ltext0
 11010 13f3 9D04     		.uleb128 .LVL69-.Ltext0
 11011 13f5 01       		.uleb128 0x1
 11012 13f6 52       		.byte	0x52
 11013 13f7 00       		.byte	0
 11014              	.LVUS26:
 11015 13f8 01       		.uleb128 .LVU122
 11016 13f9 00       		.uleb128 .LVU130
 11017 13fa 00       		.uleb128 .LVU130
 11018 13fb 00       		.uleb128 .LVU132
 11019 13fc 00       		.uleb128 .LVU133
 11020 13fd 00       		.uleb128 .LVU141
 11021 13fe 00       		.uleb128 .LVU141
 11022 13ff 00       		.uleb128 .LVU143
 11023 1400 00       		.uleb128 .LVU149
 11024 1401 00       		.uleb128 .LVU150
 11025 1402 00       		.uleb128 .LVU150
 11026 1403 00       		.uleb128 .LVU157
 11027 1404 00       		.uleb128 .LVU161
 11028 1405 00       		.uleb128 .LVU171
 11029              	.LLST26:
 11030 1406 04       		.byte	0x4
 11031 1407 8303     		.uleb128 .LVL52-.Ltext0
 11032 1409 9A03     		.uleb128 .LVL54-.Ltext0
 11033 140b 02       		.uleb128 0x2
 11034 140c 31       		.byte	0x31
 11035 140d 9F       		.byte	0x9f
 11036 140e 04       		.byte	0x4
 11037 140f 9A03     		.uleb128 .LVL54-.Ltext0
 11038 1411 9D03     		.uleb128 .LVL55-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 223


 11039 1413 01       		.uleb128 0x1
 11040 1414 50       		.byte	0x50
 11041 1415 04       		.byte	0x4
 11042 1416 9F03     		.uleb128 .LVL56-.Ltext0
 11043 1418 C503     		.uleb128 .LVL60-.Ltext0
 11044 141a 01       		.uleb128 0x1
 11045 141b 50       		.byte	0x50
 11046 141c 04       		.byte	0x4
 11047 141d C503     		.uleb128 .LVL60-.Ltext0
 11048 141f CE03     		.uleb128 .LVL61-.Ltext0
 11049 1421 02       		.uleb128 0x2
 11050 1422 31       		.byte	0x31
 11051 1423 9F       		.byte	0x9f
 11052 1424 04       		.byte	0x4
 11053 1425 E103     		.uleb128 .LVL62-.Ltext0
 11054 1427 E803     		.uleb128 .LVL63-.Ltext0
 11055 1429 02       		.uleb128 0x2
 11056 142a 31       		.byte	0x31
 11057 142b 9F       		.byte	0x9f
 11058 142c 04       		.byte	0x4
 11059 142d E803     		.uleb128 .LVL63-.Ltext0
 11060 142f F803     		.uleb128 .LVL66-.Ltext0
 11061 1431 01       		.uleb128 0x1
 11062 1432 50       		.byte	0x50
 11063 1433 04       		.byte	0x4
 11064 1434 8504     		.uleb128 .LVL67-.Ltext0
 11065 1436 9D04     		.uleb128 .LVL69-.Ltext0
 11066 1438 01       		.uleb128 0x1
 11067 1439 50       		.byte	0x50
 11068 143a 00       		.byte	0
 11069              	.LVUS27:
 11070 143b 03       		.uleb128 .LVU124
 11071 143c 00       		.uleb128 .LVU130
 11072 143d 00       		.uleb128 .LVU130
 11073 143e 00       		.uleb128 .LVU137
 11074 143f 00       		.uleb128 .LVU137
 11075 1440 00       		.uleb128 .LVU143
 11076 1441 00       		.uleb128 .LVU149
 11077 1442 00       		.uleb128 .LVU150
 11078              	.LLST27:
 11079 1443 04       		.byte	0x4
 11080 1444 8303     		.uleb128 .LVL52-.Ltext0
 11081 1446 9A03     		.uleb128 .LVL54-.Ltext0
 11082 1448 02       		.uleb128 0x2
 11083 1449 30       		.byte	0x30
 11084 144a 9F       		.byte	0x9f
 11085 144b 04       		.byte	0x4
 11086 144c 9A03     		.uleb128 .LVL54-.Ltext0
 11087 144e AA03     		.uleb128 .LVL58-.Ltext0
 11088 1450 01       		.uleb128 0x1
 11089 1451 51       		.byte	0x51
 11090 1452 04       		.byte	0x4
 11091 1453 AA03     		.uleb128 .LVL58-.Ltext0
 11092 1455 CE03     		.uleb128 .LVL61-.Ltext0
 11093 1457 02       		.uleb128 0x2
 11094 1458 30       		.byte	0x30
 11095 1459 9F       		.byte	0x9f
GAS LISTING /tmp/cceaV4lG.s 			page 224


 11096 145a 04       		.byte	0x4
 11097 145b E103     		.uleb128 .LVL62-.Ltext0
 11098 145d E803     		.uleb128 .LVL63-.Ltext0
 11099 145f 02       		.uleb128 0x2
 11100 1460 30       		.byte	0x30
 11101 1461 9F       		.byte	0x9f
 11102 1462 00       		.byte	0
 11103              	.LVUS13:
 11104 1463 00       		.uleb128 0
 11105 1464 00       		.uleb128 .LVU90
 11106 1465 00       		.uleb128 .LVU90
 11107 1466 00       		.uleb128 .LVU109
 11108 1467 00       		.uleb128 .LVU109
 11109 1468 00       		.uleb128 .LVU110
 11110 1469 00       		.uleb128 .LVU110
 11111 146a 00       		.uleb128 0
 11112              	.LLST13:
 11113 146b 04       		.byte	0x4
 11114 146c 8202     		.uleb128 .LVL32-.Ltext0
 11115 146e 9B02     		.uleb128 .LVL36-.Ltext0
 11116 1470 01       		.uleb128 0x1
 11117 1471 55       		.byte	0x55
 11118 1472 04       		.byte	0x4
 11119 1473 9B02     		.uleb128 .LVL36-.Ltext0
 11120 1475 D602     		.uleb128 .LVL47-.Ltext0
 11121 1477 04       		.uleb128 0x4
 11122 1478 A3       		.byte	0xa3
 11123 1479 01       		.uleb128 0x1
 11124 147a 55       		.byte	0x55
 11125 147b 9F       		.byte	0x9f
 11126 147c 04       		.byte	0x4
 11127 147d D602     		.uleb128 .LVL47-.Ltext0
 11128 147f DB02     		.uleb128 .LVL48-.Ltext0
 11129 1481 01       		.uleb128 0x1
 11130 1482 55       		.byte	0x55
 11131 1483 04       		.byte	0x4
 11132 1484 DB02     		.uleb128 .LVL48-.Ltext0
 11133 1486 F702     		.uleb128 .LFE55-.Ltext0
 11134 1488 04       		.uleb128 0x4
 11135 1489 A3       		.byte	0xa3
 11136 148a 01       		.uleb128 0x1
 11137 148b 55       		.byte	0x55
 11138 148c 9F       		.byte	0x9f
 11139 148d 00       		.byte	0
 11140              	.LVUS14:
 11141 148e 00       		.uleb128 0
 11142 148f 00       		.uleb128 .LVU82
 11143 1490 00       		.uleb128 .LVU82
 11144 1491 00       		.uleb128 0
 11145              	.LLST14:
 11146 1492 04       		.byte	0x4
 11147 1493 8202     		.uleb128 .LVL32-.Ltext0
 11148 1495 8702     		.uleb128 .LVL33-.Ltext0
 11149 1497 01       		.uleb128 0x1
 11150 1498 54       		.byte	0x54
 11151 1499 04       		.byte	0x4
 11152 149a 8702     		.uleb128 .LVL33-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 225


 11153 149c F702     		.uleb128 .LFE55-.Ltext0
 11154 149e 01       		.uleb128 0x1
 11155 149f 5A       		.byte	0x5a
 11156 14a0 00       		.byte	0
 11157              	.LVUS15:
 11158 14a1 00       		.uleb128 0
 11159 14a2 00       		.uleb128 .LVU89
 11160 14a3 00       		.uleb128 .LVU89
 11161 14a4 00       		.uleb128 .LVU109
 11162 14a5 00       		.uleb128 .LVU109
 11163 14a6 00       		.uleb128 .LVU110
 11164 14a7 00       		.uleb128 .LVU110
 11165 14a8 00       		.uleb128 0
 11166              	.LLST15:
 11167 14a9 04       		.byte	0x4
 11168 14aa 8202     		.uleb128 .LVL32-.Ltext0
 11169 14ac 9602     		.uleb128 .LVL35-.Ltext0
 11170 14ae 01       		.uleb128 0x1
 11171 14af 51       		.byte	0x51
 11172 14b0 04       		.byte	0x4
 11173 14b1 9602     		.uleb128 .LVL35-.Ltext0
 11174 14b3 D602     		.uleb128 .LVL47-.Ltext0
 11175 14b5 04       		.uleb128 0x4
 11176 14b6 A3       		.byte	0xa3
 11177 14b7 01       		.uleb128 0x1
 11178 14b8 51       		.byte	0x51
 11179 14b9 9F       		.byte	0x9f
 11180 14ba 04       		.byte	0x4
 11181 14bb D602     		.uleb128 .LVL47-.Ltext0
 11182 14bd DB02     		.uleb128 .LVL48-.Ltext0
 11183 14bf 01       		.uleb128 0x1
 11184 14c0 51       		.byte	0x51
 11185 14c1 04       		.byte	0x4
 11186 14c2 DB02     		.uleb128 .LVL48-.Ltext0
 11187 14c4 F702     		.uleb128 .LFE55-.Ltext0
 11188 14c6 04       		.uleb128 0x4
 11189 14c7 A3       		.byte	0xa3
 11190 14c8 01       		.uleb128 0x1
 11191 14c9 51       		.byte	0x51
 11192 14ca 9F       		.byte	0x9f
 11193 14cb 00       		.byte	0
 11194              	.LVUS16:
 11195 14cc 00       		.uleb128 0
 11196 14cd 00       		.uleb128 .LVU91
 11197 14ce 00       		.uleb128 .LVU91
 11198 14cf 00       		.uleb128 .LVU109
 11199 14d0 00       		.uleb128 .LVU109
 11200 14d1 00       		.uleb128 .LVU110
 11201 14d2 00       		.uleb128 .LVU110
 11202 14d3 00       		.uleb128 0
 11203              	.LLST16:
 11204 14d4 04       		.byte	0x4
 11205 14d5 8202     		.uleb128 .LVL32-.Ltext0
 11206 14d7 9D02     		.uleb128 .LVL37-.Ltext0
 11207 14d9 01       		.uleb128 0x1
 11208 14da 52       		.byte	0x52
 11209 14db 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 226


 11210 14dc 9D02     		.uleb128 .LVL37-.Ltext0
 11211 14de D602     		.uleb128 .LVL47-.Ltext0
 11212 14e0 04       		.uleb128 0x4
 11213 14e1 A3       		.byte	0xa3
 11214 14e2 01       		.uleb128 0x1
 11215 14e3 52       		.byte	0x52
 11216 14e4 9F       		.byte	0x9f
 11217 14e5 04       		.byte	0x4
 11218 14e6 D602     		.uleb128 .LVL47-.Ltext0
 11219 14e8 DB02     		.uleb128 .LVL48-.Ltext0
 11220 14ea 01       		.uleb128 0x1
 11221 14eb 52       		.byte	0x52
 11222 14ec 04       		.byte	0x4
 11223 14ed DB02     		.uleb128 .LVL48-.Ltext0
 11224 14ef F702     		.uleb128 .LFE55-.Ltext0
 11225 14f1 04       		.uleb128 0x4
 11226 14f2 A3       		.byte	0xa3
 11227 14f3 01       		.uleb128 0x1
 11228 14f4 52       		.byte	0x52
 11229 14f5 9F       		.byte	0x9f
 11230 14f6 00       		.byte	0
 11231              	.LVUS17:
 11232 14f7 01       		.uleb128 .LVU83
 11233 14f8 00       		.uleb128 .LVU94
 11234 14f9 00       		.uleb128 .LVU94
 11235 14fa 00       		.uleb128 .LVU109
 11236 14fb 00       		.uleb128 .LVU109
 11237 14fc 00       		.uleb128 .LVU110
 11238              	.LLST17:
 11239 14fd 04       		.byte	0x4
 11240 14fe 8702     		.uleb128 .LVL33-.Ltext0
 11241 1500 AF02     		.uleb128 .LVL38-.Ltext0
 11242 1502 02       		.uleb128 0x2
 11243 1503 30       		.byte	0x30
 11244 1504 9F       		.byte	0x9f
 11245 1505 04       		.byte	0x4
 11246 1506 AF02     		.uleb128 .LVL38-.Ltext0
 11247 1508 D602     		.uleb128 .LVL47-.Ltext0
 11248 150a 01       		.uleb128 0x1
 11249 150b 54       		.byte	0x54
 11250 150c 04       		.byte	0x4
 11251 150d D602     		.uleb128 .LVL47-.Ltext0
 11252 150f DB02     		.uleb128 .LVL48-.Ltext0
 11253 1511 02       		.uleb128 0x2
 11254 1512 30       		.byte	0x30
 11255 1513 9F       		.byte	0x9f
 11256 1514 00       		.byte	0
 11257              	.LVUS18:
 11258 1515 02       		.uleb128 .LVU84
 11259 1516 00       		.uleb128 .LVU94
 11260 1517 00       		.uleb128 .LVU94
 11261 1518 00       		.uleb128 .LVU107
 11262 1519 00       		.uleb128 .LVU108
 11263 151a 00       		.uleb128 .LVU109
 11264 151b 00       		.uleb128 .LVU109
 11265 151c 00       		.uleb128 .LVU110
 11266              	.LLST18:
GAS LISTING /tmp/cceaV4lG.s 			page 227


 11267 151d 04       		.byte	0x4
 11268 151e 8702     		.uleb128 .LVL33-.Ltext0
 11269 1520 AF02     		.uleb128 .LVL38-.Ltext0
 11270 1522 02       		.uleb128 0x2
 11271 1523 31       		.byte	0x31
 11272 1524 9F       		.byte	0x9f
 11273 1525 04       		.byte	0x4
 11274 1526 AF02     		.uleb128 .LVL38-.Ltext0
 11275 1528 D202     		.uleb128 .LVL45-.Ltext0
 11276 152a 01       		.uleb128 0x1
 11277 152b 52       		.byte	0x52
 11278 152c 04       		.byte	0x4
 11279 152d D402     		.uleb128 .LVL46-.Ltext0
 11280 152f D602     		.uleb128 .LVL47-.Ltext0
 11281 1531 01       		.uleb128 0x1
 11282 1532 52       		.byte	0x52
 11283 1533 04       		.byte	0x4
 11284 1534 D602     		.uleb128 .LVL47-.Ltext0
 11285 1536 DB02     		.uleb128 .LVL48-.Ltext0
 11286 1538 02       		.uleb128 0x2
 11287 1539 31       		.byte	0x31
 11288 153a 9F       		.byte	0x9f
 11289 153b 00       		.byte	0
 11290              	.LVUS19:
 11291 153c 00       		.uleb128 .LVU87
 11292 153d 00       		.uleb128 .LVU94
 11293 153e 00       		.uleb128 .LVU94
 11294 153f 01       		.uleb128 .LVU96
 11295 1540 01       		.uleb128 .LVU96
 11296 1541 00       		.uleb128 .LVU97
 11297 1542 00       		.uleb128 .LVU98
 11298 1543 00       		.uleb128 .LVU109
 11299 1544 00       		.uleb128 .LVU109
 11300 1545 00       		.uleb128 .LVU110
 11301              	.LLST19:
 11302 1546 04       		.byte	0x4
 11303 1547 8A02     		.uleb128 .LVL34-.Ltext0
 11304 1549 AF02     		.uleb128 .LVL38-.Ltext0
 11305 154b 01       		.uleb128 0x1
 11306 154c 50       		.byte	0x50
 11307 154d 04       		.byte	0x4
 11308 154e AF02     		.uleb128 .LVL38-.Ltext0
 11309 1550 B402     		.uleb128 .LVL39-.Ltext0
 11310 1552 09       		.uleb128 0x9
 11311 1553 71       		.byte	0x71
 11312 1554 00       		.sleb128 0
 11313 1555 A3       		.byte	0xa3
 11314 1556 01       		.uleb128 0x1
 11315 1557 55       		.byte	0x55
 11316 1558 1C       		.byte	0x1c
 11317 1559 23       		.byte	0x23
 11318 155a 01       		.uleb128 0x1
 11319 155b 9F       		.byte	0x9f
 11320 155c 04       		.byte	0x4
 11321 155d B402     		.uleb128 .LVL39-.Ltext0
 11322 155f B802     		.uleb128 .LVL40-.Ltext0
 11323 1561 07       		.uleb128 0x7
GAS LISTING /tmp/cceaV4lG.s 			page 228


 11324 1562 71       		.byte	0x71
 11325 1563 00       		.sleb128 0
 11326 1564 A3       		.byte	0xa3
 11327 1565 01       		.uleb128 0x1
 11328 1566 55       		.byte	0x55
 11329 1567 1C       		.byte	0x1c
 11330 1568 9F       		.byte	0x9f
 11331 1569 04       		.byte	0x4
 11332 156a BD02     		.uleb128 .LVL41-.Ltext0
 11333 156c D602     		.uleb128 .LVL47-.Ltext0
 11334 156e 09       		.uleb128 0x9
 11335 156f 71       		.byte	0x71
 11336 1570 00       		.sleb128 0
 11337 1571 A3       		.byte	0xa3
 11338 1572 01       		.uleb128 0x1
 11339 1573 55       		.byte	0x55
 11340 1574 1C       		.byte	0x1c
 11341 1575 23       		.byte	0x23
 11342 1576 01       		.uleb128 0x1
 11343 1577 9F       		.byte	0x9f
 11344 1578 04       		.byte	0x4
 11345 1579 D602     		.uleb128 .LVL47-.Ltext0
 11346 157b DB02     		.uleb128 .LVL48-.Ltext0
 11347 157d 01       		.uleb128 0x1
 11348 157e 50       		.byte	0x50
 11349 157f 00       		.byte	0
 11350              	.LVUS20:
 11351 1580 00       		.uleb128 .LVU94
 11352 1581 00       		.uleb128 .LVU95
 11353 1582 00       		.uleb128 .LVU100
 11354 1583 00       		.uleb128 .LVU104
 11355              	.LLST20:
 11356 1584 04       		.byte	0x4
 11357 1585 AF02     		.uleb128 .LVL38-.Ltext0
 11358 1587 B402     		.uleb128 .LVL39-.Ltext0
 11359 1589 01       		.uleb128 0x1
 11360 158a 50       		.byte	0x50
 11361 158b 04       		.byte	0x4
 11362 158c C302     		.uleb128 .LVL42-.Ltext0
 11363 158e CD02     		.uleb128 .LVL43-.Ltext0
 11364 1590 01       		.uleb128 0x1
 11365 1591 50       		.byte	0x50
 11366 1592 00       		.byte	0
 11367              	.LVUS4:
 11368 1593 00       		.uleb128 0
 11369 1594 00       		.uleb128 .LVU24
 11370 1595 00       		.uleb128 .LVU24
 11371 1596 00       		.uleb128 .LVU45
 11372 1597 00       		.uleb128 .LVU45
 11373 1598 00       		.uleb128 .LVU46
 11374 1599 00       		.uleb128 .LVU46
 11375 159a 00       		.uleb128 .LVU50
 11376 159b 00       		.uleb128 .LVU50
 11377 159c 00       		.uleb128 .LVU54
 11378 159d 00       		.uleb128 .LVU54
 11379 159e 00       		.uleb128 .LVU55
 11380 159f 00       		.uleb128 .LVU55
GAS LISTING /tmp/cceaV4lG.s 			page 229


 11381 15a0 00       		.uleb128 .LVU79
 11382 15a1 00       		.uleb128 .LVU79
 11383 15a2 00       		.uleb128 0
 11384              	.LLST4:
 11385 15a3 04       		.byte	0x4
 11386 15a4 45       		.uleb128 .LVL8-.Ltext0
 11387 15a5 4D       		.uleb128 .LVL9-.Ltext0
 11388 15a6 01       		.uleb128 0x1
 11389 15a7 55       		.byte	0x55
 11390 15a8 04       		.byte	0x4
 11391 15a9 4D       		.uleb128 .LVL9-.Ltext0
 11392 15aa 9201     		.uleb128 .LVL19-.Ltext0
 11393 15ac 01       		.uleb128 0x1
 11394 15ad 53       		.byte	0x53
 11395 15ae 04       		.byte	0x4
 11396 15af 9201     		.uleb128 .LVL19-.Ltext0
 11397 15b1 9401     		.uleb128 .LVL20-.Ltext0
 11398 15b3 04       		.uleb128 0x4
 11399 15b4 A3       		.byte	0xa3
 11400 15b5 01       		.uleb128 0x1
 11401 15b6 55       		.byte	0x55
 11402 15b7 9F       		.byte	0x9f
 11403 15b8 04       		.byte	0x4
 11404 15b9 9401     		.uleb128 .LVL20-.Ltext0
 11405 15bb A301     		.uleb128 .LVL21-.Ltext0
 11406 15bd 01       		.uleb128 0x1
 11407 15be 53       		.byte	0x53
 11408 15bf 04       		.byte	0x4
 11409 15c0 A301     		.uleb128 .LVL21-.Ltext0
 11410 15c2 AD01     		.uleb128 .LVL22-.Ltext0
 11411 15c4 04       		.uleb128 0x4
 11412 15c5 A3       		.byte	0xa3
 11413 15c6 01       		.uleb128 0x1
 11414 15c7 55       		.byte	0x55
 11415 15c8 9F       		.byte	0x9f
 11416 15c9 04       		.byte	0x4
 11417 15ca AD01     		.uleb128 .LVL22-.Ltext0
 11418 15cc B401     		.uleb128 .LVL23-.Ltext0
 11419 15ce 01       		.uleb128 0x1
 11420 15cf 53       		.byte	0x53
 11421 15d0 04       		.byte	0x4
 11422 15d1 B401     		.uleb128 .LVL23-.Ltext0
 11423 15d3 FB01     		.uleb128 .LVL31-.Ltext0
 11424 15d5 04       		.uleb128 0x4
 11425 15d6 A3       		.byte	0xa3
 11426 15d7 01       		.uleb128 0x1
 11427 15d8 55       		.byte	0x55
 11428 15d9 9F       		.byte	0x9f
 11429 15da 04       		.byte	0x4
 11430 15db FB01     		.uleb128 .LVL31-.Ltext0
 11431 15dd 8202     		.uleb128 .LFE54-.Ltext0
 11432 15df 01       		.uleb128 0x1
 11433 15e0 53       		.byte	0x53
 11434 15e1 00       		.byte	0
 11435              	.LVUS5:
 11436 15e2 00       		.uleb128 0
 11437 15e3 00       		.uleb128 .LVU34
GAS LISTING /tmp/cceaV4lG.s 			page 230


 11438 15e4 00       		.uleb128 .LVU34
 11439 15e5 00       		.uleb128 .LVU46
 11440 15e6 00       		.uleb128 .LVU46
 11441 15e7 00       		.uleb128 .LVU50
 11442 15e8 00       		.uleb128 .LVU50
 11443 15e9 00       		.uleb128 .LVU54
 11444 15ea 00       		.uleb128 .LVU54
 11445 15eb 00       		.uleb128 .LVU55
 11446 15ec 00       		.uleb128 .LVU55
 11447 15ed 00       		.uleb128 .LVU79
 11448 15ee 00       		.uleb128 .LVU79
 11449 15ef 00       		.uleb128 0
 11450              	.LLST5:
 11451 15f0 04       		.byte	0x4
 11452 15f1 45       		.uleb128 .LVL8-.Ltext0
 11453 15f2 69       		.uleb128 .LVL12-.Ltext0
 11454 15f3 01       		.uleb128 0x1
 11455 15f4 54       		.byte	0x54
 11456 15f5 04       		.byte	0x4
 11457 15f6 69       		.uleb128 .LVL12-.Ltext0
 11458 15f7 9401     		.uleb128 .LVL20-.Ltext0
 11459 15f9 01       		.uleb128 0x1
 11460 15fa 55       		.byte	0x55
 11461 15fb 04       		.byte	0x4
 11462 15fc 9401     		.uleb128 .LVL20-.Ltext0
 11463 15fe A301     		.uleb128 .LVL21-.Ltext0
 11464 1600 01       		.uleb128 0x1
 11465 1601 54       		.byte	0x54
 11466 1602 04       		.byte	0x4
 11467 1603 A301     		.uleb128 .LVL21-.Ltext0
 11468 1605 AD01     		.uleb128 .LVL22-.Ltext0
 11469 1607 01       		.uleb128 0x1
 11470 1608 55       		.byte	0x55
 11471 1609 04       		.byte	0x4
 11472 160a AD01     		.uleb128 .LVL22-.Ltext0
 11473 160c B401     		.uleb128 .LVL23-.Ltext0
 11474 160e 01       		.uleb128 0x1
 11475 160f 54       		.byte	0x54
 11476 1610 04       		.byte	0x4
 11477 1611 B401     		.uleb128 .LVL23-.Ltext0
 11478 1613 FB01     		.uleb128 .LVL31-.Ltext0
 11479 1615 01       		.uleb128 0x1
 11480 1616 55       		.byte	0x55
 11481 1617 04       		.byte	0x4
 11482 1618 FB01     		.uleb128 .LVL31-.Ltext0
 11483 161a 8202     		.uleb128 .LFE54-.Ltext0
 11484 161c 01       		.uleb128 0x1
 11485 161d 54       		.byte	0x54
 11486 161e 00       		.byte	0
 11487              	.LVUS6:
 11488 161f 00       		.uleb128 0
 11489 1620 00       		.uleb128 .LVU33
 11490 1621 00       		.uleb128 .LVU33
 11491 1622 00       		.uleb128 .LVU46
 11492 1623 00       		.uleb128 .LVU46
 11493 1624 00       		.uleb128 .LVU50
 11494 1625 00       		.uleb128 .LVU50
GAS LISTING /tmp/cceaV4lG.s 			page 231


 11495 1626 00       		.uleb128 .LVU54
 11496 1627 00       		.uleb128 .LVU54
 11497 1628 00       		.uleb128 .LVU55
 11498 1629 00       		.uleb128 .LVU55
 11499 162a 00       		.uleb128 .LVU79
 11500 162b 00       		.uleb128 .LVU79
 11501 162c 00       		.uleb128 0
 11502              	.LLST6:
 11503 162d 04       		.byte	0x4
 11504 162e 45       		.uleb128 .LVL8-.Ltext0
 11505 162f 64       		.uleb128 .LVL11-.Ltext0
 11506 1630 01       		.uleb128 0x1
 11507 1631 51       		.byte	0x51
 11508 1632 04       		.byte	0x4
 11509 1633 64       		.uleb128 .LVL11-.Ltext0
 11510 1634 9401     		.uleb128 .LVL20-.Ltext0
 11511 1636 04       		.uleb128 0x4
 11512 1637 A3       		.byte	0xa3
 11513 1638 01       		.uleb128 0x1
 11514 1639 51       		.byte	0x51
 11515 163a 9F       		.byte	0x9f
 11516 163b 04       		.byte	0x4
 11517 163c 9401     		.uleb128 .LVL20-.Ltext0
 11518 163e A301     		.uleb128 .LVL21-.Ltext0
 11519 1640 01       		.uleb128 0x1
 11520 1641 51       		.byte	0x51
 11521 1642 04       		.byte	0x4
 11522 1643 A301     		.uleb128 .LVL21-.Ltext0
 11523 1645 AD01     		.uleb128 .LVL22-.Ltext0
 11524 1647 04       		.uleb128 0x4
 11525 1648 A3       		.byte	0xa3
 11526 1649 01       		.uleb128 0x1
 11527 164a 51       		.byte	0x51
 11528 164b 9F       		.byte	0x9f
 11529 164c 04       		.byte	0x4
 11530 164d AD01     		.uleb128 .LVL22-.Ltext0
 11531 164f B401     		.uleb128 .LVL23-.Ltext0
 11532 1651 01       		.uleb128 0x1
 11533 1652 51       		.byte	0x51
 11534 1653 04       		.byte	0x4
 11535 1654 B401     		.uleb128 .LVL23-.Ltext0
 11536 1656 FB01     		.uleb128 .LVL31-.Ltext0
 11537 1658 04       		.uleb128 0x4
 11538 1659 A3       		.byte	0xa3
 11539 165a 01       		.uleb128 0x1
 11540 165b 51       		.byte	0x51
 11541 165c 9F       		.byte	0x9f
 11542 165d 04       		.byte	0x4
 11543 165e FB01     		.uleb128 .LVL31-.Ltext0
 11544 1660 8202     		.uleb128 .LFE54-.Ltext0
 11545 1662 01       		.uleb128 0x1
 11546 1663 51       		.byte	0x51
 11547 1664 00       		.byte	0
 11548              	.LVUS7:
 11549 1665 00       		.uleb128 0
 11550 1666 00       		.uleb128 .LVU42
 11551 1667 00       		.uleb128 .LVU42
GAS LISTING /tmp/cceaV4lG.s 			page 232


 11552 1668 00       		.uleb128 .LVU44
 11553 1669 00       		.uleb128 .LVU44
 11554 166a 00       		.uleb128 .LVU46
 11555 166b 00       		.uleb128 .LVU46
 11556 166c 00       		.uleb128 .LVU50
 11557 166d 00       		.uleb128 .LVU50
 11558 166e 00       		.uleb128 .LVU54
 11559 166f 00       		.uleb128 .LVU54
 11560 1670 00       		.uleb128 .LVU55
 11561 1671 00       		.uleb128 .LVU55
 11562 1672 00       		.uleb128 .LVU79
 11563 1673 00       		.uleb128 .LVU79
 11564 1674 00       		.uleb128 0
 11565              	.LLST7:
 11566 1675 04       		.byte	0x4
 11567 1676 45       		.uleb128 .LVL8-.Ltext0
 11568 1677 7D       		.uleb128 .LVL17-.Ltext0
 11569 1678 01       		.uleb128 0x1
 11570 1679 52       		.byte	0x52
 11571 167a 04       		.byte	0x4
 11572 167b 7D       		.uleb128 .LVL17-.Ltext0
 11573 167c 8D01     		.uleb128 .LVL18-.Ltext0
 11574 167e 03       		.uleb128 0x3
 11575 167f 7B       		.byte	0x7b
 11576 1680 01       		.sleb128 1
 11577 1681 9F       		.byte	0x9f
 11578 1682 04       		.byte	0x4
 11579 1683 8D01     		.uleb128 .LVL18-.Ltext0
 11580 1685 9401     		.uleb128 .LVL20-.Ltext0
 11581 1687 04       		.uleb128 0x4
 11582 1688 A3       		.byte	0xa3
 11583 1689 01       		.uleb128 0x1
 11584 168a 52       		.byte	0x52
 11585 168b 9F       		.byte	0x9f
 11586 168c 04       		.byte	0x4
 11587 168d 9401     		.uleb128 .LVL20-.Ltext0
 11588 168f A301     		.uleb128 .LVL21-.Ltext0
 11589 1691 01       		.uleb128 0x1
 11590 1692 52       		.byte	0x52
 11591 1693 04       		.byte	0x4
 11592 1694 A301     		.uleb128 .LVL21-.Ltext0
 11593 1696 AD01     		.uleb128 .LVL22-.Ltext0
 11594 1698 04       		.uleb128 0x4
 11595 1699 A3       		.byte	0xa3
 11596 169a 01       		.uleb128 0x1
 11597 169b 52       		.byte	0x52
 11598 169c 9F       		.byte	0x9f
 11599 169d 04       		.byte	0x4
 11600 169e AD01     		.uleb128 .LVL22-.Ltext0
 11601 16a0 B401     		.uleb128 .LVL23-.Ltext0
 11602 16a2 01       		.uleb128 0x1
 11603 16a3 52       		.byte	0x52
 11604 16a4 04       		.byte	0x4
 11605 16a5 B401     		.uleb128 .LVL23-.Ltext0
 11606 16a7 FB01     		.uleb128 .LVL31-.Ltext0
 11607 16a9 04       		.uleb128 0x4
 11608 16aa A3       		.byte	0xa3
GAS LISTING /tmp/cceaV4lG.s 			page 233


 11609 16ab 01       		.uleb128 0x1
 11610 16ac 52       		.byte	0x52
 11611 16ad 9F       		.byte	0x9f
 11612 16ae 04       		.byte	0x4
 11613 16af FB01     		.uleb128 .LVL31-.Ltext0
 11614 16b1 8202     		.uleb128 .LFE54-.Ltext0
 11615 16b3 01       		.uleb128 0x1
 11616 16b4 52       		.byte	0x52
 11617 16b5 00       		.byte	0
 11618              	.LVUS8:
 11619 16b6 00       		.uleb128 0
 11620 16b7 00       		.uleb128 .LVU50
 11621 16b8 00       		.uleb128 .LVU50
 11622 16b9 00       		.uleb128 .LVU54
 11623 16ba 00       		.uleb128 .LVU54
 11624 16bb 00       		.uleb128 .LVU78
 11625 16bc 00       		.uleb128 .LVU78
 11626 16bd 00       		.uleb128 .LVU79
 11627 16be 00       		.uleb128 .LVU79
 11628 16bf 00       		.uleb128 0
 11629              	.LLST8:
 11630 16c0 04       		.byte	0x4
 11631 16c1 45       		.uleb128 .LVL8-.Ltext0
 11632 16c2 A301     		.uleb128 .LVL21-.Ltext0
 11633 16c4 01       		.uleb128 0x1
 11634 16c5 58       		.byte	0x58
 11635 16c6 04       		.byte	0x4
 11636 16c7 A301     		.uleb128 .LVL21-.Ltext0
 11637 16c9 AD01     		.uleb128 .LVL22-.Ltext0
 11638 16cb 04       		.uleb128 0x4
 11639 16cc A3       		.byte	0xa3
 11640 16cd 01       		.uleb128 0x1
 11641 16ce 58       		.byte	0x58
 11642 16cf 9F       		.byte	0x9f
 11643 16d0 04       		.byte	0x4
 11644 16d1 AD01     		.uleb128 .LVL22-.Ltext0
 11645 16d3 F801     		.uleb128 .LVL30-.Ltext0
 11646 16d5 01       		.uleb128 0x1
 11647 16d6 58       		.byte	0x58
 11648 16d7 04       		.byte	0x4
 11649 16d8 F801     		.uleb128 .LVL30-.Ltext0
 11650 16da FB01     		.uleb128 .LVL31-.Ltext0
 11651 16dc 04       		.uleb128 0x4
 11652 16dd A3       		.byte	0xa3
 11653 16de 01       		.uleb128 0x1
 11654 16df 58       		.byte	0x58
 11655 16e0 9F       		.byte	0x9f
 11656 16e1 04       		.byte	0x4
 11657 16e2 FB01     		.uleb128 .LVL31-.Ltext0
 11658 16e4 8202     		.uleb128 .LFE54-.Ltext0
 11659 16e6 01       		.uleb128 0x1
 11660 16e7 58       		.byte	0x58
 11661 16e8 00       		.byte	0
 11662              	.LVUS9:
 11663 16e9 00       		.uleb128 0
 11664 16ea 00       		.uleb128 .LVU50
 11665 16eb 00       		.uleb128 .LVU50
GAS LISTING /tmp/cceaV4lG.s 			page 234


 11666 16ec 00       		.uleb128 .LVU54
 11667 16ed 00       		.uleb128 .LVU54
 11668 16ee 00       		.uleb128 .LVU78
 11669 16ef 00       		.uleb128 .LVU78
 11670 16f0 00       		.uleb128 .LVU79
 11671 16f1 00       		.uleb128 .LVU79
 11672 16f2 00       		.uleb128 0
 11673              	.LLST9:
 11674 16f3 04       		.byte	0x4
 11675 16f4 45       		.uleb128 .LVL8-.Ltext0
 11676 16f5 A301     		.uleb128 .LVL21-.Ltext0
 11677 16f7 01       		.uleb128 0x1
 11678 16f8 59       		.byte	0x59
 11679 16f9 04       		.byte	0x4
 11680 16fa A301     		.uleb128 .LVL21-.Ltext0
 11681 16fc AD01     		.uleb128 .LVL22-.Ltext0
 11682 16fe 04       		.uleb128 0x4
 11683 16ff A3       		.byte	0xa3
 11684 1700 01       		.uleb128 0x1
 11685 1701 59       		.byte	0x59
 11686 1702 9F       		.byte	0x9f
 11687 1703 04       		.byte	0x4
 11688 1704 AD01     		.uleb128 .LVL22-.Ltext0
 11689 1706 F801     		.uleb128 .LVL30-.Ltext0
 11690 1708 01       		.uleb128 0x1
 11691 1709 59       		.byte	0x59
 11692 170a 04       		.byte	0x4
 11693 170b F801     		.uleb128 .LVL30-.Ltext0
 11694 170d FB01     		.uleb128 .LVL31-.Ltext0
 11695 170f 04       		.uleb128 0x4
 11696 1710 A3       		.byte	0xa3
 11697 1711 01       		.uleb128 0x1
 11698 1712 59       		.byte	0x59
 11699 1713 9F       		.byte	0x9f
 11700 1714 04       		.byte	0x4
 11701 1715 FB01     		.uleb128 .LVL31-.Ltext0
 11702 1717 8202     		.uleb128 .LFE54-.Ltext0
 11703 1719 01       		.uleb128 0x1
 11704 171a 59       		.byte	0x59
 11705 171b 00       		.byte	0
 11706              	.LVUS10:
 11707 171c 01       		.uleb128 .LVU26
 11708 171d 00       		.uleb128 .LVU50
 11709 171e 00       		.uleb128 .LVU54
 11710 171f 00       		.uleb128 .LVU55
 11711 1720 00       		.uleb128 .LVU55
 11712 1721 00       		.uleb128 .LVU78
 11713 1722 00       		.uleb128 .LVU79
 11714 1723 00       		.uleb128 0
 11715              	.LLST10:
 11716 1724 04       		.byte	0x4
 11717 1725 52       		.uleb128 .LVL10-.Ltext0
 11718 1726 A301     		.uleb128 .LVL21-.Ltext0
 11719 1728 02       		.uleb128 0x2
 11720 1729 30       		.byte	0x30
 11721 172a 9F       		.byte	0x9f
 11722 172b 04       		.byte	0x4
GAS LISTING /tmp/cceaV4lG.s 			page 235


 11723 172c AD01     		.uleb128 .LVL22-.Ltext0
 11724 172e B401     		.uleb128 .LVL23-.Ltext0
 11725 1730 02       		.uleb128 0x2
 11726 1731 30       		.byte	0x30
 11727 1732 9F       		.byte	0x9f
 11728 1733 04       		.byte	0x4
 11729 1734 B401     		.uleb128 .LVL23-.Ltext0
 11730 1736 F801     		.uleb128 .LVL30-.Ltext0
 11731 1738 01       		.uleb128 0x1
 11732 1739 5B       		.byte	0x5b
 11733 173a 04       		.byte	0x4
 11734 173b FB01     		.uleb128 .LVL31-.Ltext0
 11735 173d 8202     		.uleb128 .LFE54-.Ltext0
 11736 173f 02       		.uleb128 0x2
 11737 1740 30       		.byte	0x30
 11738 1741 9F       		.byte	0x9f
 11739 1742 00       		.byte	0
 11740              	.LVUS11:
 11741 1743 01       		.uleb128 .LVU26
 11742 1744 00       		.uleb128 .LVU34
 11743 1745 00       		.uleb128 .LVU34
 11744 1746 00       		.uleb128 .LVU36
 11745 1747 00       		.uleb128 .LVU37
 11746 1748 00       		.uleb128 .LVU46
 11747 1749 00       		.uleb128 .LVU46
 11748 174a 00       		.uleb128 .LVU50
 11749 174b 00       		.uleb128 .LVU54
 11750 174c 00       		.uleb128 .LVU55
 11751 174d 00       		.uleb128 .LVU55
 11752 174e 00       		.uleb128 .LVU58
 11753 174f 00       		.uleb128 .LVU62
 11754 1750 00       		.uleb128 .LVU72
 11755 1751 00       		.uleb128 .LVU79
 11756 1752 00       		.uleb128 0
 11757              	.LLST11:
 11758 1753 04       		.byte	0x4
 11759 1754 52       		.uleb128 .LVL10-.Ltext0
 11760 1755 69       		.uleb128 .LVL12-.Ltext0
 11761 1756 02       		.uleb128 0x2
 11762 1757 31       		.byte	0x31
 11763 1758 9F       		.byte	0x9f
 11764 1759 04       		.byte	0x4
 11765 175a 69       		.uleb128 .LVL12-.Ltext0
 11766 175b 6C       		.uleb128 .LVL13-.Ltext0
 11767 175c 01       		.uleb128 0x1
 11768 175d 50       		.byte	0x50
 11769 175e 04       		.byte	0x4
 11770 175f 6E       		.uleb128 .LVL14-.Ltext0
 11771 1760 9401     		.uleb128 .LVL20-.Ltext0
 11772 1762 01       		.uleb128 0x1
 11773 1763 50       		.byte	0x50
 11774 1764 04       		.byte	0x4
 11775 1765 9401     		.uleb128 .LVL20-.Ltext0
 11776 1767 A301     		.uleb128 .LVL21-.Ltext0
 11777 1769 02       		.uleb128 0x2
 11778 176a 31       		.byte	0x31
 11779 176b 9F       		.byte	0x9f
GAS LISTING /tmp/cceaV4lG.s 			page 236


 11780 176c 04       		.byte	0x4
 11781 176d AD01     		.uleb128 .LVL22-.Ltext0
 11782 176f B401     		.uleb128 .LVL23-.Ltext0
 11783 1771 02       		.uleb128 0x2
 11784 1772 31       		.byte	0x31
 11785 1773 9F       		.byte	0x9f
 11786 1774 04       		.byte	0x4
 11787 1775 B401     		.uleb128 .LVL23-.Ltext0
 11788 1777 BA01     		.uleb128 .LVL24-.Ltext0
 11789 1779 01       		.uleb128 0x1
 11790 177a 50       		.byte	0x50
 11791 177b 04       		.byte	0x4
 11792 177c C701     		.uleb128 .LVL27-.Ltext0
 11793 177e E101     		.uleb128 .LVL29-.Ltext0
 11794 1780 01       		.uleb128 0x1
 11795 1781 50       		.byte	0x50
 11796 1782 04       		.byte	0x4
 11797 1783 FB01     		.uleb128 .LVL31-.Ltext0
 11798 1785 8202     		.uleb128 .LFE54-.Ltext0
 11799 1787 02       		.uleb128 0x2
 11800 1788 31       		.byte	0x31
 11801 1789 9F       		.byte	0x9f
 11802 178a 00       		.byte	0
 11803              	.LVUS12:
 11804 178b 03       		.uleb128 .LVU28
 11805 178c 00       		.uleb128 .LVU34
 11806 178d 00       		.uleb128 .LVU34
 11807 178e 00       		.uleb128 .LVU41
 11808 178f 00       		.uleb128 .LVU41
 11809 1790 00       		.uleb128 .LVU50
 11810 1791 00       		.uleb128 .LVU54
 11811 1792 00       		.uleb128 .LVU55
 11812 1793 00       		.uleb128 .LVU55
 11813 1794 01       		.uleb128 .LVU60
 11814 1795 01       		.uleb128 .LVU60
 11815 1796 00       		.uleb128 .LVU61
 11816 1797 00       		.uleb128 .LVU62
 11817 1798 00       		.uleb128 .LVU72
 11818 1799 00       		.uleb128 .LVU79
 11819 179a 00       		.uleb128 0
 11820              	.LLST12:
 11821 179b 04       		.byte	0x4
 11822 179c 52       		.uleb128 .LVL10-.Ltext0
 11823 179d 69       		.uleb128 .LVL12-.Ltext0
 11824 179e 02       		.uleb128 0x2
 11825 179f 30       		.byte	0x30
 11826 17a0 9F       		.byte	0x9f
 11827 17a1 04       		.byte	0x4
 11828 17a2 69       		.uleb128 .LVL12-.Ltext0
 11829 17a3 79       		.uleb128 .LVL16-.Ltext0
 11830 17a4 01       		.uleb128 0x1
 11831 17a5 51       		.byte	0x51
 11832 17a6 04       		.byte	0x4
 11833 17a7 79       		.uleb128 .LVL16-.Ltext0
 11834 17a8 A301     		.uleb128 .LVL21-.Ltext0
 11835 17aa 02       		.uleb128 0x2
 11836 17ab 30       		.byte	0x30
GAS LISTING /tmp/cceaV4lG.s 			page 237


 11837 17ac 9F       		.byte	0x9f
 11838 17ad 04       		.byte	0x4
 11839 17ae AD01     		.uleb128 .LVL22-.Ltext0
 11840 17b0 B401     		.uleb128 .LVL23-.Ltext0
 11841 17b2 02       		.uleb128 0x2
 11842 17b3 30       		.byte	0x30
 11843 17b4 9F       		.byte	0x9f
 11844 17b5 04       		.byte	0x4
 11845 17b6 B401     		.uleb128 .LVL23-.Ltext0
 11846 17b8 BE01     		.uleb128 .LVL25-.Ltext0
 11847 17ba 0A       		.uleb128 0xa
 11848 17bb 72       		.byte	0x72
 11849 17bc 00       		.sleb128 0
 11850 17bd 76       		.byte	0x76
 11851 17be 00       		.sleb128 0
 11852 17bf 1C       		.byte	0x1c
 11853 17c0 A3       		.byte	0xa3
 11854 17c1 01       		.uleb128 0x1
 11855 17c2 55       		.byte	0x55
 11856 17c3 1C       		.byte	0x1c
 11857 17c4 9F       		.byte	0x9f
 11858 17c5 04       		.byte	0x4
 11859 17c6 BE01     		.uleb128 .LVL25-.Ltext0
 11860 17c8 C201     		.uleb128 .LVL26-.Ltext0
 11861 17ca 0C       		.uleb128 0xc
 11862 17cb 72       		.byte	0x72
 11863 17cc 00       		.sleb128 0
 11864 17cd 76       		.byte	0x76
 11865 17ce 00       		.sleb128 0
 11866 17cf 1C       		.byte	0x1c
 11867 17d0 A3       		.byte	0xa3
 11868 17d1 01       		.uleb128 0x1
 11869 17d2 55       		.byte	0x55
 11870 17d3 1C       		.byte	0x1c
 11871 17d4 23       		.byte	0x23
 11872 17d5 01       		.uleb128 0x1
 11873 17d6 9F       		.byte	0x9f
 11874 17d7 04       		.byte	0x4
 11875 17d8 C701     		.uleb128 .LVL27-.Ltext0
 11876 17da E101     		.uleb128 .LVL29-.Ltext0
 11877 17dc 0A       		.uleb128 0xa
 11878 17dd 72       		.byte	0x72
 11879 17de 00       		.sleb128 0
 11880 17df 76       		.byte	0x76
 11881 17e0 00       		.sleb128 0
 11882 17e1 1C       		.byte	0x1c
 11883 17e2 A3       		.byte	0xa3
 11884 17e3 01       		.uleb128 0x1
 11885 17e4 55       		.byte	0x55
 11886 17e5 1C       		.byte	0x1c
 11887 17e6 9F       		.byte	0x9f
 11888 17e7 04       		.byte	0x4
 11889 17e8 FB01     		.uleb128 .LVL31-.Ltext0
 11890 17ea 8202     		.uleb128 .LFE54-.Ltext0
 11891 17ec 02       		.uleb128 0x2
 11892 17ed 30       		.byte	0x30
 11893 17ee 9F       		.byte	0x9f
GAS LISTING /tmp/cceaV4lG.s 			page 238


 11894 17ef 00       		.byte	0
 11895              	.Ldebug_loc3:
 11896              		.section	.debug_aranges,"",@progbits
 11897 0000 2C000000 		.long	0x2c
 11898 0004 0200     		.value	0x2
 11899 0006 00000000 		.long	.Ldebug_info0
 11900 000a 08       		.byte	0x8
 11901 000b 00       		.byte	0
 11902 000c 0000     		.value	0
 11903 000e 0000     		.value	0
 11904 0010 00000000 		.quad	.Ltext0
 11904      00000000 
 11905 0018 C2090000 		.quad	.Letext0-.Ltext0
 11905      00000000 
 11906 0020 00000000 		.quad	0
 11906      00000000 
 11907 0028 00000000 		.quad	0
 11907      00000000 
 11908              		.section	.debug_rnglists,"",@progbits
 11909              	.Ldebug_ranges0:
 11910 0000 6E000000 		.long	.Ldebug_ranges3-.Ldebug_ranges2
 11911              	.Ldebug_ranges2:
 11912 0004 0500     		.value	0x5
 11913 0006 08       		.byte	0x8
 11914 0007 00       		.byte	0
 11915 0008 00000000 		.long	0
 11916              	.LLRL60:
 11917 000c 04       		.byte	0x4
 11918 000d 890A     		.uleb128 .LBB34-.Ltext0
 11919 000f 920A     		.uleb128 .LBE34-.Ltext0
 11920 0011 04       		.byte	0x4
 11921 0012 A00A     		.uleb128 .LBB40-.Ltext0
 11922 0014 A00A     		.uleb128 .LBE40-.Ltext0
 11923 0016 04       		.byte	0x4
 11924 0017 A50A     		.uleb128 .LBB41-.Ltext0
 11925 0019 AB0A     		.uleb128 .LBE41-.Ltext0
 11926 001b 00       		.byte	0
 11927              	.LLRL74:
 11928 001c 04       		.byte	0x4
 11929 001d D90A     		.uleb128 .LBB44-.Ltext0
 11930 001f E20A     		.uleb128 .LBE44-.Ltext0
 11931 0021 04       		.byte	0x4
 11932 0022 F40A     		.uleb128 .LBB52-.Ltext0
 11933 0024 F40A     		.uleb128 .LBE52-.Ltext0
 11934 0026 04       		.byte	0x4
 11935 0027 F90A     		.uleb128 .LBB53-.Ltext0
 11936 0029 FF0A     		.uleb128 .LBE53-.Ltext0
 11937 002b 00       		.byte	0
 11938              	.LLRL89:
 11939 002c 04       		.byte	0x4
 11940 002d A00B     		.uleb128 .LBB54-.Ltext0
 11941 002f A70B     		.uleb128 .LBE54-.Ltext0
 11942 0031 04       		.byte	0x4
 11943 0032 AF0B     		.uleb128 .LBB58-.Ltext0
 11944 0034 AF0B     		.uleb128 .LBE58-.Ltext0
 11945 0036 04       		.byte	0x4
 11946 0037 B40B     		.uleb128 .LBB59-.Ltext0
GAS LISTING /tmp/cceaV4lG.s 			page 239


 11947 0039 BD0B     		.uleb128 .LBE59-.Ltext0
 11948 003b 00       		.byte	0
 11949              	.LLRL108:
 11950 003c 04       		.byte	0x4
 11951 003d F60B     		.uleb128 .LBB70-.Ltext0
 11952 003f FB0B     		.uleb128 .LBE70-.Ltext0
 11953 0041 04       		.byte	0x4
 11954 0042 FF0B     		.uleb128 .LBB73-.Ltext0
 11955 0044 810C     		.uleb128 .LBE73-.Ltext0
 11956 0046 00       		.byte	0
 11957              	.LLRL117:
 11958 0047 04       		.byte	0x4
 11959 0048 A20C     		.uleb128 .LBB74-.Ltext0
 11960 004a AB0C     		.uleb128 .LBE74-.Ltext0
 11961 004c 04       		.byte	0x4
 11962 004d AF0C     		.uleb128 .LBB78-.Ltext0
 11963 004f AF0C     		.uleb128 .LBE78-.Ltext0
 11964 0051 04       		.byte	0x4
 11965 0052 B40C     		.uleb128 .LBB79-.Ltext0
 11966 0054 BB0C     		.uleb128 .LBE79-.Ltext0
 11967 0056 00       		.byte	0
 11968              	.LLRL128:
 11969 0057 04       		.byte	0x4
 11970 0058 DF0C     		.uleb128 .LBB80-.Ltext0
 11971 005a E60C     		.uleb128 .LBE80-.Ltext0
 11972 005c 04       		.byte	0x4
 11973 005d EE0C     		.uleb128 .LBB84-.Ltext0
 11974 005f EE0C     		.uleb128 .LBE84-.Ltext0
 11975 0061 04       		.byte	0x4
 11976 0062 F30C     		.uleb128 .LBB85-.Ltext0
 11977 0064 FA0C     		.uleb128 .LBE85-.Ltext0
 11978 0066 00       		.byte	0
 11979              	.LLRL151:
 11980 0067 04       		.byte	0x4
 11981 0068 E40E     		.uleb128 .LBB94-.Ltext0
 11982 006a E80E     		.uleb128 .LBE94-.Ltext0
 11983 006c 04       		.byte	0x4
 11984 006d EC0E     		.uleb128 .LBB97-.Ltext0
 11985 006f A20F     		.uleb128 .LBE97-.Ltext0
 11986 0071 00       		.byte	0
 11987              	.Ldebug_ranges3:
 11988              		.section	.debug_line,"",@progbits
 11989              	.Ldebug_line0:
 11990 0000 1D100000 		.section	.debug_str,"MS",@progbits,1
 11990      05000800 
 11990      8D000000 
 11990      010101FB 
 11990      0E0D0001 
 11991              	.LASF51:
 11992 0000 67657465 		.string	"getenv"
 11992      6E7600
 11993              	.LASF98:
 11994 0007 6275665F 		.string	"buf_pos"
 11994      706F7300 
 11995              	.LASF123:
 11996 000f 72616E64 		.string	"rand"
 11996      00
GAS LISTING /tmp/cceaV4lG.s 			page 240


 11997              	.LASF79:
 11998 0014 7061645F 		.string	"pad_type"
 11998      74797065 
 11998      00
 11999              	.LASF108:
 12000 001d 5F75746F 		.string	"_utoh8"
 12000      683800
 12001              	.LASF63:
 12002 0024 73797374 		.string	"system"
 12002      656D00
 12003              	.LASF67:
 12004 002b 5F5A5374 		.string	"_ZSt3divll"
 12004      33646976 
 12004      6C6C00
 12005              	.LASF53:
 12006 0036 6D626C65 		.string	"mblen"
 12006      6E00
 12007              	.LASF4:
 12008 003c 756E7369 		.string	"unsigned int"
 12008      676E6564 
 12008      20696E74 
 12008      00
 12009              	.LASF66:
 12010 0049 5F5F676E 		.string	"__gnu_cxx"
 12010      755F6378 
 12010      7800
 12011              	.LASF12:
 12012 0053 5F5F696E 		.string	"__int32_t"
 12012      7433325F 
 12012      7400
 12013              	.LASF112:
 12014 005d 68737472 		.string	"hstr_to_uint8"
 12014      5F746F5F 
 12014      75696E74 
 12014      3800
 12015              	.LASF55:
 12016 006b 77636861 		.string	"wchar_t"
 12016      725F7400 
 12017              	.LASF97:
 12018 0073 636F6E76 		.string	"conv_len"
 12018      5F6C656E 
 12018      00
 12019              	.LASF68:
 12020 007c 5F5A4E39 		.string	"_ZN9__gnu_cxx3divExx"
 12020      5F5F676E 
 12020      755F6378 
 12020      78336469 
 12020      76457878 
 12021              	.LASF72:
 12022 0091 73747274 		.string	"strtoull"
 12022      6F756C6C 
 12022      00
 12023              	.LASF90:
 12024 009a 64617461 		.string	"data_in"
 12024      5F696E00 
 12025              	.LASF42:
 12026 00a2 5F5A5374 		.string	"_ZSt3absd"
GAS LISTING /tmp/cceaV4lG.s 			page 241


 12026      33616273 
 12026      6400
 12027              	.LASF40:
 12028 00ac 5F5A5374 		.string	"_ZSt3abse"
 12028      33616273 
 12028      6500
 12029              	.LASF41:
 12030 00b6 5F5A5374 		.string	"_ZSt3absf"
 12030      33616273 
 12030      6600
 12031              	.LASF38:
 12032 00c0 5F5A5374 		.string	"_ZSt3absg"
 12032      33616273 
 12032      6700
 12033              	.LASF44:
 12034 00ca 5F5A5374 		.string	"_ZSt3absl"
 12034      33616273 
 12034      6C00
 12035              	.LASF74:
 12036 00d4 73747274 		.string	"strtold"
 12036      6F6C6400 
 12037              	.LASF39:
 12038 00dc 5F5A5374 		.string	"_ZSt3absn"
 12038      33616273 
 12038      6E00
 12039              	.LASF71:
 12040 00e6 73747274 		.string	"strtoll"
 12040      6F6C6C00 
 12041              	.LASF21:
 12042 00ee 75696E74 		.string	"uint32_t"
 12042      33325F74 
 12042      00
 12043              	.LASF16:
 12044 00f7 696E7438 		.string	"int8_t"
 12044      5F7400
 12045              	.LASF56:
 12046 00fe 6D62746F 		.string	"mbtowc"
 12046      776300
 12047              	.LASF85:
 12048 0105 5F776972 		.string	"_wiretou32"
 12048      65746F75 
 12048      333200
 12049              	.LASF25:
 12050 0110 666C6F61 		.string	"float"
 12050      7400
 12051              	.LASF95:
 12052 0116 70616464 		.string	"padding_type"
 12052      696E675F 
 12052      74797065 
 12052      00
 12053              	.LASF121:
 12054 0123 5F5F6C65 		.string	"__len"
 12054      6E00
 12055              	.LASF17:
 12056 0129 696E7431 		.string	"int16_t"
 12056      365F7400 
 12057              	.LASF36:
GAS LISTING /tmp/cceaV4lG.s 			page 242


 12058 0131 6C6F6E67 		.string	"long long unsigned int"
 12058      206C6F6E 
 12058      6720756E 
 12058      7369676E 
 12058      65642069 
 12059              	.LASF84:
 12060 0148 62756630 		.string	"buf0"
 12060      00
 12061              	.LASF11:
 12062 014d 5F5F7569 		.string	"__uint16_t"
 12062      6E743136 
 12062      5F7400
 12063              	.LASF117:
 12064 0158 7374725F 		.string	"str_to_uint8"
 12064      746F5F75 
 12064      696E7438 
 12064      00
 12065              	.LASF69:
 12066 0165 6C6C6469 		.string	"lldiv"
 12066      7600
 12067              	.LASF70:
 12068 016b 61746F6C 		.string	"atoll"
 12068      6C00
 12069              	.LASF119:
 12070 0171 5F5F6465 		.string	"__dest"
 12070      737400
 12071              	.LASF122:
 12072 0178 474E5520 		.string	"GNU C++17 12.2.1 20230121 -mtune=generic -march=x86-64 -ggdb -O1 -fopenmp"
 12072      432B2B31 
 12072      37203132 
 12072      2E322E31 
 12072      20323032 
 12073              	.LASF22:
 12074 01c2 73697A65 		.string	"size_t"
 12074      5F7400
 12075              	.LASF114:
 12076 01c9 7369676E 		.string	"sign"
 12076      00
 12077              	.LASF59:
 12078 01ce 7372616E 		.string	"srand"
 12078      6400
 12079              	.LASF77:
 12080 01d4 5041445F 		.string	"PAD_ZEROES"
 12080      5A45524F 
 12080      455300
 12081              	.LASF111:
 12082 01df 68737472 		.string	"hstr_to_uint16"
 12082      5F746F5F 
 12082      75696E74 
 12082      313600
 12083              	.LASF115:
 12084 01ee 7374725F 		.string	"str_to_uint32"
 12084      746F5F75 
 12084      696E7433 
 12084      3200
 12085              	.LASF50:
 12086 01fc 62736561 		.string	"bsearch"
GAS LISTING /tmp/cceaV4lG.s 			page 243


 12086      72636800 
 12087              	.LASF24:
 12088 0204 5F5F666C 		.string	"__float128"
 12088      6F617431 
 12088      323800
 12089              	.LASF107:
 12090 020f 5F75746F 		.string	"_utoh16"
 12090      68313600 
 12091              	.LASF93:
 12092 0217 70726570 		.string	"prepend_padding"
 12092      656E645F 
 12092      70616464 
 12092      696E6700 
 12093              	.LASF76:
 12094 0227 5041445F 		.string	"PAD_NONE"
 12094      4E4F4E45 
 12094      00
 12095              	.LASF15:
 12096 0230 63686172 		.string	"char"
 12096      00
 12097              	.LASF30:
 12098 0235 35646976 		.string	"5div_t"
 12098      5F7400
 12099              	.LASF125:
 12100 023c 6D656D32 		.string	"mem2ascii"
 12100      61736369 
 12100      6900
 12101              	.LASF113:
 12102 0246 7374725F 		.string	"str_to_int32"
 12102      746F5F69 
 12102      6E743332 
 12102      00
 12103              	.LASF57:
 12104 0253 71756963 		.string	"quick_exit"
 12104      6B5F6578 
 12104      697400
 12105              	.LASF19:
 12106 025e 75696E74 		.string	"uint8_t"
 12106      385F7400 
 12107              	.LASF28:
 12108 0266 71756F74 		.string	"quot"
 12108      00
 12109              	.LASF110:
 12110 026b 68737472 		.string	"hstr_to_uint32"
 12110      5F746F5F 
 12110      75696E74 
 12110      333200
 12111              	.LASF54:
 12112 027a 6D627374 		.string	"mbstowcs"
 12112      6F776373 
 12112      00
 12113              	.LASF100:
 12114 0283 5F693136 		.string	"_i16toa"
 12114      746F6100 
 12115              	.LASF96:
 12116 028b 74617267 		.string	"target_len"
 12116      65745F6C 
GAS LISTING /tmp/cceaV4lG.s 			page 244


 12116      656E00
 12117              	.LASF127:
 12118 0296 5F75696E 		.string	"_uint32toa"
 12118      74333274 
 12118      6F6100
 12119              	.LASF34:
 12120 02a1 6C6F6E67 		.string	"long long int"
 12120      206C6F6E 
 12120      6720696E 
 12120      7400
 12121              	.LASF126:
 12122 02af 5F75696E 		.string	"_uint16toa"
 12122      74313674 
 12122      6F6100
 12123              	.LASF106:
 12124 02ba 5F75746F 		.string	"_utoh32"
 12124      68333200 
 12125              	.LASF9:
 12126 02c2 5F5F696E 		.string	"__int16_t"
 12126      7431365F 
 12126      7400
 12127              	.LASF52:
 12128 02cc 6C646976 		.string	"ldiv"
 12128      00
 12129              	.LASF37:
 12130 02d1 5F5F636F 		.string	"__compar_fn_t"
 12130      6D706172 
 12130      5F666E5F 
 12130      7400
 12131              	.LASF23:
 12132 02df 5F5F756E 		.string	"__unknown__"
 12132      6B6E6F77 
 12132      6E5F5F00 
 12133              	.LASF83:
 12134 02eb 7365656B 		.string	"seek"
 12134      00
 12135              	.LASF87:
 12136 02f0 5F666C69 		.string	"_flip_u16"
 12136      705F7531 
 12136      3600
 12137              	.LASF7:
 12138 02fa 5F5F696E 		.string	"__int8_t"
 12138      74385F74 
 12138      00
 12139              	.LASF82:
 12140 0303 7374726C 		.string	"strlen"
 12140      656E00
 12141              	.LASF27:
 12142 030a 6C6F6E67 		.string	"long double"
 12142      20646F75 
 12142      626C6500 
 12143              	.LASF20:
 12144 0316 75696E74 		.string	"uint16_t"
 12144      31365F74 
 12144      00
 12145              	.LASF116:
 12146 031f 7374725F 		.string	"str_to_uint16"
GAS LISTING /tmp/cceaV4lG.s 			page 245


 12146      746F5F75 
 12146      696E7431 
 12146      3600
 12147              	.LASF89:
 12148 032d 6465635F 		.string	"dec_to_bcd"
 12148      746F5F62 
 12148      636400
 12149              	.LASF78:
 12150 0338 5041445F 		.string	"PAD_SPACES"
 12150      53504143 
 12150      455300
 12151              	.LASF10:
 12152 0343 73686F72 		.string	"short int"
 12152      7420696E 
 12152      7400
 12153              	.LASF124:
 12154 034d 38706164 		.string	"8pad_type"
 12154      5F747970 
 12154      6500
 12155              	.LASF14:
 12156 0357 6C6F6E67 		.string	"long int"
 12156      20696E74 
 12156      00
 12157              	.LASF99:
 12158 0360 70616464 		.string	"padding_char"
 12158      696E675F 
 12158      63686172 
 12158      00
 12159              	.LASF45:
 12160 036d 61746578 		.string	"atexit"
 12160      697400
 12161              	.LASF86:
 12162 0374 5F666C69 		.string	"_flip_u32"
 12162      705F7533 
 12162      3200
 12163              	.LASF102:
 12164 037e 5F75746F 		.string	"_utoa"
 12164      6100
 12165              	.LASF103:
 12166 0384 5F75746F 		.string	"_utob"
 12166      6200
 12167              	.LASF104:
 12168 038a 5F75746F 		.string	"_utorh"
 12168      726800
 12169              	.LASF32:
 12170 0391 6C646976 		.string	"ldiv_t"
 12170      5F7400
 12171              	.LASF8:
 12172 0398 5F5F7569 		.string	"__uint8_t"
 12172      6E74385F 
 12172      7400
 12173              	.LASF80:
 12174 03a2 6865785F 		.string	"hex_ascii"
 12174      61736369 
 12174      6900
 12175              	.LASF46:
 12176 03ac 61745F71 		.string	"at_quick_exit"
GAS LISTING /tmp/cceaV4lG.s 			page 246


 12176      7569636B 
 12176      5F657869 
 12176      7400
 12177              	.LASF105:
 12178 03ba 7061645F 		.string	"pad_size"
 12178      73697A65 
 12178      00
 12179              	.LASF62:
 12180 03c3 73747274 		.string	"strtoul"
 12180      6F756C00 
 12181              	.LASF5:
 12182 03cb 6C6F6E67 		.string	"long unsigned int"
 12182      20756E73 
 12182      69676E65 
 12182      6420696E 
 12182      7400
 12183              	.LASF18:
 12184 03dd 696E7433 		.string	"int32_t"
 12184      325F7400 
 12185              	.LASF101:
 12186 03e5 5F69746F 		.string	"_itoa"
 12186      6100
 12187              	.LASF92:
 12188 03eb 62797465 		.string	"byte"
 12188      00
 12189              	.LASF75:
 12190 03f0 5F5F696E 		.string	"__int128"
 12190      74313238 
 12190      00
 12191              	.LASF29:
 12192 03f9 6469765F 		.string	"div_t"
 12192      7400
 12193              	.LASF2:
 12194 03ff 756E7369 		.string	"unsigned char"
 12194      676E6564 
 12194      20636861 
 12194      7200
 12195              	.LASF13:
 12196 040d 5F5F7569 		.string	"__uint32_t"
 12196      6E743332 
 12196      5F7400
 12197              	.LASF43:
 12198 0418 5F5A5374 		.string	"_ZSt3absx"
 12198      33616273 
 12198      7800
 12199              	.LASF120:
 12200 0422 5F5F7372 		.string	"__src"
 12200      6300
 12201              	.LASF60:
 12202 0428 73747274 		.string	"strtod"
 12202      6F6400
 12203              	.LASF73:
 12204 042f 73747274 		.string	"strtof"
 12204      6F6600
 12205              	.LASF64:
 12206 0436 77637374 		.string	"wcstombs"
 12206      6F6D6273 
GAS LISTING /tmp/cceaV4lG.s 			page 247


 12206      00
 12207              	.LASF61:
 12208 043f 73747274 		.string	"strtol"
 12208      6F6C00
 12209              	.LASF31:
 12210 0446 366C6469 		.string	"6ldiv_t"
 12210      765F7400 
 12211              	.LASF91:
 12212 044e 64617461 		.string	"data_out"
 12212      5F6F7574 
 12212      00
 12213              	.LASF33:
 12214 0457 376C6C64 		.string	"7lldiv_t"
 12214      69765F74 
 12214      00
 12215              	.LASF6:
 12216 0460 7369676E 		.string	"signed char"
 12216      65642063 
 12216      68617200 
 12217              	.LASF3:
 12218 046c 73686F72 		.string	"short unsigned int"
 12218      7420756E 
 12218      7369676E 
 12218      65642069 
 12218      6E7400
 12219              	.LASF88:
 12220 047f 6263645F 		.string	"bcd_to_dec"
 12220      746F5F64 
 12220      656300
 12221              	.LASF35:
 12222 048a 6C6C6469 		.string	"lldiv_t"
 12222      765F7400 
 12223              	.LASF118:
 12224 0492 6D656D63 		.string	"memcpy"
 12224      707900
 12225              	.LASF47:
 12226 0499 61746F66 		.string	"atof"
 12226      00
 12227              	.LASF48:
 12228 049e 61746F69 		.string	"atoi"
 12228      00
 12229              	.LASF49:
 12230 04a3 61746F6C 		.string	"atol"
 12230      00
 12231              	.LASF109:
 12232 04a8 5F75746F 		.string	"_utoh"
 12232      6800
 12233              	.LASF81:
 12234 04ae 63617073 		.string	"caps_hex_ascii"
 12234      5F686578 
 12234      5F617363 
 12234      696900
 12235              	.LASF65:
 12236 04bd 7763746F 		.string	"wctomb"
 12236      6D6200
 12237              	.LASF26:
 12238 04c4 646F7562 		.string	"double"
GAS LISTING /tmp/cceaV4lG.s 			page 248


 12238      6C6500
 12239              	.LASF94:
 12240 04cb 636F6E76 		.string	"converted_buf"
 12240      65727465 
 12240      645F6275 
 12240      6600
 12241              	.LASF58:
 12242 04d9 71736F72 		.string	"qsort"
 12242      7400
 12243              		.section	.debug_line_str,"MS",@progbits,1
 12244              	.LASF1:
 12245 0000 2F686F6D 		.string	"/home/prodan/_work/linux/radar/radar_img_create"
 12245      652F7072 
 12245      6F64616E 
 12245      2F5F776F 
 12245      726B2F6C 
 12246              	.LASF0:
 12247 0030 6C69625F 		.string	"lib_convert.cpp"
 12247      636F6E76 
 12247      6572742E 
 12247      63707000 
 12248              		.ident	"GCC: (Gentoo Hardened 12.2.1_p20230121-r1 p10) 12.2.1 20230121"
 12249 0040 2F686F6D 		.section	.note.GNU-stack,"",@progbits
 12249      652F7072 
 12249      6F64616E 
 12249      2F5F776F 
 12249      726B2F6C 
