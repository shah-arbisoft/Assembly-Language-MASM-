include irvine32.inc

.data
	arr dword 8 dup(?)
	msg dword  "  ",0
	;msg1 byte "zero found : ",0
	zerocount dword ?
	mini dword ?
	
.code
	
	initialize proc
		mov esi, offset arr
		mov ecx, lengthof arr
		L1:
			call readint
			mov [esi],eax
			add esi,4
		loop L1
		call crlf
		call crlf
		ret
	initialize endp
	
	print proc
		mov esi,offset arr
		mov ecx,lengthof arr
		L1:
			mov eax,[esi]
			call writedec
			call writestring
			add esi,4
			
		loop L1
		call crlf
		call crlf
		ret
	print endp
	
	zero proc
		
		
		mov esi,offset arr
		mov ecx,lengthof arr
		L1:
			mov eax,[esi]
			
			cmp eax,0   
			jnz zz
			inc zerocount
			
			zz:
			add esi,4
					
		loop L1
		
		ret
	zero endp
	
	
	
	min proc
		mov esi,offset arr
		mov ecx,lengthof arr
		L1:
			mov eax,[esi]
			
			cmp eax,mini   
			jle zz
			mov mini,eax
				
			zz:
				add esi,4
							
		loop L1

		ret
	min endp
			

	
	main proc
	mov mini ,0
	mov zerocount,0
	mov edx,offset msg
	call initialize
	call print
	
	call zero
	
	mov eax,zerocount
	call writedec
	call crlf
	call min
	call crlf
	mov eax,mini
	call writedec
	exit
	main endp
	
end main
