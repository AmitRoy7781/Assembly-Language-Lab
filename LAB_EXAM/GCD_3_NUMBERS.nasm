segment .data
a:	dq	0
b:	dq	0
c:	dq	0


fmt_in:		db	"%lld %lld %lld",0
fmt_out:	db	"%lld",10,0

segment .bss


segment .text
global main
extern printf,scanf

main:
	push RBP


	mov RDI,fmt_in
	mov RSI,a
	mov RDX,b
	mov RCX,c
	call scanf
	
	mov RBX,[a]
	mov RCX,[b]

	cmp RCX,0
	jne GCD

	mov RCX,RBX
	jmp OK			
	
	GCD:
	mov RAX,RBX
	mov RDX,0
	div RCX

	cmp RDX,0
	je OK
	
	mov RBX,RCX
	mov RCX,RDX
	jmp GCD

	OK:			;GCD of 1st two numbers will be in RCX
	mov RBX,[c]
	
	cmp RCX,0
	jne GCD2

	mov RCX,RBX
	jmp OK2			
	
	GCD2:
	mov RAX,RBX
	mov RDX,0
	div RCX

	cmp RDX,0
	je OK2
	
	mov RBX,RCX
	mov RCX,RDX
	jmp GCD2

	OK2:
	mov RDI,fmt_out
	mov RSI,RCX
	call printf
	
	

END:
	pop RBP
	ret
