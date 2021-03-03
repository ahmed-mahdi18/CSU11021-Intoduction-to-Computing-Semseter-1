  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:

  @
  @ write your program here
  @
  MOV R0,#0                       @result = 0
  MOV R3, #' '                    
  MOV R4, #0        
  LDRB R5, [R1]                   @ charA= [addressA]
  LDRB R6, [R2]                   @ charB = [addressB]
While1 :
  CMP R5, #0                      @ while ( charA != 0  &&  charB != 0)
  BEQ EndWhile1
  CMP R6, #0
  BEQ EndWhile1

  CMP R5, #'a'                    @ if ( char >= 'a' && char <= 'z'  )
  BLO NotlwrA
  CMP R5, #'z'
  BHI NotlwrA
  SUB R5,R5,#0x20                 @ charA = charA- 0x20
  STRB R5, [R1]                   @ [address1] = ch1

NotlwrA:                          @ if ( char >= 'a' && char <= 'z'   )
  CMP R6, #'a'                      
  BLO NotlwrB
  CMP R6, #'z'
  BHI NotlwrB
  SUB R6, R6,0x20                  @ charB= charB -0x20
  STRB R6, [R2]                    @ addressB 

NotlwrB :
  ADD R7, R7, #1                    @characterB = characterB + 1
  ADD R8, R8, #1                    @characterA = characterA + 1
  ADD R2, R2, #1                    @addressB = addressB + 1
  ADD R1, R1, #1                    @addressA = addressA +  1
  LDRB R5,[R1]
  LDRB R6,[R2]
  B    While1

EndWhile1 :                         @if ( charA != 0 || charB != 0   )
 CMP R5, #0                          
 BNE End 
 CMP R6, #0
 BNE End
 SUB R2, R2, R7                        @ addressB = addressB - characterB 
 SUB R1, R1, R8                        @ addressA = addressA - characterA     
 LDRB R5, [R1]                         @ charA = [ addressA]
 LDRB R6, [R2]                         @ charB = [ addressB]

While2 :                               
  CMP R5, #0                            @ while ( char!= 0)
  BEQ EndWhile2                         @ {
  MOV R9, #0                            @ Char =0 
  MOV R10, #0                           @ charC= 0 

For :                                  @ for ( charC 0 )
  CMP R6, #0                            @ charB!= 0
  BEQ EndFor1                          
  CMP R9, #1                           @ Char != 1 
  BEQ EndFor1 
  CMP R5, R6                           @if ( charA == charB)
  BNE EndIfNot 
  MOV R9, #1                           @Char = 1
  STRB R3, [R2]                         
  ADD R4, R4 , #1                      @Char = Char + 1 

EndIfNot :   
  ADD R2, #1                           @ addressB = addressB + 1 
  LDRB R6, [R2]                        @ charB = [addressB]
  ADD R10 , #1                         @ charC = charC + 1 
  B For 
EndFor1 :  
  SUB R2, R2, R10                       @ addressB = addressB - charC 
  LDRB R6, [R2]                         @ charB = [addressB]
  ADD R1, R1, #1                        @ byteddressA= addressA + 1 
  LDRB R5, [R1]                         @ charA = [addressA]
  B While2

EndWhile2:                            @ if ( Char = charC )                   
  CMP R4, R8  
  BNE End 
  ADD R0, R0 , #1                       @ result  = 1 

End : 





























  @ End of program ... check your result

End_Main:
  BX    lr

