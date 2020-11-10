
[Protected mode](https://en.wikipedia.org/wiki/Protected_mode)

Until now we were in 16-bit real mode. It is a good start but we need to step up. So we can use C code to build the rest of the kernel instead of assembly. You see, even writing a simple print function is a big deal in assembly.  

32-bit mode allows us to use 32 bit registers and memory addressing, protected memory, virtual memory 

There won't be BIOS interrupts anymore. 0x10 is the screen related interrupt service routine of BIOS and we were using it to print. Since it will also be gone, we will need a new print routine   

We can print by directly manipulating the VGA video memory instead of calling int 0x10

The VGA memory starts at address 0xb8000 

It has a text mode, useful to avoid manipulating direct pixels. Every character uses 2 bytes, one for the ASCII, one for color 

The structure of the memory concatenates rows. To access a specific character on the 80x25 grid is:

`0xb8000 + 2 * (row * 80 + col)`



