; BIOS will load bootloader to 0x7c00
; so this line means a global offset, every adress will be offsetted by 0x7c00
[org 0x7c00] 

mov bx, HELLO; bx is a 16 bit general CPU register , there are 4 of them, a,b,c,d 
call print ; call pushes the return adress to stack, and ret in the callee pops it 

; Infinite loop (e9 fd ff)
jmp $ 

; assembler will replace this line with the actual source 
%include "print.asm"

HELLO: ; labels are used to mark the start of data and procedures to be able to reference it later  
    ; since data is in quotes, assembler will convert each character to its ascii byte code
    ; 0 denotes the end of the string  
    db 'Hello, World', 0


times 510-($-$$) db 0; ; Fill with 510 zeros minus the size of the previous code
dw 0xaa55 ; Magic number



