;SUBSTRING_MATCHING

segment .data
l1:		dq	0
l2:		dq	0
n:		dq 	0
fmt_in:		db 	"%s %s",0
fmt_out:	db 	"%s contains %s %lld times",10,0
dummy:		db	"%lld %lld",10,0
fmt_n:		db 	"",10,0
	

segment	.bss
ara1:	resq	105
ara2:	resq	105

segment .text
global main
extern scanf,printf


main:
	push rbp
	mov rbp,rsp
	
	mov RDI,fmt_in
	mov RSI,ara1
	mov RDX,ara2
	mov RAX,0
	call scanf

	push 0		;first string index
	push ara1	;first string base
	call LENGTH
	mov [l1],RAX

	push 0		;second string index
	push ara2	;second string base
	call LENGTH
	mov [l2],RAX
	

	;mov RDI,dummy
	;mov RSI,[l1]
	;mov RDX,[l2]
	;call printf
	
	mov RAX,0		
	push 0			;first string index   = RBP + 32
	mov RBX,[l1]		
	push RBX		;first string length  = RBP + 24
	mov RBX,[l2]
	push RBX		;second string length = RBP + 16
	call OUTER_LOOP

	mov RDI,fmt_out
	mov RSI,ara1
	mov RDX,ara2
	mov RCX,RAX
	mov RAX,0
	call printf

	leave
	ret


OUTER_LOOP:
	
	push rbp
	mov rbp,rsp

	mov R8,[RBP+32]		;first string index
	mov R9,[RBP+24]		;first string length
	mov R10,[RBP+16]	;second string length

	mov R12,0
	add R12,R8
	add R12,R10

	cmp R12,R9
	jg EXIT1


	inc R8
	push R8
	push R9
	push R10
	call OUTER_LOOP

	pop R8
	pop R8
	pop R8 
		
	mov R8,[RBP+32]		;first string index
	mov R9,[RBP+24]		;first string length
	mov R10,[RBP+16]	;second string length
	
	push R8			;first  string index
	push 0			;second string index
	push R10		;second string length
	mov RBX,0
	call INNER_LOOP
	add RAX,RBX
	leave
	ret
	

EXIT1:
	leave
	ret


INNER_LOOP:

	push rbp
	mov rbp,rsp

	mov R8,[RBP+32]		;first string index
	mov R9,[RBP+24]		;second string index
	mov R10,[RBP+16]	;second string length
	
	cmp R9,R10
	je YES
	
	
	mov RDX,0
	mov RCX,0
	mov DL,[ara1+R8]
	mov CL,[ara2+R9]
	cmp RCX,RDX
	jne NO
	

	inc R8
	inc R9
	push R8
	push R9
	push R10
	call INNER_LOOP
	leave
	ret


NO:
	mov RBX,0
	leave
	ret
	

YES:	
	mov RBX,1
	leave
	ret

LENGTH:
	push rbp
	mov rbp,rsp

	mov R9,[RBP+24]		;string index
	mov R8,[RBP+16]		;string base

	mov BL,[R8+R9]
	cmp RBX,0
	je EXIT2

	
	inc R9
	push R9
	push R8
	call LENGTH
	inc RAX
	leave 
	ret

EXIT2:

	mov RAX,0
	leave
	ret
