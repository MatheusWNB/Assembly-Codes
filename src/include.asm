%include "macros.asm"
;Useful codes that will be used many times in programs.
section .data
    codes: db '0123456789abcdef'

section .text
    global loop_strlen
    global loop
    global loop_div
    global print_char

end:
    ret

;Function to print a char
print_char:
    sub rsp, 1
    mov [rsp], dil 

    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    mov rsi, rsp
    syscall

    add rsp, 1
    jmp end

;Stores the string size in "rax"
loop_strlen:
    cmp byte[rdi + rax], 0
    je end

    lea rsi, [rdi + rax]

    push_ rax, rcx, rdi
    sys_print 1, rsi
    pop_ rdi, rcx, rax

    inc rax
    jmp loop_strlen

;Divide the numbers stored in "rax" to obtain the decimal size of the string.
loop_div:
    xor rdx, rdx
    div rbx

    inc rcx
    push rdx

    test rax, rax
    jz loop_print_div

    jmp loop_div

;Print the decimal size of the string stored in "rdx"
loop_print_div:
    test rcx, rcx
    jz end
    pop rdx
    lea rsi, [codes + rdx]

    push rcx
    sys_print 1, rsi
    pop rcx

    dec rcx
    jmp loop_print_div

;Loop to print numbers
loop:
    lea rsi, [rel codes]
    push rax
    sub rcx, 4
    sar rax, cl
    and rax, 0xf

    push rsi
    lea rsi, [rsi + rax]

    push rcx

    mov rax, 1
    mov rdi, 1

    sys_print 1, rsi

    pop_ rcx, rsi, rax

    dec rbx

    test rbx, rbx
    jnz loop

    jmp end

    





