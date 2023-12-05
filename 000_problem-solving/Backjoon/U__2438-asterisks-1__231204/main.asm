 			bits		64
			global		_main
			extern		_scanf
			extern		_printf

			section		.text
_main:
			push		rbp
			mov			rbp, rsp
			sub			rsp, 16

			
			mov			rdi, _l_str_1
			lea			rsi, [rbp-4]
			mov			rax, 0
			call		_scanf

			mov			rdi, _l_str
			mov			esi, dword [rbp-4]
			mov			rax, 0
			call		_printf

			add			rsp, 16
			pop			rbp
			
			section		.data
_l_str_1:	db			"%d", 0
_l_str:		db			"%d\n",0
_l_str_2:	db			"*", 0
_l_str_3:	db			"", 10, 0
