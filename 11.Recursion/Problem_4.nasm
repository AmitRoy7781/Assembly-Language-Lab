segment .data
fmt_in:		db	"%s",0
fmt_out:	db	"value: %c",10,0
fmt_out2:	db	"%s",10,0

a:		dq	0
b:		dq	0
n:		dq	0
cnt:		dq	0
increment:	dq	0
d:		dq	128

temp1:		db	1
temp2:		db	1
temp3:		db	1
temp4:		db	1
temp5:		db	1


segment .bss
str:	resb	1000000
str2:	resb	1000000
mp:	resq	130

segment .text

global main
extern printf,scanf

main:
	push RBP
	mov RBP,RSP

	mov RAX,0
	mov RDI,fmt_in
	mov RSI,str
	call scanf

	mov RAX,0	;index of main string
	push RAX
	
	mov RAX,0	;index of converted string
	push RAX

	call FUNC

	mov RDI,fmt_out2
	mov RSI,str2
	call printf

	leave
	ret

FUNC:
	push RBP
	mov RBP,RSP


	mov R9,[RBP+24]	;index of main string
	mov R8,[RBP+16]	;index of converted string
		


	mov RAX,0
	mov RAX,[str+R9]
	
	mov RDX,0
	div qword[d]
	mov RAX,RDX


	cmp RAX,0
	je BASE_CASE	


	mov RCX,[mp+RAX*8]	; RBX=mp[RAX]
	cmp RCX,1		;checked whether RBX=mp[RAX]=0
	je INCREMENT		;if mp[RAX]=0 then incremented the index of main string


	mov [str2+R8],RAX	;added if new character appeared
	inc R8			;incremented the index of converted string

	mov RBX,1		;set the value of mp[RAX]=1
	mov [mp+RAX*8],RBX


	INCREMENT:
	inc R9		


	push R9
	push R8

	call FUNC
	leave
	ret
		

	
	BASE_CASE:
	mov AL,0
	mov [str2+R8],AL
	leave
	ret	
	
