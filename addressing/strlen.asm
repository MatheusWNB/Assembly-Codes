section .data
    string: db "Matheus", 0

section .text
    global _start

end:
    ret

loop:
    cmp byte[rdi + rax], 0
    je end

    inc rax

    jmp loop

_start:
    mov rdi, [rel string]
    mov rax, 0

    call loop

    mov rbx, rdi

    mov rax, 1
    xor rdi, rdi
    syscall
