DSEG    SEGMENT
ADR     DB      0A3H,35H,4FH
LEN     DB      3
TEMP	DB		?,?,?
RLT     DB      0
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        LEA     SI,ADR
        LEA     DI,TEMP
        MOV 	CX,0003H
AGAIN:  MOV     AL,[SI]
        NOT     AL
        MOV 	[DI],AL
        INC     SI
        INC     DI
        LOOP 	AGAIN
        MOV     AX,4CH
        INT     21H
CSEG    ENDS
        END     START