	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	mov	x9, sp
	sub	x8, x29, #8
	str	x8, [x9]
	sub	x8, x29, #12
	str	x8, [x9, #8]
	sub	x8, x29, #16
	str	x8, [x9, #16]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_scanf
	ldur	w8, [x29, #-8]
	ldur	w9, [x29, #-12]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB0_3
	b	LBB0_1
LBB0_1:
	ldur	w8, [x29, #-8]
	ldur	w9, [x29, #-16]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB0_3
	b	LBB0_2
LBB0_2:
	ldur	w8, [x29, #-8]
	mov	w9, #1000
	mul	w9, w8, w9
	mov	w8, #10000
	add	w8, w8, w9
	stur	w8, [x29, #-20]
	b	LBB0_17
LBB0_3:
	ldur	w8, [x29, #-8]
	ldur	w9, [x29, #-12]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB0_5
	b	LBB0_4
LBB0_4:
	ldur	w8, [x29, #-8]
	mov	w9, #100
	mul	w8, w8, w9
	add	w8, w8, #1000
	stur	w8, [x29, #-20]
	b	LBB0_16
LBB0_5:
	ldur	w8, [x29, #-8]
	ldur	w9, [x29, #-16]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB0_7
	b	LBB0_6
LBB0_6:
	ldur	w8, [x29, #-8]
	mov	w9, #100
	mul	w8, w8, w9
	add	w8, w8, #1000
	stur	w8, [x29, #-20]
	b	LBB0_15
LBB0_7:
	ldur	w8, [x29, #-12]
	ldur	w9, [x29, #-16]
	subs	w8, w8, w9
	cset	w8, ne
	tbnz	w8, #0, LBB0_9
	b	LBB0_8
LBB0_8:
	ldur	w8, [x29, #-12]
	mov	w9, #100
	mul	w8, w8, w9
	add	w8, w8, #1000
	stur	w8, [x29, #-20]
	b	LBB0_14
LBB0_9:
	ldur	w8, [x29, #-8]
	str	w8, [sp, #24]
	ldr	w8, [sp, #24]
	ldur	w9, [x29, #-12]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_11
	b	LBB0_10
LBB0_10:
	ldur	w8, [x29, #-12]
	str	w8, [sp, #24]
	b	LBB0_11
LBB0_11:
	ldr	w8, [sp, #24]
	ldur	w9, [x29, #-16]
	subs	w8, w8, w9
	cset	w8, ge
	tbnz	w8, #0, LBB0_13
	b	LBB0_12
LBB0_12:
	ldur	w8, [x29, #-16]
	str	w8, [sp, #24]
	b	LBB0_13
LBB0_13:
	ldr	w8, [sp, #24]
	mov	w9, #100
	mul	w8, w8, w9
	stur	w8, [x29, #-20]
	b	LBB0_14
LBB0_14:
	b	LBB0_15
LBB0_15:
	b	LBB0_16
LBB0_16:
	b	LBB0_17
LBB0_17:
	ldur	w9, [x29, #-20]
                                        ; implicit-def: $x8
	mov	x8, x9
	mov	x9, sp
	str	x8, [x9]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_printf
	mov	w0, #0
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"%d%d%d"

l_.str.1:                               ; @.str.1
	.asciz	"%d\n"

.subsections_via_symbols
