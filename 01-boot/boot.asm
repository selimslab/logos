; Infinite loop (e9 fd ff)
loop:
    jmp loop 

; Fill with zeros until the last 2 bytes
; code zeros 55 aa 
; db means define byte 
times 510-($-$$) db 0
dw 0xaa55  ;dw is define word, a word is 16 bit here 