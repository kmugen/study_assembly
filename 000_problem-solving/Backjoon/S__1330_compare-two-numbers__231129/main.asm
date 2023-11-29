			bits		64
			global		_main
			extern		_scanf
			extern		_printf

			section		.text
_main:
			push		rbp
			mov			rbp, rsp
			sub			rsp, 16

			mov			rdi, fmt_in
			lea			rsi, [rbp-4]
			lea			rdx, [rbp-8]
			mov			rax, 0
			call		_scanf

			mov			eax, dword [rbp-4]
			mov			ebx, dword [rbp-8]
			cmp			eax, ebx
			jge			else_if
			
			mov			rdi, fmt_out_1
			mov			rax, 0
			call		_printf
			jmp			branch_end
else_if:
			mov			eax, dword [rbp-4]
			mov			ebx, dword [rbp-8]
			cmp			eax, ebx
			jg			else

			mov			rdi, fmt_out_2
			mov			rax, 0
			call		_printf
			jmp			branch_end
else:
			mov			rdi, fmt_out_3
			mov			rax, 0
			call		_printf
			jmp			branch_end
branch_end:

			add			rsp, 16
			pop			rbp

			mov			rax, 0x2000001
			mov			rdi, 0
			syscall

			section		.data
fmt_in:		db			"%d%d", 0
fmt_out_1:	db			"<", 10, 0
fmt_out_2:	db			"==", 10, 0
fmt_out_3:	db			">", 10, 0
