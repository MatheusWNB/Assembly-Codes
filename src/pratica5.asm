%include "macros.asm"
section .data
    string: db "MatheusWNB", 0
    msg: db "Len: ", 0
    len_msg: equ $- msg

section .text
    global _start
    extern loop_strlen
    extern loop_div
    extern print_char

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

    mov rdi, 65
    call print_char
    mov rdi, 10
    call print_char
    
    mov rax, 60
    xor rdi, rdi
    syscall
