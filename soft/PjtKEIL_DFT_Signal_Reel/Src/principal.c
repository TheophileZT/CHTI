
#include <stdio.h>
#include "DriverJeuLaser.h"
extern int DFT_ModuleAuCarre(short int * Signal64ech, char k);
extern short int LeSignal;
short int dma_buf[64];
int tab[64];
int hit[3];
int num=0;
int score [6];

void callbackSystick(void){
	//int a = 0; pour tester le timer Systick
	Start_DMA1(64);
	Wait_On_End_Of_DMA1();
	Stop_DMA1;
	
	for (int i = 17; i<25; i++){
		if (i!=21 || i!=22){
			tab[i] = DFT_ModuleAuCarre( dma_buf, i);
			if (tab[i]>16){
				if (num == 0){
					hit[0]=i;
					num++;
				} else if (hit[num-1]==i){
					hit[num]=i;
					num++;
				}else {
					hit[0] = NULL;
					hit[1] = NULL;
					hit[2] = NULL;
					num = 0;
				}
				if (num ==3){
					switch (i){
						case 17:
							score[0]++;
							break;
						case 18:
							score[1]++;
							break;
						case 19:
							score[2]++;
							break;
						case 20:
							score[3]++;
							break;
						case 23:
							score[4]++;
							break;
						case 24:
							score[5]++;
							break;
					}
					hit[0] = NULL;
					hit[1] = NULL;
					hit[2] = NULL;
					num = 0;
				}
			}
		}
	}
	
	
}
int main(void)
{
	
// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

// Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers
CLOCK_Configure();

	Systick_Period_ff(360000);
	Systick_Prio_IT(0, callbackSystick);
	SysTick_On ;	
	SysTick_Enable_IT ;

	Init_TimingADC_ActiveADC_ff(ADC1, 72);
	Single_Channel_ADC( ADC1, 2 );
	
	Init_Conversion_On_Trig_Timer_ff( ADC1, TIM2_CC2, 225 );
	
	
	Init_ADC1_DMA1( 0, dma_buf );

	

//============================================================================	
	
	
while	(1)
	{
		
	}
}



