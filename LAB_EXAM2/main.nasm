;RGBY

segment .data
n:		dq	0	
two:		dq	2
temp1:		dq	0
temp2:		dq	0

fmt_in:		db 	"%s",0
fmt_out1:	db 	"Color Matched",10,0
fmt_out2:	db 	"Color Not Matched",10,0
fmt_n:		db 	"",10,0
	

segment	.bss
ara:	resb	105
used:	resq	105

segment .text
global main
extern scanf,printf


main:
	push rbp
	mov rbp,rsp
	
	mov RDI,fmt_in
	mov RSI,ara
	mov RAX,0
	call scanf

	push 0		;R-B
	push 0		;G-Y
	push 0		;index
	call FUNC	

	add RAX,RBX
	

	cmp RAX,0
	je PRINT2

	mov RDI,fmt_out2
	jmp PRINT

PRINT2:
	mov RDI,fmt_out1

PRINT:
	mov RAX,0
	call printf

	leave
	ret

FUNC:
	push RBP
	mov RBP,RSP
	
	mov R8,[RBP+16]		;index
	mov R9,[RBP+24]		;G-Y
	mov R10,[RBP+32]	;R-B

	mov RAX,0
	mov AL,[ara+R8]

	cmp RAX,0
	je EXIT
	
	cmp RAX,'R'
	je RED
	
	cmp RAX,'G'
	je GREEN

	cmp RAX,'B'
	je BLACK

	jmp YELLOW


GREEN:
	inc R9
	jmp RECURSIVE_CALL

YELLOW:
	dec R9
	jmp RECURSIVE_CALL

RED:
	inc R10
	jmp RECURSIVE_CALL

BLACK:
	dec R10
	jmp RECURSIVE_CALL

RECURSIVE_CALL:
	inc R8
	push R10
	push R9
	push R8
	call FUNC
	leave
	ret
	
EXIT:
	mov RAX,R9
	mov RBX,R10
	leave
	ret
