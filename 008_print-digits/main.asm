bits 64

section .bss
		arr		resb	100
		
section .text
    	global _main
 
_main:
		mov		rax, 3412
		call	_make_arr
		call	_print_arr
		jmp		_exit
				
_make_arr:
		mov		rbx, 10
		mov		rbp, rsp
		mov		rcx, arr
		mov		r10, 0
_make_arr_loop_1:
		mov		rdx, 0
		div		rbx
		push	rdx
		inc		r10
		cmp		rax, 0
		jne		_make_arr_loop_1
_make_arr_loop_2:
		pop		rdx
		add		rdx, 48
		mov		byte [rcx], dl
		inc		rcx
		cmp		rbp, rsp
		jne		_make_arr_loop_2
		mov		byte [rcx], 10
		inc		rcx
		mov		byte [rcx], 0
		ret
		
_print_arr:
		mov		rax, 0x2000004
		mov		rdi, 1
		mov		rsi, arr
		add		r10, 2
		mov		rdx, r10
		syscall
		ret
		
_exit:
		mov		rax, 0x2000001
		mov		rdi, 0
		syscall
