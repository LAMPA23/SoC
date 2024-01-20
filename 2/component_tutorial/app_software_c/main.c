#define p_SWs 0x00002000
#define p_reg32 0x00002010

int main()
{
    while(1) *(volatile unsigned char*) p_reg32 = *(volatile unsigned char*) p_SWs;
}