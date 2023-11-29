			bits		64
			global		_main
			extern		_scanf
			extern		_printf

			section		.text
_main:
			push		rbp							; stack init
			mov			rbp, rsp
			sub			rsp, 32

			mov			rdi, fmt_in					; rbp-4: int n1, rbp-8: int n2
			lea			rsi, [rbp-4]
			lea			rdx, [rbp-8]
			mov			rax, 0
			call		_scanf

			mov			eax, dword [rbp-4]			; eax: n1, ebx: n2
			mov			ebx, dword [rbp-8]
			imul		eax, ebx					; eax: n1*n2
			mov			dword [rbp-12], eax			; rbp-12: int mul = n1*n2

			mov			eax, 0
			mov			dword [rbp-16], eax			; rbp-16: int i = 0
_loop0_s:
			mov			eax, dword [rbp-16]
			cmp			eax, 3						; if (i>=3) break
			jge			_loop0_f

			mov			eax, dword [rbp-8]			; eax: n2
			mov			ebx, 10						; ebx: mod
			div			ebx							; eax: n2/mod, edx: n2%mod
			mov			dword [rbp-8], eax			; rbp-8: Q, rbp-20: R
			mov			dword [rbp-20], edx

			mov			eax, dword [rbp-4]			; eax: n1
			mov			ebx, dword [rbp-20]			; ebx: R_n2
			imul		eax, ebx					; n1*R_n2
			mov			dword [rbp-24], eax			; rbp-24: n1*R_n2

			mov			rdi, fmt_out				; print n1*R_n2
			mov			esi, dword [rbp-24]
			mov			rax, 0
			call		_printf
			
			mov			eax, dword [rbp-16]			; i++
			inc			eax
			mov			dword [rbp-16], eax
			jmp			_loop0_s
_loop0_f:
			mov			rdi, fmt_out				; print n1*n2
			mov			esi, dword [rbp-12]
			mov			rax, 0
			call		_printf

			add			rsp, 32
			pop			rdi

			mov			rax, 0x2000001
			mov			rdi, 0
			syscall

			section		.data
fmt_in:		db			"%d%d", 0
fmt_out:	db			"%d", 10, 0
