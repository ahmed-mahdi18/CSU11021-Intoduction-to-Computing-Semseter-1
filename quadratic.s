  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  @ Write an ARM Assembly Language program to evaluate
  @   ax^2 + bx + c for given values of a, b, c and x
  
  MUL R0, R1, R1    @ X * X

  MUL R5, R2, R0    @ AX^2

  MUL R6, R3,R1     @BX
  
  ADD R7 , R5,R6    @AX^2 + BX

  ADD R0, R4, R7    @ AX^2 + BX + C

  
  

  @ End of program ... check your result

End_Main:
  BX    lr

.end
