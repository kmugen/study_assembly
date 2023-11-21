bits 64

section .data
		msg_1 db 	"Type your name "
		msg_2 db	"Your name is "

section .bss
		buf_name db	16

section .text
		global _main

_main:
		; print msg_1 on terminal
		mov		rax, 0x2000004
		mov		rdi, 1
		mov		rsi, msg_1
		mov		rdx, 15
		syscall

		; get name from terminal
		mov		rax, 0x2000003		; system call number (3, sys_read)
		mov		rdi, 0			; file descriptor (0, stdin)
		mov		rsi, buf_name		; buffer address
		mov		rdx, 16			; buffer size
		syscall

		; print msg_2 on terminal
		mov		rax, 0x2000004
		mov		rdi, 1
		mov		rsi, msg_2
		mov		rdx, 13
		syscall

		; print buf_name on terminal
		mov		rax, 0x2000004
		mov		rdi, 1
		mov		rsi, buf_name
		mov		rdx, 15
		syscall

		; exit system
		mov		rax, 0x2000001
		mov		rdi, 0
		syscall
