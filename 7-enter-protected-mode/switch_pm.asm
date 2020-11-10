[bits 16]
switch_to_pm:
    cli ; 1. disable interrupts
    lgdt [gdt_descriptor] ; 2. load the GDT descriptor
    mov eax, cr0
    or eax, 0x1 ; 3. set 32-bit mode bit in cr0, the CPU control register
    mov cr0, eax
    jmp CODE_SEG:init_pm ; 4. far jump by using a different segment, Flush the CPU pipeline 

[bits 32]
init_pm: ; we are now using 32-bit instructions
    ; 5. update the segment registers
    mov ax, DATA_SEG 
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000 ; 6. update the stack 
    mov esp, ebp

    call BEGIN_PM ; 7. Call the label in boot.asm, it will continue from the label there 
