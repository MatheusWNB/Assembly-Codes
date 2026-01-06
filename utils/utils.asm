;Useful codes that will be used many times in programs.

;Exit program
%macro exit_code 0
    mov rax, 60
    xor rdi, rdi
    syscall
%endmacro

;Push registers
%macro sys_print 2
    mov rax, 1
    mov rdi, 1
    mov rdx, %1
    mov rsi, %2
    syscall
%endmacro


