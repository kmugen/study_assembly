bits 64
			global		_main
			extern		_printf
			extern		_scanf
		
			section		.text
_main:                                   
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        
        mov		rdi, fmt_1
       	lea     rsi, [rbp-4]
        lea     rdx, [rbp-8]
        mov     al, 0
        call    _scanf
        
		mov		rax, 0
        mov		eax, [rbp-4]
        sub		eax, [rbp-8]
        
        mov		rdi, fmt_2
        mov		rsi, rax
        call	_printf
        add     rsp, 16
        pop     rbp
        ret
        
			section		.data
fmt_1:      db			"%d %d", 0
fmt_2:		db			"%d", 10, 0
