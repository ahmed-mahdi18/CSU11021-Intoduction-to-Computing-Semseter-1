  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  @ Write an ARM Assembly Language Program that will convert
  @   a signed value (integer) in R3 into three ASCII characters that
  @   represent the integer as a decimal value in ASCII form, prefixed
  @   by the sign (+/-).
  @ The first character in R0 should represent the sign
  @ The second character in R1 should represent the most significaint digit
  @ The third character in R2 should represent the least significant digit
  @ Store 'N', '/', 'A' if the integer is outside the range -99 ... 0 ... +99

  

  MOV R0, #0
  MOV R1, #0
  MOV R2, #0
  
  CMP R3, #0                                             @if (n=0)
  BNE ElseIfPositive
  MOV R0 ,#0X20                                          @R0 = ''
  MOV R1, #'0'                                           @R1 = '0'
  MOV R2, #'0'                                           @R2 = '0'
  B   EndIf

ElseIfPositive :
  MOV R4, #10                                           @R4 = 10 
  CMP R3, #0                                            @if ( NUMBER>0 && NUMBER<100)
  BLE ElseIfNegative                                    @ {
  CMP R3, #100                                         
  BGE EndIfGreater
  MOV R0, 0x2B                                          @MOVE R0 TO '+'
  UDIV R6, R3, R4                                       @DIVIDE R3 BY R4
  ADD R1,R1,R6                                          @ ADD R1 AND R6
  ADD R1,R1, 0x30                                       @ convert it to ASCII 
  MUL R6, R6, R4                                        @ R6 =R6*R4
  SUB R3, R3, R6                                        @ R3= R3-R6
  MOV R2, R3                                            @ R2=R3
  ADD R2,R2,0x30                                        @convert it to ASCII BY ADDING 0X30
  B   EndIf 
 

ElseIfNegative :
  MOV R5 , #-100                                         @ElseIf ( NUMBER > "-100 " && NUMBER <0)
  CMP R3, R5
  BLE EndIfGreater
  MOV R5,#-1                                             @ R5 = -1
  MUL R3, R3,R5                                           
  MOV R0, 0x2D                                           @ R0 = '-'
  UDIV R6, R3, R4                                        @ R6 = R3/R4
  ADD R1,R1,R6                                           @ R1 = R1+1
  ADD R1,R1, 0x30                                        @ convert it to ASCII 
  MUL R6, R6, R4                                         @ R6 = R6*R4
  SUB R3, R3, R6                                         @ R3= R3-R6
  MOV R2, R3      
  
  
  
                                         @ R2 = R3
  ADD R2,R2,0x30                                         @convert it to ASCII BY ADDING 0X30
  B   EndIf

EndIfGreater :                                          @Else
  MOV R0, 0x4E                                           @MOVE  R0 TO 'N'
  MOV R1, 0x2F                                           @MOVE  R1 TO '/'
  MOV R2, 0x41                                           @MOVE  R2 = 'A'
 
EndIf :





















  @ End of program ... check your result

End_Main:
  BX    lr

.end
