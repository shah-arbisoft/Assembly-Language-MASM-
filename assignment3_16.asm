include irvine16.inc
.model small
.stack 100h
.data
.code
	main proc

		mov ah,1h   ; read a charach from user
		int 21h		;print function
		
		mov dl,al
		call crlf 
		
		mov ah,02h   ; display a character
		int 21h
	
		exit
	main endp
	end main