#include "defines.h" 

void PORT_INIT (void)
{
	 // Registrador que seta se é entrada ou saída (1 ENABLE/ 0 DISABLE)
	PD_DDR=0xFF; 
	PE_DDR=0x20;
	PC_DDR=0xFF; 
}

void delay_ms (unsigned long int I)
{
	#define clock 16 //EM MEGAHERTZ
	I=(I*(clock*45))/4;
	for (;I>0;I--);
}

void clock_config (void)
{
	CLK_ICKCR=0x01; // Cada bit é uma função (Habilitamos a função HSIEN)
	CLK_ECKCR=0x00; // Registrador que habilita e desabilita o clock externo
	CLK_CMSR=0xE1; // Habilita o clock interno 
	CLK_CKDIVR=0x00; //Divisão do click interno >> 16MHz/1
}

void WRITE_DISPLAY (char c)
{
	switch (c)
	{
		case 0: 
						SEG_A_ON;
						SEG_B_ON;
						SEG_C_ON;
						SEG_D_ON;
						SEG_E_ON;
						SEG_F_ON;
						SEG_G_OF;
						break;
		case 1:
						SEG_A_OF;
						SEG_B_ON;
						SEG_C_ON;
						SEG_D_OF;
						SEG_E_OF;
						SEG_F_OF;
						SEG_G_OF;
						break;
		case 2: 
						SEG_A_ON;
						SEG_B_ON;
						SEG_C_OF;
						SEG_D_ON;
						SEG_E_ON;
						SEG_F_OF;
						SEG_G_ON;
						break;
		case 3:
						SEG_A_ON;
						SEG_B_ON;
						SEG_C_ON;
						SEG_D_ON;
						SEG_E_OF;
						SEG_F_OF;
						SEG_G_ON;
						break;
		case 4:
						SEG_A_OF;
						SEG_B_ON;
						SEG_C_ON;
						SEG_D_OF;
						SEG_E_OF;
						SEG_F_ON;
						SEG_G_ON;
						break;
		case 5:
						SEG_A_ON;
						SEG_B_OF;
						SEG_C_ON;
						SEG_D_ON;
						SEG_E_OF;
						SEG_F_ON;
						SEG_G_ON;
						break;
		case 6:
						SEG_A_ON;
						SEG_B_OF;
						SEG_C_ON;
						SEG_D_ON;
						SEG_E_ON;
						SEG_F_ON;
						SEG_G_ON;
						break;
		case 7:
						SEG_A_ON;
						SEG_B_ON;
						SEG_C_ON;
						SEG_D_OF;
						SEG_E_OF;
						SEG_F_OF;
						SEG_G_OF;
						break;
		case 8:
						SEG_A_ON;
						SEG_B_ON;
						SEG_C_ON;
						SEG_D_ON;
						SEG_E_ON;
						SEG_F_ON;
						SEG_G_ON;
						break;
		case 9:
						SEG_A_ON;
						SEG_B_ON;
						SEG_C_ON;
						SEG_D_OF;
						SEG_E_OF;
						SEG_F_ON;
						SEG_G_ON;
						break;
	}
}

void DISPLAY_WRITE_VALUE (unsigned int c)
{
	static unsigned char count=1; //Static pois o programa passa por ela apenas uma vez 
	switch(count)
	{
		case 1:
						DISPLAY_A_ON;
						DISPLAY_B_OF;
						DISPLAY_C_OF;
						DISPLAY_D_OF;
						WRITE_DISPLAY((c/1000)%10);
						break;
		case 2:
						DISPLAY_A_OF;
						DISPLAY_B_ON;
						DISPLAY_C_OF;
						DISPLAY_D_OF;
						WRITE_DISPLAY((c/100)%10);
						break;
		case 3:
						DISPLAY_A_OF;
						DISPLAY_B_OF;
						DISPLAY_C_ON;
						DISPLAY_D_OF;
						WRITE_DISPLAY((c/10)%10);
						break;
		case 4:
						DISPLAY_A_OF;
						DISPLAY_B_OF;
						DISPLAY_C_OF;
						DISPLAY_D_ON;
						WRITE_DISPLAY((c/1)%10);
						count=0;
						break;
	}
	count=count+1;
}