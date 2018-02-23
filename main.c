#include "defines.h"
#include "functions.h"

main()
{
	unsigned char i=0;
	int mux=0;
	PORT_INIT();
	clock_config();
	TransistorLed1_Bargraph_OFF; 
	TransistorOtherLeds_Bargraph_OFF; 
	Out_LedPTH_OFF;
	SEG_DP_OF;
	
	while (1)
	{
		for (mux=0;mux<1000;mux++)
		{
			DISPLAY_WRITE_VALUE(i);
			delay_ms(1);
		}
		i++;
	}
}

