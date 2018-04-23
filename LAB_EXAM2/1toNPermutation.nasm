;1 to N permutation

segment .data
n:		dq	0	
two:		dq	2
temp1:		dq	0
temp2:		dq	0

fmt_in:		db 	"%lld",0
fmt_out:	db 	"%lld",0
dummy:		db	"%lld %lld",10,0
fmt_n:		db 	"",10,0
	

segment	.bss
ara:	resq	105
used:	resq	105

segment .text
global main
extern scanf,printf


main:
	push rbp
	mov rbp,rsp
	
	mov RDI,fmt_in
	mov RSI,n
	mov RAX,0
	call scanf


	push 0		;current
	call PERMUTE


	leave
	ret

PERMUTE:
	push RBP
	mov RBP,RSP
	
	mov R8,[RBP+16]		;current

	cmp R8,[n]
	je PRINT

	mov RBX,1

CHECK_USED:
	cmp RBX,[n]
	jg EXIT
	

	mov RCX,[used+RBX*8]
	cmp RCX,0
	je RECURSIVE_CALL
	
	inc RBX
	jmp CHECK_USED

RECURSIVE_CALL:

	mov RAX,1
	mov [used+RBX*8],RAX


	mov [ara+R8*8],RBX


	inc R8
	push RBX
	push R8

	call PERMUTE

	pop R8
	pop RBX
	dec R8

	mov RAX,0
	mov [used+RBX*8],RAX
	
	inc RBX
	jmp CHECK_USED	
	


PRINT:
	mov RCX,0

DONE:
	cmp RCX,[n]
	je NEW_LINE
	
	mov RDI,fmt_out
	mov RSI,[ara+RCX*8]
	mov RAX,0
	mov [temp2],RCX
	call printf
	mov RCX,[temp2]
	inc RCX
	jmp DONE


NEW_LINE:
	mov RDI,fmt_n
	mov RAX,0
	call printf

	
EXIT:
	leave
	ret
