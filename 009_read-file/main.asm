bits 64

section .data
		path_1	db	"text_1.txt", 0

section .bss
		text_1	db	100
		
section .text
		global	_main

_main:
		mov		rax, 0x2000005		; open file system call
		mov		rdi, path_1			; file path
		mov		rsi, 0				; flag (read only)
		mov		rdx, 0				; mode
		syscall						; return file descriptor to rax

		push	rax
		mov		rdi, rax			; rdi: file descriptor
		mov		rax, 0x2000003
		mov		rsi, text_1
		mov		rdx, 99
		syscall

		mov		rax, 0x2000006		; close file system call
		pop		rdi					; backed up file descriptor
		syscall

		mov		rax, 0x2000004
		mov		rdi, 1
		mov		rsi, text_1
		mov		rdx, 100
		syscall
		
		mov		rax, 0x2000001
		mov		rdi, 0
		syscall
