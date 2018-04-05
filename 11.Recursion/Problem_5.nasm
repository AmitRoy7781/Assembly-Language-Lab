segment .data
fmt_in:		db	"%lld",0
fmt_out1:	db	"%lld found at position %lld ",10,0
fmt_out2:	db	"%lld not found",10,0

a:		dq	0
b:		dq	0
n:		dq	0
cnt:		dq	0
val:		dq	0
d:		dq	128
two:		dq	2

temp1:		dq	1
temp2:		dq	1
temp3:		dq	1
temp4:		dq	1
temp5:		dq	1


segment .bss
ara:	resq	1000000

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

	mov RCX,0

TAKE_INPUT:
	cmp RCX,[n]
	je  DONE

	mov [temp1],RCX

	mov RAX,0
	mov RDI,fmt_in
	mov RSI,a
	call scanf

	mov RCX,[temp1]
	
	mov RAX,[a]
	mov [ara+RCX*8],RAX

	inc RCX
	jmp TAKE_INPUT	


	
DONE:
	
	
	mov RAX,0
	mov RDI,fmt_in
	mov RSI,val
	call scanf
	

	mov RAX,[val]	;val to search
	push RAX


	mov RAX,[n]	;right
	dec RAX
	push RAX
	

	mov RAX,0	;left
	push RAX

	call FUNC

	cmp RAX,-1
	je NOT_FOUND

	
	mov RDI,fmt_out1
	mov RSI,[val]
	mov RDX,RAX
	inc RDX
	mov RAX,0
	call printf
	jmp END1


NOT_FOUND:
	mov RAX,0
	mov RDI,fmt_out2
	mov RSI,[val]
	call printf	

END1:	
	leave
	ret






FUNC:
	push RBP
	mov RBP,RSP


	mov R8,[RBP+16]		;left
	mov R9,[RBP+24]		;right
	mov R10,[RBP+32]	;value


	
	
	cmp R8,R9
	jg NOT_EXIST

	

	mov R11,R8
	add R11,R9		;mid=(left+right)/2	R11=mid
	
	mov RAX,R11
	mov RDX,0
	div qword[two]
	mov R11,RAX

	
	
	

	mov RDX,[ara + R11*8]

	


	cmp RDX,R10
	je  EXIST

	cmp RDX,R10
	jg  LEFT_PORTION
	
	jmp RIGHT_PORTION
	

LEFT_PORTION:
	dec R11
	mov R9,R11
	jmp RECURSIVE_CALL


RIGHT_PORTION:	
	inc R11
	mov R8,R11
	jmp RECURSIVE_CALL
	

RECURSIVE_CALL:
	push R10
	push R9
	push R8
	call FUNC

	leave
	ret


NOT_EXIST: 	
	mov RAX,-1
	jmp END2

	
EXIST:
	mov RAX,R11

END2:	
	leave
	ret
