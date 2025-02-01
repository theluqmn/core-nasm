section .bss
    int_to_string_buffer: resb 256

section .text
    global strlen
    global int_to_string

strlen:
    ; count the length of a string
    push rsi
    mov rdx, 0

    get_string_len:
        inc rdx
        inc rsi
        mov cl, [rsi]
        cmp cl, 0
    jne get_string_len

    mov rsi, rdx
    ret

int_to_string:
    ; convert an integer to a string
    mov rax, rdi
    mov rcx, 10
    xor rbx, rbx

    ; handle zero cases
    test rax, rax
    jnz int_to_string_loop
    mov byte [rsi], '0'
    mov byte [rsi + 1], 0
    ret

    int_to_string_loop:
        xor rdx, rdx
        div rcx
        add dl, '0'
        push rdx
        inc rbx

        test rax, rax
        jnz int_to_string_loop
    
    int_to_string_pop:
        pop rdx
        mov [rsi], dl
        inc rsi
        dec rbx
        jnz int_to_string_pop

        mov byte [rsi], 0
        ret