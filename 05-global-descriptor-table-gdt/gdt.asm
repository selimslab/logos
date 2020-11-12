; GDT
gdt_start: ; label to calculate size of the GDT decriptor 

gdt_null:               ; the mandatory null descriptor
    dd 0x0              ; ’dd ’ means define double word ( i.e. 4 bytes )
    dd 0x0              

; the code segment descriptor
gdt_code:               
    ; base =0x0 
    ; limit =0xfffff 32 bit 
    dw 0xffff           ; Limit ( bits 0 -15)
    dw 0x0              ; Base ( bits 0 -15)
    db 0x0              ; Base ( bits 16 -23)

    ; 1st flags : ( present )1 ( privilege )00 ( descriptor type )1 -> 1001 b
    ; type flags : ( code )1 ( conforming )0 ( readable )1 ( accessed )0 -> 1010 b
    db 10011010b        ; 1st flags , type flags 

    ; 2nd flags : ( granularity )1 (32 - bit default )1 (64 - bit seg )0 ( AVL )0 -> 1100 b
    ; limit 1111 
    db 11001111b        ; 2nd flags , Limit ( bits 16 -19)
    db 0x0              ; Base ( bits 24 -31)

; the data segment descriptor
gdt_data:               
                        ; Same as code segment except for the type flags :
                        ; type flags : ( code )0 ( expand down )0 ( writable )1 ( accessed )0 -> 0010 b
    
    dw 0xffff           ; Limit ( bits 0 -15)
    dw 0x0              ; Base ( bits 0 -15)
    db 0x0              ; Base ( bits 16 -23)
    db 10010010b        ; 1st flags , type flags
    db 11001111b        ; 2nd flags , Limit ( bits 16 -19)
    db 0x0              ; Base ( bits 24 -31)

gdt_end:                ; label to be able to calculate the size of the GDT 
                        ; for the GDT decriptor ( below )

; the CPU can't directly load the GDT address, 
; it requires a meta structure called the "GDT descriptor" 
; GDT descriptor is a 6-byte structure of 2 parts 
; GDT size (16 bits)
; GDT address (32 bits)
gdt_descriptor:
    dw gdt_end - gdt_start - 1  ; Size of our GDT 
                            
    dd gdt_start                ; Start address of our GDT


CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start