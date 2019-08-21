include irvine32.inc

.data
	a dword 101,21,45
	b dword 20
	cc dword 30
	d dword 40
	
	msg byte "sum is : " ,0
	msg1 byte "sum is : " ,0
.code
main proc
	mov ebx,OFFSET msg
	mov edx,OFFSET msg1 
	call msgbox
	xor eax,eax
	xor edx,edx
	mov esi,offset a
	cld
	mov ecx,3
	l1:
	
	
	lodsd
	call writeint
	call crlf
	
	 
	 loop l1
 
	
	

	
	

	
	
	
	
	
	call crlf
	call crlf
	call crlf
	exit
	main ENDP
END main