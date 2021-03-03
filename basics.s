  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  @ Write an ARM Assembly Language program to evaluate
  @   x^3 - 4x^2 + 3x + 8
  MUL R0 ,R1,R1     @ X^2
  MUL R2 ,R0,R1     @ X^2 TIMES X
  
  LDR R3, =4
  MUL R4,R3,R0     @ 4X^2

  LDR R5, =3
  MUL R6,R5,R1     @ 3X

  SUB R7,R2,R4     @ x^3 - 4x^2
  ADD R8,R7,R6     @ x^3 - 4x^2 + 3X
 
  LDR R9, =8
  ADD R0,R8,R9     @ x^3 - 4x^2 + 3x + 8

  

  @ End of program ... check your result

End_Main:
  BX    lr

.end
