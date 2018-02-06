segment .data
Hello: db "Hello World",0
fmt: db "%d %d",0
fmt1: db "%d",10,0

a    dq 20d
b    dq 3d
zero dq 0d
quot dq 0d
rem  dq 0d

segment .text

global main
extern printf
extern scanf

main:
push RBP


mov RCX,10d
mov RAX,5d



CHK:
	push RAX
	push RCX
	mov RDI,fmt1
	mov RSI,RAX
	call printf
	POP RCX
	POP RAX
	ADD RAX,5d
	DEC RCX
	JNZ CHK

pop RBP
ret


;nasm -f elf64 assembly_sample.asm
;gcc assembly_sample.o -o assembly_sample
;./assembly_sample 
