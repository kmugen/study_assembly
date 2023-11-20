bits 64

section .text
		global _main

_main:
		mov		rax, 0x2000001		; system call number (0, exit) + 0x2000000 (Unix BSD assembly)
		mov		rdx, 0 				; exit status
		syscall
