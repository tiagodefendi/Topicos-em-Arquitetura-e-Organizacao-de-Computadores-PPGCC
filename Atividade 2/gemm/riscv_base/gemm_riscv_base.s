	.file	"gemm_minimal.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	kernel_gemm, @function
kernel_gemm:
.LFB0:
	.cfi_startproc
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	ra,88(sp)
	sd	s0,80(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,96
	.cfi_def_cfa 8, 0
	fsd	fa0,-56(s0)
	fsd	fa1,-64(s0)
	sd	a3,-72(s0)
	sd	a4,-80(s0)
	sd	a5,-88(s0)
	mv	a5,a0
	sw	a5,-36(s0)
	mv	a5,a1
	sw	a5,-40(s0)
	mv	a5,a2
	sw	a5,-44(s0)
	sw	zero,-20(s0)
	j	.L2
.L7:
	sw	zero,-24(s0)
	j	.L3
.L6:
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-72(s0)
	add	a4,a5,a4
	lw	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa4,0(a5)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-72(s0)
	add	a4,a5,a4
	fld	fa5,-64(s0)
	fmul.d	fa5,fa4,fa5
	lw	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fsd	fa5,0(a5)
	sw	zero,-28(s0)
	j	.L4
.L5:
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-72(s0)
	add	a4,a5,a4
	lw	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa4,0(a5)
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-80(s0)
	add	a4,a5,a4
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa3,0(a5)
	fld	fa5,-56(s0)
	fmul.d	fa3,fa3,fa5
	lw	a4,-28(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-88(s0)
	add	a4,a5,a4
	lw	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	fmul.d	fa5,fa3,fa5
	lw	a4,-20(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-72(s0)
	add	a4,a5,a4
	fadd.d	fa5,fa4,fa5
	lw	a5,-24(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fsd	fa5,0(a5)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L4:
	lw	a5,-28(s0)
	mv	a4,a5
	lw	a5,-44(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L5
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L3:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L6
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L7
	nop
	nop
	ld	ra,88(sp)
	.cfi_restore 1
	ld	s0,80(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 96
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE0:
	.size	kernel_gemm, .-kernel_gemm
	.globl	C
	.bss
	.align	3
	.type	C, @object
	.size	C, 12800
C:
	.zero	12800
	.globl	A
	.align	3
	.type	A, @object
	.size	A, 12800
A:
	.zero	12800
	.globl	B
	.align	3
	.type	B, @object
	.size	B, 12800
B:
	.zero	12800
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sd	ra,24(sp)
	sd	s0,16(sp)
	.cfi_offset 1, -8
	.cfi_offset 8, -16
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	lla	a5,.LC0
	fld	fa5,0(a5)
	fsd	fa5,-24(s0)
	lla	a5,.LC1
	fld	fa5,0(a5)
	fsd	fa5,-32(s0)
	lla	a5,B
	lla	a4,A
	lla	a3,C
	fld	fa1,-32(s0)
	fld	fa0,-24(s0)
	li	a2,40
	li	a1,40
	li	a0,40
	call	kernel_gemm
	lla	a5,C
	fld	fa5,0(a5)
	fcvt.w.d a5,fa5,rtz
	sext.w	a5,a5
	mv	a0,a5
	ld	ra,24(sp)
	.cfi_restore 1
	ld	s0,16(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.section	.rodata
	.align	3
.LC0:
	.word	0
	.word	1073217536
	.align	3
.LC1:
	.word	858993459
	.word	1072902963
	.ident	"GCC: (GNU) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
