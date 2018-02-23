   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
2961                     ; 4 main()
2961                     ; 5 {
2963                     	switch	.text
2964  0000               _main:
2966  0000 5203          	subw	sp,#3
2967       00000003      OFST:	set	3
2970                     ; 6 	unsigned char i=0;
2972  0002 0f01          	clr	(OFST-2,sp)
2974                     ; 7 	int mux=0;
2976                     ; 8 	PORT_INIT();
2978  0004 cd0000        	call	_PORT_INIT
2980                     ; 9 	clock_config();
2982  0007 cd0000        	call	_clock_config
2984                     ; 10 	TransistorLed1_Bargraph_OFF; 
2986  000a 721a500f      	bset	_PD_ODR,#5
2987                     ; 11 	TransistorOtherLeds_Bargraph_OFF; 
2989  000e 7218500f      	bset	_PD_ODR,#4
2990                     ; 12 	Out_LedPTH_OFF;
2992  0012 721a5014      	bset	_PE_ODR,#5
2993                     ; 13 	SEG_DP_OF;
2995  0016 7212500a      	bset	_PC_ODR,#1
2996  001a               L7602:
2997                     ; 17 		for (mux=0;mux<1000;mux++)
2999  001a 5f            	clrw	x
3000  001b 1f02          	ldw	(OFST-1,sp),x
3002  001d               L3702:
3003                     ; 19 			DISPLAY_WRITE_VALUE(i);
3005  001d 7b01          	ld	a,(OFST-2,sp)
3006  001f 5f            	clrw	x
3007  0020 97            	ld	xl,a
3008  0021 cd0000        	call	_DISPLAY_WRITE_VALUE
3010                     ; 20 			delay_ms(1);
3012  0024 ae0001        	ldw	x,#1
3013  0027 89            	pushw	x
3014  0028 ae0000        	ldw	x,#0
3015  002b 89            	pushw	x
3016  002c cd0000        	call	_delay_ms
3018  002f 5b04          	addw	sp,#4
3019                     ; 17 		for (mux=0;mux<1000;mux++)
3021  0031 1e02          	ldw	x,(OFST-1,sp)
3022  0033 1c0001        	addw	x,#1
3023  0036 1f02          	ldw	(OFST-1,sp),x
3027  0038 9c            	rvf
3028  0039 1e02          	ldw	x,(OFST-1,sp)
3029  003b a303e8        	cpw	x,#1000
3030  003e 2fdd          	jrslt	L3702
3031                     ; 22 		i++;
3033  0040 0c01          	inc	(OFST-2,sp)
3036  0042 20d6          	jra	L7602
3049                     	xdef	_main
3050                     	xref	_DISPLAY_WRITE_VALUE
3051                     	xref	_clock_config
3052                     	xref	_delay_ms
3053                     	xref	_PORT_INIT
3072                     	end
