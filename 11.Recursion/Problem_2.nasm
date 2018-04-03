segment .data
fmt_in:		db	"%lld",0
fmt_out:	db	"%lld",10,0

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
	mov RSI,n
	call scanf

	mov RAX,0

	cmp [n],RAX
	je PRINT
	
	mov RAX,0
	push RAX

	mov RAX,1
	push RAX
	
	mov RAX,1
	push RAX

	mov RAX,[n]
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


	mov R8,[RBP+40]		;fib[n-1]
	mov R9,[RBP+32]		;fib[n]
	mov R10,[RBP+24]	;position
	mov R11,[RBP+16]	;limit
	
	
	cmp R10,R11
	je BASE_CASE




	inc R10
		
	mov RDX,R9
	add R9,R8
	mov R8,RDX	


	push R8
	push R9
	push R10
	push R11

	call FUNC 
	leave
	ret
		

	
	BASE_CASE:
	mov RAX,R9	
	leave
	ret	
