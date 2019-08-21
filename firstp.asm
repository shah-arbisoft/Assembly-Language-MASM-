INCLUDE Irvine32.inc;

.data
    count dword 10
    msg byte "enter a number  ",0
    num dword 0FFFFFFFFh

.code
    main PROC
    
    
    xor eax,eax
    
    mov eax,num
    call dumpregs
    add eax,5h
    pushfd
    call writehex
    call crlf
    popfd
    call dumpregs
    
    mov edx,offset msg
    call writestring
    xor edx,edx
    call readint
    
    L1:
    idiv count
    add num,edx
    xor edx,edx
    cmp eax,0
    jnz L1
    
    mov eax,num
    call writeint
    call crlf
    exit
main ENDP
END main
