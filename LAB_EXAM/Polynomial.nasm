segment .data
m: dq 0
n: dq 0
m2: dq 0
sum: dq 0
fmt: db "%lld", 10,0
great: db "is larger",10, 0
fmt2: dq "%lld %s", 10, 0


segment .text
global main
extern printf
extern scanf

main:
push RBP


call scan1

call scan2


mov R8, [m]
mov [m2], R8
;mov [sum], R8
mov RCX, [n]
dec RCX
mov R9, 0

l1:
inc R9

push R9
push RCX
push R8

mov RAX, [m]
imul R8
mov [m], RAX

test R9, 1
jnz summinus

mov R10, [sum]
add R10, RAX
mov [sum], R10

retpoint:


pop R8
pop RCX
pop R9

loop l1

mov R11, [sum]
mov R12, [m2]
add R11, R12
mov [sum], R11

mov RDI, fmt
mov RSI, [sum]
mov RAX, 0
call printf


pop RBP
ret 

summinus:
mov R10, [sum]
sub R10, RAX
mov [sum], R10
jmp retpoint 

scan1:
mov RAX , 0
mov RDI, fmt
mov RSI, m
call scanf
ret

scan2:

mov RAX , 0
mov RDI, fmt
mov RSI, n
call scanf
ret

