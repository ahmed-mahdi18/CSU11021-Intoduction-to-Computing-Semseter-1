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

  
  MOV R8, #0x20
  LDRB R6 , [R1]                    
  MOV R7, #0                        
  While :
  CMP R6, #0                        
  BEQ End
  CMP R7, #'a'
  BLO Iflessthanlowercaseaz
  CMP R7, #'z'
  BLO Elsenotlowercaseatoz

  Iflessthanlowercaseaz :
  CMP R7, #'A'
  BLO Checkiflowercaseaz
  CMP R7, #'Z'
  BLO Elsenotlowercaseatoz

  Checkiflowercaseaz :
  CMP R6, #'a'
  BLO ElsecapitalAtoZ
  CMP R6, #'z'
  BHI  ElsecapitalAtoZ
  SUB R6, R6, R8
  B    ElsecapitalAtoZ

  Elsenotlowercaseatoz :
  CMP R6, #'A'
  BLO  ElsecapitalAtoZ
  CMP R6, #'Z'
  BHI  ElsecapitalAtoZ
  ADD R6, R6, R8 
  
  ElsecapitalAtoZ :
  MOV R7, #0
  ADD R7, R7, R6
  STRB R6, [R1]
  ADD  R1,R1,#1
  LDRB R6, [R1]
  B    While
End :
 


















  @ End of program ... check your result

End_Main:
  BX    lr

