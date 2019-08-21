TITLE Comparing Strings (Compare.asm)
INCLUDE Irvine32.inc
.data
string_1 BYTE "ABCDEF",0
string_2 BYTE "IJKLMN",0

.code
main PROC
call Clrscr
mov esi,offset string_1 
mov edi,offset string_2 
mov ecx,lengthof string_1

push offset string_1
push offset string_2
pop esi





mov edx,esi

call writestring
call crlf



exit
main ENDP
END main