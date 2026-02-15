%include "include.asm"
section .data
    string: db "fwfwefwefw", 0
    msg: db "Len: ", 0
    len_msg: equ $- msg

section .text
    global _start
    extern loop_strlen

_start:
    lea rdi, [rel string]
    mov rax, 0

    call loop_strlen

    push rax
    newline
    sys_print len_msg, msg
    pop rax
    
    mov rbx, 2
    call loop
    newline

    mov rax, 60
    xor rdi, rdi
    syscall
