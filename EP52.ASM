DSEG    SEGMENT
DATA    DB      -1,5,10,7,6,-5,1,3,-4,8
MAX     DB      0
MIN     DB      0
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        MOV     CX,10
        LEA     SI,DATA
GO:     MOV     DL,[SI]
        MOV     BH,MAX
        MOV     BL,MIN
        CMP     DL,BH
        JGE     MAXE
TESTM:  CMP     DL,BL
        JLE     MINE
        JMP     GOON
MAXE:   MOV     MAX,DL
        JMP     TESTM
MINE:   MOV     MIN,DL
GOON:   INC     SI
        LOOP    GO
        MOV     AH,4CH
        INT     21H
CSEG    ENDS
        END     START
