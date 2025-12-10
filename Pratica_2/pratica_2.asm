section .data
    array: db '10', 0x0a,'20', 0x0a,'30', 0x0a,'40', 0x0a
    ; pular_linha: db 0xa

section .text
    global _start

_start:
    mov rcx, 12 ;Quantidade de bytes que serão iterados no array
    mov rax, 0 ;Armazena o valor de rdx com os bytes que serão iterados
    mov rdi, 1
    mov rdx, 0
   
.loop:
    add rax, rdx 
    lea rsi, [array + rax] ;Rsi obtém o endereço do primeiro elemento do array

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

    ;Se as interações não acabaram continua no loop
    cmp rcx, 0 
    jnz .loop

    ;Finaliza o programa
    mov rax, 60
    xor rdi, rdi
    syscall





