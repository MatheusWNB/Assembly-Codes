section .data
    array: db '10', 0x0a,'20', 0x0a,'30', 0x0a,'40', 0x0a
    ; pular_linha: db 0xa

section .text
    global _start

_start:
    mov rcx, 12
    mov rax, 0
    mov rdi, 1
    mov rdx, 0
   
.loop:
    add rax, rdx
    lea rsi, [array + rax]

    sub rcx, 3
    add rdx, 3

    push rax
    mov rax, 1

    push rcx

    syscall

    ; push rdx
    ; call .linha
    ; pop rdx

    pop rcx
    pop rax

    cmp rcx, 0
    jnz .loop

    mov rax, 60
    xor rdi, rdi
    syscall

; .linha:
;     mov rdx, 1
;     mov rax, 1
;     mov rsi, pular_linha
;     syscall
    
    




