;#include <stdio.h>
;
;int main() {
;    int var1, var2;
;    int sum, difference, product, quotient, remainder;
;
;    scanf("%d %d", &var1, &var2);
;
;    sum = var1 + var2;
;    difference = var1 - var2;
;    product = var1 * var2;
;    quotient = var1 / var2;
;    remainder = var1 % var2;
;
;    printf("%d\n%d\n%d\n%d\n%d\n", sum, difference, product, quotient, remainder);
;
;    return 0;
;}

			bits		64
			global		_main
			extern		_scanf
			extern		_printf

			section		.text
_main:
			push		rbp
			mov			rbp, rsp
			sub			rsp, 32

			mov			rdi, fmt_in
			lea			rsi, [rbp-4]
			lea			rdx, [rbp-8]
			mov			rax, 0
			call		_scanf

			mov			eax, dword [rbp-4]
			add			eax, dword [rbp-8]
			mov			dword [rbp-12], eax

			mov			eax, dword [rbp-4]
			sub			eax, dword [rbp-8]
			mov			dword [rbp-16], eax

			mov			eax, dword [rbp-4]
			imul		eax, dword [rbp-8]
			mov			dword [rbp-20], eax

			mov			eax, dword [rbp-4]
			mov			ebx, dword [rbp-8]
			mov			edx, 0
			div			ebx
			mov			dword [rbp-24], eax
			mov			dword [rbp-28], edx

			mov			rdi, fmt_out
			mov			esi, dword [rbp-12]
			mov			edx, dword [rbp-16]
			mov			ecx, dword [rbp-20]
			mov			r8d, dword [rbp-24]
			mov			r9d, dword [rbp-28]
			mov			rax, 0
			call		_printf

			add			rsp, 32
			pop			rbp
			ret

			section		.data
fmt_in:		db			"%d%d", 0
fmt_out:	db			"%d", 10, "%d", 10, "%d", 10, "%d", 10, "%d", 10, 0
