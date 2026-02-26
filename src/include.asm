%include "macros.asm"
;Useful codes that will be used many times in programs.
section .data
    codes: db '0123456789abcdef'

section .text
    global loop_strlen
    global loop
    global loop_div

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

loop_div:
    xor rdx, rdx
    div rbx

    inc rcx
    push rdx

    test rax, rax
    jz loop_print_div

    jmp loop_div

loop_print_div:
    test rcx, rcx
    jz end
    pop rdx
    lea rsi, [codes + rdx]

    push rcx
    sys_print 1, rsi
    pop rcx

    dec rcx
    jmp loop_print_div

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

    pop_ rcx, rsi, rax

    dec rbx

    test rbx, rbx
    jnz loop

    jmp end

    





