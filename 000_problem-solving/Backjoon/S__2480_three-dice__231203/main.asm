bits 64
global _main
extern _scanf
extern _printf
section .text
_main:
push rbp
mov	rbp, rsp
sub rsp,32

mov rdi, str0
lea rsi, [rbp-4]
lea rdx, [rbp-8]
lea rcx, [rbp-12]
mov rax, 0
call _scanf

mov eax, dword [rbp-4]
cmp eax, dword [rbp-8]
jne	_LBB0_3

jmp _lbb0_1
_lbb0_1:
mov eax, dword [rbp-4]
cmp eax, dword [rbp-12]
jne _LBB0_3

jmp _lbb0_2
_lbb0_2:
mov eax, dword [rbp-4];
imul eax, 1000
add eax, 10000
mov dword [rbp-16], eax
jmp _lbb0_17

_LBB0_3:
mov eax, dword [rbp-4]
cmp eax, dword [rbp-8]
jne _lbb0_5

jmp _lbb0_4
_lbb0_4:
mov eax, dword [rbp-4]
imul eax, 100
add eax, 1000
mov dword [rbp-16], eax
jmp _lbb0_16

_lbb0_5:
mov eax, dword [rbp-4]
cmp eax, dword [rbp-12]
jne _lbb0_7

jmp _lbb0_6
_lbb0_6:
mov eax, dword [rbp-4]
imul eax, 100
add eax, 1000
mov dword [rbp-16], eax
jmp _lbb0_15

_lbb0_7:
mov eax, dword [rbp-8]
cmp eax, dword [rbp-12]
jne _lbb0_9

jmp _lbb0_8
_lbb0_8:
mov eax, dword [rbp-8]
imul eax, 100
add eax, 1000
mov dword [rbp-16], eax
jmp _lbb0_14

_lbb0_9:
mov eax, dword [rbp-4]
mov dword [rbp-20], eax
mov eax, dword [rbp-20]
cmp eax, dword [rbp-8]
jge _lbb0_11

jmp _lbb0_10
_lbb0_10:
mov eax, dword [rbp-8]
mov dword [rbp-20], eax

jmp _lbb0_11
_lbb0_11:
mov eax, dword [rbp-20]
cmp eax, dword [rbp-12]
jge _lbb0_13

jmp _lbb0_12
_lbb0_12:
mov eax, dword [rbp-12]
mov dword [rbp-20], eax
jmp _lbb0_13

_lbb0_13:
mov eax, dword [rbp-20]
imul eax, 100
mov dword [rbp-16], eax

jmp _lbb0_14
_lbb0_14:

jmp _lbb0_15
_lbb0_15:

jmp _lbb0_16
_lbb0_16:

jmp _lbb0_17
_lbb0_17:

mov rdi, str1
mov esi, dword [rbp-16]
mov rax, 0
call _printf

add rsp, 32
pop rbp

mov rax, 0x2000001
mov rdi, 0
syscall





section .data
str0 db "%d%d%d", 0
str1 db "%d", 10, 0
