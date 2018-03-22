;Given an input string containing alphanumeric characters. 
;Check whether the string is a palindrome or not. Ignore case of letters in the input.
;For example: 
;Input: AbBa
;Output: Palindrome



segment .data

a:		db	97
s:		db	32

cnt:		dq	0
fmt_in:		db	"%s",0
fmt		db	"%c",10,0
fmt_out1:	db	"Input: %s",10,0
fmt_out2:	db	"Output: Palindrome",10,0
fmt_out3:	db	"Output: Not Palindrome",10,0

segment .bss
array resb 21
array2 resb 21

segment .text
global main
extern printf,scanf,gets


main:
	push RBP

	INPUT_STRING:
	mov RDI,fmt_in
	mov RSI, array	
	call scanf
	
	mov RCX,0
	mov RBX,0	

	CNT:
	cmp [array+RCX],RBX
	jz PRINT_INFO	

	mov RAX,0;
	mov AL,[array+RCX]
	mov [array2+RCX],AL
	
	cmp AL,[a]
	JGE TO_UPPER

	jmp INCREMENT
	
	TO_UPPER:
	sub AL,32d
	mov [array+RCX],AL


	INCREMENT:	
	;mov [cnt],RCX
	;mov RDI,fmt
	;mov RSI,[array+RCX]
	;call printf
	;mov RCX,[cnt]	

	inc RCX
	jmp CNT
	

	PRINT_INFO:
	mov RDI,fmt_out1
	mov RSI,array2
	mov [cnt],RCX
	call printf
	mov RCX,[cnt]

	
	mov RDX,RCX
	dec RDX
	mov RCX,0
	mov RBX,0
	mov R8,0	

	P_CHECK:
	cmp [array+RCX],R8
	jz PALINDROME	

	mov RAX,0;
	mov AL,[array+RCX]
	mov RBX,0
	mov BL,[array+RDX]
	
	cmp AL,BL
	jne NOT_PALINDROME	

	
		

	inc RCX
	dec RDX
	jmp P_CHECK

	PALINDROME:
	mov RDI,fmt_out2
	mov RSI,array
	call printf
	jmp END

	NOT_PALINDROME:
	mov RDI,fmt_out3
	mov RSI,array
	call printf
	
END:
	pop RBP
ret; 	
