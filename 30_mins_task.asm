include irvine32.inc

.data
	a dword 16
	b dword 32
	cc dword 64
	d dword 64
	eqq dword ?
	ls dword ?
	gr dword ?
	count dword 0
	e dword ?
	msg dword "  ",0
	msg1 byte "count is : "
	
.code 

main proc
	
	xor eax,eax
	mov eax,a
	add eax,b
	mov e,eax
	mov edx,offset msg
	
	cmp eax,d
	
	je j1
	mov eqq,0
	
	ja lgreater
	mov gr,0
	
	jb lless
	mov ls,0
	
	
	jmp j2
	
	j1:
		mov eqq,1
		jmp j2
		
	lgreater:
		mov gr,1
		jmp j2
	lless:
		mov ls,1
		jmp j2
		
	j2:
	
	mov eax,eqq
	call writeint
	call writestring
	call crlf
	mov eax,gr
	call writeint
	call writestring
	call crlf
	mov eax,ls
	call writeint
	call writestring
	
	call crlf
	mov eax,d
	sub eax,e
	mov ecx,eax
	L1:
		inc count
	loop L1
	
	
	
	mov eax ,count
	xor edx,edx
	mov edx,offset msg1
	call writestring
	call writedec
	call crlf

	exit
main ENDP
end main