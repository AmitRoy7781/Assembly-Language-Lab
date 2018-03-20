segment .data
a:	dq	0
b:	dq	0
c:	dq	0
n:	dq	0
temp:	dq	0
temp1:	dq	0
temp2:	dq	0
temp3:	dq	0


fmt_in:		db	"%lld",0
fmt_out:	db	"%lld",10,0
fmt_out2:	db	"Prev: %lld GCD: %lld",10,0

segment .bss
array	resq	1000000

segment .text
global main
extern printf,scanf

main:
	push RBP

	mov RDI,fmt_in
	mov RSI,n
	call scanf
	
	mov RCX,0

	TAKE_INPUT:
	cmp RCX,[n]
	je DONE

	mov [temp],RCX
	mov RDI,fmt_in
	mov RSI,a
	call scanf
	mov RCX,[temp]

	mov RAX,[a]
	mov [array+RCX*8],RAX

	inc RCX
	jmp TAKE_INPUT


	DONE:
	mov RBX,[array]
	mov [temp],RBX
	mov R8,1	

	N_LCM:
	cmp R8,[n]
	je PRINT_LCM

	mov RCX,[array+R8 * 8]

	cmp RCX,0
	jne GCD

	mov RAX,0
	jmp NEW_LCM	
	
	GCD:
	mov RAX,RBX
	mov RDX,0
	div RCX

	cmp RDX,0
	je FIND_LCM
	
	mov RBX,RCX
	mov RCX,RDX
	jmp GCD

	FIND_LCM:
	mov RAX,[temp]			; GCD is at RCX
	mul qword [array + R8 * 8]	; product is at RAX
					; lcm = RAX / RCX

	
	mov RDX,0
	div RCX

	;mov [temp1],RAX
	;mov [temp2],R8
	;mov [temp3],RCX
	
	;mov RDI,fmt_out2
	;mov RSI,RAX
	;mov RDX,RCX
	;call printf

	;mov RAX,[temp1]
	;mov R8,[temp2]
	;mov RCX,[temp3]

	
		
	NEW_LCM:

	mov RBX,RAX
	mov [temp],RAX
	

	inc R8
	jmp N_LCM

	
		
	PRINT_LCM:
	mov RDI,fmt_out
	mov RSI,RBX
	call printf

END:
	pop RBP
	ret
