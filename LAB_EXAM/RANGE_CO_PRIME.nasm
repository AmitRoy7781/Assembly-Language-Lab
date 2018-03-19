segment .data
a:	dq	0
b:	dq	0
c:	dq	0

temp1:	dq	0
temp2:	dq	0


fmt_in:		db	"%lld %lld",0
fmt_out1:	db	"%lld:",0
fmt_out2:	db	" %lld",0
fmt_nline:	db	"",10,0

segment .bss


segment .text
global main
extern printf,scanf

main:
	push RBP


	mov RDI,fmt_in
	mov RSI,a
	mov RDX,b
	call scanf
	

	mov R8,[a]
	mov R9,[a]
	
	OUTER_LOOP:
	cmp R8,[b]
	jg END

	mov [temp1],R8
	mov [temp2],R9
	
	mov RDI,fmt_out1	
	mov RSI,R8
	call printf

	mov R8,[temp1]
	mov R9,[temp2]
	
	INNER_LOOP:
	cmp R9,[b]
	jg INCREMENT2

	mov RBX,R8
	mov RCX,R9

	cmp RCX,0
	jne GCD

	mov RCX,RBX
	jmp PRINT_GCD	
	
	GCD:
	mov RAX,RBX
	mov RDX,0
	div RCX

	cmp RDX,0
	je PRINT_GCD
	
	mov RBX,RCX
	mov RCX,RDX
	jmp GCD

	PRINT_GCD:
	cmp RCX,1
	jne INCREMENT1

	mov [temp1],R8
	mov [temp2],R9
	
	mov RDI,fmt_out2	
	mov RSI,R9
	call printf

	mov R8,[temp1]
	mov R9,[temp2]

	INCREMENT1:
	inc R9
	jmp INNER_LOOP


	INCREMENT2:
	mov R9,[a]
	inc R8
	
	mov [temp1],R8
	mov [temp2],R9
	
	mov RDI,fmt_nline	
	call printf

	mov R8,[temp1]
	mov R9,[temp2]	
	
	jmp OUTER_LOOP



	


END:
	pop RBP
	ret
