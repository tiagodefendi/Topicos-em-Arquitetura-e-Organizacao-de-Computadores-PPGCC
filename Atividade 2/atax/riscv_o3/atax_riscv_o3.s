	.file	"atax_minimal.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	li	a2,320
	li	a1,0
	lla	a0,.LANCHOR0
	sd	ra,8(sp)
	.cfi_offset 1, -8
	call	memset@plt
	lla	a3,.LANCHOR0+320
	mv	a0,a3
	lla	a1,A
	lla	a6,A+12800
	lla	a2,.LANCHOR0+960
	lla	a7,.LANCHOR0
.L4:
	fmv.d.x	fa4,zero
	lla	a5,.LANCHOR0+640
	mv	a4,a1
.L2:
	fld	fa3,0(a4)
	fld	fa5,0(a5)
	addi	a5,a5,8
	addi	a4,a4,8
	fmadd.d	fa4,fa3,fa5,fa4
	bne	a2,a5,.L2
	fsd	fa4,0(a0)
	lla	a5,.LANCHOR0
	mv	a4,a1
.L3:
	fld	fa3,0(a5)
	fld	fa5,0(a4)
	addi	a5,a5,8
	addi	a4,a4,8
	fmadd.d	fa5,fa4,fa5,fa3
	fsd	fa5,-8(a5)
	bne	a3,a5,.L3
	addi	a1,a1,320
	addi	a0,a0,8
	bne	a6,a1,.L4
	fld	fa4,0(a7)
	fld	fa5,320(a7)
	ld	ra,8(sp)
	.cfi_restore 1
	fcvt.w.d a5,fa4,rtz
	fcvt.w.d a0,fa5,rtz
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	addw	a0,a0,a5
	jr	ra
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	tmp
	.globl	y
	.globl	x
	.globl	A
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	y, @object
	.size	y, 320
y:
	.zero	320
	.type	tmp, @object
	.size	tmp, 320
tmp:
	.zero	320
	.type	x, @object
	.size	x, 320
x:
	.zero	320
	.type	A, @object
	.size	A, 12800
A:
	.zero	12800
	.ident	"GCC: (GNU) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
