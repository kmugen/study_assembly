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
lea rdx, [rbp-8]
mov rax, 0
call _scanf

mov rdi, fmt_out
mov esi, dword [rbp-4]
mov rax, 0
call _printf

mov rdi, fmt_out
mov esi, dword [rbp-8]
mov rax, 0
call _printf

add rsp, 16
pop rbp

section .data
fmt_in: db "%d%d",0
fmt_out: db "%d",10,0
