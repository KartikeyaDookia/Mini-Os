; boot/boot.asm
[org 0x7c00]       ; BIOS loads bootloader to 0x7c00
mov si, msg
call print_string
jmp $

print_string:
    mov ah, 0x0E
.next_char:
    lodsb
    cmp al, 0
    je .done
    int 0x10
    jmp .next_char
.done:
    ret

msg db "Booting MyOS...", 0

times 510 - ($ - $$) db 0
dw 0xAA55
