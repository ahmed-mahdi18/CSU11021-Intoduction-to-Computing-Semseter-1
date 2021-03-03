  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  .global  Main

Main:

  @modeCount = 0;
  @mode = 0
  @i1 = 0;

  @ while (i1 < N)
  @{
    @ value1 = word[address1]

    @ count = 0;
    @ address2 = address1 + 4;
    @ i2 = i1 + 1
    @ While ( i2 < N)
    @ {
       @value2 = word[address2]
       @ if (value1 == value2)
       @{
         @ count = count + 1;
       @}
       @i2 = i2 + 1;
       @ address2 = address2 + 4;
      @}  
      @if (count > modeCount)
      @ {
        @mode = value1;
        @modeCount = count;
      @}

      @ i1 = i1 + 1;
      @address1 = address1 + 4;

  @}
      

    MOV R3, #0            @modeCount = 0;
    MOV R4, #0            @mode = 0
    MOV R5, #0            @i1 = 0;

    While1 :
    CMP R5, R2            @ while (i1 < N)
    BGE EndWhile          @{
    LDR R6, [R1]          @ value1 = word[address1]
    MOV R7, #0            @ count = 0;
    ADD R8, R1,#4         @ address2 = address1 + 4;
    ADD R9, R5, #1        @ i2 = i1 + 1

    While2 :
    CMP R9, R2             @ While ( i2 < N)
    BGE EndIf1              @{
    LDR R10,[R8]           @ value2 = word[address2]
    CMP R6, R10            @ if (value1 == value2)
    BNE EndIf2             @{
    ADD R7,R7,#1           @ count = count + 1;
    EndIf2 :               @}
    ADD R9,R9,#1           @i2 = i2 + 1;
    ADD R8,R8,#4           @ address2 = address2 + 4;    
    B   While2
    EndIf1 :
    CMP R7,R3             @if (count > modeCount)
    BLE EndIf3             @{
    MOV R4,R6              @mode = value1;
    MOV R3,R7              @modeCount = count;  
    MOV R0,R4              @ STORE mode=value1 into R0
    EndIf3 :               @}
    ADD R5,R5,#1           @ i1 = i1 + 1;
    ADD R1,R1,#4           @address1 = address1 + 4;
    B   While1             @}


   EndWhile :




















  @ End of program ... check your result

End_Main:
  BX    lr

