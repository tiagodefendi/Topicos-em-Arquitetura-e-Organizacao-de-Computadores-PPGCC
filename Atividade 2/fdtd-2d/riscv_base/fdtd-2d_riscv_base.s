	.file	"fdtd-2d_minimal.c"
	.option pic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	kernel_fdtd_2d, @function
kernel_fdtd_2d:
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
	sd	a3,-56(s0)
	sd	a4,-64(s0)
	sd	a5,-72(s0)
	sd	a6,-80(s0)
	mv	a5,a0
	sw	a5,-36(s0)
	mv	a5,a1
	sw	a5,-40(s0)
	mv	a5,a2
	sw	a5,-44(s0)
	sw	zero,-20(s0)
	j	.L2
.L17:
	sw	zero,-28(s0)
	j	.L3
.L4:
	lw	a5,-20(s0)
	slli	a5,a5,3
	ld	a4,-80(s0)
	add	a5,a4,a5
	fld	fa5,0(a5)
	ld	a4,-64(s0)
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fsd	fa5,0(a5)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L3:
	lw	a5,-28(s0)
	mv	a4,a5
	lw	a5,-44(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L4
	li	a5,1
	sw	a5,-24(s0)
	j	.L5
.L8:
	sw	zero,-28(s0)
	j	.L6
.L7:
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-64(s0)
	add	a4,a5,a4
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa4,0(a5)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-72(s0)
	add	a4,a5,a4
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa3,0(a5)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	addi	a5,a5,-320
	ld	a4,-72(s0)
	add	a4,a4,a5
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	fsub.d	fa3,fa3,fa5
	lla	a5,.LC0
	fld	fa5,0(a5)
	fmul.d	fa5,fa3,fa5
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-64(s0)
	add	a4,a5,a4
	fsub.d	fa5,fa4,fa5
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fsd	fa5,0(a5)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L6:
	lw	a5,-28(s0)
	mv	a4,a5
	lw	a5,-44(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L7
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L5:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L8
	sw	zero,-24(s0)
	j	.L9
.L12:
	li	a5,1
	sw	a5,-28(s0)
	j	.L10
.L11:
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-56(s0)
	add	a4,a5,a4
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa4,0(a5)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-72(s0)
	add	a4,a5,a4
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa3,0(a5)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-72(s0)
	add	a4,a5,a4
	lw	a5,-28(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	fsub.d	fa3,fa3,fa5
	lla	a5,.LC0
	fld	fa5,0(a5)
	fmul.d	fa5,fa3,fa5
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-56(s0)
	add	a4,a5,a4
	fsub.d	fa5,fa4,fa5
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fsd	fa5,0(a5)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L10:
	lw	a5,-28(s0)
	mv	a4,a5
	lw	a5,-44(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L11
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L9:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-40(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L12
	sw	zero,-24(s0)
	j	.L13
.L16:
	sw	zero,-28(s0)
	j	.L14
.L15:
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-72(s0)
	add	a4,a5,a4
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa4,0(a5)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-56(s0)
	add	a4,a5,a4
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sext.w	a5,a5
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa3,0(a5)
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-56(s0)
	add	a4,a5,a4
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	fsub.d	fa3,fa3,fa5
	lw	a5,-24(s0)
	addi	a4,a5,1
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-64(s0)
	add	a4,a5,a4
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	fadd.d	fa3,fa3,fa5
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-64(s0)
	add	a4,a5,a4
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fld	fa5,0(a5)
	fsub.d	fa3,fa3,fa5
	lla	a5,.LC1
	fld	fa5,0(a5)
	fmul.d	fa5,fa3,fa5
	lw	a4,-24(s0)
	mv	a5,a4
	slli	a5,a5,2
	add	a5,a5,a4
	slli	a5,a5,6
	mv	a4,a5
	ld	a5,-72(s0)
	add	a4,a5,a4
	fsub.d	fa5,fa4,fa5
	lw	a5,-28(s0)
	slli	a5,a5,3
	add	a5,a4,a5
	fsd	fa5,0(a5)
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L14:
	lw	a5,-44(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	lw	a4,-28(s0)
	sext.w	a4,a4
	blt	a4,a5,.L15
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L13:
	lw	a5,-40(s0)
	addiw	a5,a5,-1
	sext.w	a5,a5
	lw	a4,-24(s0)
	sext.w	a4,a4
	blt	a4,a5,.L16
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a5,-20(s0)
	mv	a4,a5
	lw	a5,-36(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L17
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
	.size	kernel_fdtd_2d, .-kernel_fdtd_2d
	.globl	ex
	.bss
	.align	3
	.type	ex, @object
	.size	ex, 12800
ex:
	.zero	12800
	.globl	ey
	.align	3
	.type	ey, @object
	.size	ey, 12800
ey:
	.zero	12800
	.globl	hz
	.align	3
	.type	hz, @object
	.size	hz, 12800
hz:
	.zero	12800
	.globl	_fict_
	.align	3
	.type	_fict_, @object
	.size	_fict_, 160
_fict_:
	.zero	160
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
	lla	a6,_fict_
	lla	a5,hz
	lla	a4,ey
	lla	a3,ex
	li	a2,40
	li	a1,40
	li	a0,20
	call	kernel_fdtd_2d
	lla	a5,hz
	fld	fa5,0(a5)
	fcvt.w.d a5,fa5,rtz
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
	.section	.rodata
	.align	3
.LC0:
	.word	0
	.word	1071644672
	.align	3
.LC1:
	.word	1717986918
	.word	1072064102
	.ident	"GCC: (GNU) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
