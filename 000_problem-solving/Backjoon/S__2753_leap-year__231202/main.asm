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
			mov			rax, 0
			call		_scanf
			
			mov			eax, dword [rbp-4]
			mov			ebx, 400
			mov			edx, 0
			div			ebx
			cmp			edx, 0
			je			_if

			mov			eax, dword [rbp-4]
			mov			ebx, 4
			mov			edx, 0
			div			ebx
			cmp			edx, 0
			jne			_else

			mov			eax, dword [rbp-4]
			mov			ebx, 100
			mov			edx, 0
			div			ebx
			cmp			edx, 0
			je			_else
_if:
			mov			dword [rbp-8], 1
			jmp			_branch_f
_else:
			mov			dword [rbp-8], 0
			jmp			_branch_f
_branch_f:
			mov			rdi, fmt_out
			mov			esi, dword [rbp-8]
			mov			rax, 0
			call		_printf

			add			rsp, 16
			pop			rbp

			mov			rax, 0x2000001
			mov			rdi, 0
			syscall
						
			section		.data
fmt_in:		db			"%d", 0
fmt_out:	db			"%d", 10, 0
