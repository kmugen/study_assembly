;	#include<stdio.h>
;
;	int main() {
;		int n1, n2;
;		scanf("%d%d",n1,n2);
;		int ans;
;		ans=n1-n2;
;		printf("%d",ans);
;		return 0;
;	}

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
			mov			al, 0
			call		_scanf

			mov			rax, 0
			mov			eax, dword [rbp-4]
			sub			eax, dword [rbp-8]
			mov			dword [rbp-12], eax

			mov			eax, dword [rbp-12]
			mov			rdi, fmt_out
			mov			rsi, rax
			call		_printf

			add			rsp, 16
			pop			rbp
			ret
			
			section		.data
fmt_in:		db			"%d %d", 0
fmt_out:	db			"%d", 10, 0
