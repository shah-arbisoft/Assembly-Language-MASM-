include irvine32.inc

.data
	n byte "NAME : shah hussain ",0
	fn byte "FNAME : Johar Ali Shah ",0
	email byte "email : shahhussain2044",0
	e byte "age : ",0
	age dword 20
	
.code 

main proc

	xor edx,edx
	xor eax,eax
	
	mov edx , offset n
	call writestring
	call crlf
	
	mov edx , offset fn
	call writestring
	call crlf
	
	mov edx , offset email
	call writestring
	call crlf
	mov edx,offset e
	call writestring
	mov eax , age
	call writedec
	call crlf
	call crlf
	
	exit
main ENDP
end main