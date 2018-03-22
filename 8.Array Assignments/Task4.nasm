;Write a program which reads 5 numbers into an array and prints the third largest
;number. If the user enters 7, 13, 2, 10, 6 then your program should print 7.



segment .data

a:		dq 	0
cnt:		dq	0
fmt_in:		db	"%lld",0
fmt_out:	db	"%lld",10,0
segment .bss
array resq 21

segment .text
global main
extern printf,scanf


main:
	push RBP

	mov RCX,0

	INPUT_ARRAY:
	cmp RCX,5
	jz OK
	mov [cnt],RCX		;safety
	mov RDI,fmt_in		
	mov RSI,a
	call scanf
	mov RAX,[a]
	mov RCX,[cnt]		;safety
	mov [array + RCX*8],RAX
	inc RCX
	jmp INPUT_ARRAY

	OK:
	mov RCX,0
	mov RDX,0


	OUTER_LOOP:
	cmp RCX,5
	jz PRINT_3RD_LARGEST
	mov RDX,RCX
	inc RDX	

	INNER_LOOP:
	cmp RDX,5
	jz INCREMENT2
	
	mov RAX,[array+RCX*8]
	cmp RAX,[array+RDX*8]
	jl  INCREMENT1

	xchg RAX,[array+RDX*8]
	xchg RAX,[array+RCX*8]

	INCREMENT1:
	inc RDX
	jmp INNER_LOOP

	INCREMENT2:
	inc RCX
	jmp OUTER_LOOP

	PRINT_3RD_LARGEST:
	mov RDI,fmt_out
	mov RSI,[array+16]
	call printf		
	jmp END
END:
	pop RBP
ret; 
