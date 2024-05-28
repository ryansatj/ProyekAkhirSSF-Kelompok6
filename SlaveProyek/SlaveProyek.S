#define __SFR_OFFSET 0x00  
#include "avr/io.h"       

.global RESET           

RESET:
    ; Reset button input
    SBI PORTD, 4          ; Pull up bit

    ; Set LEDs and Buzzer as output 
    SBI DDRD, 2           ; set PORTD2 for output
    SBI DDRD, 3           ; set PORTD3 for output
    SBI PORTD, 2          ; turn on green LED
    CBI PORTD, 3

; Main loop
main_loop:
    rcall delay_sec
    rcall I2C_init       ; Call I2C_init subroutine
    rcall I2C_listen      ; Call I2C_listen subroutine
    rcall I2C_read        ; Call I2C_read subroutine
    cpi r16, 0x01         ; Compare received data with hex 1
    breq enable_alarm     ; If equal, branch to enable_alarm
    
    rjmp main_loop        ; Jump to main_loop

; Enable alarm (PIR sensor triggered)
enable_alarm:
    SBI PORTD, 3          ; set PORTD3 output as high, activates all alarm component
    CBI PORTD, 2          ; clear PORTD2 output, deactivate green LED

    SBIC PIND, 4         ; skip next line if button is not pressed
    rjmp enable_alarm     ; loop as long as reset button is not pressed

    rjmp RESET            ; reset all alarm component when button is pressed

I2C_init:
    LDI R21, 0b10010000                     ; Load 0b10010000 into R21
    STS TWAR, R21                           ; Store R21 into TWAR register
    LDI R21, (1<<TWEN)                      ; Load TWEN flag into R21
    STS TWCR, R21                           ; Store R21 into TWCR register
    LDI R21, (1<<TWINT)|(1<<TWEN)|(1<<TWEA) ; Load TWINT, TWEN, and TWEA flags into R21
    STS TWCR, R21                           ; Store R21 into TWCR register
    RET

I2C_listen:
    LDS R21, TWCR                           ; Load value from TWCR register into R21
    SBRS R21, TWINT                         ; Skip next instruction if TWINT flag is set
    RJMP I2C_listen                         ; Jump to I2C_listen
    RET

I2C_read:
    LDI R21, (1<<TWINT)|(1<<TWEA)|(1<<TWEN) ; Load TWINT, TWEA, and TWEN flags into R21
    STS TWCR, R21                           ; Store R21 into TWCR register
wt:
    LDS R21, TWCR                           ; Load value from TWCR register into R21
    SBRS R21, TWINT                         ; Skip next instruction if TWINT flag is set
    RJMP wt                                 ; Jump to wt
    LDS R16, TWDR                           ; Load value from TWDR register into R27
    RET

delay_sec: 
  ldi r20, 255            ; Load 255 into r20
l7: 
  ldi r21, 255            ; Load 255 into r21
l8: 
  ldi r22, 80             ; Load 80 into r22
l9: 
  dec r22                 ; Decrement r22
  brne l9                 ; Branch to l9 if r22 is not zero
  dec r21                 ; Decrement r21
  brne l8                 ; Branch to l8 if r21 is not zero
  dec r20                 ; Decrement r20
  brne l7                 ; Branch to l7 if r20 is not zero
  ret  
