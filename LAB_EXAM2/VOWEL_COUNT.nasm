;VOWEL_COUNT

segment .data
l1:		dq	0
l2:		dq	0
n:		dq 	0
fmt_in:		db 	"%s",0
fmt_out:	db 	"Vowel %lld, Consonant %lld",10,0
dummy:		db	"%lld %lld",10,0
fmt_n:		db 	"",10,0
	

segment	.bss
ara:	resq	105

segment .text
global main
extern scanf,printf,gets


main:
	push rbp
	mov rbp,rsp
	
	mov RDI,ara
	mov RAX,0
	call gets

	push 0		;vowel_count
	push 0		;consonant_count
	push 0		;string_index


	mov RAX,0
	mov RBX,0

	call REC
	
	mov RDI,fmt_out
	mov RSI,RAX
	mov RDX,RBX
	mov RAX,0
	call printf


	leave
	ret

REC:
	push RBP
	mov RBP,RSP
	
	mov R8,[RBP+32]		;vowel_count
	mov R9,[RBP+24]		;consonant_count
	mov R10,[RBP+16]	;string_index
		
	mov RCX,0	
	mov CL,[ara+R10]
	
	cmp RCX,0
	je EXIT

	
	cmp RCX,'a'
	jge MINUS_a
	jmp MINUS_A
	

MINUS_a:
	sub RCX,'a'
	jmp OPERATION

	
MINUS_A:
	sub RCX,'A'
	jmp OPERATION

OPERATION:	

	cmp RCX,0
	jl RECURSIVE_CALL

	cmp RCX,25
	jg RECURSIVE_CALL
	

	cmp RCX,0
	je VOWEL

	cmp RCX,4
	je VOWEL

	cmp RCX,8
	je VOWEL

	cmp RCX,14
	je VOWEL

	cmp RCX,20
	je VOWEL
	
		
	inc RBX
	jmp RECURSIVE_CALL

VOWEL:
	inc RAX	


RECURSIVE_CALL:
	inc R10
	push R8
	push R9
	push R10
	call REC
	leave
	ret



EXIT:
	
	leave
	ret
