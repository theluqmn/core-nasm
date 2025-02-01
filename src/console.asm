section .bss
    console_input_buffer: resb 256

section .text
    global print
    global input
    
print:
    ; initialise registers
    pop rsi ; get message from stack for use in loop
    push rsi ; push back to stack
    mov rdx, 0

    ; loop through each character in the message
    get_message_len:
        inc rdx
        inc rsi
        mov cl, [rsi]
        cmp cl, 0
    jne get_message_len

    ; print out the message
    mov rax, 1
    mov rdi, 1
    pop rsi
    syscall
    ret

input:
    ; initialise registers
    mov rax, 0
    mov rdi, 0
    mov rsi, console_input_buffer
    mov rdx, 256
    syscall

    ; store the input in rsi
    mov rdi, [console_input_buffer]
    push rdi
    ret