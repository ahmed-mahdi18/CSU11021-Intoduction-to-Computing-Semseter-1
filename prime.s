  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  @
  @ Write an ARM Assembly Language Program that will determine
  @   whether the unsigned number in R1 is a prime number
  @
  @ Output:
  @   R0: 1 if the number in R1 is prime
  @       0 if the number in R1 is not prime
  @

  
  
  MOV R0,#0
                     
  CMP R1, #1              @ if (R1 < 1)
  BLS If                    @ branch to If
  //MOV R0,#0
  //CMP R1, #1
  //BEQ Else

  CMP R1, #2              @ if (R1 = 2)
  BEQ Else                @ branch to Else
  LDR R4, =2               @ R4 = 2
  MOV R2,R1                @ R2 = R1
  While :
  CMP  R2, #2             @while (R2 > R4) 
  BLS  EndWh               @{
  SUB  R2,R2,#1            @ R2 = R2 - 1
  UDIV R3,R1,R2            @R3 = R1 / R2 (stores whole number only)
  MUL  R5,R3,R2            @R5 = R3 * R2
  SUB  R6,R1,R5            @R6 = R1-R5
  ADD  R4,R4,#1            @ R4++
  B    While  
EndWh :                    @ }
  CMP  R6,#0               @if (R6 = 0)
  BNE  Else                @ {
  CMP  R6,#0               @ if (R6 != 0)
  BEQ  If                  @{
  B    While        
  Else :                   
  MOV R0, #1               @ R0 = 1
  B   EndIf 
  If : 
  MOV R0, #0               @R0 = 0
  EndIf :




  
  
 












  @ End of program ... check your result

End_Main:
  BX    lr

.end
