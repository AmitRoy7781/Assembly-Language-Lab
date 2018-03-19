segment .data
fmt_in:		db	"%lld",0
fmt_star:	db	"*",0
fmt_space:	db	" ",0
fmt_nline:	db	"",10,0

a:		dq	0
temp1:		dq	0
temp2:		dq	0
temp3:		dq	0

segment .bss

segment .text
global main
extern printf,scanf

main:
	push RBP
	
	mov RDI,fmt_in
	mov RSI,a
	call scanf
	
	mov RCX,1
	mov RDX,1
	mov RAX,1

	OUTER_LOOP:	
	cmp RCX,[a]
	jg END

	INNER_LOOP:
	cmp RDX,[a]
	jg INCREMENT2

	cmp RCX,[a]
	je PRINT_STAR

	cmp RDX,1
	je PRINT_STAR

	cmp RDX,RAX
	je PRINT_STAR

	PRINT_SPACE:
	mov [temp1],RCX
	mov [temp2],RDX
	mov [temp3],RAX
	
	mov RDI,fmt_space
	call printf
	
	mov RCX,[temp1]
	mov RDX,[temp2]
	mov RAX,[temp3]
	jmp INCREMENT1
	
	
	PRINT_STAR:
	mov [temp1],RCX
	mov [temp2],RDX
	mov [temp3],RAX
	
	mov RDI,fmt_star
	call printf
	
	mov RCX,[temp1]
	mov RDX,[temp2]
	mov RAX,[temp3]
	jmp INCREMENT1




	INCREMENT1:
	inc RDX
	jmp INNER_LOOP
	
	INCREMENT2:
	mov [temp1],RCX
	mov [temp2],RDX
	mov [temp3],RAX
	
	mov RDI,fmt_nline
	call printf
	
	mov RCX,[temp1]
	mov RDX,[temp2]
	mov RAX,[temp3]
	
	mov RDX,1
	inc RAX
	inc RCX
	jmp OUTER_LOOP

END:
	pop RBP
	ret	
