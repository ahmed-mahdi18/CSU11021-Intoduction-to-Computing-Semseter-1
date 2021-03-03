  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:

  @
  @ write your program here
  @   
                     
  MOV R2, #0                                   @ Value1 = 0 ; 
  MOV R3, #0                                   @ Value2 = 0 ;
  MOV R4, #0                                   @ count = 0 ; 
  MOV R0 , #1                                  @ result = 1 ; 
  LDRB R2 , [R1]                               @ Value1 = [address]                            
  While1 :                                     @ while ( Value1 != 0 )
  CMP R2, #0     
  BEQ  EndWhile1 
  ADD R1, R1, #1                               @ address = address + 1
  LDRB R2, [R1]                                @ Value1 = [ address ]
  ADD R4,R4, #1                                @ count += 1
  B  While1 

  EndWhile1 :
  SUB R1, R1, R4                               @ address -=  1

  WhileNot1 :                                   @ while ( count > 1  && result != 0 )
  CMP R4, #1            
  BLE End
  CMP R0, #0 
  BEQ End 
  LDRB R2, [R1]                                 @ Value1 = [ address]

  While2 :                                      @ while ( Value1 !=a && Value1 != z )
  CMP R2, #'a' 
  BLT Else1
  CMP R2, #'z'
  BLE Else2 
  Else1 : 
  CMP R2, #'A'                                  @ while ( Value1 >= A && Value1 > Z)
  BLT ElseNot 
  CMP R2, #'Z'
  BLE Else2 
  ElseNot :
  ADD R1, R1, #1                                @ address = address +  1
  LDRB R2, [R1]                                 @ Value  1 = [address ]
  SUB  R4,R4, #1                                @ count -=  1
  B While2
  Else2  :
  SUB  R4,R4, #1                                @ count -=  1 
  ADD R1,R1, R4                                 @ address += count 
  LDRB R3, [R1]                                 @ Value2 = [address]
  While3 : 
  CMP R3, #'a'                                  @ while ( Value 2 >= a && Value 2 > z)
  BLT ElseNot3
  CMP R3, #'z'
  BLE ElseNot4
  ElseNot3 :
  CMP R3, #'A'                                  @ while ( Value 2 >= A && Value 2 > Z)
  BLT ElseNot5
  CMP R3, #'Z'
  BLE ElseNot4
  ElseNot5 : 
  SUB R1,R1 , #1                                @ ByteAddress -=  1 
  LDRB R3, [R1]                                 @ value2 = [address]
  SUB  R4,R4, #1                                @ count -= 1
  B While3 
  ElseNot4 : 
  BIC R2, R2, #0x20                             @ Value1 into UPPERCASE 
  BIC R3,R3, #0x20                               @ Value 2 into UPPERCASE 
  CMP R2, R3                                    @ ( if Value 2 != Value 1)
  BEQ IfEqual                                   
  MOV R0 , #0                                   @ result = 0 
  IfEqual : 
  SUB R4,R4, #1                                 @ count = count   -1
  SUB R1,R1, R4                                 @ address -= count 
  B WhileNot1
  End : 


























  @ End of program ... check your result

End_Main:
  BX    lr

