%include "macros.asm"

section .text
    global _start
    extern loop

_start:
    mov rax, 0x1122334455667788
    mov rdi, 1
    mov rdx, 1
    mov rcx, 64

    call loop

    exit_code



 

