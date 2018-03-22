;Given an array of size 10. You are to take 10 inputs from the keyboard. 
;All the number will have to be unique. If you give a duplicate number, 
;it will not be included in the array. Finally your array will contain 10 unique number.
;For Example:
;Input: 5
;Output: Give 9 more numbers.
;Input: 5
;Output: Number already exists. Give 9 more numbers.
;Input: 7
;Output: Give 8 more numbers.
;…
;…
;…
;Input: 26
;Output: The 10 numbers are 5, 7, …, 26


segment .data

a:		dq	97
temp:		dq	0
s:		dq	32
cnt:		dq	0

fmt_in:		db	"%lld",0
fmt:		db	"%c",10,0
fmt_out1:	db	"Input: %lld",10,0
fmt_out2:	db	"Output: Give %lld more numbers.",10,0
fmt_out3:	db	"Output: Number already exists. Give %lld more numbers.",10,0
fmt_out4:	db	"Output: The 10 numbers are ",0
fmt_out5:	db	"%lld",0
fmt_out6:	db	", %lld",0
fmt_out7:	db	"",10,0

segment .bss
array resq 21
array2 resb 21

segment .text
global main
extern printf,scanf


main:
	push RBP

	mov RCX,0		;number of distinct numbers
	mov RBX,0
	mov RDX,0		 

	TAKE_INPUT:
	
	mov RDI,fmt_in
	mov RSI,a
	mov [temp],RCX
	call scanf
	mov RCX,[temp]
		
	mov RDI,fmt_out1
	mov RSI,[a]
	mov [temp],RCX
	call printf
	mov RCX,[temp]	

	mov RBX,0

	DUPLICATE_TEST:
	cmp RBX,RCX
	je NEW_NUM	
	
	mov R8,[array + RBX*8]
	cmp R8,[a]
	je DUPLICATE_NUM

	inc RBX
	jmp DUPLICATE_TEST

	DUPLICATE_NUM:
	mov RDI,fmt_out3
	mov RSI,10
	sub RSI,RCX
	mov [temp],RCX
	call printf
	mov RCX,[temp]
	jmp TAKE_INPUT

	NEW_NUM:
	mov RBX,[a]
	mov [array + RCX*8], RBX
	inc RCX
	
	cmp RCX,10	
	je OK

	mov RDI,fmt_out2
	mov RSI,10
	sub RSI,RCX
	mov [temp],RCX
	call printf
	mov RCX,[temp]
	jmp TAKE_INPUT

	OK:
	mov RDI,fmt_out4
	call printf
	mov RDI,fmt_out5
	mov RSI,[array]
	call printf
	mov RCX,1
	
	OUTPUT_ARRAY:
	cmp RCX,10
	je NEW_LINE
	
	mov RDI,fmt_out6
	mov RSI,[array+RCX*8]
	mov [temp],RCX
	call printf
	mov RCX,[temp]

	inc RCX
	jmp OUTPUT_ARRAY
	
	NEW_LINE:
	mov RDI,fmt_out7
	call printf
END:
	pop RBP
ret; 


