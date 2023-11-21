
bits 64

section .data
		msg db 81
		
section .text
		global _main

_main:
		mov		rax, 0
		jmp		_next
		mov		rax, 1
_next:	
		mov		rax, 0x2000001
		mov 	rdi, 0
		syscall
