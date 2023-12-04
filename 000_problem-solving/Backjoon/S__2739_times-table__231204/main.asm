			bits		64
			global		_main
			extern		_scanf
			extern		_printf

			section		.text
_main:
			push		rbp
			mov			rbp, rsp
			sub			rsp, 16

			mov			dword [rbp-4], 0

			mov			dword [rbp-8], 0

			mov			rdi, _l_str_1
			lea			rsi, [rbp-8]
			mov			rax, 0
			call		_scanf
			
			mov			dword [rbp-12], 1
			
			jmp			_lbb0_1
_lbb0_1:
			mov			eax, dword [rbp-12]
			cmp			eax, 9
			jg			_lbb0_4
			
			jmp			_lbb0_2
_lbb0_2:
			mov			rdi, _l_str_2
			mov			esi, dword [rbp-8]
			mov			edx, dword [rbp-12]
			mov			ecx, dword [rbp-8]
			imul		ecx, dword [rbp-12]
			mov			rax, 0
			call		_printf
			jmp			_lbb0_3
_lbb0_3:
			mov			eax, dword [rbp-12]
			add			eax, 1
			mov			dword [rbp-12], eax
			jmp			_lbb0_1
_lbb0_4:
			mov			rax, 0x2000001
			mov			rdi, 0
			syscall
						
			section		.data
_l_str_1	db			"%d", 0
_l_str_2	db			"%d * %d = %d",10, 0
