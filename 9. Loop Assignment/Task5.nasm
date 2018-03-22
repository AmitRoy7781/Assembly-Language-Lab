;Take an integer from the use to form the following structure.
;Input: 3
;Output:
;  *
; * *
;*****


segment .data

n:		dq	97
one:		dq	1d
zero:		dq	0d
i:		dq	0
j:		dq	0
limit:		dq	0

fmt_in:		db	"%lld",0
fmt_star:	db	"*",0
fmt_space:	db	" ",0
fmt_nline:	db	"",10,0


segment .bss

segment .text
global main
extern printf,scanf


main:
	push RBP
	
	mov RDI,fmt_in
	mov RSI,n
	call scanf
	
	mov R8,0d
	mov [i],R8
	mov R8,[n]
	add R8,[n]
	mov [limit],R8	
	
	OUTER_LOOP1:
	mov RDX,[i]
	inc RDX
	cmp RDX,[n]
	jz OK
	
	mov R8,1d
	mov [j],R8
	
	INNER_LOOP:
	mov R8,[j]
	cmp R8,[limit]
	jg INCREMENT2
	
	;RCX -> i
	;RDX -> j

	mov R8,[n]
	mov R9,[n]
	sub R8,[i]
	add R9,[i]
	mov RDX,[j]
	
	cmp R8,RDX
	jz PRINT_STAR

	cmp R9,RDX
	jz PRINT_STAR
	
	PRINT_SPACE:
	mov RDI,fmt_space
	call printf
	jmp INCREMENT1
	
	PRINT_STAR:
	mov RDI,fmt_star
	call printf
	jmp INCREMENT1
	
	
	INCREMENT1:
	mov R8,[j]
	inc R8
	mov [j],R8
	jmp INNER_LOOP

	INCREMENT2:
	mov RDI,fmt_nline
	call printf
	mov R8,[i]
	inc R8
	mov [i],R8
	jmp OUTER_LOOP1
	
	OK:
	mov R8,1d
	mov [i],R8

	OUTER_LOOP2:
	mov R8,[i]
	cmp R8,[limit]
	jz NEW_LINE
	
	mov RDI,fmt_star
	call printf
	
	mov R8,[i]
	inc R8
	mov [i],R8
	jmp OUTER_LOOP2
	
	NEW_LINE:
	mov RDI,fmt_nline
	call printf
	jmp END
END:
	pop RBP
ret; 
