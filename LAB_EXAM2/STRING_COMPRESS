;STRING_COMPRESS

segment .data
a:	dq 0
b:	dq 0
n:	dq 0
fmt_in:	db "%s",0
fmt_out:db "%c%lld",0
fmt_n:	db "",10,0
	

segment	.bss
ara:	resq	105

segment .text
global main
extern scanf,printf


main:
	push rbp
	mov rbp,rsp
	
	mov RDI,fmt_in
	mov RSI,ara
	mov RAX,0
	call scanf

		

	push 0		;position
	push 0 		;prev_char
	push 0		;prev_frequency		
	call STR_COMPRESS

	mov RDI,fmt_n
	mov RAX,0
	call printf

	leave
	ret


STR_COMPRESS:
	
	push rbp
	mov rbp,rsp


	mov R8,[RBP+16]		;prev_frequency
	mov R9,[RBP+24]		;prev_char
	mov R10,[RBP+32]	;position

	
	
	mov RBX,0
	mov BL,[ara+R10]	;extract data at R10 position


	

	cmp RBX,0		;check end of string
	je EXIT




	cmp R10,0		;check for first character of string
	je INCREMENT


	cmp R9,RBX		
	je INCREMENT

	
	mov RDI,fmt_out
	mov RSI,R9
	mov RDX,R8
	mov RAX,0
	call printf
	
	mov R8,[RBP+16]		;prev_frequency
	mov R9,[RBP+24]		;prev_char
	mov R10,[RBP+32]	;position
	

	mov R8,0
	
INCREMENT:
	
	
	mov R9,RBX
	inc R8
	inc R10
	push R10
	push R9
	push R8
	
	call STR_COMPRESS
	leave
	ret
		
	
EXIT:
	mov RDI,fmt_out
	mov RSI,R9
	mov RDX,R8
	mov RAX,0
	call printf

	leave
	ret

