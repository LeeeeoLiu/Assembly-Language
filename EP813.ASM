		PUBLIC 	MMUL
MMUL 	PROC 	NEAR
		PUSH 	BX
		MOV 	BL,[BX]
		XOR 	BH,BH  
MMUL0:	OR 		BL,BL
		JNZ 	MMUL1
		POP 	BX
		RET 
MMUL1:	SHR		BL,1
		JNC 	MMUL2
		CALL 	MADD
MMUL2:	CALL 	MSHL
		JMP 	MMUL0
MMUL 	ENDP