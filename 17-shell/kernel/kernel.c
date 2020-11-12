#include "../cpu/isr.h"
#include "../drivers/screen.h"
#include "kernel.h"
#include "../libc/string.h"
#include "../libc/mem.h"
#include <stdint.h>

void kernel_main() {
    isr_install();
    irq_install();

    asm("int $2");
    asm("int $3");

    kprint("Try PING\n"
        "type EXIT to stop the CPU \n"
        "type PAGE to request a kmalloc()\n> ");
}

void user_input(char *input) {
    if (strcmp(input, "EXIT") == 0) {
        kprint("bye!\n");
        asm volatile("hlt");
    } 
    else if (strcmp(input, "PING") == 0) {
        kprint("pong\n");
    }
    else if (strcmp(input, "hi") == 0) {
        kprint("hey!\n");
    }
    else if (strcmp(input, "hey") == 0) {
        kprint("hi!\n");
    }
    else if (strcmp(input, "who are you") == 0) {
        kprint("logos\n");
    }
    else if (strcmp(input, "PAGE") == 0) {
        /* Lesson 22: Code to test kmalloc, the rest is unchanged */
        uint32_t phys_addr;
        uint32_t page = kmalloc(1000, 1, &phys_addr);
        char page_str[16] = "";
        hex_to_ascii(page, page_str);
        char phys_str[16] = "";
        hex_to_ascii(phys_addr, phys_str);
        kprint("Page: ");
        kprint(page_str);
        kprint(", physical address: ");
        kprint(phys_str);
        kprint("\n");
    }
    kprint("\n> ");
}
