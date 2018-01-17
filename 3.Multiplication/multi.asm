segment .data
Hello: db "Hello World",0
fmt: db "%d * %d = %d",10,0

a dd 10d
b dd 20d

segment .text

global main
extern printf

main:
push RBP

mov RDI, fmt		;RDI = "%d * %d = %d",a,b,mul

mov RSI,[a]		;RSI = variable a
mov RDX,[b]		;RDX = variable b
			
mov RCX,[a]		;RCX = variable a 
imul RCX,[b]		;;RCX = variable a * variable b

call printf

mov RAX,0
pop RBP
ret


;nasm -f elf64 assembly_sample.asm
;gcc assembly_sample.o -o assembly_sample
;./assembly_sample 
