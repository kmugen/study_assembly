bits 64

section .text
		global _main

_main:
		mov		rax, 0x2000001
		mov		rdx, 0
		syscall
