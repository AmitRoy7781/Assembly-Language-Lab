;BIG_MOD

segment .data
b:		dq	0
p:		dq	0
two:		dq	2

fmt_in:		db 	"%lld %lld",0
fmt_out:	db 	"%lld^%lld = %lld",10,0
dummy:		db	"%lld %lld",10,0
fmt_n:		db 	"",10,0
	

segment	.bss
ara:	resq	105

segment .text
global main
extern scanf,printf


main:
	push rbp
	mov rbp,rsp
	
	mov RDI,fmt_in
	mov RSI,b
	mov RDX,p
	mov RAX,0
	call scanf


	mov RAX,[b]
	push RAX	;base
	mov RAX,[p]	;power
	push RAX
	mov RAX,1
	call BIG_MOD


	mov RDI,fmt_out
	mov RSI,[b]
	mov RDX,[p]
	mov RCX,RAX
	mov RAX,0
	call printf

	leave
	ret

BIG_MOD:
	push RBP
	mov RBP,RSP
	
	mov R9,[RBP+24]		;base
	mov R8,[RBP+16]		;power
	
	cmp R8,0
	je EXIT



	test R8,1
	jz RECURSIVE_CALL

	
	imul RAX,R9



RECURSIVE_CALL:

	mov RCX,R9
	imul RCX,RCX
	mov R9,RCX

	mov R10,RAX	

	mov RAX,R8
	mov RDX,0
	div qword[two]
	
	mov R8,RAX
	mov RAX,R10
	
	push R9
	push R8
	call BIG_MOD
	
EXIT:
	leave
	ret
