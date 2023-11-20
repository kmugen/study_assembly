bits 64


section .data
		text1 db "What is your name? "
		text2 db "Hello, "

section .bss
		name resb 16

section .text
		global _main
		
_main:
		call _printText1
		call _getName
		call _printText2
		call _printName
		
		mov rax, 0x2000001
		mov rdi, 0
		syscall

_getName:
		mov rax, 0x2000003
		mov rdi, 0
		mov rsi, name
		mov rdx, 16
		syscall
		ret

_printText1:
		mov rax, 0x2000004
		mov rdi, 1
		mov rsi, text1
		mov rdx, 19
		syscall
		ret
		
_printText2:
		mov rax, 0x2000004
		mov rdi, 1
		mov rsi, text2
		mov rdx, 7
		syscall
		ret	

_printName:
		mov rax, 0x2000004
		mov rdi, 1
		mov rsi, name
		mov rdx, 16
		syscall
		ret
