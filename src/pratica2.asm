%include "include.asm"

section .data
    mensagem_escrita: db "Escreva caracteres: "
    tamanho_escrita: equ $- mensagem_escrita

    end_byte: db 0x0

section .bss
    array resb 10

section .text
    global _start

_start:
    mov rcx, 3;Quantidade de bytes que serão iterados no array
    mov rax, -1

    call .escrever_no_array

    ;Finaliza o programa
    mov rax, 60
    xor rdi, rdi
    syscall

.escrever_no_array:
    add rax, 2

    push_ rcx, rsi, rax

    sys_print tamanho_escrita, mensagem_escrita

    mov rax, 0 ;Código syscall read
    mov rdi, 0 
    lea rsi, [array + rax]
    mov rdx, 3
    syscall

    sys_print 3, rsi

    pop_ rax, rsi, rcx

    newline

    cmp rcx, rax
    jne .escrever_no_array

    ret






