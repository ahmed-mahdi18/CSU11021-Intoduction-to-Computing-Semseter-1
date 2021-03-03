  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:

  @
  @ write your program here
  @

  @
  @ TIP: To view memory when debugging your program you can ...
  @
  @   Add the following watch expression: (unsigned char [64]) strA
  @
  @   OR
  @
  @   Open a Memory View specifying the address 0x20000000 and length at least 11
  @   You can open a Memory View with ctrl-shift-p type view memory (cmd-shift-p on a Mac)
  @

                                
 CMP R1, #0                             @ if (number > 0)
 BLE  ElseIfequaltoZero
 MOV  R2, #0x2B                         @ "+"
 STRB R2, [R0]                          @[byteaddress] = "+"
 ADD  R0, R0, #1                        @ address = address + 1
 B    ElseChange

 ElseIfequaltoZero :                    @ if (number = 0)
 CMP R1, #0
 BNE ElseIfnegative
 ADD R1,R1, #'0'                        @ number + "0"
 STRB R1, [R0]                          @ [byteaddress] = 0
 ADD  R0,R0, #1                         @ address = address + 1
 B    End

 ElseIfnegative :                       @ if (number < 0)
 LDR R3, = -1
 MOV R2, #0x2D                          @ "-"
 STRB R2, [R0]                          @[byteaddress] = "-"
 ADD  R0, R0, #1                        @ address = address + 1
 MOV  R4, R3                            @ a = -1
 MUL  R1,R1,R4                          @ number * -1

 ElseChange :
 MOV R5, #0                            @ power = 0
 MOV R4, #10
 ADD R6, R6, R1                        @ empty register = number
 While1 :                              @ while [number > 10]
 CMP R6, R4
 BLT EndifPowerof10
 UDIV R6,R6,R4                         @ number / 10
 ADD  R5, R5, #1                       @ power += 1
 B    While1
                                      
EndifPowerof10 :                          
MOV R8 , #1                            @ secondnumber = 1
While2 :                               @ while (power != 0)
CMP R5, #0
BEQ EqualtoZero
MUL R8,R8, R4                         @ secondnumber * 10
SUB R5,R5,#1                          @ power -= 1
B   While2


EqualtoZero :                         
MOV R7, #0                            @ thirdnumber = 0
While3 :                              @ while (power > 0)
CMP R8, #0                            
BEQ End
UDIV R7, R1, R8                      @ thirdnumber = number / power
ADD  R9, R7, #0x30                   @ thirdnumber += 0x30
STRB R9, [R0]                        @ [Byteaddress] = no.3 ;
ADD  R0,R0,#1                        @ address = address + 1
MUL  R10, R7, R8
SUB  R1,R1,R10                       
UDIV R8, R8, R4
B    While3

End :
MOV R11, 0x00                       @ null
STRB R11, [R0]                      @ [byteaddress] = null



















  @ End of program ... check your result

End_Main:
  BX    lr

