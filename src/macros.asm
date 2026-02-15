;Exit program
%macro exit_code 0
    mov rax, 60
    xor rdi, rdi
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
    push_ %1
    push_ %2
    push_ %3
%endmacro

%macro pop_ 3
    pop_ %1
    pop_ %2
    pop_ %3
%endmacro
