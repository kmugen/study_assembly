bits 64

section .text
		global _main

_main:
		mov		eax, 6
		mov		ebx, 6
		cmp		eax, ebx
		je		_if				; go to _if when eax = ebx
		mov		ecx, 0			; if not equal, then store 0
		jmp		_merge			; and jump over _if
_if:
		mov		ecx, 1
_merge:
		mov		rax, 0x2000001
		mov		rdi, 0
		syscall
