segment .data
Hello: db "Hello World",0
fmt: db "%d %d",0
fmt1: db "%d",10,0

a    dq 20d
b    dq 3d
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

mov RSI,[a]
mov RDX,[b]

mov RDI, fmt1

cmp RSI,RDX
JL first

mov RSI,[a]
call printf
jmp LAST

first: mov RSI,[b]
call printf

LAST:
pop RBP
ret


;nasm -f elf64 assembly_sample.asm
;gcc assembly_sample.o -o assembly_sample
;./assembly_sample 
