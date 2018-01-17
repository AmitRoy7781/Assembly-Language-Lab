segment .data
Hello: db "Hello World",0
fmt: db "%d / %d = %d , Reminder: %d",10,0

a    dq 20d
b    dq 3d
quot dq 0d
rem  dq 0d

segment .text

global main
extern printf

main:
push RBP

mov RAX,qword[a]
mov RDX,qword 0
div qword[b]
mov [quot], RAX;
mov [rem], RDX


mov RDI, fmt		;RDI = "%d / %d = %d , Reminder: %d",a,b,quot,rem
mov RSI,qword[a]	;RSI = variable a
mov RDX,qword[b]	;RDX = variable b
mov RCX,qword[quot]	;RCX = a/b
mov R8,qword[rem]	;/R8 = a%b

call printf

mov RAX,0
pop RBP
ret


;nasm -f elf64 assembly_sample.asm
;gcc assembly_sample.o -o assembly_sample
;./assembly_sample 
