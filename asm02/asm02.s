global _start

section .bss
    msg     resb 3

section .data
    msg1     db  "1337", 10

section .text

_start:
    mov     rax, 0
    mov     rsi, msg
    mov     rdx, 3
    syscall

    cmp rax, 3
    jne .false

    cmp byte [msg], '4'
    jne .false

    cmp byte [msg+1], '2'    
    jne .false

    cmp byte [msg+2], 10    
    jne .false

    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg1
    mov     rdx, 5
    syscall
    
    mov     rax, 60
    mov     rdi, 0
    syscall

    .false :
    mov     rax, 60
    mov     rdi, 1
    syscall