; Write a program which reads 5 numbers into an array and prints the smallest and largest
; number and their location in the array.
; If the user enters 7, 13, -5, 10, 6 then your program should print
; “Smallest number -5 was found at location 2”.
; “Largest number 13 was found at location 1”.






segment .data

a:		dq 	0
cnt:		dq	0
min:		dq	99999999999999d
minidx:		dq	0
max:		dq	-99999999999999d
maxidx:		dq	0
fmt_in:		db	"%lld",0
fmt_min: 	db	"Smallest number %lld was found at location %lld",10,0
fmt_max:	db	"Largest number %lld was found at location %lld",10,0

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
	jz PRINT_MIN_MAX
	mov [cnt],RCX		;safety
	mov RDI,fmt_in		
	mov RSI,a
	call scanf
	mov RAX,[a]
	mov RCX,[cnt]		;safety
	mov [array + RCX*8],RAX

	cmp RAX,[min]
	jl  MIN_ASSIGN
	jmp MAX_CHECK
		

	MIN_ASSIGN:
	mov [min],RAX
	mov [minidx],RCX
	jmp MAX_CHECK

	
	MAX_CHECK:
	cmp RAX,[max]
	jg MAX_ASSIGN
	
	jmp INCREMENT

	MAX_ASSIGN:
	mov [max],RAX
	mov [maxidx],RCX	
	jmp INCREMENT	

	INCREMENT:
	inc RCX
	jmp INPUT_ARRAY

	PRINT_MIN_MAX:
	mov RDI,fmt_max
	mov RSI,[max]
	mov RDX,[maxidx]
	call printf
	
	mov RDI,fmt_min
	mov RSI,[min]
	mov RDX,[minidx]
	call printf

	jmp END
END:
	pop RBP
ret
