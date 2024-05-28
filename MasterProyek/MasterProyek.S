#define __SFR_OFFSET 0x00 
#include "avr/io.h"       

.global I2C_init
.global RESET             ; Declare global symbol for RESET

RESET:
    CBI DDRD, 3           ; declare port d0 jadi input

; Main loop
main_loop:
    ; Read PIR sensor (D3)
    sbic PIND, 3         ; Skip next instruction if PORTD0 is low (PIR not triggered)
    rjmp pir_triggered    ; If PIR triggered, jump to pir_triggered

    ; PIR sensor not triggered
    ;rcall I2C_start
    ;ldi r16, 0b10010000   ; 
    ;rcall I2C_write
    ;ldi r16, 0x00         ; Load hex 0 into r16
    ;rcall I2C_write       ; Call I2C_write subroutine to send 0
    ;rcall I2C_stop
    rcall delay_sec       ; Call delay_sec subroutine for a 1-second delay
    rjmp main_loop        ; Jump back to main_loop

; PIR sensor triggered
pir_triggered:
    rcall I2C_start        
    ldi r16, 0b10010000   ; Load slave address
    rcall I2C_write       ; 
    ldi r16, 0x01         ; Load hex 1 into r16
    rcall I2C_write       ; Call I2C_write subroutine to send high signal
    rcall I2C_stop
    rcall delay_sec
    rjmp main_loop           ; Jump to RESET label

; Subroutine for 1-second delay
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
  ret                     ; Return from subroutine

I2C_init:
  LDI R21, 1<<TWPS0 ; Set prescaler to 1
  STS TWSR, R21     ; Store R21 into TWSR register
  LDI R21, 12       ; Load 12 into R21 (division factor for SCK freq = 400kHz)
  STS TWBR, R21     ; Store R21 into TWBR register
  LDI R21, (1<<TWEN) ; Load TWEN flag into R21
  STS TWCR, R21     ; Store R21 into TWCR register
  RET

I2C_start:
    LDI R21, (1<<TWINT)|(1<<TWSTA)|(1<<TWEN) ; Load TWINT, TWSTA, and TWEN flags into R21
    STS TWCR, R21         ; Store R21 into TWCR register
wt1:
    LDS R21, TWCR         ; Load value from TWCR register into R21
    SBRS R21, TWINT       ; Skip next instruction if TWINT flag is set
    RJMP wt1              ; Jump to wt1 (Wait for end of transmission)
    RET

I2C_write:
    STS TWDR, R16                 ; Store R16 into TWDR register
    LDI R21, (1<<TWINT)|(1<<TWEN) ; Load TWINT and TWEN flags into R21
    STS TWCR, R21                 ; Store R16 into TWCR register
wt2:
    LDS R21, TWCR                 ; Load value from TWCR register into R21
    SBRS R21, TWINT               ; Skip next instruction if TWINT flag is set
    RJMP wt2                      ; Jump to wt2 (Wait for end of transmission)
    RET

I2C_stop:  
    LDI R21, (1<<TWINT)|(1<<TWSTO)|(1<<TWEN) ; Load TWINT, TWSTO, and TWEN flags into R21
    STS TWCR, R21               ; Store R21 into TWCR register
    RET

