INCLUDE Irvine32.inc

.data

	op1 QWORD 0A2B2A40674981234h,0B457AFD8BC939321h,06453DC973294BFE2h,0D98709374FDECAA0h
	op2 QWORD 0A010870000234502h,0FBC974FDDC97B2A4h,0E6749332BFE253DCh,02974BC9397320002h
	sum DWORD 9 dup(0)
	msg BYTE "Sum is: ",0

.code
	main PROC

	mov  esi, OFFSET op1	
	mov  edi, OFFSET op2	
	mov  ebx, OFFSET sum	
	mov  ecx, 8	
	call Extended_Add

	mov edx, OFFSET msg	
	call WriteString

	mov esi, OFFSET sum	
	add esi, 8 * TYPE sum	 
	mov ecx, LENGTH sum	 
     L1:	
        mov eax, [esi]	 
	call WriteHex	 
	sub esi, TYPE sum	 
	loop L1

	call Crlf
	exit

main ENDP

 
	Extended_Add PROC

	pushad
	clc	
	
     L1:	
	mov eax,[esi]	
	adc eax,[edi]	 
	pushfd	 
	mov [ebx],eax	 
	add esi,4	 
	add edi,4
	add ebx,4
	popfd	 
	loop L1	 
	adc word ptr [ebx],0	 
	popad
	ret
Extended_Add ENDP

END main