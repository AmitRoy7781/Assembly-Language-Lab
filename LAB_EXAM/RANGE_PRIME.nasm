


segment .data

a:		dq	97
a2:		dq	99
b:		dq	98
two:		dq	2d
three:		dq	3d
zero:		dq	0d
temp:		dq	0d
cnt:		dq	0d
odd:		dq	0d
even:		dq	0d

fmt_in:		db	"%lld %lld",0
fmt_out:	db	"%lld",10,0
fmt_out1:	db	"First: %lld Last: %lld Difference = %lld",10,0

segment .bss
array resq 1000000

segment .text
global main
extern printf,scanf


main:
	push RBP

	mov RDI,fmt_in
	mov RSI,a
	mov RDX,b
	call scanf

	


	
	OUTER_LOOP:	



	mov R8,[b]
	cmp [a],R8
	jg OK
	
	mov RAX,[a]
	

	cmp RAX,[two]		;check for <2
	jl NOT_PRIME

	cmp RAX,[two]		;check for 2
	je PRIME

	test RAX,1		;check for other even numbers
	jz NOT_PRIME
	
	mov R8,[three]

	CHECK_PRIME:
	mov RCX,R8
	imul RCX,R8
	cmp RCX,[a]
	jg PRIME
	
	mov RAX,[a]
	mov RDX,0
	div qword R8
	
	cmp RDX,[zero]
	jz NOT_PRIME
	

	add R8,[two]
	jmp CHECK_PRIME
	
	
	
	PRIME:
	mov RAX,[a]
	mov R9,[cnt]
	mov [array + R9 * 8],RAX
	inc RAX
	inc R9
	mov [cnt],R9
	mov [a],RAX
	jmp OUTER_LOOP


	NOT_PRIME:
	mov RAX,[a]
	inc RAX
	mov [a],RAX
	jmp OUTER_LOOP

	OK:
	mov RCX,0

	PRINT_INFO:
	cmp RCX,[cnt]
	je DONE
	
	mov [temp],RCX
	mov RDI,fmt_out
	mov RSI,[array+RCX*8]
	call printf
	mov RCX,[temp]

	inc RCX
	jmp PRINT_INFO

	DONE:
	mov RDI,fmt_out1
	mov RSI,[array]
	mov RCX,[cnt]
	dec RCX
	mov RDX,[array+RCX*8]
	mov RCX,RDX
	sub RCX,RSI
	call printf

	
	
END:
	pop RBP
ret; 
