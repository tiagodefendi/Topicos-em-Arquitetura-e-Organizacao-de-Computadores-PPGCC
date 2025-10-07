	.file	"atax_minimal.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	kernel_atax, @function
kernel_atax:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-80
	.cfi_def_cfa_offset 80
	sd	ra,72(sp)
	sd	s0,64(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,80
	.cfi_def_cfa 8, 0
	sd	a2,-48(s0)
	sd	a3,-56(s0)
	sd	a4,-64(s0)
	sd	a5,-72(s0)
	mv	a5,a0
	sw	a5,-36(s0)
	mv	a5,a1
	sw	a5,-40(s0)
	sw	zero,-20(s0)
	j	.L2
.L3:
	lw	a5,-20(s0)
	slli	a5,a5,3
	ld	a4,-64(s0)
	add	a5,a4,a5
	sd	zero,0(a5)
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L3
	sw	zero,-20(s0)
	j	.L4
.L9:
	lw	a5,-20(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	sd	zero,0(a5)
	sw	zero,-24(s0)
	j	.L5
.L6:
	lw	a5,-20(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	fld	fa4,0(a5)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-48(s0)
	add	a4,a5,a4
	lw	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa3,0(a5)
	lw	a5,-24(s0)
	slli	a5,a5,3
	ld	a4,-56(s0)
	add	a5,a4,a5
	fld	fa5,0(a5)
	fmul.d	fa5,fa3,fa5
	lw	a5,-20(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	fadd.d	fa5,fa4,fa5
	fsd	fa5,0(a5)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L5:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L6
	sw	zero,-24(s0)
	j	.L7
.L8:
	lw	a5,-24(s0)
	slli	a5,a5,3
	ld	a4,-64(s0)
	add	a5,a4,a5
	fld	fa4,0(a5)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-48(s0)
	add	a4,a5,a4
	lw	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa3,0(a5)
	lw	a5,-20(s0)
	slli	a5,a5,3
	ld	a4,-72(s0)
	add	a5,a4,a5
	fld	fa5,0(a5)
	fmul.d	fa5,fa3,fa5
	lw	a5,-24(s0)
	slli	a5,a5,3
	ld	a4,-64(s0)
	add	a5,a4,a5
	fadd.d	fa5,fa4,fa5
	fsd	fa5,0(a5)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L7:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L8
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L4:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L9
	nop
	nop
	ld	ra,72(sp)
	.cfi_restore 1
	ld	s0,64(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 80
	addi	sp,sp,80
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	kernel_atax, .-kernel_atax
	.globl	A
	.bss
	.align	3
	.type	A, @object
	.size	A, 12800
A:
	.zero	12800
	.globl	x
	.align	3
	.type	x, @object
	.size	x, 320
x:
	.zero	320
	.globl	y
	.align	3
	.type	y, @object
	.size	y, 320
y:
	.zero	320
	.globl	tmp
	.align	3
	.type	tmp, @object
	.size	tmp, 320
tmp:
	.zero	320
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sd	ra,8(sp)
	sd	s0,0(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	lla	a5,tmp
	lla	a4,y
	lla	a3,x
	lla	a2,A
	li	a1,40
	li	a0,40
	call	kernel_atax
	lla	a5,y
	fld	fa5,0(a5)
	fcvt.w.d a5,fa5,rtz
	sext.w	a4,a5
	lla	a5,tmp
	fld	fa5,0(a5)
	fcvt.w.d a5,fa5,rtz
	sext.w	a5,a5
	addw	a5,a4,a5
	sext.w	a5,a5
	mv	a0,a5
	ld	ra,8(sp)
	.cfi_restore 1
	ld	s0,0(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (GNU) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
