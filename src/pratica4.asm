%include "include.asm"
section .data
    var: dq -1

section .text   
    global _start
    extern loop

_start:
    mov rcx, 64
    mov rax, [rel var]
    call loop
    newline

    mov rcx, 64
    mov byte[rel var], 1
    mov rax, [rel var]
    call loop
    newline

    mov rcx, 64
    mov word[rel var], 5
    mov rax, [rel var]
    call loop
    newline

    mov rcx, 64
    mov dword[rel var], 0xa
    mov rax, [rel var]
    call loop
    newline

    mov rcx, 64
    mov qword[rel var], 0xf
    mov rax, [rel var]
    call loop
    newline
    
    exit_code