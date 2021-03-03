  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  @ Write an ARM Assembly Language Program that will divide a
  @   value, a, in R2 by another value, b, in R3.
  
  @ Test by dividing a=23 by b=5
  @LDR   R2, =23
  @LDR   R3, =5
  
   @int quotient = 0;
   
   @while(dividend >= divisor)
   
     @{
      
      @dividend = dividend - divisor;
      
      @ quotient++;

     @}
  
     
    LDR R0, = 0
    LDR R1, = 0
    LDR R4, = 1
  
  While :
    CMP R2,R3            @ while(dividend >= divisor)
    BGE EndWh            @ {
    SUB R2,R2,R3         @dividend = dividend - divisor;
    ADD R0,R0,R4         @ quotient++;
    B   While            @ }
    MOV R1, R2
  EndWh :
    MOV R1, R2





  @ End of program ... check your result

End_Main:
  BX    lr

.end
