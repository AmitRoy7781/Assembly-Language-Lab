
segment .data
Hello: db "Hello World",0
fmt: db "%d / %d = %d , Reminder: %d",10,0
fmt2: db "%d",0
even: db "EVEN",10,0
odd: db "ODD",10,0
a    dq 20d
b    dq 2d
c	 dq 0d
quot dq 0d
rem  dq 0d

segment .text

global main
extern printf,scanf

main:
push RBP

mov RDI,fmt2
mov RSI,a
call scanf

mov RAX,qword[a]
mov RDX,qword 0
div qword[b]
mov [quot], RAX;
mov [rem], RDX

mov RDX,[c]

cmp [rem],RDX
JE PRINT_EVEN

; AND RAX,1		;changes the value to 1 or 0
; TEST RAX,1	;changes the 
; JZ EVEN

mov RDI,odd
call printf
jmp LAST


PRINT_EVEN:
mov RDI,even
call printf

LAST:
mov RAX,0
pop RBP
ret


;nasm -f elf64 assembly_sample.asm
;gcc assembly_sample.o -o assembly_sample
;./assembly_sample 
