;SUPER-DIGIT

segment .data
a:	dq 0
b:	dq 0
n:	dq 0
fmt_in:	db "%lld",0
fmt_out:db "SUPER DIGIT: %lld",10,0	
	

segment .text
global main
extern scanf,printf


main:
	push rbp
	mov rbp,rsp
	
	mov RDI,fmt_in
	mov RSI,a
	mov RAX,0
	call scanf

	mov RBX,[a]
	push RBX
	call SUPER_DIGIT

PRINT:	
	mov RDI,fmt_out
	mov RSI,RAX
	mov RAX,0
	call printf
	
	leave
	ret

SUPER_DIGIT:
	push rbp
	mov rbp,rsp

	
	mov R8,[RBP+16]
	cmp R8,10
	jl EXIT1

	
	push R8
	mov RBX,0
	call SOD
	push RBX
	call SUPER_DIGIT
	
	leave
	ret


EXIT1:
	mov R8,[RBP+16]
	mov RAX,R8
	leave
	ret


SOD:
	push rbp
	mov rbp,rsp

	mov R8,[RBP+16]
	cmp R8,10
	jl EXIT2


	mov RAX,R8
	mov RDX,0
	mov R9,10
	div R9
	
	add RBX,RDX
	push RAX
	call SOD	
	
	leave
	ret

	
EXIT2:
	mov R8,[RBP+16]
	add RBX,R8
	leave
	ret


	leave
	ret
