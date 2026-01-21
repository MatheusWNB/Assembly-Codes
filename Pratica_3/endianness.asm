%include "utils.asm"

;Exercício para tentar compreender o endianness
section .data
    codes_hex: db '0123456789abcdef'

    demo1: dq 0x1122334455667788
    demo2: db 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88

    new_line: db 0xa

section .text
    global _start:

_start:
    mov rax, [rel demo1]
    mov rcx, 64
    lea rsi, [rel codes_hex]
    call loop

    push rsi
    sys_print 1, new_line

    mov rax, [rel demo2]
    mov rcx, 64
    pop rsi

    call loop

    exit_code










    

    