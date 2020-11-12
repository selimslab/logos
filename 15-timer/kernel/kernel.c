#include "../cpu/isr.h"
#include "../cpu/timer.h"

void kernel_main() {
    isr_install();

    asm volatile("sti");
    init_timer(50);
}