
#include "../drivers/screen.h"
#include "../libc/mem.h"
#include "../libc/string.h"

#include "../cpu/isr.h"
#include "../cpu/idt.h"


void kernel_main() {

    isr_install();
    /* Test the interrupts */
    __asm__ __volatile__("int $2");
    __asm__ __volatile__("int $3");

}