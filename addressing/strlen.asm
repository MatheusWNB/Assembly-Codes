%include "utils.asm"

section .data
    string: db "Matheus", 0

section .text
    global _start

end:
    ret

loop:
    cmp byte[rdi + rax], 0
    je end

    lea rsi, [rdi + rax]

    push_registers rax, rcx, rdi

    sys_print 1, rsi

    pop_registers rdi, rcx, rax

    inc rax

    jmp loop

_start:
    lea rdi, [rel string]
    mov rax, 0

    call loop

    mov rbx, rdi

    mov rax, 60
    xor rdi, rdi
    syscall
