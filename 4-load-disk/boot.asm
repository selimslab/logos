; BIOS will load bootloader to 0x7c00
; so this will ensure every adress is properly offset
[org 0x7c00] 

; bp means base pointer, of the stack 
mov bp, 0x8000 ; set the stack safely away from us
mov sp, bp ;sp means stack pointer

mov bx, 0x9000 ; load to a memory buffer ponited from es to bx, from 0 to 0x9000, es:bx = 0x0000:0x9000 = 0x9000
mov dh, 2 ; read 2 sectors
call disk_load

mov dx, [0x9000] ; retrieve the first loaded word, 0xdede
call print_hex

call print_new_line

mov dx, [0x9000 + 512] ; first word from second loaded sector, 0xface
call print_hex


jmp $ 

%include "print.asm"
%include "print_hex.asm"
%include "disk.asm"


; Bootsector padding 
times 510-($-$$) db 0
dw 0xaa55 

; boot sector = sector 1 of cyl 0 of head 0 of hdd 0
; from now on = sector 2 ...
; define some data ahead of boot sector, 
; so we will be sure that we actually loaded those from disk 
times 256 dw 0xdede ; sector 2 = 512 bytes
times 256 dw 0xface ; sector 3 = 512 bytes



