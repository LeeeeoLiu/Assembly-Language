; 子程序说明文件：
; 1.子程序名：ASCII
; 2.子程序功能：将一个字符的ASCII码显示在屏幕上
; 3.入口条件：数据存放在AL中
; 4.出口条件：无
; 5.受影响的寄存器：AX,BX,CX,DX
		PUBLIC 	ASCII
ASCII 	PROC 	NEAR
		XOR 	AH,AH
		MOV 	CL,16
		DIV 	CL
		LEA 	BX,HTAB
		MOV 	CX,AX
		XLAT 	
		MOV 	DL,AL
		MOV 	AH,02H
		INT 	21H
		MOV 	AL,CH
		XLAT 	
		MOV 	DL,AL
		MOV 	AH,02H
		INT 	21H
		MOV 	DL,'H'
		MOV 	AH,02H
		INT 	21H
		RET 
ASCII	ENDP