%include "macros.asm"
;Useful codes that will be used many times in programs.
section .data
    codes: db '0123456789abcdef'

section .text
    global loop_strlen
    global loop

end:
    ret

loop_strlen:
    cmp byte[rdi + rax], 0
    je end

    lea rsi, [rdi + rax]

    push_registers rax, rcx, rdi

    sys_print 1, rsi

    pop_registers rdi, rcx, rax

    inc rax

    jmp loop_strlen

loop:
    lea rsi, [rel codes]
    push rax
    sub rcx, 4
    sar rax, cl
    and rax, 0xf

    push rsi
    lea rsi, [rsi + rax]

    push rcx

    mov rax, 1
    mov rdi, 1

    sys_print 1, rsi

    pop rcx
    pop rsi
    pop rax

    test rcx, rcx
    jnz loop

    jmp end

    





