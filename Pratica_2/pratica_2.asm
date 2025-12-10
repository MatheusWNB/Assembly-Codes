section .data
    array: db '00', 0x0a,'03', 0x0a,'06', 0x0a,'09', '' 0x0a
    tamanho_array: equ $- array

    mensagem_escrita: db "Escreva 3 caracteres: "
    tamanho_escrita: equ $- mensagem_escrita

section .text
    global _start

_start:
    mov rcx, tamanho_array ;Quantidade de bytes que serão iterados no array
    mov rax, 0 ;Armazena o valor de rdx com os bytes que serão iterados
    mov rdi, 1
    mov rdx, 0
   
.loop:
    add rax, rdx 
    lea rsi, [array + rax] ;Rsi obtém o endereço do primeiro elemento do array + rax

    sub rcx, 3
    add rdx, 3

    ;Coloca o valor de rax e rcx no topo da pilha
    push rax
    push rcx

    mov rax, 1 ;Código da syscall write
    syscall

    ;Tira o valor de rcx e rax da pilha
    pop rcx 
    pop rax

    cmp rdx, 12
    je .escrever_no_array

    ;Se as iterações não acabaram continua no loop
    cmp rcx, 0 
    jnz .loop

    ;Finaliza o programa
    mov rax, 60
    xor rdi, rdi
    syscall

.escrever_no_array:
    push rax
    push rcx
    push rdx
    push rsi

    mov rax, 1 
    mov rdi, 1
    mov rdx, tamanho_escrita
    mov rsi, mensagem_escrita
    syscall

    mov rax, 0 ;Código syscall read
    mov rdi, 0 
    lea rsi, [array + 12]
    mov rdx, 2
    syscall

    pop rsi
    pop rdx
    pop rcx
    pop rax

    call .loop


    
    











