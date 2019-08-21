INCLUDE Irvine32.inc
COUNT = 4	                               

.data
	array DWORD 12h,23h,56h,78h,9Ah

.code
	main PROC
	xor ebx,ebx
	xor ecx,ecx
	mov bl,COUNT
	
	mov esi,OFFSET array
	mov ecx,Lengthof array - 1
     L1:	
	push ecx		
	mov eax,[esi+TYPE DWORD]
	mov cl,bl			; shf count
	shrd [esi],eax,cl		; shf eax to high bits of esi
	add esi,TYPE DWORD		; next dword pair
	pop ecx		
	loop L1
	
	shr DWORD PTR [esi],COUNT
				       
	mov esi,OFFSET array
	mov ecx,LENGTHOF array
	mov ebx,TYPE array
	call DumpMem
	call crlf
	call writedec
	call crlf

	exit
main ENDP
END main