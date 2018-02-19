#!/bin/bash
set -e
set -x
if [ ! -f ./echfs-utils.c ]; then
	wget https://raw.githubusercontent.com/echidnaOS/echidnaOS/master/echidnafs/echfs-utils.c
fi

if [ ! -f ./echfs-utils ]; then
	gcc -O2 echfs-utils.c -o echfs-utils
fi

nasm bootloader/bootloader.asm -f bin -o cascade.img
dd bs=32768 count=256 if=/dev/zero >> cascade.img
truncate --size=-4096 cascade.img
./echfs-utils cascade.img format 32768
clang -target i386-elf -m32 -nostdlib -ffreestanding -c kernel/main.c -o kernel/main.o
nasm kernel/startup.asm -f elf32 -o kernel/startup.o
clang -target i386-elf kernel/startup.o kernel/main.o -nostdlib -T kernel/linker.ld -o kernel.bin
./echfs-utils cascade.img import kernel.bin kernel.bin
exit 0 
