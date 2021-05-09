; Program to compute the LCM of two 8-bit numbers

START: IN 00H           ; Input Integer 1 from I/O port
       MOV C, A         ; Move A → C
       MOV D, A         ; Move A → D
       IN 01H           ; Input Integer 2 from I/O port
       MOV B, A         ; Move A → B
       MOV A, C         ; Move C → A

REC:   SUB B            ; Store A - B → A
       JNC REC          ; Jump to REC if not carry (A > 0)
       ADD B            ; Store A + B → A
       CPI 00           ; Compare A with 00H
       JZ OP            ; Jump to OP if zero (A = 00H)
       MOV A, D         ; Move D → A
       ADD C            ; Store A + C → A
       MOV D, A         ; Move A → D
       JMP REC          ; Unconditional Jump to REC

OP:    MOV A, D         ; Move D → A
       OUT 02H          ; Load value in A to I/O port
       HLT              ; Terminate--