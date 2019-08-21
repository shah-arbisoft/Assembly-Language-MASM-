include irvine32.inc


.data
	byte1 byte 3Bh
	byte2 byte 46h
	byte3 byte 0ffh
	
	count word  0
	msg byte "number of ones found  :  ",0
	msg2 byte "enter number for counting ones ",0
	arrayByte byte 0ABh, 0BCh, 0CDh, 0DEh, 0EFh, 0FAh
	arrayinput word 6 dup(?)





.code


; question 4

BitwiseMultiply proc uses ecx edx esi
	mov edx,0
	mov ecx,32
	L1:
		test ebx,1
		jz L2
		add edx,eax
		jc L3
	
	L2: 
		shr ebx,1
		shl eax,1
		jc L3
		loop L1
	L3:
		mov eax,edx
		ret
	BitwiseMultiply endp
		
main proc


	
	xor eax,eax
	movzx ax,byte1
	shr al,4
	call writehex
	
	
	call crlf 
	call crlf 
	
	xor eax,eax
	xor ebx,ebx
	
	movzx ax,byte1
	movzx bx,byte2
	
	
	
	
	shl ebx,12
	mov bx,0
	shl ebx,12
	shrd ebx,eax,4
	shr ebx,24
	mov eax,ebx
	call writehex
	call crlf
	call crlf 
	
	xor eax,eax
	xor ebx,ebx
	
	movzx ax,byte2
	movzx bx,byte3
	shl ebx,12
	mov bx,0
	shl ebx,12
	shrd ebx,eax,4
	shr ebx,24
	mov eax,ebx
	
	call writehex
	call crlf
	call crlf 
	
	;xor eax,eax
	;call readint
	;call writebin
	;call crlf
	;ror ax,1
	;call writebin
	call crlf
	call crlf 
	

	; question 3

	xor eax,eax
	mov edx,offset msg2
	call crlf
	call writestring
	call crlf
	call readint
	mov edx,offset msg
	call crlf
	L3:
	call writebin
	call crlf
	mov count,0
	mov ecx,16
	L1:
		shr ax,1
		jnc L2
		inc count	
		L2:	
	loop L1
	mov ax,count
	call writestring
	call writedec
	call crlf
	cmp ax , 1
	jne L3
	
	call crlf
	
	
	; question 5
	
	
	

	exit
main endp
end main