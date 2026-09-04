global _start

section .text
_start:
    sub rsp, 16

    mov rax, 318
    mov rdi, rsp
    mov rsi, 1
    mov rdx, 0
    syscall

    movzx eax, byte [rsp]
    mov ecx, 10
    xor edx, edx
    div ecx

    add edx, 1
    mov eax, edx

    cmp eax, 10
    je .is_ten

    add al, '0'
    mov [rsp], al
    mov rdx, 1
    jmp .print

.is_ten:
    mov word [rsp], 0x3031
    mov rdx, 2

.print:
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    syscall

    mov byte [rsp], 10       ; 10 es el valor ASCII de '\n'
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall
