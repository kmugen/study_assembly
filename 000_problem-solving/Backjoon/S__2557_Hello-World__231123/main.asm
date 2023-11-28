section .data
		msg		db		"Hello World!", 10, 0

section .text
		global	_main

_main:
		mov		rax, 0x2000004
		mov		rdi, 1
		mov		rsi, msg
		mov		rdx, 15
		syscall
		mov		rax, 0x2000001
		mov		rdi, 0
		syscall
