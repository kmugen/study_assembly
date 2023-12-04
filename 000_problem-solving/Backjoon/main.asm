bits 64
global _main
extern _scanf
extern _printf

section .text
_main:

push rbp
mov rbp, rsp
sub rsp, 16

mov rdi, fmt_in
lea rsi, [rbp-4]
mov rax, 0
call _scanf

_lbb0_1:
mov eax, dword [rbp-4]

_lbb0_2:
_lbb0_3:
_lbb0_4:

add rsp, 16
pop rbp

section .data
fmt_in: db "%d",0
fmt_out: db "%d",10,0
