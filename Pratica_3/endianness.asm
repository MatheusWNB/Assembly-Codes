;Exercício para tentar compreender o endianness
section .data
    codes_hex: db '0123456789abcdef'

    demo1: dq 0x1122334455667788
    demo2: db 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77, 0x88

    new_line: db 0xa

section .text
    global _start:

print:
    push rbx
    sub rcx, 4
    sar rbx, cl
    and rbx, 0xf

    lea rsi, [codes_hex + rbx]

    pop rbx
    push rcx

    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall

    pop rcx

    test rcx, rcx
    jnz print

    ret

_start:
    mov rbx, [demo1]
    mov rcx, 64
    call print

    mov rax, 1
    mov rdi, 1
    mov rsi, new_line
    mov rdx, 1
    syscall

    mov rbx, [demo2]
    mov rcx, 64
    call print

    mov rax, 60
    xor rdi, rdi
    syscall










    

    