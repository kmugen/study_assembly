bits 64

section .text
		global _main

_main:
		mov		rcx, 1
		call	_sub_routine		; call: return to where sub routine was called
		mov		rcx, 3				; unlike jmp, the line be executed
		jmp		_next				; jmp: doesn't return
		mov		rcx, 4				; unlike call, the line not be executed
_next:
		mov		rax, 0x2000001
		mov		rdi, 0
		syscall

_sub_routine:
		mov		rcx, 2				; execute the line then back to line 9
		ret
