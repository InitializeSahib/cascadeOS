#include <output.h>
void kernel_main(void) {
	char *vidmem = get_video_memory();
	for (int i = 0; i < 80 * 25 * 2; i += 2) {
		vidmem[i] = ' ';
		vidmem[i + 1] = 0x07;
	}
	char *my_message = "hello";
	kputs(my_message);
	for (;;);
}
