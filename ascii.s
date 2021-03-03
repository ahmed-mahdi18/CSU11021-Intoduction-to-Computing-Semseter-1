  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  @ Write an ARM Assembly Language Program that will convert
  @    a sequence of four ASCII characters, each representing a
  @    decimal digit, into tje to the value represented by the
  @    sequence.
  
  @ e.g. '2', '0', '3', '4' (or 0x32, 0x30, 0x33, 0x34) to 2034 (0x7F2)
  @ 0x7f2
  @R1, =0x34   @ '4'
  @R2, =0x33   @ '3'
  @R3, =0x30   @ '0'
  @R4, =0x32   @ '2'
  
   LDR R0, = 0     @ TOTAL = 0
   LDR R5, = 0x30   
   SUB R4,R4,R5    @ R4= 0X32 - 0X30 = 2
   ADD R0,R0,R4    @ TOTAL = TOTAL + 2
  
   MOV R6, #10     
   MUL R0,R0,R6    @ TOTAL = TOTAL X 10
   SUB R3,R3,R5    @ R3 = 0X30 - 0X30 = 0
   ADD R0,R0,R3    @ TOTAL = TOTAL + 0= 20

   MOV R6, #10 
   MUL R0,R0,R6    @ TOTAL = TOTAL X 10
   SUB R2,R2,R5    @ R2 = 0X33 - 0X30 = 3
   ADD R0,R0,R2    @ TOTAL = TOTAL + 3 = 203

   MOV R6, #10 
   MUL R0,R0,R6    @ TOTAL = TOTAL X 10
   SUB R1,R1,R5   @ R1 = OX34 - 0X30 = 4
   ADD R0,R0,R1    @ TOTAL = TOTAL + 4= 2034 
    

  @ End of program ... check your result

End_Main:
  BX    lr

.end
