#include "integrate.h"

#include <defs.h>
#include <user_uart.h>
#include <irq_vex.h>

#define reg_tap (*(volatile uint32_t *)0x35000C00)
#define reg_data (*(volatile uint32_t *)0x35000C40)



//uart
void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write(int n)
{
    while(((reg_uart_stat>>3) & 1));
    reg_tx_data = n;
}

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write_char(char c)
{
	if (c == '\n')
		uart_write_char('\r');

    // wait until tx_full = 0
    while(((reg_uart_stat>>3) & 1));
    reg_tx_data = c;
}

void __attribute__ ( ( section ( ".mprj" ) ) ) uart_write_string(const char *s)
{
    while (*s)
        uart_write_char(*(s++));
}


char __attribute__ ( ( section ( ".mprj" ) ) ) uart_read_char()
{
	char num;
    if((((reg_uart_stat>>5) | 0) == 0) && (((reg_uart_stat>>4) | 0) == 0)){
        for(int i = 0; i < 1; i++)
            asm volatile ("nop");

        num = reg_rx_data;
    }

    return num;
}

int __attribute__ ( ( section ( ".mprj" ) ) ) uart_read()
{
    int num;
    if((((reg_uart_stat>>5) | 0) == 0) && (((reg_uart_stat>>4) | 0) == 0)){
        for(int i = 0; i < 1; i++)
            asm volatile ("nop");

        num = reg_rx_data;
    }

    return num;
}

//qsort
int __attribute__ ( ( section ( ".mprjram" ) ) ) partition(int low,int hi){
	int pivot = C[hi];
	int i = low-1,j;
	int temp;
	for(j = low;j<hi;j++){
		if(C[j] < pivot){
			i = i+1;
			temp = C[i];
			C[i] = C[j];
			C[j] = temp;
		}
	}
	if(C[hi] < C[i+1]){
		temp = C[i+1];
		C[i+1] = C[hi];
		C[hi] = temp;
	}
	return i+1;
}

void __attribute__ ( ( section ( ".mprjram" ) ) ) sort(int low, int hi){
	if(low < hi){
		int p = partition(low, hi);
		sort(low,p-1);
		sort(p+1,hi);
	}
}

int* __attribute__ ( ( section ( ".mprjram" ) ) ) qsort(){
	sort(0,SIZE-1);
	return C;
}

//mm
int* __attribute__ ( ( section ( ".mprjram" ) ) ) matmul()
{
	int i=0;
	int j;
	int k;
	int sum;
	int kk;
	unsigned int count = 0;
	for (i=0; i<SIZE_M; i++){
		for (j=0; j<SIZE_M; j++){
			sum = 0;
			for(k = 0;k<SIZE_M;k++)
				sum += A[(i*SIZE_M) + k] * B[(k*SIZE_M) + j];
			result[(i*SIZE_M) + j] = sum;
		}
	}
	return result;
}

//fir
void __attribute__ ( ( section ( ".mprjram" ) ) ) initfir() {	

	//write fir tap
	for (int i = 0; i < N; i++)
	{	
		(*(volatile uint32_t *)(0x35000C00+(0X0004*i))) = tap[i] ;		
	}
	
	//write fir data
	int x;
	for (int i = 0; i < data_length; i++)
	{	
		x = i+1;
		(*(volatile uint32_t *)(0x35000C40+(0X0004*i))) = x ;
	}
	
	
}

// int __attribute__ ( ( section ( ".mprjram" ) ) ) firfilter(int inputsample){
// 	for(int i=N-1; i>0; i--){
// 		inputbuffer[i] = inputbuffer[i-1];
// 	}
// 	inputbuffer[0] = inputsample;
	
// 	int outputsample = 0;
// 	for(int i=0; i<N; i++){
// 		outputsample += taps[i]*inputbuffer[i];
// 	}
// 	return outputsample;
// }

// int* __attribute__ ( ( section ( ".mprjram" ) ) ) fir(){
// 	initfir();
// 	for(int i=0; i<N; i++){
// 		outputsignal[i] = firfilter(inputsignal[i]);
// 	}
// 	return outputsignal;
// }