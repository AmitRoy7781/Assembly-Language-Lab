;Given 2 input strings. Check if the two strings are equal (case sensitive).
;Example: 
;Input: abcd abcd
;Output: Equal
;Input: abCd abcd
;Output: Not equal



segment .data

a:		db	97
s:		db	32

cnt:		dq	0
fmt_in:		db	"%s %s",0
fmt		db	"%c",10,0
fmt_out1:	db	"Input: %s %s",10,0
fmt_out2:	db	"Output: Equal",10,0
fmt_out3:	db	"Output: Not equal",10,0

segment .bss
array1 resb 21
array2 resb 21

segment .text
global main
extern printf,scanf,gets


main:
	push RBP

	INPUT_STRING:
	mov RDI,fmt_in
	mov RSI, array1
	mov RDX, array2
	call scanf
	
	OUTPUT_STRING:
	mov RDI,fmt_out1
	mov RSI,array1
	mov RDX,array2
	call printf
	
	mov RDX,0
	mov RCX,0
	
	CHECK:
	mov RAX,0
	mov RBX,0
	mov AL,[array1+RDX]
	mov BL,[array2+RCX]
	
	
	cmp AL,0d
	je BL_EQUAL
	jmp COMPARISON	
		
	BL_EQUAL:
	cmp BL,0d
	je EQUAL
	jmp NOT_EQUAL
	
	
	COMPARISON:
	cmp AL,BL
	je INCREMENT
	jmp NOT_EQUAL

	INCREMENT:
	inc RDX
	inc RCX
	jmp CHECK

	
	EQUAL:
	mov RDI,fmt_out2
	call printf
	jmp END

	NOT_EQUAL:
	mov RDI,fmt_out3
	call printf
	
END:
	pop RBP
ret; 
