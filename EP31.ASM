DSEG    SEGMENT
RAL     DW      ?
HTAB    DB      '0123456789ABCDEF'
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        MOV     AH,01H
        INT     21H
        SUB     AL,30H
        MOV     BL,AL
        MOV     DL,'*'
        MOV     AH,02H
        INT     21H
        MOV     AH,01H
        INT     21H
        SUB     AL,30H
        MUL     BL
        MOV     RAL,AX
        MOV     DX,AX
        MOV     AL,DL
        MOV     DL,'='
        MOV     AH,02H
        INT     21H
        MOV     DL,AL
        MOV     AL,DH          
        MOV     CH,DH
        MOV     DH,DL
        MOV     CL,4
        SHR     AL,CL
        MOV     CL,DL
        LEA     BX,HTAB
        XLAT
        MOV     DL,AL
        MOV     AH,02H
        INT     21H
        AND     CH,0FH
        MOV     AL,CH
        XLAT
        MOV     DL,AL
        MOV     AH,02H
        INT     21H
        MOV     AL,DH
        MOV     CH,DH
        MOV     CL,4
        SHR     AL,CL
        XLAT
        MOV     DL,AL
        MOV     AH,02H
        INT     21H
        AND     CH,0FH
        MOV     AL,CH
        XLAT
        MOV     DL,AL
        MOV     AH,02H
        INT     21H
        MOV     DL,'H'
        MOV     AH,02H
        INT     21H
        MOV     AH,4CH
        INT     21H
CSEG    ENDS
        END     START
