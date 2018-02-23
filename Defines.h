#include "functions.h"
#include "iostm8s.h"

// Ativação e desativação dos led´s PTH 
	#define		Transistor_Led3_ON 		PD_ODR&=~0x80  // Envia 0V do pino PD7
	#define		Transistor_Led3_OFF		PD_ODR|=0x80   // Envia 5V do pino PD7
	
	#define		Transistor_Led2_OFF		PD_ODR|=0x40    // Envia 5V do pino PD6
	#define		Transistor_Led2_ON		PD_ODR&=~0x40   // Envia 0V do pino PD6
	
	#define		Transistor_Led1_ON		PD_ODR|=0x08   // Envia 0V do pino PD3
	#define		Transistor_Led1_OFF		PD_ODR&=~0x08  // Envia 5V do pino PD3
	
	#define 	Out_LedPTH_ON					PE_ODR&=~0x20  // Envia 0V do pino PE5
	#define 	Out_LedPTH_OFF				PE_ODR|=0x20   // Envia 5V do pino PE5
	
	// Ativação e desativação do Bargraph
	#define 	TransistorLed1_Bargraph_ON 		PD_ODR&=~0x20	 // Envia 0V do pino PD5	
	#define 	TransistorLed1_Bargraph_OFF 	PD_ODR|=0x20	 // Envia 5V do pino PD5	
	#define 	PinLed1_Bargraph_ON 					PE_ODR&=~0x20  // Envia 0V do pino PE5
	#define 	PinLed1_Bargraph_OFF					PE_ODR|=0x20   // Envia 5V do pino PE5
	
	#define 	TransistorOtherLeds_Bargraph_ON 		PD_ODR&=~0x10	// Envia 0V do pino PD4	
	#define 	TransistorOtherLeds_Bargraph_OFF 		PD_ODR|=0x10	// Envia 5V do pino PD4	
	
	#define		PinLed2_Bargraph_ON					PE_ODR&=~0x20   // Envia 0V do pino PE5
	#define 	PinLed2_Bargraph_OFF				PE_ODR|=0x20    // Envia 5V do pino PE5
	
	#define		PinLed3_Bargraph_ON					PC_ODR&=~0x02   // Envia 0V do pino PC1
	#define 	PinLed3_Bargraph_OFF				PC_ODR|=0x02    // Envia 5V do pino PC1
	
	#define		PinLed4_Bargraph_ON					PC_ODR&=~0x08   // Envia 0V do pino PC3
	#define 	PinLed4_Bargraph_OFF				PC_ODR|=0x08    // Envia 5V do pino PC3
	
	#define		PinLed5_Bargraph_ON					PC_ODR&=~0x10   // Envia 0V do pino PC4
	#define 	PinLed5_Bargraph_OFF				PC_ODR|=0x10    // Envia 5V do pino PC4
	
	#define		PinLed6_Bargraph_ON					PC_ODR&=~0x20   // Envia 0V do pino PC5
	#define 	PinLed6_Bargraph_OFF				PC_ODR|=0x20    // Envia 5V do pino PC5
	
	#define		PinLed7_Bargraph_ON					PC_ODR&=~0x40  // Envia 0V do pino PC6
	#define 	PinLed7_Bargraph_OFF				PC_ODR|=0x40   // Envia 5V do pino PC6
	
	#define		PinLed8_Bargraph_ON					PC_ODR&=~0x80  // Envia 0V do pino PC7
	#define 	PinLed8_Bargraph_OFF				PC_ODR|=0x80   // Envia 5V do pino PC7
	
	#define		PinLed9_Bargraph_ON					PD_ODR&=~0x01  // Envia 0V do pino PD7
	#define 	PinLed9_Bargraph_OFF				PD_ODR|=0x01   // Envia 5V do pino PD7
	
	#define		PinLed10_Bargraph_ON				PD_ODR&=~0x04  // Envia 0V do pino PD2
	#define 	PinLed10_Bargraph_OFF				PD_ODR|=0x04   // Envia 5V do pino PD2
	
	#define delay 2000;
	
	
	

	/***********************************************************
**Arquivo:function.h                                      **
**Desenvolvido por William Wellington Mentz               **
**biblioteca contem os prototipos de funções para         **
**o arquivo functions.c                                   **
**inicio: 04/04/2017                                      **
**finalizado:   /  /2017                                  **
***********************************************************/

// Habilita e desabilita o comum dos displays
#define DISPLAY_A_ON	PD_ODR&=~0x80
#define DISPLAY_A_OF	PD_ODR|=0x80
#define DISPLAY_B_ON	PD_ODR&=~0x40
#define DISPLAY_B_OF	PD_ODR|=0x40
#define DISPLAY_D_ON	PD_ODR&=~0x20
#define DISPLAY_D_OF	PD_ODR|=0x20
#define DISPLAY_C_ON	PD_ODR&=~0x08
#define DISPLAY_C_OF	PD_ODR|=0x08

// Habilita e desabilita os segmentos dos displays
#define SEG_A_ON	PD_ODR&=~0x04
#define SEG_A_OF	PD_ODR|=0x04
#define SEG_B_ON	PD_ODR&=~0x01
#define SEG_B_OF	PD_ODR|=0x01
#define SEG_C_ON	PC_ODR&=~0x80
#define SEG_C_OF	PC_ODR|=0x80
#define SEG_D_ON	PC_ODR&=~0x40
#define SEG_D_OF	PC_ODR|=0x40
#define SEG_E_ON	PC_ODR&=~0x20
#define SEG_E_OF	PC_ODR|=0x20
#define SEG_F_ON	PC_ODR&=~0x10
#define SEG_F_OF	PC_ODR|=0x10
#define SEG_G_ON	PC_ODR&=~0x08
#define SEG_G_OF	PC_ODR|=0x08
#define SEG_DP_ON	PC_ODR&=~0x02
#define SEG_DP_OF	PC_ODR|=0x02



