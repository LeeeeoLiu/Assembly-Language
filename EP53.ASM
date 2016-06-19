DSEG    SEGMENT
DATA    DB      -1,2,4,-5,7,9,-15,-41,24,-3,5,-7,-8,10,14,17,-18,-55,13,20
RLT     DB      22 DUP (0)
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG
START:  MOV     AX,DSEG
        MOV     DS,AX
        MOV     DH,0    ;比较的0
        MOV     BL,0    ;计数
        MOV     CX,20
        LEA     DI,DATA
        LEA     SI,RLT
        INC     SI
GO:     MOV     DL,[DI]
        CMP     DL,DH
        JGE     PLUS
        JMP     GOON
PLUS:   INC     BL
        MOV     [SI],DL
        INC     SI
GOON:   INC     DI
        LOOP    GO
        LEA     SI,RLT
        MOV     [SI],BL
        MOV     BH,20
        SUB     BH,BL
        XOR 	AX,AX
        MOV 	AL,BL
        ADD 	AL,01H
        ADD     SI,AX
        MOV     [SI],BH
        XOR  	CX,CX
        MOV 	CL,BH
        LEA 	DI,DATA
GO2:    MOV 	DL,[DI]
        CMP 	DH,DL
        JGE 	NEGTI
        INC 	DI
        JMP 	GO2
NEGTI:	INC 	SI
		MOV 	[SI],DL
		INC  	DI
		LOOP 	GO2
        MOV     AH,4CH
        INT     21H
CSEG    ENDS
        END     START
