bits 64

section .data
		msg db "Hello, World!"
		
section .text
		global _main

_main:
		mov		rax, 0x2000004		; sys_write
		mov		rdi, 1				; file desciptor (stdout)
		mov		rsi, msg			; buffer address
		mov		rdx, 14				; buffer size
		syscall

		mov		rax, 0x2000001		; sys_exit
		mov		rdi, 0x0 			; exit status
		syscall
