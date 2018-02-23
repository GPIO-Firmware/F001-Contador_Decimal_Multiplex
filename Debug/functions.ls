   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
2937                     ; 3 void PORT_INIT (void)
2937                     ; 4 {
2939                     	switch	.text
2940  0000               _PORT_INIT:
2944                     ; 6 	PD_DDR=0xFF; 
2946  0000 35ff5011      	mov	_PD_DDR,#255
2947                     ; 7 	PE_DDR=0x20;
2949  0004 35205016      	mov	_PE_DDR,#32
2950                     ; 8 	PC_DDR=0xFF; 
2952  0008 35ff500c      	mov	_PC_DDR,#255
2953                     ; 9 }
2956  000c 81            	ret
2990                     .const:	section	.text
2991  0000               L01:
2992  0000 000002d0      	dc.l	720
2993                     ; 11 void delay_ms (unsigned long int I)
2993                     ; 12 {
2994                     	switch	.text
2995  000d               _delay_ms:
2997       00000000      OFST:	set	0
3000                     ; 14 	I=(I*(clock*45))/4;
3002  000d 96            	ldw	x,sp
3003  000e 1c0003        	addw	x,#OFST+3
3004  0011 cd0000        	call	c_ltor
3006  0014 ae0000        	ldw	x,#L01
3007  0017 cd0000        	call	c_lmul
3009  001a a602          	ld	a,#2
3010  001c cd0000        	call	c_lursh
3012  001f 96            	ldw	x,sp
3013  0020 1c0003        	addw	x,#OFST+3
3014  0023 cd0000        	call	c_rtol
3017  0026 2009          	jra	L7702
3018  0028               L3702:
3019                     ; 15 	for (;I>0;I--);
3022  0028 96            	ldw	x,sp
3023  0029 1c0003        	addw	x,#OFST+3
3024  002c a601          	ld	a,#1
3025  002e cd0000        	call	c_lgsbc
3027  0031               L7702:
3030  0031 96            	ldw	x,sp
3031  0032 1c0003        	addw	x,#OFST+3
3032  0035 cd0000        	call	c_lzmp
3034  0038 26ee          	jrne	L3702
3035                     ; 16 }
3038  003a 81            	ret
3065                     ; 18 void clock_config (void)
3065                     ; 19 {
3066                     	switch	.text
3067  003b               _clock_config:
3071                     ; 20 	CLK_ICKCR=0x01; // Cada bit é uma função (Habilitamos a função HSIEN)
3073  003b 350150c0      	mov	_CLK_ICKCR,#1
3074                     ; 21 	CLK_ECKCR=0x00; // Registrador que habilita e desabilita o clock externo
3076  003f 725f50c1      	clr	_CLK_ECKCR
3077                     ; 22 	CLK_CMSR=0xE1; // Habilita o clock interno 
3079  0043 35e150c3      	mov	_CLK_CMSR,#225
3080                     ; 23 	CLK_CKDIVR=0x00; //Divisão do click interno >> 16MHz/1
3082  0047 725f50c6      	clr	_CLK_CKDIVR
3083                     ; 24 }
3086  004b 81            	ret
3122                     ; 26 void WRITE_DISPLAY (char c)
3122                     ; 27 {
3123                     	switch	.text
3124  004c               _WRITE_DISPLAY:
3128                     ; 28 	switch (c)
3131                     ; 119 						break;
3132  004c 4d            	tnz	a
3133  004d 2734          	jreq	L3112
3134  004f 4a            	dec	a
3135  0050 2751          	jreq	L5112
3136  0052 4a            	dec	a
3137  0053 276e          	jreq	L7112
3138  0055 4a            	dec	a
3139  0056 2603cc00e3    	jreq	L1212
3140  005b 4a            	dec	a
3141  005c 2603          	jrne	L61
3142  005e cc0103        	jp	L3212
3143  0061               L61:
3144  0061 4a            	dec	a
3145  0062 2603          	jrne	L02
3146  0064 cc0122        	jp	L5212
3147  0067               L02:
3148  0067 4a            	dec	a
3149  0068 2603          	jrne	L22
3150  006a cc0140        	jp	L7212
3151  006d               L22:
3152  006d 4a            	dec	a
3153  006e 2603          	jrne	L42
3154  0070 cc015e        	jp	L1312
3155  0073               L42:
3156  0073 4a            	dec	a
3157  0074 2603          	jrne	L62
3158  0076 cc017c        	jp	L3312
3159  0079               L62:
3160  0079 4a            	dec	a
3161  007a 2603          	jrne	L03
3162  007c cc019a        	jp	L5312
3163  007f               L03:
3164  007f acb601b6      	jpf	L7512
3165  0083               L3112:
3166                     ; 30 		case 0: 
3166                     ; 31 						SEG_A_ON;
3168  0083 7215500f      	bres	_PD_ODR,#2
3169                     ; 32 						SEG_B_ON;
3171  0087 7211500f      	bres	_PD_ODR,#0
3172                     ; 33 						SEG_C_ON;
3174  008b 721f500a      	bres	_PC_ODR,#7
3175                     ; 34 						SEG_D_ON;
3177  008f 721d500a      	bres	_PC_ODR,#6
3178                     ; 35 						SEG_E_ON;
3180  0093 721b500a      	bres	_PC_ODR,#5
3181                     ; 36 						SEG_F_ON;
3183  0097 7219500a      	bres	_PC_ODR,#4
3184                     ; 37 						SEG_G_OF;
3186  009b 7216500a      	bset	_PC_ODR,#3
3187                     ; 38 						break;
3189  009f acb601b6      	jpf	L7512
3190  00a3               L5112:
3191                     ; 39 		case 1:
3191                     ; 40 						SEG_A_OF;
3193  00a3 7214500f      	bset	_PD_ODR,#2
3194                     ; 41 						SEG_B_ON;
3196  00a7 7211500f      	bres	_PD_ODR,#0
3197                     ; 42 						SEG_C_ON;
3199  00ab 721f500a      	bres	_PC_ODR,#7
3200                     ; 43 						SEG_D_OF;
3202  00af 721c500a      	bset	_PC_ODR,#6
3203                     ; 44 						SEG_E_OF;
3205  00b3 721a500a      	bset	_PC_ODR,#5
3206                     ; 45 						SEG_F_OF;
3208  00b7 7218500a      	bset	_PC_ODR,#4
3209                     ; 46 						SEG_G_OF;
3211  00bb 7216500a      	bset	_PC_ODR,#3
3212                     ; 47 						break;
3214  00bf acb601b6      	jpf	L7512
3215  00c3               L7112:
3216                     ; 48 		case 2: 
3216                     ; 49 						SEG_A_ON;
3218  00c3 7215500f      	bres	_PD_ODR,#2
3219                     ; 50 						SEG_B_ON;
3221  00c7 7211500f      	bres	_PD_ODR,#0
3222                     ; 51 						SEG_C_OF;
3224  00cb 721e500a      	bset	_PC_ODR,#7
3225                     ; 52 						SEG_D_ON;
3227  00cf 721d500a      	bres	_PC_ODR,#6
3228                     ; 53 						SEG_E_ON;
3230  00d3 721b500a      	bres	_PC_ODR,#5
3231                     ; 54 						SEG_F_OF;
3233  00d7 7218500a      	bset	_PC_ODR,#4
3234                     ; 55 						SEG_G_ON;
3236  00db 7217500a      	bres	_PC_ODR,#3
3237                     ; 56 						break;
3239  00df acb601b6      	jpf	L7512
3240  00e3               L1212:
3241                     ; 57 		case 3:
3241                     ; 58 						SEG_A_ON;
3243  00e3 7215500f      	bres	_PD_ODR,#2
3244                     ; 59 						SEG_B_ON;
3246  00e7 7211500f      	bres	_PD_ODR,#0
3247                     ; 60 						SEG_C_ON;
3249  00eb 721f500a      	bres	_PC_ODR,#7
3250                     ; 61 						SEG_D_ON;
3252  00ef 721d500a      	bres	_PC_ODR,#6
3253                     ; 62 						SEG_E_OF;
3255  00f3 721a500a      	bset	_PC_ODR,#5
3256                     ; 63 						SEG_F_OF;
3258  00f7 7218500a      	bset	_PC_ODR,#4
3259                     ; 64 						SEG_G_ON;
3261  00fb 7217500a      	bres	_PC_ODR,#3
3262                     ; 65 						break;
3264  00ff acb601b6      	jpf	L7512
3265  0103               L3212:
3266                     ; 66 		case 4:
3266                     ; 67 						SEG_A_OF;
3268  0103 7214500f      	bset	_PD_ODR,#2
3269                     ; 68 						SEG_B_ON;
3271  0107 7211500f      	bres	_PD_ODR,#0
3272                     ; 69 						SEG_C_ON;
3274  010b 721f500a      	bres	_PC_ODR,#7
3275                     ; 70 						SEG_D_OF;
3277  010f 721c500a      	bset	_PC_ODR,#6
3278                     ; 71 						SEG_E_OF;
3280  0113 721a500a      	bset	_PC_ODR,#5
3281                     ; 72 						SEG_F_ON;
3283  0117 7219500a      	bres	_PC_ODR,#4
3284                     ; 73 						SEG_G_ON;
3286  011b 7217500a      	bres	_PC_ODR,#3
3287                     ; 74 						break;
3289  011f cc01b6        	jra	L7512
3290  0122               L5212:
3291                     ; 75 		case 5:
3291                     ; 76 						SEG_A_ON;
3293  0122 7215500f      	bres	_PD_ODR,#2
3294                     ; 77 						SEG_B_OF;
3296  0126 7210500f      	bset	_PD_ODR,#0
3297                     ; 78 						SEG_C_ON;
3299  012a 721f500a      	bres	_PC_ODR,#7
3300                     ; 79 						SEG_D_ON;
3302  012e 721d500a      	bres	_PC_ODR,#6
3303                     ; 80 						SEG_E_OF;
3305  0132 721a500a      	bset	_PC_ODR,#5
3306                     ; 81 						SEG_F_ON;
3308  0136 7219500a      	bres	_PC_ODR,#4
3309                     ; 82 						SEG_G_ON;
3311  013a 7217500a      	bres	_PC_ODR,#3
3312                     ; 83 						break;
3314  013e 2076          	jra	L7512
3315  0140               L7212:
3316                     ; 84 		case 6:
3316                     ; 85 						SEG_A_ON;
3318  0140 7215500f      	bres	_PD_ODR,#2
3319                     ; 86 						SEG_B_OF;
3321  0144 7210500f      	bset	_PD_ODR,#0
3322                     ; 87 						SEG_C_ON;
3324  0148 721f500a      	bres	_PC_ODR,#7
3325                     ; 88 						SEG_D_ON;
3327  014c 721d500a      	bres	_PC_ODR,#6
3328                     ; 89 						SEG_E_ON;
3330  0150 721b500a      	bres	_PC_ODR,#5
3331                     ; 90 						SEG_F_ON;
3333  0154 7219500a      	bres	_PC_ODR,#4
3334                     ; 91 						SEG_G_ON;
3336  0158 7217500a      	bres	_PC_ODR,#3
3337                     ; 92 						break;
3339  015c 2058          	jra	L7512
3340  015e               L1312:
3341                     ; 93 		case 7:
3341                     ; 94 						SEG_A_ON;
3343  015e 7215500f      	bres	_PD_ODR,#2
3344                     ; 95 						SEG_B_ON;
3346  0162 7211500f      	bres	_PD_ODR,#0
3347                     ; 96 						SEG_C_ON;
3349  0166 721f500a      	bres	_PC_ODR,#7
3350                     ; 97 						SEG_D_OF;
3352  016a 721c500a      	bset	_PC_ODR,#6
3353                     ; 98 						SEG_E_OF;
3355  016e 721a500a      	bset	_PC_ODR,#5
3356                     ; 99 						SEG_F_OF;
3358  0172 7218500a      	bset	_PC_ODR,#4
3359                     ; 100 						SEG_G_OF;
3361  0176 7216500a      	bset	_PC_ODR,#3
3362                     ; 101 						break;
3364  017a 203a          	jra	L7512
3365  017c               L3312:
3366                     ; 102 		case 8:
3366                     ; 103 						SEG_A_ON;
3368  017c 7215500f      	bres	_PD_ODR,#2
3369                     ; 104 						SEG_B_ON;
3371  0180 7211500f      	bres	_PD_ODR,#0
3372                     ; 105 						SEG_C_ON;
3374  0184 721f500a      	bres	_PC_ODR,#7
3375                     ; 106 						SEG_D_ON;
3377  0188 721d500a      	bres	_PC_ODR,#6
3378                     ; 107 						SEG_E_ON;
3380  018c 721b500a      	bres	_PC_ODR,#5
3381                     ; 108 						SEG_F_ON;
3383  0190 7219500a      	bres	_PC_ODR,#4
3384                     ; 109 						SEG_G_ON;
3386  0194 7217500a      	bres	_PC_ODR,#3
3387                     ; 110 						break;
3389  0198 201c          	jra	L7512
3390  019a               L5312:
3391                     ; 111 		case 9:
3391                     ; 112 						SEG_A_ON;
3393  019a 7215500f      	bres	_PD_ODR,#2
3394                     ; 113 						SEG_B_ON;
3396  019e 7211500f      	bres	_PD_ODR,#0
3397                     ; 114 						SEG_C_ON;
3399  01a2 721f500a      	bres	_PC_ODR,#7
3400                     ; 115 						SEG_D_OF;
3402  01a6 721c500a      	bset	_PC_ODR,#6
3403                     ; 116 						SEG_E_OF;
3405  01aa 721a500a      	bset	_PC_ODR,#5
3406                     ; 117 						SEG_F_ON;
3408  01ae 7219500a      	bres	_PC_ODR,#4
3409                     ; 118 						SEG_G_ON;
3411  01b2 7217500a      	bres	_PC_ODR,#3
3412                     ; 119 						break;
3414  01b6               L7512:
3415                     ; 121 }
3418  01b6 81            	ret
3421                     	bsct
3422  0000               L1612_count:
3423  0000 01            	dc.b	1
3467                     ; 123 void DISPLAY_WRITE_VALUE (unsigned int c)
3467                     ; 124 {
3468                     	switch	.text
3469  01b7               _DISPLAY_WRITE_VALUE:
3471  01b7 89            	pushw	x
3472       00000000      OFST:	set	0
3475                     ; 126 	switch(count)
3477  01b8 b600          	ld	a,L1612_count
3479                     ; 156 						break;
3480  01ba 4a            	dec	a
3481  01bb 270c          	jreq	L3612
3482  01bd 4a            	dec	a
3483  01be 272b          	jreq	L5612
3484  01c0 4a            	dec	a
3485  01c1 2748          	jreq	L7612
3486  01c3 4a            	dec	a
3487  01c4 2765          	jreq	L1712
3488  01c6 cc0248        	jra	L7122
3489  01c9               L3612:
3490                     ; 128 		case 1:
3490                     ; 129 						DISPLAY_A_ON;
3492  01c9 721f500f      	bres	_PD_ODR,#7
3493                     ; 130 						DISPLAY_B_OF;
3495  01cd 721c500f      	bset	_PD_ODR,#6
3496                     ; 131 						DISPLAY_C_OF;
3498  01d1 7216500f      	bset	_PD_ODR,#3
3499                     ; 132 						DISPLAY_D_OF;
3501  01d5 721a500f      	bset	_PD_ODR,#5
3502                     ; 133 						WRITE_DISPLAY((c/1000)%10);
3504  01d9 1e01          	ldw	x,(OFST+1,sp)
3505  01db 90ae03e8      	ldw	y,#1000
3506  01df 65            	divw	x,y
3507  01e0 a60a          	ld	a,#10
3508  01e2 62            	div	x,a
3509  01e3 5f            	clrw	x
3510  01e4 97            	ld	xl,a
3511  01e5 9f            	ld	a,xl
3512  01e6 cd004c        	call	_WRITE_DISPLAY
3514                     ; 134 						break;
3516  01e9 205d          	jra	L7122
3517  01eb               L5612:
3518                     ; 135 		case 2:
3518                     ; 136 						DISPLAY_A_OF;
3520  01eb 721e500f      	bset	_PD_ODR,#7
3521                     ; 137 						DISPLAY_B_ON;
3523  01ef 721d500f      	bres	_PD_ODR,#6
3524                     ; 138 						DISPLAY_C_OF;
3526  01f3 7216500f      	bset	_PD_ODR,#3
3527                     ; 139 						DISPLAY_D_OF;
3529  01f7 721a500f      	bset	_PD_ODR,#5
3530                     ; 140 						WRITE_DISPLAY((c/100)%10);
3532  01fb 1e01          	ldw	x,(OFST+1,sp)
3533  01fd a664          	ld	a,#100
3534  01ff 62            	div	x,a
3535  0200 a60a          	ld	a,#10
3536  0202 62            	div	x,a
3537  0203 5f            	clrw	x
3538  0204 97            	ld	xl,a
3539  0205 9f            	ld	a,xl
3540  0206 cd004c        	call	_WRITE_DISPLAY
3542                     ; 141 						break;
3544  0209 203d          	jra	L7122
3545  020b               L7612:
3546                     ; 142 		case 3:
3546                     ; 143 						DISPLAY_A_OF;
3548  020b 721e500f      	bset	_PD_ODR,#7
3549                     ; 144 						DISPLAY_B_OF;
3551  020f 721c500f      	bset	_PD_ODR,#6
3552                     ; 145 						DISPLAY_C_ON;
3554  0213 7217500f      	bres	_PD_ODR,#3
3555                     ; 146 						DISPLAY_D_OF;
3557  0217 721a500f      	bset	_PD_ODR,#5
3558                     ; 147 						WRITE_DISPLAY((c/10)%10);
3560  021b 1e01          	ldw	x,(OFST+1,sp)
3561  021d a60a          	ld	a,#10
3562  021f 62            	div	x,a
3563  0220 a60a          	ld	a,#10
3564  0222 62            	div	x,a
3565  0223 5f            	clrw	x
3566  0224 97            	ld	xl,a
3567  0225 9f            	ld	a,xl
3568  0226 cd004c        	call	_WRITE_DISPLAY
3570                     ; 148 						break;
3572  0229 201d          	jra	L7122
3573  022b               L1712:
3574                     ; 149 		case 4:
3574                     ; 150 						DISPLAY_A_OF;
3576  022b 721e500f      	bset	_PD_ODR,#7
3577                     ; 151 						DISPLAY_B_OF;
3579  022f 721c500f      	bset	_PD_ODR,#6
3580                     ; 152 						DISPLAY_C_OF;
3582  0233 7216500f      	bset	_PD_ODR,#3
3583                     ; 153 						DISPLAY_D_ON;
3585  0237 721b500f      	bres	_PD_ODR,#5
3586                     ; 154 						WRITE_DISPLAY((c/1)%10);
3588  023b 1e01          	ldw	x,(OFST+1,sp)
3589  023d a60a          	ld	a,#10
3590  023f 62            	div	x,a
3591  0240 5f            	clrw	x
3592  0241 97            	ld	xl,a
3593  0242 9f            	ld	a,xl
3594  0243 cd004c        	call	_WRITE_DISPLAY
3596                     ; 155 						count=0;
3598  0246 3f00          	clr	L1612_count
3599                     ; 156 						break;
3601  0248               L7122:
3602                     ; 158 	count=count+1;
3604  0248 3c00          	inc	L1612_count
3605                     ; 159 }
3608  024a 85            	popw	x
3609  024b 81            	ret
3622                     	xdef	_DISPLAY_WRITE_VALUE
3623                     	xdef	_WRITE_DISPLAY
3624                     	xdef	_clock_config
3625                     	xdef	_delay_ms
3626                     	xdef	_PORT_INIT
3627                     	xref.b	c_x
3646                     	xref	c_lzmp
3647                     	xref	c_lgsbc
3648                     	xref	c_rtol
3649                     	xref	c_lursh
3650                     	xref	c_lmul
3651                     	xref	c_ltor
3652                     	end
