%include "macros.asm"
section .data
    var: dq -1

    new_line: db 0xa

section .text   
    global _start
    extern loop

new_line_:
    sys_print 1, new_line
    ret

_start:
    mov rcx, 64
    mov rax, [rel var]
    call loop
    call new_line_

    mov rcx, 64
    mov byte[rel var], 1
    mov rax, [rel var]
    call loop
    call new_line_

    mov rcx, 64
    mov word[rel var], 5
    mov rax, [rel var]
    call loop
    call new_line_

    mov rcx, 64
    mov dword[rel var], 0xa
    mov rax, [rel var]
    call loop
    call new_line_

    mov rcx, 64
    mov qword[rel var], 0xf
    mov rax, [rel var]
    call loop
    call new_line_
    
    exit_code