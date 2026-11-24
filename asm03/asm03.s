global _start

section .data
    msg     db  "1337", 10

section .text

_start:

    mov rax, [rsp]
    cmp rax, 2
    jne .bad_args

    mov rsi, [rsp+16]

    cmp byte [rsi], '4'
    jne .false

    cmp byte [rsi+1], '2'
    jne .false

    cmp byte [rsi+2], 0
    jne .false

    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg
    mov     rdx, 5
    syscall
    
    mov     rax, 60
    mov     rdi, 0
    syscall

    .false :
    mov     rax, 60
    mov     rdi, 1
    syscall

    .bad_args :
    mov     rax, 60
    mov     rdi, 2
    syscall