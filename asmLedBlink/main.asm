; ------------------------------------------------------------------------------
; Project:  LED Blink
; File:     ledBlink.asm
; Author:   Leandro Schwarz
; Created:  2024-09-23
; Modified: 2024-10-03
; Version:  1.1
; Notes:    Blinks a LED at PB5. Fcpu = 16 MHz.
; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------
; Include definition files
; ------------------------------------------------------------------------------
.include "include/m328Pdef.inc"

; ------------------------------------------------------------------------------
; Interrupt vectors
; ------------------------------------------------------------------------------
.org 0x0000
    JMP resetHandler
.org INT0addr
    JMP int0Handler
.org INT1addr
    JMP int1Handler
.org PCI0addr
    JMP pcint0Handler
.org PCI1addr
    JMP pcint1Handler
.org PCI2addr
    JMP pcint2Handler
.org WDTaddr
    JMP wdtHandler
.org OC2Aaddr
    JMP timer2CompAHandler
.org OC2Baddr
    JMP timer2CompBHandler
.org OVF2addr
    JMP timer2OvfHandler
.org ICP1addr
    JMP timer1CaptureHandler
.org OC1Aaddr
    JMP timer1CompAHandler
.org OC1Baddr
    JMP timer1CompBHandler
.org OVF1addr
    JMP timer1OvfHandler
.org OC0Aaddr
    JMP timer0CompAHandler
.org OC0Baddr
    JMP timer0CompBHandler
.org OVF0addr
    JMP timer0OvfHandler
.org SPIaddr
    JMP spiHandler
.org URXCaddr
    JMP usartRxHandler
.org UDREaddr
    JMP usartDataEmptyHandler
.org UTXCaddr
    JMP usartTxHandler
.org ADCCaddr
    JMP adcHandler
.org ERDYaddr
    JMP eepromHandler
.org ACIaddr
    JMP analogCompHandler
.org TWIaddr
    JMP twiHandler
.org SPMRaddr
    JMP flashHandler
.org INT_VECTORS_SIZE

; ------------------------------------------------------------------------------
; Register definitions
; ------------------------------------------------------------------------------
; NONE

; ------------------------------------------------------------------------------
; Constant definitions
; ------------------------------------------------------------------------------
; NONE

; ------------------------------------------------------------------------------
; Include other assembly files
; ------------------------------------------------------------------------------
; NONE

; ------------------------------------------------------------------------------
; Constants stored in Flash memory
; Note: Variables must be multiples of 2, since memory is organized in 16 bits
; ------------------------------------------------------------------------------
; NONE

; ------------------------------------------------------------------------------
; Main function
; ------------------------------------------------------------------------------
main:
    SBI     DDRB, PB5                   ; Configures PB5 pin as output
mainLoop:
    SBI     PORTB, PB5                  ; Turns LED on
    RCALL   delayMs100                  ; Waits delay
    CBI     PORTB, PB5                  ; Turns LED off
    RCALL   delayMs100                  ; Waits delay
    JMP     mainLoop

; ------------------------------------------------------------------------------
; Function definitions
; ------------------------------------------------------------------------------
delayMs100:
    NOP                     ; Comment this line for CALL / Uncomment for RCALL
    LDI     R18, 9
    LDI     R19, 30
    LDI     R20, 226
delayMs100Loop:
    DEC     R20
    BRNE    delayMs100Loop
    DEC     R19
    BRNE    delayMs100Loop
    DEC     R18
    BRNE    delayMs100Loop
    RJMP    PC + 1
    RET

delayMs250:
    NOP                     ; Comment this line for CALL / Uncomment for RCALL
    LDI     R18, 21
    LDI     R19, 75
    LDI     R20, 188
delayMs250Loop:
    DEC     R20
    BRNE    delayMs250Loop
    DEC     R19
    BRNE    delayMs250Loop
    DEC     R18
    BRNE    delayMs250Loop
    RJMP    PC + 1
    RET

delayMs500:
    NOP                     ; Comment this line for CALL / Uncomment for RCALL
    LDI     R18, 41
    LDI     R19, 150
    LDI     R20, 125
delayMs500Loop:
    DEC     R20
    BRNE    delayMs500Loop
    DEC     R19
    BRNE    delayMs500Loop
    DEC     R18
    BRNE    delayMs500Loop
    NOP
    RET

; ------------------------------------------------------------------------------
; Interrupt handlers
; ------------------------------------------------------------------------------
int0Handler:
int1Handler:
pcint0Handler:
pcint1Handler:
pcint2Handler:
wdtHandler:
timer2CompAHandler:
timer2CompBHandler:
timer2OvfHandler:
timer1CaptureHandler:
timer1CompAHandler:
timer1CompBHandler:
timer1OvfHandler:
timer0CompAHandler:
timer0CompBHandler:
timer0OvfHandler:
spiHandler:
usartRxHandler:
usartDataEmptyHandler:
usartTxHandler:
adcHandler:
eepromHandler:
analogCompHandler:
twiHandler:
flashHandler:
resetHandler:
    LDI     R16, 0                      ; Disables USART transmitter and receiver
    STS     UCSR0B, R16                 ; ...
    LDI     R19, LOW(RAMEND)            ; Stores RAM END address on Stack Pointer
    OUT     SPL, R19                    ; ...
    LDI     R19, HIGH(RAMEND)           ; ...
    OUT     SPH,R19                     ; ...
    JMP     main
