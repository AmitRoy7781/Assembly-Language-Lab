segment .data
Hello: db "Hello World",0
fmt: db "Negation of %d is %d",10,0

a dd 10
b dd 20

segment .text

global main
extern printf

main:
push RBP

mov RDI, fmt

mov RSI,[a]
mov RDX,[a]
neg RDX

call printf

mov RAX,0
pop RBP
ret


;nasm -f elf64 assembly_sample.asm
;gcc assembly_sample.o -o assembly_sample
;./assembly_sample 
