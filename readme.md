
# Logos 

Logos bootloads a kernel, connects to the keyboard and the screen, then starts a basic shell 

It is 32 bit and the assembly core is written for x86. 

---

This is a project to understand and replicate [the great OS tutorial of Carlos Fenollosa](https://github.com/cfenollosa/os-tutorial) 

Most parts are re-written, commented, and simplified 

## Setup 

we need a way to view our OS as it grows. A way is to boot a small computer like a raspberry pi or arduino. A simpler way is to use an emulator. Here we use [qemu](https://www.qemu.org/) 

For assembler we will use [Netwide Assembler- nasm](https://www.nasm.us/)

### macOS

 `brew install qemu nasm`

### linux 

use your own package manager 

## Resources

The bootloader part is largely from Prof. Blundell's book [Writing a Simple Operating System — from Scratch ](https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)

### Books 

Operating Systems: From 0 to 1

Writing a Simple Operating System — from Scratch

Operating Systems: Three Easy Pieces

### Links 

https://wiki.osdev.org/Main_Page

https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf

http://www.posix.nl/linuxassembly/nasmdochtml/nasmdoca.html

https://github.com/cfenollosa/os-tutorial

https://en.wikipedia.org/wiki/X86_assembly_language

https://github.com/tuhdo/os01

https://nasm.us/doc/nasmdoc3.html

https://articles.jaredcamins.com/building-a-kernel-for-a-toy-os-on-os-x-6002ea8a69b4

https://stackoverflow.com/questions/25634708/gnu-linker-equivalent-command-in-os-x/26378967#26378967

## Assembly overview 

B - Define Byte. 8 bits

DW - Define Word. Generally 2 bytes on a typical x86 32-bit system

DD - Define double word.


## x86 overview

there are 8, 16, and 32 bit general registers

they are named a, b, c, d

| a | c | d | b 

low, high 

8-bit general registers: AL is 0, CL is 1, DL is 2, BL is 3, AH is 4, CH is 5, DH is 6, and BH is 7.

16-bit general registers: AX is 0, CX is 1, DX is 2, BX is 3, SP is 4, BP is 5, SI is 6, and DI is 7.

32-bit general registers: EAX is 0, ECX is 1, EDX is 2, EBX is 3, ESP is 4, EBP is 5, ESI is 6, and EDI is 7.

Segment registers: ES is 0, CS is 1, SS is 2, DS is 3, FS is 4, and GS is 5.

extra es, code cs, stack ss, data dx 

{Floating-point registers}: ST0 is 0, ST1 is 1, ST2 is 2, ST3 is 3, ST4 is 4, ST5 is 5, ST6 is 6, and ST7 is 7.

64-bit MMX registers: MM0 is 0, MM1 is 1, MM2 is 2, MM3 is 3, MM4 is 4, MM5 
is 5, MM6 is 6, and MM7 is 7.

Control registers: CR0 is 0, CR2 is 2, CR3 is 3, and CR4 is 4.

Debug registers: DR0 is 0, DR1 is 1, DR2 is 2, DR3 is 3, DR6 is 6, and DR7 is 7.

Test registers: TR3 is 3, TR4 is 4, TR5 is 5, TR6 is 6, and TR7 is 7

AX multiply/divide, string load & store

CX count for string operations & shifts

DX port address for IN and OUT

BX index register for MOVE

SP points to top of the stack

BP points to base of the stack frame

SI points to a source in stream operations

DI points to a destination in stream operations
