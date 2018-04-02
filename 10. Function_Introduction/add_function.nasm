
segment .data
fmt_out:	db	"%lld",10,0


segment .bss

segment .text
global main
extern printf,scanf


main:
	push RBP
	mov RBP,RSP

	mov RAX,5
	mov RBX,10
	push RAX
	push RBX
	call ADDVAL
	
	pop RAX
	pop RBX
	
END:
	pop RBP
	ret

ADDVAL:
	push RBP
	mov RBP,RSP
	
	mov R8,[RBP + 16]
	mov R9,[RBP + 24]

	add R8,R9
	
	mov RDI,fmt_out
	mov RSI,R8
	call printf

	leave 	;mov RSP,RBP & pop RBP
	ret
