section .data
    codes: db '0123456789abcdef'
    var: dq -1

    new_line: db 0xa

section .text   
    global _start

new_line_:
    mov rax, 1
    mov rdi, 1
    mov rsi, new_line
    mov rdx, 1
    syscall

    ret

loop:
    push rbx

    sub rcx, 4
    sar rbx, cl
    and rbx, 0xf
    lea rsi, [rel codes]
    add rsi, rbx

    push rcx

    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall

    pop rcx
    pop rbx

    test rcx, rcx
    jnz loop

    call new_line_
    ret 

_start:
    mov rcx, 64
    mov rbx, [rel var]
    call loop

    mov rcx, 64
    mov byte[rel var], 1
    mov rbx, [rel var]
    call loop

    mov rcx, 64
    mov word[rel var], 5
    mov rbx, [rel var]
    call loop

    mov rcx, 64
    mov dword[rel var], 0xa
    mov rbx, [rel var]
    call loop

    mov rcx, 64
    mov qword[rel var], 0xf
    mov rbx, [rel var]
    call loop

    mov rax, 60
    mov rdi, 0
    syscall