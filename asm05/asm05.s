global _start

section .rodata
    n db 10

section .text

_start:

mov rcx, [rsp]
cmp rcx, 2
jne .exit

mov r12, [rsp+16]

.loop :
    cmp byte [r12], 0
    je .fin

    mov rax, 1
    mov rdi, 1
    mov rsi, r12
    mov rdx, 1
    syscall

    inc r12
    jmp .loop

.fin:
    mov rax, 1
    mov rdi, 1
    mov rsi, n
    mov rdx, 1
    syscall
    
    mov rax, 60
    mov rdi, 0
    syscall

.exit:
    mov rax, 60
    mov rdi, 2
    syscall