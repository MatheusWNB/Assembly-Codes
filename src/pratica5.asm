%include "include.asm"
section .data
    string: db "Matheus", 0

section .text
    global _start
    extern loop_strlen

_start:
    lea rdi, [rel string]
    mov rax, 0

    call loop_strlen
    newline

    mov rax, rdi

    mov rax, 60
    xor rdi, rdi
    syscall
