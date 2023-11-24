;#include <stdio.h>
;
;int main() {
;    double var1, var2, result;
;
;    scanf("%lf %lf", &var1, &var2);
;
;    result = var1 / var2;
;
;    printf("%.9lf\n", result);
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
			lea			rsi, [rbp-8]
			lea			rdx, [rbp-16]₩
			mov			rax, 0
			call		_scanf

			movsd		xmm0, qword [rbp-8]
			divsd		xmm0, qword [rbp-16]
			movsd		qword [rbp-24], xmm0

			mov			rdi, fmt_out
			movsd		xmm0, qword [rbp-24]
			mov			rax, rax
			call		_printf

			add			rsp, 16
			pop			rbp
			ret
					

			section		.data
fmt_in:		db			"%lf%lf", 0
fmt_out:	db			"%.9lf", 10, 0
