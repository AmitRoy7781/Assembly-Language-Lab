segment .data
Hello: db "Hello World",0
fmt: db "%d",0
fmt1: db "%d",10,0
palindrome: db "%d is palindrome ",10,0
notpalindrome: db "%d is not palindrome ",10,0

shoza	dq	20d
ulta	dq	0d
ten		dq	10d
zero	dq	0d
minus	dq -1d
a		dq  0d

segment .text

global main
extern printf
extern scanf

main:
push RBP

mov RDI, fmt
mov RSI,shoza
call scanf

mov RBX, [shoza]
mov [a], RBX

loop:	

	mov RAX,qword[shoza]
	mov RDX,qword [zero]
	div qword[ten]

	mov [shoza],RAX

	mov RCX,[ulta]
	imul RCX,[ten]
	add RCX,RDX

	mov [ulta],RCX	

	mov RBX,0d
	cmp [shoza],RBX
	jnz loop




mov RBX, [a]
cmp [ulta],RBX
jz	PRINT

mov RDI,notpalindrome
mov RSI,[a]
call printf
jmp LAST

PRINT:
mov RDI,palindrome
mov RSI,[a]
call printf


LAST:
pop RBP
ret



