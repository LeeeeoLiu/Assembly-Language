DSEG    SEGMENT
NUM     DB      5
SUM     DW      ?
DSEG    ENDS
CSEG    SEGMENT
        ASSUME CS: CSEG,DS: DSEG
START:  MOV AX,DSEG
        MOV DS,AX
        XOR CH,CH
        MOV AL,1
        MOV BL,1
DATA:   MUL BL
        INC BL
        LOOP DATA
        MOV SUM,AX
        MOV AH,4CH
        INT 21H
CSEG    ENDS
        END START
