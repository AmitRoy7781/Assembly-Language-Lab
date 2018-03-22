;Write an assembly program that reads 10 numbers from the user. The program then reads
;a number between 0 to 9, and shows the number at the corresponding index number. For
;instance, if the array is a and the user enters 3, your program should print the value at
;position 3.

segment .data

a:		dq 	0
cnt:		dq	0
fmt_in:		db	"%lld",0
fmt_out: 	db	"Number at %lldth position = %lld",10,0

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
	jz TAKE_INDEX

	mov [cnt],RCX		
	mov RDI,fmt_in		
	mov RSI,a
	call scanf
	
	mov RCX,[cnt]		
	mov RAX,[a]
	mov [array + RCX*8],RAX

	inc RCX
	jmp INPUT_ARRAY

	TAKE_INDEX:
	mov RDI,fmt_in
	mov RSI,a
	call scanf

	mov RAX,[a]
	mov RSI,RAX
	dec RAX

	mov RAX,[array + RAX*8]
	mov RDI,fmt_out
	mov RDX,RAX
	call printf

END:
	pop RBP
ret
