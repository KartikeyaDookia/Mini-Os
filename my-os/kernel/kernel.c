// kernel/kernel.c
void kernel_main() {
    const char *str = "Welcome to MyOS!";
    char *vidptr = (char*)0xb8000;  // VGA memory
    unsigned int i = 0;
    while(str[i] != '\0') {
        vidptr[i * 2] = str[i];
        vidptr[i * 2 + 1] = 0x07; // light grey on black
        i++;
    }
    while(1);
}
