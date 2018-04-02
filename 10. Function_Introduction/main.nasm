
segment .data
fmt:		db	"%lld",10,0
fmt_out:	db	"%lld + %lld = %lld",10,0
fmt_in:		db	"%lld %lld",0
fmt_num:	db	"%lld is not prime",10,0


a:		dq	0
b:		dq	0
c:		dq	0
two:		dq	2
zero:		dq	0
three:		dq	3
temp:		dq	0

segment .bss
 
segment .text
global main
extern printf,scanf


main:
	push RBP
	mov RBP,RSP

	mov RDI,fmt_in
	mov RSI,a
	mov RDX,b
	call scanf
	
	mov RAX,[a]
	mov RBX,[b]
	push RAX
	push RBX

	call ADD_NUM
	
	pop RAX
	pop RBX
	
	leave
	ret

ADD_NUM:

	
	push RBP
	mov RBP,RSP
	
	mov R8,[RBP + 24]
	mov R9,[RBP + 16]

	push R8
	call ISPRIME
	pop RAX

	cmp RAX,0
	jz FIRST_NUM

	
	push R9
	call ISPRIME
	pop RAX

	cmp RAX,0
	jz SECOND_NUM

	

	mov R8,[a]
	mov R9,[b]
	add R8,R9
	mov RDI,fmt_out
	mov RSI,[a]
	mov RDX,[b]
	mov RCX,R8
	call printf
	jmp END_1



	FIRST_NUM:
	mov RDI,fmt_num
	mov RSI,[a]
	call printf
	jmp END_1

	

	SECOND_NUM:
	mov RDI,fmt_num
	mov RSI,[b]
	call printf
	jmp END_1

	

	END_1:
	leave 	;mov RSP,RBP & pop RBP && ret



ISPRIME:

	push RBP
	mov RBP,RSP

	mov RAX,[RBP+16]
	
	cmp RAX,[two]		;check for <2
	jl NOT_PRIME

	cmp RAX,[two]		;check for 2
	jz PRIME

	test RAX,1		;check for other even numbers
	jz NOT_PRIME
	
	mov R8,[three]

	CHECK_PRIME:
	mov RCX,R8
	imul RCX,R8
	cmp RCX,[RBP+16]
	jg PRIME
	
	mov RAX,[RBP+16]
	mov RDX,0
	div qword R8
	
	cmp RDX,[zero]
	jz NOT_PRIME
	

	add R8,[two]
	jmp CHECK_PRIME



	NOT_PRIME:
	mov RAX,0
	mov [RBP+16],RAX
	jmp END_2

	
	PRIME:
	mov RAX,1
	mov [RBP+16],RAX
	jmp END_2


	END_2:
	leave



