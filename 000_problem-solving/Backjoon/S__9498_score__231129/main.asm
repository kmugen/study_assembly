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

			mov			dword [rbp-8], 65

			mov			eax, dword [rbp-4]
			cmp			eax, 90
			jl			elif_1
			; Do Nothing
			jmp			branch_f
elif_1:
			mov			eax, dword [rbp-4]
			cmp			eax, 80
			jl			elif_2

			mov			eax, dword [rbp-8]
			add			eax, 1
			mov			dword [rbp-8], eax

			jmp			branch_f
elif_2:
			mov			eax, dword [rbp-4]
			cmp			eax, 70
			jl			elif_3

			mov			eax, dword [rbp-8]
			add			eax, 2
			mov			dword [rbp-8], eax

			jmp			branch_f
elif_3:
			mov			eax, dword [rbp-4]
			cmp			eax, 60
			jl			else

			mov			eax, dword [rbp-8]
			add			eax, 3
			mov			dword [rbp-8], eax

			jmp			branch_f
else:
			mov			eax, dword [rbp-8]
			add			eax, 5
			mov			dword [rbp-8], eax

			jmp			branch_f
branch_f:
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
fmt_out:	db			"%c", 10, 0
