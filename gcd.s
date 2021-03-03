  .syntax unified
  .cpu cortex-m4
  .thumb
  .global  Main

Main:

  @ Write an ARM Assembly Language Program that will compute
  @   the GCD (greatest common divisor) of two numbers in R2 and R3.
  @ Test by computing GCD of 45 and 27
  @ LDR   R2, =45
  @ LDR   R3, =27
  
@ whil e ( a != b )
@ {
@ i f ( a > b )
@ {
@ a = a − b ;
@ }
@ e l s e
@ {
@ b = b − a ;
@ }
@ }
@ r e s u l t = a ;

While:

  CMP R2,R3
  BEQ EndWh

  CMP R2,R3
  BLS ElseGreaterB
  SUB R2,R2,R3
  B   EndIfLabel
  
ElseGreaterB:
  SUB R3,R3,R2

EndIfLabel:
  B  While
   
EndWh: 
  MOV R0, R2




  @ End of program ... check your result

End_Main:
  BX    lr

.end
