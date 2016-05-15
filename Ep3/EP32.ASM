DSEG    SEGMENT
ITAB    DB      0,1,2,3,4,5,6,7,8,9,0,0,0,0,0,0,0,10,11,12,13,14,15
SUM     DB      ?
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        MOV     AH,01H  ;输入第一个数
        INT     21H
        SUB     AL,30H
        LEA     BX,ITAB
        XLAT
        MOV     CL,5H
        MUL     CL
        MOV     CL,AL
        MOV     AH,01H  ;输入第二个数
        INT     21H
        SUB     AL,30H
        XLAT
        ADD     AL,CL
        MOV     SUM,AL
        MOV     AH,4CH 
        INT     21H
CSEG    ENDS
        END     START
