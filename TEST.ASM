DSEG    SEGMENT
ADR     DB      0A3H,35H,4FH
LEN     DB      3
RLT     DB      0
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        LEA     SI,ADR
        LEA     DI,RLT
        XOR     CH,CH
        MOV     CL,LEN
        STC
AGAIN:  MOV     AL,[SI]
        NOT     AL
        JNC     NEXT
        ADC     AL,0
NEXT:   MOV     [DI],AL
        INC     SI
        INC     DI
        LOOP    AGAIN
        DEC     SI
        DEC     DI
        OR      AL,80H
        MOV     BL,[SI]
        AND     BL,80H
        JZ      OVER
        AND     AL,7FH
OVER:   MOV     [DI],AL
        MOV     AX,4C00H
        INT     21H
CSEG    ENDS
        END     START