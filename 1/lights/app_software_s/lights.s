.global _start 

_start: 
    movia r2, AVECTOR /* Register r2 is a pointer to vector A */ 
    movia r3, BVECTOR /* Register r3 is a pointer to vector B */ 
    movia r4, N 
    ldw r4, 0(r4) /*Register r4 is used as the counter for loop iterations*/ 
    add r5, r0, r0 /* Register r5 is used to accumulate the product */ 

LOOP: 
    ldw r6, 0(r2) /* Load the next element of vector A */ 
    ldw r7, 0(r3) /* Load the next element of vector B */ 
    mul r8, r6, r7 /* Compute the product of next pair of elements */ 
    add r5, r5, r8 /* Add to the sum */ 
    addi r2, r2, 4 /* Increment the pointer to vector A */ 
    addi r3, r3, 4 /* Increment the pointer to vector B */ 
    subi r4, r4, 1 /* Decrement the counter */ 
    bgt r4, r0, LOOP /* Loop again if not finished */ 
    stw r5, 0x0100(r0) /* Store the result in memory */ 
STOP: br STOP 

N: 
.word 6 /* Specify the number of elements */ 

AVECTOR: 
.word 5, 3, -6, 19, 8, 12 /* Specify the elements of vector A */ 

BVECTOR: 
.word 2, 14, -3, 2, -5, 36 /* Specify the elements of vector B */ 
