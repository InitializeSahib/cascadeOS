#include <output.h>
char* get_video_memory() {
	return (char *) 0xb8000;
}
void kputs(char *data) {
	char *vidmem = get_video_memory();
	for (int i = 0; data[i]; i++) {
		vidmem[i * 2] = data[i];
		vidmem[i * 2+ 1] = 0x07;
	}
}
