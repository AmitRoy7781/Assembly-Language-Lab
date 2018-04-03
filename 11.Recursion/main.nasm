segment .data
fmt_in:		db	"%lld %lld",0
fmt_out:	db	"%lld",10,0

a:		dq	0
b:		dq	0
n:		dq	0
cnt:		dq	2
increment:	dq	1


segment .bss

segment .text

global main
extern printf,scanf

main:
	push RBP
	mov RBP,RSP

	mov RAX,0
	mov RDI,fmt_in
	mov RSI,a
	mov RDX,b
	call scanf


	mov RAX,[b]	
	mov RBX,0
	cmp RBX,[a]
	je PRINT

	mov RAX,[a]
	push RAX

	mov RAX,[b]
	push RAX
	

	call FUNC

	PRINT:
	mov RDI,fmt_out
	mov RSI,RAX
	mov RAX,0
	call printf


	leave
	ret

FUNC:
	push RBP
	mov RBP,RSP


	mov R9,[RBP+24]	;a
	mov R8,[RBP+16]	;b
	
	cmp R8,0
	je BASE_CASE	

	mov RAX,R9
	mov RDX,0
	div R8
	mov R9,R8
	mov R8,RDX
			


	push R9
	push R8

	call FUNC 
	leave
	ret
		

	
	BASE_CASE:
	mov RAX,R9	
	leave
	ret	
	
