section .text
    global len_string
    
strlen:
    ; initialise registers
    push rsi
    mov rdx, 0

    ; loop through each character in the message
    get_string_len:
        inc rdx
        inc rsi
        mov cl, [rsi]
        cmp cl, 0
    jne get_string_len

    mov rsi, rdx
    ret