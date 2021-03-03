  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:
  
  @
  @ write your program here
  @
                 
 LDR R3, [R1]            @ value1 = [addressA] 
 ADD R1, R1, #4          @ addressA +=4
 LDR R4,[R2]             @ value2 = [addressB]
 ADD R2,R2,#4            @ addressB +=4
 MOV R5, #0              @ TempAddressA = 0
 MOV R6, #0              @ NumberA = 0
 MOV R7, #0              @ AddressAC = 0;
 ADD R7,R7, R0           @ AddressAC += addressC
 

While1:
  CMP R5,R3              @ While(TempAddressA != value1)
  BEQ EndWhile1
  LDR R6, [R1], #4       @ numberA = [addressA]
  STR R6, [R0], #4       @ numberA = [addressC]
  ADD R5,R5,#1           @ TempAddressA += 1
  B   While1

EndWhile1:
  MOV R11, #4
  ADD R5,R5,#1           @ TempAddressA += 1
  MUL R5,R5,R11          @ TempAddressA *= 4
  SUB R1,R1,R5           @ AddressA -= TempAddressA
  MOV R8,#0              @ TempAddressB = 0
  MOV R9,#0              @ NumberB = 0

While2:
  CMP R8, R4             @ While(TempAddressB != value2)
  BEQ EndWhile2
  LDR R9, [R2]           @ NumberB = [AddressB]
  MOV R5,#0
  LDR R6, [R1]           @ NumberA = [AddressA]


While3:
  CMP R5, R3             @ While(TempAddressA != value1)
  BEQ EndWhile3
  CMP R6, R9
  BEQ EndWhile3
  ADD R1,R1,#4           @ AddressA += 4
  LDR R6, [R1]           @ NumberA = [AddressA]
  ADD R5,R5,#1           @ TempAddressA += 1
  B   While3

EndWhile3:
  MUL R5,R5,R11          @TempAddressA *= 4
  SUB R1,R1,R5           @ AddressA -= TempAddressA

  CMP R6,R9              @ If (NumberA != NumberB)
  BEQ EndIf
  STR R9, [R0]           @ NumberB = [addressC]
  ADD R0,R0,#4           @ addressC += 4
EndIf:
  ADD R2,R2,#4           @ addressB += 4
  ADD R8,R8,#1           @ TempAddressB
  B   While2

EndWhile2:
  MOV R4, #0            @ value2 = 0
  
While4:
  CMP R7, R0            @ while (AddressAC != addressC)
  BEQ EndWhile4
  ADD R7,R7,#4          @ AdressAC += 4
  ADD R4,#1             @ value2 = 1
  B   While4
  
EndWhile4:
  MOV R3,#0             @ value1 = 0
  ADD R3,R3,R4          @ value1 += value2
  MOV R10,#0            @ NumberC = 0   

While5:
  CMP R4,#0             
  BEQ End
  SUB R0,R0,#4         @ addressC += 4
  LDR R10,[R0]         @ NumberC = addressC
  ADD R0,R0,#4         @ addressC += 4
  STR R10, [R0]        @ NumberC = addressC
  SUB R0,R0,#4         @ addressC -= 4
  SUB R4,R4,#1         @ value2 = 1
  B   While5

End:
  STR R3,[R0]          @ addressC = value1





























  @ End of program ... check your result

End_Main:
  BX    lr

