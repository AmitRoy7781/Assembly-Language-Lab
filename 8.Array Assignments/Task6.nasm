;Write a program which reads 5 numbers into an array, sorts/arranges the numbers from
;low to high and prints all numbers in the array.
;If the user enters 7, 13, 2, 10, 6 then your program should print 2, 6, 7, 10, and 13.



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
	jz DONE
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

	DONE:
	mov RCX,0
	
	PRINT_ARRAY:
	cmp RCX,5
	jz END
	mov [cnt],RCX
	mov RDI,fmt_out
	mov RSI,[array + RCX*8]
	call printf
	mov RCX,[cnt]
	inc RCX
	jmp PRINT_ARRAY	
		
	jmp END
END:
	pop RBP
ret; 
