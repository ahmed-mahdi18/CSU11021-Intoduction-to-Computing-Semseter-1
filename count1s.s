  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  
  @
  @ write your program here
  @
  
 LDR R0, =0 @ Count
  @ R1 is the binary input

WhileNotSet: 
  CMP R1, #0
  BEQ EndWhileNotSet
  
  MOV R2, R1, LSL #1
  AND R1, R1, R2

  ADD R0, R0, #1
  b WhileNotSet
EndWhileNotSet:
  @ End of program ... check your result

End_Main:
  BX    lr

.end
