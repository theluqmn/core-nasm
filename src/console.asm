section .bss
    input: resb 128

section .text
    global _console_print
    
_console_print:
    push rsi
    mov rdx, 0

    get_message_len:
        inc rdx
        inc rsi
        mov cl, [rsi]
        cmp cl, 0
    jne get_message_len

    mov rax, 1
    mov rdi, 1
    pop rsi
    syscall
    ret