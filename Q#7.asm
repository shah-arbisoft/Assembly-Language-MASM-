INCLUDE Irvine32.inc;

.data

	arr dword 2,3,4,5,6,7,8,9,10,11,12,13,14
	num dword ?
	n dword 2
	msg byte "	not prime",0
	msg1 byte " 	prime ",0
	

.code

is_prime proc uses ecx

    mov num , eax
    
    xor edx,edx
    div n
    mov ecx,eax
   
    L:
        xor edx,edx
    	mov eax,num
    	
    	
    	cmp ecx,1
    	jz ll
    	
    	
    	div ecx	
    	cmp edx,0
    	jz J	
    	loop L	
    J:
    
    mov edx,offset msg
    call writestring
    jmp endd
    
    ll:
    	mov edx, offset msg1
    	call writestring
    	
    
    endd:
   
    
    ret
is_prime endp

	
main proc


	
	
   mov ecx,13
   mov esi,offset arr
   
   
   
   LLL:
  
   
   	mov eax,[esi]
   	call writeint
  	call is_prime
 	add esi , 4
	call crlf	
   	loop LLL
   
    	
    
    
    

  call crlf
    exit
main ENDP
END main