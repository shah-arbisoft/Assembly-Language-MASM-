
.data  
	
	str1 BYTE "ENTER YOUR NAME: ",0
   	str2 BYTE "ENTER YOUR ID NUMBER: ",0
   	str3 BYTE "                                                         FAST NU",0
        str4     BYTE  "              COAL QUIZ MAKER PROJECT By Shah Hussain(P17-6016), Mikael Khalid(P16-6023), Abdullah (16-6033) ",0
   	str5 BYTE "          	      NAME: ",0
	str6 BYTE "          	      ROLL : ",0
	str7 BYTE "          	      CURRECT: ",0
	str8 BYTE "          	      INCURRECT: ",0
	str9 BYTE "          	      TOTAL: ",0
   	str10 BYTE 80 DUP(0)
        temp1 BYTE 0
	temp2 BYTE 0
	temp3 BYTE 0
	temp4 DWORD 0
	arr1 BYTE  10 dup (0)
	num DWORD 0
	index DWORD 0
	projectname BYTE "startname.txt",0
	projectname2 BYTE "startname2.txt",0
	Buffer=5000
	buffersize BYTE Buffer dup(?)
	marks BYTE 0
	wrong BYTE 0
	total BYTE 0
	file_name BYTE "Question.txt",0
	filehandle Dword ?
	Byteread DWORD ?
	count BYTE 0
	username BYTE 20 dup(0)
	id BYTE 20 dup(0)
   	counter2 BYTE 0
   	
   	;-----------------------------------FILEOUTDATA
   	resultshow byte "result.txt",0
   	handle dword 0
	;-----------------------------------MOUSEDATA 	
   	GetConsoleWindow            PROTO
	GetCurrentConsoleFont       PROTO :DWORD,:DWORD,:DWORD
	GetConsoleFontSize          PROTO :DWORD,:DWORD
	GetClientRect               PROTO :DWORD,:DWORD
	ClientToScreen              PROTO :DWORD,:DWORD
	GetCursorPos                PROTO :DWORD
	PtInRect                    PROTO :DWORD,:POINT
	
	IFNDEF CONSOLE_FONT_INFO
	CONSOLE_FONT_INFO STRUCT
	nFont             DWORD ?
	dwFontSize        COORD <>
	CONSOLE_FONT_INFO ENDS
	ENDIF
	
	GetKeyState PROTO, nVirtKey:DWORD
	cursor_position COORD <>
	coordPrevious   COORD <-1,-1> 
	hwndConsole     DWORD ?
	hStdOut         DWORD ?
	gotoxy_handle dword ?
	coordConsole    COORD <>
	str11 BYTE "CLICK ON ANY OPTION",0



.code


;-----------------------------------PROCEDURES
HEADTITLE PROC
	mov eax,11    ; head title text color
	call settextcolor
	call crlf
	
	mov edx,offset str3
	call writestring
	
	call crlf
	mov edx,offset str4
	call writestring
	xor ebx,ebx
	call crlf
	call crlf
	mov eax,white 
	call settextcolor
	ret
HEADTITLE ENDP
START PROC
	mov eax,yellow 
	call settextcolor
	call clrscr
	mov edx,offset projectname
	call openfile
	mov filehandle,eax
	mov edx,offset buffersize
	mov ecx,Buffer
	call readffile	
	mov ecx,eax
	mov esi,offset buffersize
	L71:
		mov al,[esi]
		;mov ah,02h   ; display a character
		;int 21h
		call writechar
		inc esi
	Loop L71
	mov eax,2000
	call delay 
	call clrscr
	mov eax,yellow 
	call settextcolor
	mov edx,offset projectname2
		call openfile
		mov filehandle,eax
		mov edx,offset buffersize
		mov ecx,Buffer
		call readffile	
		mov ecx,eax
		mov esi,offset buffersize
		L81:
						
		mov al,[esi]
			cmp al, 'A'               ; compare al with "A"
			jl next_char               ; jump to next character if less
			cmp al, 'Z'             ; compare al with "Z"
			jle found_letter           ; if al is >= "A" && <= "Z" -> found a letter
			cmp al, 'a'              ; compare al with "a"
			jl next_char               ; jump to next character if less (since it's between "Z" & "a")
			cmp al, 'z'              ; compare al with "z"
			jg next_char               ; above "Z" -> not a character
			found_letter:
			push eax
			mov eax,15
			call delay
			pop eax
		next_char:	
		call writechar
		
		inc esi
	Loop L81
	mov eax,white 
	call settextcolor
	
	call readint
	xor eax,eax
	call clrscr
	call crlf
	mov eax,11 
	call settextcolor
	mov edx,offset str3
	call writestring
	call crlf
	mov edx,offset str4
	call writestring
	call crlf
	mov eax,white 
	call settextcolor
	call crlf
	call crlf
	mov edx,offset str1
	call writestring
	xor ecx,ecx
	xor edx,edx
	mov eax,10
	call settextcolor
	mov edx,offset username
	mov ecx,sizeof username-1
	call readstring
	call crlf
	mov eax,white 
	call settextcolor
	mov edx,offset str2
	call writestring
	xor ecx,ecx
	xor edx,edx
	mov eax,10 
	call settextcolor
	mov edx,offset id
	mov ecx,sizeof id-1
	call readstring
	mov eax,white
	call settextcolor
	call clrscr
	ret
START ENDP
RESULTFILE PROC
		mov edx,offset resultshow
		call openfile
		mov filehandle,eax
		mov edx,offset buffersize
		mov ecx,Buffer
		call readffile
		mov ecx,eax
		mov esi,offset buffersize
		L112:
			mov al,[esi]
			call writechar
			inc esi
		Loop L112
		xor eax,eax
		mov eax,0
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
		mov handle, eax
		mov ax, 44
		mov cursor_position.x, ax
		mov eax, 11
		mov cursor_position.y, ax
		invoke SetConsoleCursorPosition, handle, cursor_position
		mov edx,offset username
		call writestring
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
		mov handle, eax
		mov ax, 44
		mov cursor_position.x, ax
		mov eax, 14
		mov cursor_position.y, ax
		invoke SetConsoleCursorPosition, handle, cursor_position
		mov edx,offset id
		call writestring
	INVOKE GetStdHandle, STD_OUTPUT_HANDLE
			mov handle, eax
			mov ax, 44
			mov cursor_position.x, ax
			mov eax, 16
			mov cursor_position.y, ax
		invoke SetConsoleCursorPosition, handle, cursor_position
			xor eax,eax
			mov al,marks
		call writedec
		call crlf
		call crlf
		call crlf
		call crlf
		call crlf
	exit
RESULTFILE ENDP
RESULTOUT PROC
	call clrscr
	call crlf
	call crlf
	call crlf
	call crlf
	mov eax,yellow
	call settextcolor
	mov edx,offset str5
	call writestring
	mov edx,offset username
	call writestring
	call crlf
	call crlf
	call crlf
	mov edx,offset str6
	call writestring
	mov edx,offset id
	call writestring
	call crlf
	call crlf
	call crlf
	mov eax,white 
	call settextcolor
	mov edx,offset str9
	call writestring
	mov eax,0
	mov al,total
	call writedec
	call crlf
	call crlf
	call crlf
	mov eax,12 
	call settextcolor
	mov edx,offset str8
	call writestring
	mov eax,0
	mov al,wrong
	call writedec
	call crlf
	call crlf
	call crlf
	mov eax,10 
	call settextcolor
	mov edx,offset str7
	call writestring
	mov eax,0
	mov al,marks
	call writedec
	mov eax,7 
	call settextcolor
	call crlf
	call crlf
	call crlf
	call crlf
	exit
RESULTOUT ENDP
RANDOMQUESTION PROC
	call  randomize
	xor eax,eax
	mov eax,10
	call randomrange
	add eax,48
	mov temp3,al
	mov ecx,10
	L712:	    
		mov num,eax
		push ecx
        	mov ecx,10
        	L222:  
			mov index,ecx
			mov eax,num
			movzx esi,arr1[ecx-1]
			.WHILE eax == 0 || eax == esi	
				call randomize
				xor eax,eax
				mov eax,10
				call randomrange
				add eax,48
				mov temp3,al
				mov num,eax
				mov ecx,11
			.ENDW
		loop L222
		pop ecx
		mov arr1[ecx-1],al
		movzx eax,arr1[ecx-1]
		loop L712
		ret
RANDOMQUESTION ENDP
READFFILE PROC
	invoke READFILE,eax,edx,ecx,ADDR Byteread,0
	mov eax,Byteread
	ret
READFFILE ENDP
OPENFILE PROC
	INVOKE CREATEFILE ,EDX,GENERIC_READ,Do_NOT_SHARE,NULL,OPEN_EXISTING,FILE_ATTRIBUTE_NORMAL,0
	ret
OPENFILE ENDP


;-----------------------------------MOUSECODE START
NEXTQUESTION PROC
	INVOKE  GetConsoleWindow
        mov     hwndConsole,eax
        INVOKE  GetStdHandle,STD_OUTPUT_HANDLE
        mov     hStdOut,eax
Lo1:
	mov bh,15 
	mov bl,50
	call move
	mov eax,yellow 
	call settextcolor
	mov edx,offset str11
	call writestring
	mov eax,white 
	call settextcolor
	
	
	mov eax,5
	call delay
	INVOKE  GetKeyState,VK_LBUTTON
	
        test ax,8080h
        jnz L234
        jmp Lo1
L234:
    	call updatemouseposition
    	.if edx==6 || edx==7
    		.if ecx<=1
    			mov al,'a'
    			mov temp1,'a'
    			jmp L6
    			exit
    			.endif
    		
    		
    		.if ecx>=24 && ecx<=26
    			mov al,'b'
		    	mov temp1,'b'
		    	jmp L6
		    	exit
		    	.endif
    		
    		
    		.if ecx>=48 && ecx<=50
    				mov al,'c'
				mov temp1,'c'
				jmp L6
				exit
				 .endif
    		
    		
    		.if ecx>=64 && ecx<=66
    		
    				mov al,'d'
				mov temp1,'d'
				jmp L6
				exit
				.endif
    		
    		
    	.endif
    	jmp Lo1
    	
    	mov eax,ecx
    	call writedec
    	mov eax,32
    	call writechar
    	mov eax,edx
    	call  writedec
    	call crlf
    	mov eax,50
    	call delay
    	
    	jmp Lo1
NEXTQUESTION ENDP
UPDATEMOUSEPOSITION PROC
        LOCAL   _rcClient       :RECT
        LOCAL   _ptCursor       :POINT
        LOCAL   _cfi            :CONSOLE_FONT_INFO
        LOCAL   _csbi           :CONSOLE_SCREEN_BUFFER_INFO
        INVOKE  GetClientRect,hwndConsole,addr _rcClient
        INVOKE  ClientToScreen,hwndConsole,addr _rcClient.left
        mov     ecx,_rcClient.left
        mov     edx,_rcClient.top
        add     _rcClient.right,ecx
        add     _rcClient.bottom,edx
        INVOKE  GetCursorPos,addr _ptCursor
        INVOKE  PtInRect,addr _rcClient,_ptCursor
        or      eax,eax
        jz      UPexit
        INVOKE  GetConsoleScreenBufferInfo,hStdOut,addr _csbi
        INVOKE  GetCurrentConsoleFont,hStdOut,0,addr _cfi
        INVOKE  GetConsoleFontSize,hStdOut,_cfi.nFont
        xchg    eax,ecx
        xor     edx,edx
        mov dword ptr _cfi.dwFontSize,ecx
        mov     eax,_ptCursor.x
        and     ecx,0FFFFh
        sub     eax,_rcClient.left
        div     ecx
        push    eax
        movzx   ecx,word ptr _cfi.dwFontSize.Y
        mov     eax,_ptCursor.y
        xor     edx,edx
        sub     eax,_rcClient.top
        div     ecx
        pop     ecx
        xchg    eax,edx
        add     cx,_csbi.srWindow.Left
        add     dx,_csbi.srWindow.Top
        mov     eax,TRUE
        mov     coordConsole.X,cx
      	mov     coordConsole.Y,dx
       UPexit: ret
UPDATEMOUSEPOSITION ENDP
MOVE PROC
		INVOKE GetStdHandle, STD_OUTPUT_HANDLE
		mov gotoxy_handle, eax
		movzx ax, bl
		mov cursor_position.x, ax
		movzx ax, bh
		mov cursor_position.y, ax
		invoke SetConsoleCursorPosition, gotoxy_handle, cursor_position
		ret
MOVE ENDP

;-----------------------------------MOUSECODE ENDS
