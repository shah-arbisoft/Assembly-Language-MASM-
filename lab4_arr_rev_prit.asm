include irvine32.inc


.data
	num dword 10 dup(?)	
.code
main proc

	xor eax,eax
	xor ecx,ecx
	xor esi,esi
	mov ecx , 10	
	f:
	   call readint
	    mov num[esi],eax
	    add esi,4	   
	loop f
	sub esi,4
	
	call crlf
	call crlf
	
	mov ecx,10
	g:
		     
		    mov eax,num[esi]
		    call writedec
		    call crlf
		    sub esi,4		   
	loop g
	
	
	call crlf
	exit
	main ENDP
end main