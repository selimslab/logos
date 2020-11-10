
## Goal: scroll

it is easy to scrolling for granted but we are at such a low level, we need to implement it 

when at the end, we can copy every row to its upper row, and blank the last line 

first we will need a function to copy memory 

and this is the first function in our freestanding c library, libc 

in libc/mem.c
```c++
void memory_copy(char *source, char *dest, int nbytes) {
    int i;
    for (i = 0; i < nbytes; i++) {
        *(dest + i) = *(source + i);
    }
}
```

and we add the rest to the print_char at drivers/screen.c 
```c++
    /* Check if the offset is over screen size and scroll */
    if (offset >= MAX_ROWS * MAX_COLS * 2) {
        int i;
        for (i = 1; i < MAX_ROWS; i++) 
            memory_copy(get_offset(0, i) + VIDEO_ADDRESS,
                        get_offset(0, i-1) + VIDEO_ADDRESS,
                        MAX_COLS * 2);

        /* Blank last line */
        char *last_line = get_offset(0, MAX_ROWS-1) + VIDEO_ADDRESS;
        for (i = 0; i < MAX_COLS * 2; i++) last_line[i] = 0;

        offset -= 2 * MAX_COLS;
    }
```

