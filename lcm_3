; Program to compute the LCM of three 8-bit numbers


START: IN 00H           ; Input Integer 1 from I/O port
       MOV C, A         ; Move A → C
       MOV D, A         ; Move A → D
       IN 01H           ; Input Integer 2 from I/O port
       MOV B, A         ; Move A → B
       MOV A, C         ; Move C → A

       Call LCM         ; Call the LCM subroutine

       IN 02H           ; Input Integer 3 from I/O port
       MOV C, A         ; Move A → C
       MOV D, A         ; Move A → D
       IN 03H           ; Input old LCM from I/O port
       MOV B, A         ; Move A → B
       MOV A, C         ; Move C → A

       Call LCM         ; Call the LCM subroutine

       HLT              ; Terminate

LCM:   SUB B           ; Store A - B → A
       JNC LCM         ; Jump to LCM if not carry (A > 0)
       ADD B           ; Store A + B → A
       CPI 00          ; Compare A with 00H
       JZ OP           ; Jump to OP if zero (A = 00H)
       MOV A,D         ; Move D → A
       ADD C           ; Store A+C → A
       MOV D,A         ; Move A → D
       JMP LCM         ; Unconditional Jump to LCM

OP:    MOV A,D         ; Move D → A
       OUT 03H         ; Load value in A to I/O port

       RET             ; Return to main routine




