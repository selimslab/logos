#include "mem.h"

void memory_copy(uint8_t *source, uint8_t *dest, int nbytes) {
    // this is good old memcpy 
    int i;
    for (i = 0; i < nbytes; i++) {
        *(dest + i) = *(source + i);
    }
}


