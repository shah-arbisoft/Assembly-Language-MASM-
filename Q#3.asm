; answer 3

include irvine32.inc

.data

num word 000100100000111b    ; example given in question
msg byte "seconds  : ",0
msg1 byte "minutes  :  ",0
msg3 byte "hours    :  ",0



.code 

main proc

xor eax,eax
mov ax,num
call writebin 
call crlf
call crlf
call crlf

pushad
shl ax,11
shr ax,10
call crlf
mov edx,offset msg
call writestring
call writeint
call crlf


popad


shl ax,6
shr ax,10
mov edx,offset msg1
call writestring
call writeint

call crlf


xor eax,eax
mov ax,num
mov edx,offset msg3
call writestring
shr ax,10
call writeint

call crlf
call crlf
call crlf


	exit
	main endp
	end main