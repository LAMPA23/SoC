#include<stdio.h>

#define p_SWs 0x00021000
#define p_reg32 0x00021018

int main()
{
    unsigned char N[20];
    
    while(1)
    {
        printf("\nOld number is: %c, New number is: ", N[0]);
        scanf("%s", N);
        *(volatile unsigned char*) p_reg32 = N[0] - 0x30;
    }
}