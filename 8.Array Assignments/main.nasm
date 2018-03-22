;Given an input string (upper case letters only). Count the number of vowels and
;consonants in the string. For example, if the user gives “this is a string.” Then your
;program should print
;“Given input: this is a string”
;“Vowels: 8 Consonants: 15”


segment .data

v:		dq 	0
c:		dq	0
d:		dq	128

a:		dq	65
e:		dq 	69
i:		dq	73
o:		dq	79
u:		dq	85
s:		dq	32

cnt:		dq	0
fmt_in:		db	"%s",0
fmt		db	"%d",10,0
fmt_out1:	db	"Given input: %s",10,0
fmt_out2:	db	"Vowels: %lld Consonants: %lld",10,0

segment .bss
array resq 21

segment .text
global main
extern printf,scanf,gets


main:
	push RBP

	INPUT_STRING:
	mov RDI,array	
	call gets	
	
	mov RCX,0
	mov RBX,0	

	CNT:
	cmp [array+RCX],RBX
	jz PRINT_INFO
	mov RAX,[array+RCX]
	
	mov RDX,0
	div qword[d]
	mov RAX,RDX


	cmp RAX,[a]
	jz VOWEL

	cmp RAX,[e]
	jz VOWEL

	cmp RAX,[i]
	jz VOWEL

	cmp RAX,[o]
	jz VOWEL

	cmp RAX,[u]
	jz VOWEL

	cmp RAX,[s]
	jnz CONSONANT
	
	jmp INCREMENT

	VOWEL:
	inc qword [v]
	jmp INCREMENT
	
	CONSONANT:
	inc qword [c]
	
	
	INCREMENT:
	inc RCX
	jmp CNT
	
	PRINT_INFO:
	mov RDI,fmt_out1
	mov RSI,array
	call printf
	mov RDI,fmt_out2
	mov RSI,[v]
	mov RDX,[c]
	call printf
	
END:
	pop RBP
ret; 
