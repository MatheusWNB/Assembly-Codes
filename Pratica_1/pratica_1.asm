%include "utils.asm"

section .data
    codes: db '0123456789ABCDEF'

section .text
    global _start:

_start:
    mov rax, 0x1122334455667788
    mov rdi, 1
    mov rdx, 1
    mov rcx, 64
    lea rsi, [rel codes]

    call loop

    exit_code



 

