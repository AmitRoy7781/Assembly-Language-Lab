;Write an assembly program that would input twenty numbers from the user and print
;sum, then the first number, then the 2 nd number followed by 3rd number and so on.


segment .data

a:		dq 	0
cnt:		dq	0
fmt:		db	"%lld",10,0
fmt_in: 	db	"%lld",0
fmt_out: 	db	"SUM = %lld",10,0

segment .bss
array resq 21

segment .text
global main
extern printf,scanf


main:
	push RBP

	mov RCX,0
	mov RBX,0

	INPUT_ARRAY:
	cmp RCX,20
	jz PRINT_SUM
	mov [cnt],RCX		;safety
	mov RDI,fmt_in		
	mov RSI,a
	call scanf
	mov RAX,[a]
	mov RCX,[cnt]		;safety
	mov [array + RCX*8],RAX
	add RBX,RAX
	inc RCX
	jmp INPUT_ARRAY


	PRINT_SUM:
	mov RDI,fmt_out
	mov RSI,RBX
	call printf

	mov RCX,0

	OUTPUT_ARRAY:
	cmp RCX,20
	jz END
	mov [cnt],RCX
	mov RDI,fmt
	mov RSI,[array+RCX*8]
	call printf
	mov RCX,[cnt]
	inc RCX
	jmp OUTPUT_ARRAY


END:
	pop RBP
ret
