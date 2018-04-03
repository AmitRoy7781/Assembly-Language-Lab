segment .data
fmt_in:		db	"%lld",0
fmt_out:	db	"%lld",10,0

a:		dq	0
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
	call scanf

	
	mov RAX,[a]
	push RAX

	mov RAX,[cnt]
	push RAX
	
	mov RAX,[increment]
	push RAX


	call FUNC

	mov RDI,fmt_out
	mov RSI,RAX
	mov RAX,0
	call printf


	leave
	ret

FUNC:
	push RBP
	mov RBP,RSP


	mov R8,[RBP+32]		;limit
	mov R9,[RBP+24]		;value to add
	mov R10,[RBP+16]	;increment
	
	
	cmp R9,R8
	jg BASE_CASE
		

	add R9,R10
	inc R10	

	push R8
	push R9
	push R10

	call FUNC 
	mov R9,[RBP+24]
	add RAX,R9
	
	leave
	ret
		

	
	BASE_CASE:
	mov RAX,0	
	leave
	ret	
	




