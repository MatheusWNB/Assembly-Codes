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

    push rax
    push rcx
    push rdi

    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    syscall

    pop rdi
    pop rcx
    pop rax

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
