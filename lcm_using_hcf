; Program that computes lcm of two 8-bit numbers 
; using the GCD formula


START: CALL MUL           ; Call the MUL Subroutine
       CALL HCF           ; Call the HCF Subroutine
       CALL DIV           ; Call the DIV Subroutine
    
       HLT                ; Terminate

; Multiply the two 8-bit numbers

MUL:   IN 00H             ; Input Integer 1 from I/O port
       MOV B, A           ; Move A → B
       IN 01H             ; Input Integer 2 from I/O port
       MOV C, A           ; Move A → C
       MVI A, 00H         ; Initialize A = 0

LOOP:  ADD B              ; Store A + B → A
       JNC NEXT           ; Jump to NEXT if no carry
       INR D              ; Store D + 1 → D

NEXT:  DCR C              ; Store C - 1 → C 
       JNZ LOOP           ; Jump to LOOP if C != 0
       STA 066H           ; Store the data of A in 066H
       MOV A, D           ; Move D → A
       STA 067H           ; Store the data of A in 067H
      
       RET                ; Return to the main routine

; HCF of the two 8-bit numbers

HCF:   IN 00H             ; Take input from I/O port
       MOV B, A           ; Store first input in register B
       IN 01H             ; Take input from I/O port
       CMP B              ; Compare value in A and B
       JZ OP              ; Jump to OP if zero (A = B)
       JNC REC            ; Jump to REC if not carry (A > B)
       MOV C,A            ; Move A → C
       MOV A,B            ; Move B → A
       MOV B,C            ; Move C → B

REC:   SUB B              ; Store A-B → A
       CMP B              ; Compare value in A and B
       JZ OP              ; Jump to OP if zero (A = B)
       JNC REC            ; Jump to REC if not carry (A > B)
       MOV C,A            ; Move A → C
       MOV A,B            ; Move B → A
       MOV B,C            ; Move C → B
       JMP REC            ; Unconditional Jump to shift

OP:    STA 068H           ; Store the data of A in 068H

       RET                ; Return to the main routine

; Divide the product(16-bit) by the HCF(8-bit)

DIV:   LXI H, 066H         ; Load 0066H in the HL register pair
       MOV A, M            ; Move M → A
       INX H               ; Store HL + 1 → HL
       MOV B, M            ; Move M → B
       INX H               ; Store HL + 1 → HL 
       MOV C, M            ; Move M → C
       INR B               ; Store B + 1 → B
       LXI H,0000H         ; Load 0000H in the HL register pair

LOOP1: SUB C               ; Store A - C → A
       JC SKIP             ; Jump to SKIP if carry 

INCR:  INX H               ; Store HL + 1 → HL 
       JMP LOOP1           ; Unconditional jump to LOOP1

SKIP:  DCR B               ; Store B - 1 → B 
       JZ STORE            ; Jump to STORE if zero (B == 0)
       JMP INCR            ; Unconditional jump to INCR

STORE: XCHG                ; Swap DE and HL pair contents
       MOV A, E            ; Move E → A
       OUT 02H             ; Load value in A to I/O port
       MOV A, D            ; Move D → A
       OUT 03H             ; Load value in A to I/O port

       RET                 ; Return to the main routine



