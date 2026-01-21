%include "utils.asm"
section .data
    string: db "Matheus", 0

section .text
    global _start

_start:
    lea rdi, [rel string]
    mov rax, 0

    call loop_strlen

    mov rbx, rdi

    mov rax, 60
    xor rdi, rdi
    syscall
