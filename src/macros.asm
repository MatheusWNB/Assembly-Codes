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

%macro push_registers 3
    push %1
    push %2
    push %3
%endmacro

%macro pop_registers 3
    pop %1
    pop %2
    pop %3
%endmacro
