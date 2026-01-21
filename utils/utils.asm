;Useful codes that will be used many times in programs.

section .text
    global .loop
    global .loop_strlen

;Exit program
%macro exit_code 0
    mov rax, 60
    xor rdi, rdi
    syscall
%endmacro

;Print string
%macro sys_print 2
    mov rax, 1
    mov rdi, 1
    mov rdx, %1
    mov rsi, %2
    syscall

%endmacro

%macro push_registers 3
    push %1
    push %2
    push %3
%endmacro

%macro pop_registers 3
    pop %1
    pop %2
    pop %3
%endmacro

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

    





