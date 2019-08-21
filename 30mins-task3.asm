include irvine32.inc

.data
	arr dword 15,9,4,19,22,30,45,0,0,2,20
	msg byte "after sorting ",0
	msg1 byte "  ",0
	temp dword ?
	pivot dword ?
	n dword ?
	p dword ?
	
.code 

main proc

	xor eax,eax
	mov esi , offset arr
	mov eax,offset arr
	add eax,sizeof arr
	sub eax,type arr
	mov edi,eax
	xor eax,eax          
	
	  		;esi represents temp or first element
	  		;edi represents pivot or last element
	l1:
		mov eax,[esi]
		mov temp,eax
		mov eax,[edi]
		mov pivot ,eax
		
		mov eax,temp
		cmp eax,pivot
		
		jne jj
		mov eax,temp
		xchg eax,pivot
		mov arr[esi],eax
		mov eax,pivot
		mov arr[edi],eax
		
		sub edi,type arr
		
		jj:
			add esi,type arr
	
	
	cmp esi,edi
	jne l1
	
	mov edx,offset msg1
	mov esi,offset arr
	mov eax,lengthof arr
	mov ecx,lengthof arr
	loooop:
		xor eax,eax
		mov eax,[esi]
		add esi,type arr
		call writedec
		call writestring
	loop loooop
	
	
	
	exit
main ENDP
end main