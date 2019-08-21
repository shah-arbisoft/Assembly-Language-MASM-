include irvine32.inc

.data


	t dword ?
	
	maxxx dword 0
	var1 dword ?
	var2 dword ?
	var3 dword ?
	var4 dword ?
	var5 dword ?
	msg0 byte  "enter 5 integers",0
	msg byte "enter an integer from 1-12 ",0
	msg1 byte  "given integer is not in range of 1-12  ",0
	msg2 byte "january",0
	msg3 byte "Februaru",0
	msg4 byte "March",0
	msg5 byte "April",0
	msg6 byte "May",0
	msg7 byte "june",0
	msg8 byte "July",0
	msg9 byte "August",0
	msg10 byte "September",0
	msg11 byte "October",0
	msg12 byte "November",0
	msg13 byte "December",0
	
	

.code

monthname proc
	
	
	

	
		zz:
			mov edx,offset msg1
			call writestring
			call crlf
				
		mov edx,offset msg
		call writestring 
		call crlf
		call readint
		cmp eax,0
	jbe zz

	
	cmp eax,1
	je L1
	cmp eax,2
	je L2
	cmp eax,3
	je L3
	cmp eax,4
	je L4
	cmp eax,5
	je L5
	cmp eax,6
	je L6
	cmp eax,7
	je L7
	cmp eax,8
	je L8
	cmp eax,9
	je L9
	cmp eax,10
	je L10
	cmp eax,11
	je L11
	cmp eax,12
	je L12
	
	
	
		L1:
			
			mov edx,offset msg2
			call writestring
			jmp back
		
		L2:
				mov edx, offset  msg3
				call writestring
				jmp back
		
		L3:
				mov edx, offset  msg4
				call writestring
				jmp back
		
		L4:
				mov edx,offset  msg5
				call writestring
				jmp back
		
		L5:
				mov edx, offset msg6
				call writestring
				jmp back
		
		L6:
				mov edx, offset msg7
				call writestring
				jmp back
		
		L7:
				mov edx, offset msg8
				call writestring
				jmp back
		
		L8:
				mov edx, offset msg9
				call writestring
				jmp back
		
		L9:
				mov edx, offset msg10
				call writestring
				jmp back
		
		L10:
				mov edx, offset msg11
				call writestring
				jmp back
		
		
		L11:
				mov edx, offset msg12
				call writestring
				jmp back
		
		L12:
				mov edx, offset  msg13
				call writestring
				jmp back
	
	
	
	back:
	
	ret
monthname endp

swap proc
		cmp maxxx,eax
		jae J
		mov maxxx,eax
		J:
		ret 
		swap endp


maxx proc
	mov edx,offset msg0
	call writestring
	
		
	
		
		
	
	
		
		
		call crlf
		call readint
		mov var1,eax
		
		call readint
		mov var2,eax
		
		call readint
		mov var3,eax
		
		call readint
		mov var4,eax
		
		call readint
		mov var5,eax
				
	
	
	
	
	
	xor eax,eax
	
	
	
		
		
		
	
		
		
		
	
	
	
	
	mov eax,var1
	call swap
	
	mov eax,var2
	call swap
	
	mov eax,var3
	call swap
	
	mov eax,var4
	call swap
	
	mov eax,var5
	call swap
	
	
	
	
	
	mov eax,maxxx
	
	
	call writestring
	call crlf
	call crlf
	call writedec
	
	ret
maxx endp
	





main proc
	xor eax,eax
	
	call maxx
	call crlf
	
	
	
	
	
	
	
	exit
	main endp
	end main