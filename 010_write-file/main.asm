bits 64

section .data
		file_path_1	db	"./text_1.txt", 0
		file_path_2	db	"./text_2.txt", 0
		file_path_3	db	"./text_3.txt", 0
		content		db	"Hello, World!", 10, 0
		
section .text
		global _main

		; 1 	000 000 001
		; 2     000 000 000
		; 3		000 000 001
		; 4     000 000 100
		; 5 	000 000 101
		; 6     000 000 100
		; 7     000 000 101
		; 8     000 001 000
_main:
		mov		rdi, file_path_1
		mov		rsi, 0x0000			; RDONLY
		call	_open_and_write

		mov		rdi, file_path_2
		mov		rsi, 0x0001			; WRONLY
		call	_open_and_write

		mov		rdi, file_path_3
		mov		rsi, 0x0201			; CREAT | WRONLY
		mov		rdx, 0777o
		call	_open_and_write
		
		jmp		_exit

_open_and_write:
		mov		rax, 0x2000005
		syscall
		
		push	rax

		mov		rdi, rax
		mov		rax, 0x2000004
		mov		rsi, content
		mov		rdx, 15
		syscall
		
		mov		rax, 0x2000006
		pop		rdi
		syscall
		ret

_exit:
		mov		rax, 0x2000001
		mov		rdi, 0
		syscall
