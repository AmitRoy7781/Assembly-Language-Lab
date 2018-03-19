segment .data
fmt_in:		db	"%s %s",0
fmt:		db	"%lld",10,0
fmt_out:	db	"%lld %lld",10,0
fmt_star:	db	"*",0
fmt_space:	db	" ",0
fmt_nline:	db	"",10,0

l1:		dq	0
l2:		dq	0
res:		dq	0
temp1:		dq	0
temp2:		dq	0
temp3:		dq	0
temp4:		dq	0
d:		dq	128
zero:		dq	0

segment .bss
array1	resb	21
array2	resb	21

segment .text
global main
extern printf,scanf

main:
	push RBP
	mov RDI,fmt_in
	mov RSI,array1
	mov RDX,array2
	call scanf
	
	mov RCX,0
	mov RDX,0
	mov RBX,0

	LEN1:
	cmp [array1+RCX],RBX
	je LEN2
	
	inc RCX
	jmp LEN1

	LEN2:
	cmp [array2+RDX],RBX
	je DONE
	
	inc RDX
	jmp LEN2


	DONE:
	mov [l1],RCX
	mov [l2],RDX
	mov [res],RCX
	sub [res],RDX
	
	mov RCX,0	
	mov RDX,0

	CHECK_EQUAL:
	mov RAX,0
	mov RBX,0
	mov AL,[array1+RCX]
	mov BL,[array2+RDX]
	
	cmp AL,0d
	je PRINT_RESULT

	cmp BL,0d
	je PRINT_RESULT

	cmp AL,BL
	je INCREMENT	
	
	jmp PRINT_DIF
	
	;mov [temp1],RAX
	;mov [temp2],RBX
	;mov [temp3],RCX
	;mov [temp4],RDX

	;mov RDI,fmt_out
	;mov RSI,RAX
	;mov RDX,RBX
	;call printf	

	;mov RAX,[temp1]
	;mov RBX,[temp2]
	;mov RCX,[temp3]
	;mov RDX,[temp4]
	


	INCREMENT:	
	inc RCX
	inc RDX
	jmp CHECK_EQUAL 

	PRINT_RESULT:
	mov RDI,fmt
	mov RSI,[res]
	call printf
	jmp END

	PRINT_DIF:
	mov RDI,fmt
	mov RSI,RAX
	sub RSI,RBX
	call printf

END:
	pop RBP
	ret	
