print:
    pusha ; push all registers to the stack 


start:
    mov al, [bx] ; pass the first char at bx to al 
    cmp al, 0 ; 0 means the end of string  
    je done

    mov ah, 0x0e  ; set high byte of register a to teletype mode, so BIOS will print al when 
    
    int 0x10 ; invoke the screen related interrupt service routine of BIOS, so it prints the char at al 

    ; Each interrupt is represented by a unique number that is an index to the interrupt vector, 
    ; a table initially set up by BIOS at the start of memory (i.e. at physical address 0x0)
    ; that contains address pointers to interrupt service routines 

    ; increment pointer to the next char 
    add bx, 1
    jmp start

done:
    popa; restore all registers from the stack 
    ret



print_new_line:
    pusha
    
    mov ah, 0x0e ; tty
    mov al, 0x0a ; newline char
    int 0x10 ; interrupt
    mov al, 0x0d ; carriage return
    int 0x10 
    
    popa
    ret
