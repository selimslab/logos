

We want to be able to write to screen. To use a keyboard we need interrupts. 

An interrupt means a signal. the receiver is OS. A device can send it, for example a keyboard, a mic, a screen, or software can send it. This signal triggers an Interrupt Service Routine or interrupt handler. 

The signal sent is interrupt request(IRQ) and the processing method is Interrupt Service Routine(ISR)

When we get a request, we need a way to know the correct response for it. A table would be good for this. This table is commonly called Interrupt Descriptor Table (IDT). 

We are using IDT to determine the correct response to interrupts and exceptions.

our interrupt services in the folder cpu/ 

idt.c defines IDT, interrupt.asm defines ISRs, isr.c implements isrs defined there. 

remember to add the object file of interrupt.asm to C_SOURCES

`OBJ = ${C_SOURCES:.c=.o}` -> `OBJ = ${C_SOURCES:.c=.o cpu/interrupt.o}`
