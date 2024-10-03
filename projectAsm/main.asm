; ------------------------------------------------------------------------------
; Project:  ASM template project
; File:     main.asm
; Author:   Leandro Schwarz
; Created:  2024-09-23
; Modified: 2024-10-03
; Version:  1.0
; Notes:    This is an assembly project template. Fcpu = 16 MHz.
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
mainLoop:
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
    RETI                                ; Returns from interrupt
int1Handler:
    RETI                                ; Returns from interrupt
pcint0Handler:
    RETI                                ; Returns from interrupt
pcint1Handler:
    RETI                                ; Returns from interrupt
pcint2Handler:
    RETI                                ; Returns from interrupt
wdtHandler:
    RETI                                ; Returns from interrupt
timer2CompAHandler:
    RETI                                ; Returns from interrupt
timer2CompBHandler:
    RETI                                ; Returns from interrupt
timer2OvfHandler:
    RETI                                ; Returns from interrupt
timer1CaptureHandler:
    RETI                                ; Returns from interrupt
timer1CompAHandler:
    RETI                                ; Returns from interrupt
timer1CompBHandler:
    RETI                                ; Returns from interrupt
timer1OvfHandler:
    RETI                                ; Returns from interrupt
timer0CompAHandler:
    RETI                                ; Returns from interrupt
timer0CompBHandler:
    RETI                                ; Returns from interrupt
timer0OvfHandler:
    RETI                                ; Returns from interrupt
spiHandler:
    RETI                                ; Returns from interrupt
usartRxHandler:
    RETI                                ; Returns from interrupt
usartDataEmptyHandler:
    RETI                                ; Returns from interrupt
usartTxHandler:
    RETI                                ; Returns from interrupt
adcHandler:
    RETI                                ; Returns from interrupt
eepromHandler:
    RETI                                ; Returns from interrupt
analogCompHandler:
    RETI                                ; Returns from interrupt
twiHandler:
    RETI                                ; Returns from interrupt
flashHandler:
    RETI                                ; Returns from interrupt
resetHandler:
    LDI     R16, 0                      ; Disables USART transmitter and receiver
    STS     UCSR0B, R16                 ; ...
    LDI     R19, LOW(RAMEND)            ; Stores RAM END address on Stack Pointer
    OUT     SPL, R19                    ; ...
    LDI     R19, HIGH(RAMEND)           ; ...
    OUT     SPH,R19                     ; ...
    JMP     main
