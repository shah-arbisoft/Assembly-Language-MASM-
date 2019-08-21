include irvine32.inc
.data
	a qword 3.56
	b qword 2.45
.code 
main proc
	
	
	fld a
	fsub b
	
	
	call dumpregs
	
	exit 
main endp
end main