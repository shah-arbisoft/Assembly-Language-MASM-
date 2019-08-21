INCLUDE Irvine32.inc

.data
	msg BYTE "The Difference of the two equals : ",0
	val1 QWORD 0fh
	val2 QWORD 0ah
	res QWORD 1 DUP(0)	
	DoubleWords = SIZEOF val1 / TYPE DWORD

.code
	main PROC

	mov  esi, OFFSET val1	
	mov  edi, OFFSET val2	
	mov  ebx, OFFSET res	
	mov  ecx, DoubleWords
	call Extended_Sub

	mov edx, OFFSET msg	
	call WriteString

	mov esi, OFFSET res
	add esi, DoubleWords * 4	; move to end of last dword in result
	mov ecx, DoubleWords	

     L1:	
	sub esi, TYPE DWORD	
	mov eax, [esi]	
	call WriteHex	
	loop L1

	call Crlf
	exit
main ENDP

	Extended_Sub PROC

	pushad
	clc

     L1:	
	mov eax,[esi]	
	sbb eax,[edi]	
	pushfd	
	mov [ebx],eax	
	add esi,4	
	add edi,4
	add ebx,4
	popfd	
	loop L1	

	sbb word ptr [ebx],0	; subtract any leftover carry
	
	popad
	
	ret
Extended_Sub ENDP

END main