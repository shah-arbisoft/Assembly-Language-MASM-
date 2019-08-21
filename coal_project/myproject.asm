 INCLUDE    irvine32.inc
 INCLUDE    GraphWin.inc
 INCLUDE    virtualkeys.inc
 INCLUDELIB User32.lib
 INCLUDE my_procedures.inc


.data 
msg byte "interupt used",0

.code
MAIN PROC
	;mov ah,09h
	;mov edx, offset msg
	;int 21h 
	
	call start
	call headtitle
	call randomquestion
TOP::
	xor eax,eax
	mov esi,temp4
	mov al,arr1[esi]
	mov temp3,al
	inc esi
	mov temp4,esi
	mov edx,offset file_name
	call openfile
	mov filehandle,eax
	mov edx,offset buffersize
	mov ecx,Buffer
	call readffile
	mov ecx,eax
	mov esi,offset buffersize
	call crlf
L:
	xor eax,eax
	mov al,[esi]
	.if al==temp3
	inc esi
	mov al,[esi]
	.if al==41
	L9:
		inc esi
	L10:
		mov al,[esi]
		push eax
		mov eax,white 
		call settextcolor
		pop eax
		call writechar
		push eax
		mov eax,10 
		call settextcolor
		pop eax
		cmp al,10
			je L2
	loop L9
	.endif
	.endif
	inc esi
	loop L
	exit
L2:
	inc esi
	dec ecx
	inc count
	cmp count,2
		je L3
	jmp L10
L7:
	inc marks
	cmp counter2,10
		je L5
	call crlf
	jmp TOP
L3:
	inc total
	xor eax,eax
	mov count,0
	xor ebx,ebx
	mov ebx,ecx
	xor ecx,ecx
	xor edx,edx
	mov edx,offset str10
	mov ecx,sizeof str10-1
	mov bl,[esi]
	mov temp2,bl
	inc esi
	inc esi
	inc esi
	L222:
	
	
	
	push ebx
	push ecx
	push edx
	call nextquestion
	
L6::
	
	pop ebx
	pop ecx
	pop edx
	call clrscr
	
	call headtitle
	inc counter2
	mov al,temp1
	mov bl,temp2	
	.if al==bl 
		je L7
	.endif
	push ebx
	sub bl,32
	.if al==bl 
	je L7
	.endif
	pop bx
	jmp L4
	xor edx,edx
	xor ecx,ecx
	mov ecx,ebx
jmp L
L4::
	xor eax,eax
	mov al,total
	sub al,marks
	mov wrong,al
	cmp counter2,10
		je L5
	jmp TOP
L5:
	call resultout
	

exit
MAIN ENDP
END MAIN