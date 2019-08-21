include irvine32.inc

.data
	arr1 dword 4 dup(3 dup(?))   ; normal 4x3 matri
	arr2 dword 3 dup(4 dup(?))   ; for tanspose matrix
	arr3 dword 3 dup(4 dup(?))   ; for matrix multiplication
	arr4 dword 3 dup(3 dup(?))   ; for resultant matrix of multiplication
	x dword ?
	y dword ?
	z dword ?
	sum dword ?  ; diagnol sum
	num1 dword ?
	num2 dword ?
	num3 dword ?
	result dword ?
	msg dword "   ",0
	msg1 byte "reverse matrix",0
	msg2 byte "transpose matrix",0
	msg3 byte "diagnal sum is : "
	msg4 byte "resultant matrix is : ",0
	msg5 byte "1st matrix is : ",0
	msg6 byte "2nd matrix is : ",0
.code


	initialize proc       		 ; procedure for initializing array1
		call crlf
		call crlf
		mov esi , offset arr1
		mov ecx , lengthof arr1
		LL:
			call readint
			mov [esi] , eax
			add esi , 4
		loop LL
		
		
		mov esi,offset arr1  ;  for printing
		call crlf
		mov ecx,4
		mov x,ecx
			L3:       ; 
				
				mov x,ecx
				mov ecx,3
				L4:
					mov eax , [esi]
					call writedec
					add esi , 4
					mov edx,offset msg
					call writestring
							
				loop L4
				call crlf
				mov ecx,x
			loop L3
			
				
		
		call crlf
		call crlf
		ret
	initialize endp
	
	
	
	
	
	reverse proc			; procedure  to print array in reverse 
		call crlf
		call crlf
		sub esi , 4
		mov edx, offset msg
		mov ecx , 4
		L1:
			mov x,ecx
			mov ecx,3
			L2:	
				mov eax , [esi]
				sub esi , 4
				call writedec
				call writestring
			loop L2
			call crlf
		mov ecx,x
		loop L1
		call crlf
		call crlf
		ret
	reverse endp
	
	
	
	
	transpose proc       ;	procedure  for transpose of a matrix
		call crlf
		call crlf
		mov edx,offset msg
		mov edi , offset arr2
		mov esi , offset arr1
		mov y,0
		
		mov x,3
		mov ecx,3
		L1:
			mov x,ecx
			mov ecx,4
			L2:
				mov z,ecx
				mov ecx,y
				mov eax,[esi+ecx]
				mov ecx,z
				mov [edi], eax
				add edi,4
				add y,12
			
			loop L2
			sub y,44
					
		mov ecx,x
		loop L1
		
		mov esi,offset arr2  ;  for printing
			call crlf
			mov ecx,3
			mov x,ecx
			L3:       ; transposed array printing
				
				mov x,ecx
				mov ecx,4
				L4:
					mov eax , [esi]
					call writedec
					add esi , 4
					call writestring
					
				loop L4
				call crlf
			mov ecx,x
		loop L3
	
		
		call crlf
		call crlf
		ret
	transpose endp
	
	
	
	diagnol proc
		mov esi,offset arr1
		mov ecx,3
		LL:
			mov eax,[esi]
			add sum,eax
			add esi ,16
		loop LL	
		ret
	diagnol endp
	
	
	
	
	
	
	
	mullti proc        	; procedure defined for multiplication
	
	
	
	
		
		
		
		
		mov edx, offset msg
	
		call crlf
		call crlf
		
		mov esi , offset arr3     ; for initializing
		mov ecx , lengthof arr3
		LL:
			call readint
			mov [esi] , eax
			add esi , 4
		loop LL
		
		call crlf
		call crlf
		mov edx,offset msg6
					call writestring        ; 2nd matrix is
					mov esi,offset arr1  ;  for printing
					mov edx,offset msg
						call crlf
						mov ecx,4
						mov x,ecx
						LLK:       ; 
											
						mov x,ecx
						mov ecx,3
						L7K:
							mov eax , [esi]
						call writedec
						add esi , 4
						call writestring
							
					loop L7K
					call crlf
				mov ecx,x
		loop LLK
		
		
		
		call crlf
		call crlf
		mov edx, offset msg5
		call writestring        ; 1st matrix is
		mov esi,offset arr3  ;  for printing
					call crlf
					mov edx,offset msg
					mov ecx,3
					mov x,ecx
					L6:       ; transposed array printing
						
						mov x,ecx
						mov ecx,4
						L7:
							mov eax , [esi]
							call writedec
							add esi , 4
							call writestring
							
						loop L7
						call crlf
					mov ecx,x
		loop L6
		
		call crlf
		call crlf
		
		mov esi ,offset arr1     ; 2nd matrix    
		mov edi ,offset arr3   ;   1st matrix
		
		
		
		call crlf
		call crlf
		mov edx,offset msg4
		call writestring
		call crlf
		call crlf
		mov ecx,3
		mov x,ecx
		LLL1:
			mov x,ecx
			mov ecx,4
			mov num1,0
			mov num2,0
			mov num3,0
			L1:

				mov eax,[esi]
				mov ebx, [edi]
				mul ebx
				add num1,eax

				mov eax,[esi+4]
				mov ebx,[edi]
				mul ebx
				add num2,eax

				mov eax,[esi+8]
				mov ebx,[edi]
				mul ebx
				add num3,eax

				add esi,12
				add edi,4

			loop L1
			
			mov esi,offset arr1
			mov edx,offset msg
			
			mov eax,num1
			call writedec
			call writestring
			mov eax,num2
			call writedec
			call writestring
			mov eax,num3
			call writedec
			call crlf
		mov ecx,x
		dec ecx
		jne LLL1
		
		
		
		
		
		
		
		
		
		ret
	mullti endp
	

	main proc
	mov sum,0
	mov num1,0
	mov num2,0
	mov num3,0
	
	
	call initialize
	mov edx,offset msg1
	call writestring
	
	call reverse
	
	mov edx,offset msg2
	call writestring
	
	call transpose
	
	mov edx, offset msg3
	call writestring
	call diagnol
	mov eax,sum
	call writedec
	call crlf
	call crlf
	call crlf
	
	call mullti
	
	call crlf
	exit 
	main endp
	end main