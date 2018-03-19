
segment .data

fmt_in:		db	"%lld",0
fmt_star:	db	"*",0
fmt_space:	db	" ",0
fmt_Nline:	db	"",10,0
fmt_out:	db	"%lld",10,0


a:		dq	0
b:		dq	0

temp:	dq  0
temp1:	dq	0
temp2:	dq	0

segment .bss

segment .text
global main
extern printf,scanf

main:
	push RBP
	
	mov RDI,fmt_in
	mov RSI,a
	call scanf
	
	mov RCX,0
	mov RDX,0
	mov RAX,[a]
	dec RAX
	mov [b],RAX
	
	OUTER_LOOP:
	cmp RCX,[a]
	je 	END
	

	INNER_LOOP:
	cmp RDX,[a]
	je	INCREMENT2

	cmp RCX,0
	je PRINT_STAR
	
	cmp RCX,[b]
	je PRINT_STAR

	cmp RDX,0
	je PRINT_STAR

	cmp RDX,[b]
	je PRINT_STAR

	jmp PRINT_SPACE

	PRINT_STAR:
	mov [temp1],RCX
	mov [temp2],RDX
	mov RDI,fmt_star
	call printf
	mov RCX,[temp1]
	mov RDX,[temp2]
	jmp INCREMENT1


	PRINT_SPACE:
	mov [temp1],RCX
	mov [temp2],RDX
	mov RDI,fmt_space
	call printf
	mov RCX,[temp1]
	mov RDX,[temp2]
	jmp INCREMENT1
	

	INCREMENT1:
	inc RDX
	jmp INNER_LOOP	

	INCREMENT2:
	mov [temp1],RCX
	mov [temp2],RDX
	mov RDI,fmt_Nline
	call printf
	mov RCX,[temp1]
	mov RDX,[temp2]
	mov RDX,0	
	inc RCX
	jmp OUTER_LOOP
	
	
	
END:
	pop RBP
ret;
