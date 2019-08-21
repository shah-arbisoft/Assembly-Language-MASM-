include irvine32.inc


.data
	num dword  10
	n dword ?
	msg1 dword "*",0
	
.code
main proc

	xor eax,eax
	xor ecx,ecx
	xor edx,edx
	
	
	mov ecx,10
	mov n,9
	f:
	    mov num , ecx
	    call crlf
	    
	   ; sub num,n
	   ; dec n
	   ; mov ecx,num
	    g:
	     	mov edx, offset msg1
	    	call writestring
	    loop g
	    
	mov ecx , num
	loop f
	
	
	

	call crlf
	exit
	main ENDP
end main