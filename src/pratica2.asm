%include "macros.asm"
section .data
    array: db "", "", "",

    mensagem_escrita: db "Escreva caracteres: "
    tamanho_escrita: equ $- mensagem_escrita

    new_line: db 0xa
    end_byte: db 0x0

section .text
    global _start
    

add_new_line:
    lea rsi,[array + rcx]
    mov rax, 1 ;Código da syscall write
    mov rdx, 1
    mov rdi, 1

    syscall


_start:
    mov rcx, 0;Quantidade de bytes que serão iterados no array
    mov rax, 0
   
.loop:
    mov rax, rcx
    lea rsi, [array + rax] ;Rsi obtém o endereço do primeiro elemento do array + rbx
    
    add rcx, 1

    ;Coloca o valor de rbx e rcx no topo da pilha
    push rax
    push rcx

    mov rax, 1 ;Código da syscall write
    mov rdx, 1
    mov rdi, 1
    syscall

    ;Tira o valor de rcx e rbx da pilha
    pop rcx 
    push rsi
    call add_new_line

    pop rax
    pop rsi

    ;Se as iterações não acabaram continua no loop
    cmp rcx, 0 
    jnz .loop

; .escrever_no_array:
;     push rax
;     push rcx
;     push rsi

;     mov rax, 1 
;     mov rdi, 1
;     mov rsi, mensagem_escrita
;     mov rdx, tamanho_escrita
;     syscall

;     mov rax, 0 ;Código syscall read
;     mov rdi, 0 
;     lea rsi, [array + 12]
;     mov rdx, 2
;     syscall

;     mov rax, 1
;     mov rdi, 1
;     mov rdx, 2
;     syscall

;     pop rsi
;     pop rcx
;     pop rax

;     ;Finaliza o programa
;     mov rax, 60
;     xor rdi, rdi
;     syscall







