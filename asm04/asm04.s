global _start

section .bss
    number  resb  32
    
section .text

_start:
    mov rax, 0
    mov rdi, 0
    mov rsi, number
    mov rdx, 32
    syscall

    cmp byte [number+rax-1], 10
    jne .suite
    dec rax

    .suite :
    mov rcx, 0

    cmp byte [number], '-'
    jne .boucle
    
    mov rcx, 1
    
    .boucle:
        cmp rcx, rax
        je .is_number

        cmp byte [number+rcx], '0'
        jb .not_number

        cmp byte [number+rcx], '9'
        ja .not_number

        inc rcx
        jmp .boucle

    .is_number:
        test byte [number+rax-1], 1
        jz .pair
        mov rax, 60
        mov rdi, 1
        syscall

    .pair :
        mov rax, 60
        mov rdi, 0
        syscall

    .not_number :
        mov rax, 60
        mov rdi, 2
        syscall
    