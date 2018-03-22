; Write an assembly program that reads 10 numbers from the user and prints the first and
; last odd number in the list.

segment .data

a:		dq 	0
cnt:		dq	0
fmt:		db	"%lld",0
fmt1: 		db	"First ODD = %lld",10,0
fmt2: 		db	"Last ODD  = %lld",10,0
fmt3:		db	"No ODD numbers",10,0

segment .bss
array resq 21

segment .text
global main
extern printf,scanf


main:
	push RBP

	mov RCX,0
	mov RBX,0
	mov RDX,0

	INPUT_ARRAY:
	cmp RCX,10
	jz OK
	mov [cnt],RCX		;safety
	mov RDI,fmt		
	mov RSI,a
	call scanf
	mov RAX,[a]
	mov RCX,[cnt]		;safety
	mov [array + RCX*8],RAX
	add RBX,RAX
	inc RCX
	jmp INPUT_ARRAY

	OK:
	mov RCX,0
	

	FIRST_ODD:
	cmp RCX,10
	jz NO_ODD
	mov RAX,[array + RCX*8]
	test RAX,1
	jnz PRINT_FIRST_ODD
	inc RCX
	jmp FIRST_ODD

	
	PRINT_FIRST_ODD:
	mov RDI,fmt1
	mov RSI,RAX
	call printf

	mov RCX,9

	SECOND_ODD:
	cmp RCX,-1
	jz END
	mov RAX,[array+RCX*8]
	test RAX,1
	jnz PRINT_SECOND_ODD
	dec RCX
	jmp SECOND_ODD
	
	PRINT_SECOND_ODD:
	mov RDI,fmt2
	mov RSI,RAX
	call printf
	jmp END

	NO_ODD:
	mov RDI,fmt3
	call printf
	jmp END


END:
	pop RBP
ret
