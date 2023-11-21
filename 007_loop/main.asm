bits 64

section .data
		text_1 db 	"Hello, World!", 10, 0
		text_2 db	"Bye, World!", 10, 0	

section .text
		global _main

_main:
		mov		rax, text_1
		call	_print

		mov		rax, text_2
		call	_print

		mov		rax, 0x2000001
		mov		rdi, 0
		syscall

_print:
		push	rax				; temporarily store rax in stack
		mov		rbx, 0			; rbx means buffer size
_printLoop:
		inc		rax				; next index of string
		inc		rbx				; increase size
		;mov		cl, [rax]		; use cl only for comparing current character
		;cmp		cl, 0			; end of string
		cmp		byte [rax], 0
		jne		_printLoop		; if not end, back to loop

		mov		rax, 0x2000004	; if end, print
		mov		rdi, 1
		pop		rsi				; peek from stack
		mov		rdx, rbx		; counted size
		syscall
		ret
