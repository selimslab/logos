
# logos 

How OS works? This question led me to go search for answers. 

First I have read  Operating Systems: Three Easy Pieces, then I followed the great [os-tutorial](https://github.com/cfenollosa/os-tutorial). After reading the other books and links below, I have started to understand, re-write, and connect the existing pieces. This project consists of distilled ideas from these books, tutorials, and links. 

Logos is able to boot, use screen and keyboard, start a simple shell, and get user input, Maybe it will have a filesystem later. 

It is 32 bit and the assembly core is written for x86. 

## Development 

It is developed in steps. Every step has its folder, and adds a little bit on the previous step 

All you need is a mac or linux. You only need to install qemu for simulating the OS,  nasm for assembly and a C compiler to compile the kernel. Installation commands are in their relevant steps.  

There is an overview for assembly and x86 in docs/ folder 


## resources

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

