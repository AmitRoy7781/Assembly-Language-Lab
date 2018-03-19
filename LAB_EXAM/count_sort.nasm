
segment .data

fmt_in:		db	"%lld",0
fmt_out:	db	"%lld",10,0

n:	dq	0
a:	dq	0
MAX:	dq	999999

temp:	dq	0
temp1:	dq	0
temp2:	dq	0

segment .bss
array	resq	1000000
map	resq	100

segment .text
global main
extern printf,scanf

main:
	push RBP
	
	mov RDI,fmt_in
	mov RSI,n
	call scanf
	
	mov RCX,0

	CHECK:
	cmp RCX,[n]
	je OK

	mov [temp],RCX
	
	mov RDI,fmt_in
	mov RSI,a
	call scanf
	
	mov RAX,[a]
	mov RBX,[array+RAX*8]
	inc RBX
	mov [array+RAX*8],RBX
	
	mov RCX,[temp]
	inc RCX
	jmp CHECK


	OK:
	mov RCX,0
	mov RDX,0

	OUTER_LOOP:
	cmp RCX,[MAX]
	je END

	mov RDX,0
	INNER_LOOP:
	cmp RDX,[array+RCX*8]
	je INCREMENT2
	
	
	
	mov [temp1],RCX
	mov [temp2],RDX

	mov RDI,fmt_out
	mov RSI,RCX
	call printf	

	mov RCX,[temp1]
	mov RDX,[temp2]
	
	
	INCREMENT1:
	inc RDX
	jmp INNER_LOOP
		
	INCREMENT2:
	mov RDX,0
	inc RCX
	jmp OUTER_LOOP
	
	
END:
	pop RBP
	ret
