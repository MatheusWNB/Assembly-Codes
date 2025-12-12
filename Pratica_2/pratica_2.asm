section .data
    array: db '00', 0x0a,'03', 0x0a,'06', 0x0a,'09', 0x0a, ''
    tamanho_array: equ $- array

    mensagem_escrita: db "Escreva 3 caracteres: "
    tamanho_escrita: equ $- mensagem_escrita

section .text
    global _start

_start:
    mov rcx, tamanho_array ;Quantidade de bytes que serão iterados no array
    mov rbx, 0
   
.loop:
    lea rsi, [array + rbx] ;Rsi obtém o endereço do primeiro elemento do array + rbx

    sub rcx, 3
    add rbx, 3

    ;Coloca o valor de rbx e rcx no topo da pilha
    push rbx
    push rcx

    mov rax, 1 ;Código da syscall write
    mov rdx, 3
    mov rdi, 1
    syscall

    ;Tira o valor de rcx e rbx da pilha
    pop rcx 
    pop rbx

    cmp rbx, 12
    je .escrever_no_array

    ;Se as iterações não acabaram continua no loop
    cmp rcx, 0 
    jnz .loop

.escrever_no_array:
    push rbx
    push rcx
    push rsi

    mov rax, 1 
    mov rdi, 1
    mov rsi, mensagem_escrita
    mov rdx, tamanho_escrita
    syscall

    mov rax, 0 ;Código syscall read
    mov rdi, 0 
    lea rsi, [array + 12]
    mov rdx, 2
    syscall

    mov rax, 1
    mov rdi, 1
    mov rdx, 2
    syscall

    pop rsi
    pop rcx
    pop rbx

    ;Finaliza o programa
    mov rax, 60
    xor rdi, rdi
    syscall







