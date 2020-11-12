
# logos 


## background 
What happens under the hood? How do computers work really? 

How my keyboard knows what I am writing? 

How the screen knows what to show and how? 

Where is all these files and folders? What is a file anyway?  

Questions follow each other. This got me thinking. First I have read  Operating Systems: Three Easy Pieces, then I followed the great [os-tutorial](https://github.com/cfenollosa/os-tutorial). After reading and skimming a few more OS books and some time on [os-dev wiki](https://wiki.osdev.org/Main_Page), answers started to come. 

## Aim

This project is educational. It aims to connect the ideas and to show how a simple kernel works   

## Scope 

Logos is able to boot, use screen and keyboard, start a simple shell, get user input, and execute a few commands. Maybe it will have a filesystem later. 

It is 32 bit and the assembly core is written for x86. 

It is developed in 16 steps. Heavily commented yet you may need to make a few google searches to better understand.

## Setup 

we need a way to view our OS as it grows. A way is to boot a small computer like a raspberry pi or arduino. A simpler way is to use an emulator. Here we use [qemu](https://www.qemu.org/) 

For assembler we will use [Netwide Assembler- nasm](https://www.nasm.us/)

### macOS

 `brew install qemu nasm`

### linux 

use your own package manager 


## Resources

The bootloader part is largely from Prof. Blundell's book [Writing a Simple Operating System — from Scratch ](https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)

Interrupt code is largely from [os-tutorial](https://github.com/cfenollosa/os-tutorial)  

I have re-written, commented, and simplified most parts 

### books 

Operating Systems: From 0 to 1

Writing a Simple Operating System — from Scratch

Operating Systems: Three Easy Pieces

### links 

https://wiki.osdev.org/Main_Page

https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf

http://www.posix.nl/linuxassembly/nasmdochtml/nasmdoca.html

https://github.com/cfenollosa/os-tutorial

https://en.wikipedia.org/wiki/X86_assembly_language

https://github.com/tuhdo/os01

https://nasm.us/doc/nasmdoc3.html

https://articles.jaredcamins.com/building-a-kernel-for-a-toy-os-on-os-x-6002ea8a69b4

https://stackoverflow.com/questions/25634708/gnu-linker-equivalent-command-in-os-x/26378967#26378967



## assembly overview 

B - Define Byte. 8 bits

DW - Define Word. Generally 2 bytes on a typical x86 32-bit system

DD - Define double word.


## x86 overview

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
