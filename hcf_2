; Program to compute the GCD of two 8-bit numbers

Start: IN 00H         ; Take input from I/O port
       MOV B, A       ; Store first input in register B
       IN 01H         ; Take input from I/O port
       CMP B          ; Compare value in A and B
       JZ OP          ; Jump to OP if zero (A = B)
       JNC REC        ; Jump to REC if not carry (A > B)
       MOV C,A        ; Move A → C
       MOV A,B        ; Move B → A
       MOV B,C        ; Move C → B

REC:   SUB B          ; Store A-B → A
       CMP B          ; Compare value in A and B
       JZ OP          ; Jump to OP if zero (A = B)
       JNC REC        ; Jump to REC if not carry (A > B)
       MOV C,A        ; Move A → C
       MOV A,B        ; Move B → A
       MOV B,C        ; Move C → B
       JMP REC        ; Unconditional Jump to REC

OP:    OUT 02H        ; Load value in A to I/O port
       HLT            ; Terminate