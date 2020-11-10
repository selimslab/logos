wiki says "The Global Descriptor Table (GDT) is a data structure used by Intel x86-family processors starting with the 80286 in order to define the characteristics of the various memory areas used during program execution, including the base address, the size, and access privileges like executability and writability. These memory areas are called segments in Intel terminology."

in 16 bit mode we were using a global offset for memory segmentation, like `[org 0x7c00]`

No more. 

We will have segments for code and data. Start it from 0x00. gdt.asm implements the structure in this pic

<img src="https://en.wikipedia.org/wiki/File:SegmentDescriptor.svg">