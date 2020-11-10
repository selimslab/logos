
run: os-image.bin
	qemu-system-x86_64 -fda os-image.bin

# Build the kernel object file
kernel.o : kernel.bin
	i386-elf-gcc -ffreestanding -c kernel.c -o kernel.o
	
# Build the kernel entry object file.
kernel_entry.o : kernel_entry.asm
	nasm kernel_entry.asm -f elf -o kernel_entry.o

# Build the kernel binary
kernel.bin: kernel_entry.o kernel.o
	i386-elf-ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary

boot.bin: boot.asm
	nasm -f bin boot.asm -o boot.bin

os-image.bin: boot.bin kernel.bin
	cat boot.bin kernel.bin > os-image.bin


clean:
	rm -rf *.bin *.o 
