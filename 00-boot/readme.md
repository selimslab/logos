When the computer boots, the BIOS doesn't know how to load the OS. 

It delegates that task to the boot sector so the boot sector must be placed in a known, standard location.
 
That location is the first sector of the disk (cylinder 0, head 0, sector 0) It takes 512 bytes.

To make sure that the "disk is bootable", the BIOS checks that bytes 511 and 512 of the alleged boot sector are bytes 0xAA55

```bash
e9 fd ff 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[ 29 more lines with sixteen zero-bytes each ]
00 00 00 00 00 00 00 00 00 00 00 00 00 00 55 aa
```

The first three bytes perform an infinite jump

The rest is all zeros, ending with the 16-bit value 0xAA55

55 aa here because x86 is little-endian


`nasm -f bin boot.asm -o boot.bin`

`qemu boot.bin`

On some systems qemu is split into multiple binaries. You may want to call 

`qemu-system-x86_64 binfile` 

`qemu-system-x86_64 boot.bin`

