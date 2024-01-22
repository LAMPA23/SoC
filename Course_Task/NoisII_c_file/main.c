#include<stdio.h>

//#define p_reg32 0x00021008

int main()
{
    volatile unsigned long long reg32 = 0;
    volatile unsigned char half_byte[4];

    volatile unsigned long long* p_reg32 = &reg32;
    
    while(1)
    {
        reg32 = *(volatile unsigned long long*) p_reg32;

        printf("\nOld number is: %x, New number is: 0x", reg32);
        scanf("%x", &reg32);

        half_byte[0] = reg32 & 0x000F;
        half_byte[1] = (reg32 & 0x00F0) >> 4;
        half_byte[2] = (reg32 & 0x0F00) >> 8;
        half_byte[3] = (reg32 & 0xF000) >> 12;

        printf("The half bytes:\n");
        printf("half_byte[0] = %x\n", half_byte[0]);
        printf("half_byte[1] = %x\n", half_byte[1]);
        printf("half_byte[2] = %x\n", half_byte[2]);
        printf("half_byte[3] = %x\n", half_byte[3]);
    }
}