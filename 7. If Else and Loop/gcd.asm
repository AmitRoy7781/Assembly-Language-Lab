segment .data
Hello: db "Hello World",0
fmt: db "%d %d",0
fmt1: db "%d",10,0

a    dq 20d
b    dq 3d
c	 dq 0d
quot dq 0d
rem  dq 0d

segment .text

global main
extern printf
extern scanf

main:
push RBP

mov RDI, fmt
mov RSI,a
mov RDX,b

call scanf

mov RDX,[b]
cmp RDX,[c]
jz RES

loop:	

	mov RAX,qword[a]
	mov RDX,qword 0
	div qword[b]
	mov RBX,[b]
	mov [a],RBX
	mov [b],RDX
	
	;mov RDI,fmt1
	;mov RSI,[a]
	;call printf	

	mov RBX,[c]
	cmp [b],RBX
	jz RES

	jmp loop

RES:
mov RDI,fmt1
mov RSI,[a]
call printf

mov RAX,0
pop RBP
ret



