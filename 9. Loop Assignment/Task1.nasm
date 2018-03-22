;Given an array of size 10. You are to take 10 inputs from the keyboard. 
;All the number will have to be unique. If you give a duplicate number, 
;it will not be included in the array. Finally your array will contain 10 unique number.



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
fmt		db	"Value: %lld, Primes: %lld",10,0
fmt_out1:	db	"n1=%lld and n2=%lld",10,0
fmt_out2:	db	"Output:",0
fmt_out3:	db	" %lld",0
fmt_out4:	db	"",10,0
fmt_out5:	db	"Difference = %lld",10,0

segment .bss
array resq 1000000

segment .text
global main
extern printf,scanf


main:
	push RBP

	mov RCX,0
	mov RDX,10

	mov RDI,fmt_in
	mov RSI,a
	mov RDX,b
	call scanf

	mov RAX,[a]
	mov [a2],RAX
	
	OUTER_LOOP:	

	
	;mov RDI,fmt
	;mov RSI,[a]
	;mov RDX,[b]	
	;call printf

	mov R8,[b]
	cmp [a],R8
	jg OK
	
	mov RAX,[a]
	

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
	mov [array + R9*8],RAX
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
	mov RDI,fmt_out1
	mov RSI,[a2]
	mov RDX,[b]
	call printf
	mov RDI,fmt_out2
	call printf
	mov RCX,0

	PRINT_INFO:
	cmp RCX,[cnt]
	jz DONE
	
	mov RDI,fmt_out3
	mov [temp],RCX
	mov RSI,[array + RCX*8]
	call printf
	mov RCX,[temp]

	test RCX,1
	jz ADD_EVEN

	ADD_ODD:
	mov RSI,[array + RCX*8]
	add [odd],RSI
	jmp INCREMENT	
	
	ADD_EVEN:
	mov RSI,[array + RCX*8]
	add [even],RSI

	INCREMENT:
	inc RCX
	jmp PRINT_INFO

	DONE:
	mov RDI,fmt_out4
	call printf
	mov R8,[odd]
	mov R9,[even]
	
	cmp R8,R9
	jg RESULT

	xchg R8,R9	
		
	RESULT:	
	sub R8,R9
	mov RDI,fmt_out5
	mov RSI,R8
	call printf

END:
	pop RBP
ret; 
