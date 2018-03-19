
segment .data

fmt_in:		db	"%lld %lld",0
fmt_out:	db	"%lld",10,0
fmt_out2:	db	"First: %lld Last: %lld DIFFERENCE: %lld",10,0

l:	dq	0
r:	dq	0
f:	dq	400
h:	dq	100
fo:	dq	4

temp:	dq	0
temp2:	dq	0

segment .bss
array	resq	100

segment .text
global main
extern printf,scanf

main:
	push RBP

	mov RDI,fmt_in
	mov RSI,l
	mov RDX,r
	call scanf

	
	mov RBX,[l]
	mov RCX,0	

	LOOP_CHECK:
	cmp RBX,[r]
	jg END

	mov RAX,RBX
	mov RDX,0
	div qword[f]
	cmp RDX,0
	je PRINT_RBX

	mov RAX,RBX
	mov RDX,0
	div qword[h]
	cmp RDX,0
	je INCREMENT

	mov RAX,RBX
	mov RDX,0
	div qword[fo]
	cmp RDX,0
	je PRINT_RBX

	jmp INCREMENT
	
	PRINT_RBX:
	mov [temp],RBX
	mov [temp2],RCX
	mov [array+RCX*8],RBX
	
	mov RDI,fmt_out
	mov RSI,RBX
	call printf
	
	mov RCX,[temp2]
	mov RBX,[temp]
	inc RCX
	
	INCREMENT:
	inc RBX
	jmp LOOP_CHECK
END:
	mov RDI,fmt_out2
	mov RSI,[array]
	dec RCX
	mov RDX,[array + RCX*8]
	mov RCX,RDX
	sub RCX,RSI
	call printf

	pop RBP
ret;
