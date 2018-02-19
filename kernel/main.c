void kernel_main(void) {
	char *vidmem = (char *) 0xb8000;
	vidmem[0] = 'a';
	vidmem[1] = 0x07;
	for (;;);
}
