section .data
    newline_: db 0xa

;Exit program
%macro exit_code 0
    mov rax, 60
    xor rdi, rdi
    syscall
%endmacro

%macro newline 0
    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    mov rsi, newline_
    syscall
%endmacro

;Print string
%macro sys_print 2
    mov rax, 1
    mov rdi, 1
    mov rdx, %1
    mov rsi, %2
    syscall
%endmacro

%macro push_ 3
    push %1
    push %2
    push %3
%endmacro

%macro pop_ 3
    pop %1
    pop %2
    pop %3
%endmacro
