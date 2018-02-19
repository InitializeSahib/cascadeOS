extern kernel_main
section .startup
bits 32
startup:
    call kernel_main
