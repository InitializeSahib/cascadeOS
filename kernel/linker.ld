OUTPUT_FORMAT(binary)
ENTRY(startup)

SECTIONS {
  .text 0x100000 : { *(.startup) *(.text) }
  .data : { *(.rodata) *(.data) *(.bss) *(COMMON) }
}
