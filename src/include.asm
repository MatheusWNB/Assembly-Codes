%include "macros.asm"
;Useful codes that will be used many times in programs.
section .data
    codes: db '0123456789abcdef'

section .text
    global loop_strlen
    global loop

section .bss
    strlen: resb 3

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


/*
Implementar conversão de hex pra dec:
Divide o número por 10, pega o resto e converte pra código ascii
Continua a divisão com o quociente até o resto ser zero
*/

print_len:
    mov strlen, rax
    lea rsi, [rel strlen]

    sys_print 3, rsi

    jmp end


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

    





