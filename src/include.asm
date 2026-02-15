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

    push_ rax, rcx, rdi

    sys_print 1, rsi

    pop_ rdi, rcx, rax

    inc rax

    jmp loop_strlen

loop:
    lea rsi, [rel codes]
    push_ rax
    sub rcx, 4
    sar rax, cl
    and rax, 0xf

    push_ rsi
    lea rsi, [rsi + rax]

    push_ rcx

    mov rax, 1
    mov rdi, 1

    sys_print 1, rsi

    pop_ rcx
    pop_ rsi
    pop_ rax

    test rcx, rcx
    jnz loop

    jmp end

    





