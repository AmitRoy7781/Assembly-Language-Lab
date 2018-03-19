segment .data
a:	dq	0
b:	dq	0
c:	dq	0
temp:	dq	0


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
	jne GCD1

	mov RAX,0
	jmp LCM1
	
	GCD1:
	mov RAX,RBX
	mov RDX,0
	div RCX

	cmp RDX,0
	je FIND_LCM1
	
	mov RBX,RCX
	mov RCX,RDX
	jmp GCD1

	FIND_LCM1:		; GCD is at RCX
	mov RAX,[a]
	imul RAX,[b]		; product is at RAX
				; lcm = RAX / RCX
	mov RDX,0
	div RCX
	
	LCM1:
	mov [temp],RAX

	mov RBX,[temp]
	mov RCX,[c]
	
	cmp RCX,0
	jne GCD2
	
	mov RAX,0
	jmp LCM2

	GCD2:		
	mov RAX,RBX
	mov RDX,0
	div RCX
	
	cmp RDX,0
	je FIND_LCM2
	
	mov RBX,RCX
	mov RCX,RDX
	jmp GCD2
	
	FIND_LCM2:
	mov RAX,[temp]
	imul RAX,[c]
	
	mov RDX,0
	div RCX
	
	LCM2:		
	mov RDI,fmt_out
	mov RSI,RAX
	call printf

END:
	pop RBP
	ret
