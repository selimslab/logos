Now we can continue with C code. The C compiler takes your code and creates machine code, ending with .o

This is called object code. There will be an object code file for your every C file. 

Then linker comes and connects these .o files together to create a single executable binary 

so bootloader will load the boot section, it will start in 16 bit mode, switch to 32 bit mode and it will give control to the kernel 

```C
void kernel_main() {
    ... 
}
```

we are using a simulator qemu, to view our OS. Thus we need to compile our code for the simulator, not our own computer. This is called cross-compiling, compiling for a different platform than your own. 

install the compiler and helper tools we need 
```
brew tap nativeos/i386-elf-toolchain 
brew install i386-elf-binutils i386-elf-gcc
```

To run our kernel, we need to compile it, link the object code, compile the bootsector, then link the compled bootsector with kernel and run 

Fortunately we have our makefile to avoid writing all these commands again 



1. compile the kernel

`i386-elf-gcc -ffreestanding -c kernel.c -o kernel.o`

`nasm kernel_entry.asm -f elf -o kernel_entry.o`

3. link 

`i386-elf-ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary`

0x1000 because our kernel will be placed not at 0x0 in memory, but at 0x1000. The bootsector will need to know this address too.

4. compile  the boot sector 

`nasm boot.asm -f bin -o boot.bin`

5. link boot sector and kernel to a single file 

`cat boot.bin kernel.bin > os-image.bin`

6. Run!

`qemu-system-i386 -fda os-image.bin`


