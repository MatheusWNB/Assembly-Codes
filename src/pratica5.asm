%include "macros.asm"
section .data
    string: db "MatheusWNB", 0
    msg: db "Len: ", 0
    len_msg: equ $- msg
    uint: dd 5555
    string1: db "Matheus3", 0
    len1: equ $- string1
    string2: db "Matheus33", 0
    msgreturn: db "Código de retorno: ", 0
    lenmsg: equ $- msgreturn

section .text
    global _start
    extern loop_strlen
    extern loop_div
    extern print_char
    extern cmp_int
    extern getchar
    extern strcmp

_start:
    lea rdi, [rel string]
    mov rax, 0

    call loop_strlen

    push rax
    newline
    sys_print len_msg, msg
    pop rax

    xor rcx, rcx
    mov rbx, 10
    call loop_div
    newline

    call getchar

    mov rdi, 65
    call print_char
    mov rdi, 10
    call print_char

    movsx rax, dword [rel uint]
    call cmp_int
    newline

    lea rdi, [rel string1]
    lea rsi, [rel string2]
    xor rcx, rcx
    mov rdx, len1

    push rsi
    push rdi
    call strcmp

    push rdi
    sys_print lenmsg, msgreturn
    pop rdi

    call print_char
    pop rsi
    pop rdi

    exit_code
