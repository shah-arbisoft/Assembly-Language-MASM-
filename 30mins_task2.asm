include irvine32.inc

.data
	n dword ?
	a dword 90
	b dword 80
	cc dword 70
	d dword 60
	f dword 'f'
	msg byte "enter an integer between 0-100",0
	msg1 byte "your grade is :  "
	
.code 

main proc

	xor eax,eax
	mov edx,offset msg
	call writestring
	call crlf
	call readint
	
	cmp eax,a
	jae gradeA
	
	cmp eax,b
	jae gradeB
	
	cmp eax,cc
	jae gradeC
	
	cmp eax,d
	jae gradeD
	
	mov eax,'F'
	jmp ex
	
	gradeA:
		mov eax,'A'
		jmp ex
		
	gradeB:
		mov eax,'B'
		jmp ex
	
	gradeC:
		mov eax,'C'
		jmp ex
	
	gradeD:
		mov eax,'D'
		jmp ex
	
	ex:
	mov edx,offset msg1
	call crlf
	call writestring
	call writechar
	call crlf
	call crlf
	call crlf

	exit
main ENDP
end main