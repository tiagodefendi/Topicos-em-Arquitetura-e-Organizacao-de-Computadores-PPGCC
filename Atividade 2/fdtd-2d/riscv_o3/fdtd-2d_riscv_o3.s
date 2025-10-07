	.file	"fdtd-2d_minimal.c"
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
	fld	fa1,.LC0,a5
	fld	fa3,.LC1,a5
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sd	s0,88(sp)
	sd	s1,80(sp)
	sd	s2,72(sp)
	sd	s3,64(sp)
	sd	s4,56(sp)
	sd	s5,48(sp)
	sd	s6,40(sp)
	sd	s7,32(sp)
	sd	s8,24(sp)
	sd	s9,16(sp)
	sd	s10,8(sp)
	sd	s11,0(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -16
	.cfi_offset 18, -24
	.cfi_offset 19, -32
	.cfi_offset 20, -40
	.cfi_offset 21, -48
	.cfi_offset 22, -56
	.cfi_offset 23, -64
	.cfi_offset 24, -72
	.cfi_offset 25, -80
	.cfi_offset 26, -88
	.cfi_offset 27, -96
	lla	t6,.LANCHOR0
	lla	s2,.LANCHOR0+160
	lla	t5,ey+320
	lla	s1,ey+12480
	lla	t2,hz+12160
	lla	s3,ey+12800
	lla	t4,hz+12800
	lla	s0,ey+12160
	lla	t0,ex+12160
	li	t3,39
	li	t1,38
.L2:
	fld	fa5,0(t6)
	lla	a2,ey+320
	lla	a5,ey
.L3:
	fsd	fa5,0(a5)
	addi	a5,a5,8
	bne	a5,t5,.L3
	lla	a3,hz+320
	mv	a4,a3
	lla	a5,ey+320
	li	a1,1
.L4:
	mv	a0,a5
	addi	s5,a0,640
	addi	a5,a5,320
	addi	s4,a4,-320
	addi	a7,a4,320
	mv	a6,a4
.L5:
	fld	fa2,0(a6)
	fld	fa4,0(s4)
	fld	fa0,0(a0)
	fld	fa5,0(a7)
	fsub.d	fa4,fa2,fa4
	addi	a5,a5,8
	fsub.d	fa5,fa5,fa2
	addi	a6,a6,8
	addi	s4,s4,8
	addi	a7,a7,8
	addi	a0,a0,8
	fnmsub.d	fa4,fa4,fa1,fa0
	fsd	fa4,-8(a0)
	fld	fa4,-8(a5)
	fnmsub.d	fa5,fa5,fa1,fa4
	fsd	fa5,-8(a5)
	bne	a5,s5,.L5
	addiw	a1,a1,2
	addi	a4,a4,640
	bne	a1,t3,.L4
	lla	a0,ey+640
	lla	a5,ey+12480
	lla	a1,hz+12480
	lla	a4,hz+12160
.L6:
	fld	fa5,0(a1)
	fld	fa2,0(a4)
	fld	fa4,0(a5)
	addi	a5,a5,8
	fsub.d	fa5,fa5,fa2
	addi	a1,a1,8
	addi	a4,a4,8
	fnmsub.d	fa5,fa5,fa1,fa4
	fsd	fa5,-8(a5)
	bne	a5,s3,.L6
	lla	a4,ex
	lla	a5,hz
.L7:
	fld	fa4,0(a5)
	addi	a1,a4,8
	addi	a6,a5,8
	li	a7,1
.L9:
	fld	fa5,0(a6)
	fld	ft0,0(a1)
	fld	fa0,8(a1)
	fsub.d	fa2,fa5,fa4
	fld	fa4,8(a6)
	addiw	a7,a7,2
	addi	a6,a6,16
	fsub.d	fa5,fa4,fa5
	addi	a1,a1,16
	fnmsub.d	fa2,fa2,fa1,ft0
	fnmsub.d	fa5,fa5,fa1,fa0
	fsd	fa2,-16(a1)
	fsd	fa5,-8(a1)
	bne	a7,t3,.L9
	fld	fa5,312(a5)
	fld	fa2,304(a5)
	fld	fa4,312(a4)
	addi	a5,a5,320
	fsub.d	fa5,fa5,fa2
	addi	a4,a4,320
	fnmsub.d	fa5,fa5,fa1,fa4
	fsd	fa5,-8(a4)
	bne	a5,t4,.L7
	lla	a5,ex+320
	lla	a1,ey
	lla	a4,hz
	li	a6,0
.L11:
	fld	fa2,0(a5)
	fld	ft1,-320(a5)
	addi	s10,a5,-320
	addi	s9,a5,-312
	addi	s8,a5,8
	mv	s7,a0
	mv	s4,a3
	mv	s6,a1
	mv	s5,a2
	mv	a7,a4
	li	s11,0
.L12:
	fld	fa4,0(s9)
	fld	ft3,0(s5)
	fld	fa5,0(s8)
	fsub.d	ft0,fa4,ft1
	fld	ft7,0(s6)
	fsub.d	fa2,fa5,fa2
	fld	fa0,0(s7)
	fld	ft5,0(a7)
	fld	ft1,8(s9)
	fld	ft2,8(s5)
	fadd.d	ft0,ft0,ft3
	fsub.d	fa4,ft1,fa4
	fadd.d	fa0,fa2,fa0
	fld	fa2,8(s8)
	fld	ft4,8(s6)
	fld	ft6,8(s7)
	fsub.d	fa5,fa2,fa5
	fsub.d	ft0,ft0,ft7
	fadd.d	fa4,fa4,ft2
	fsub.d	fa0,fa0,ft3
	addiw	s11,s11,2
	addi	s9,s9,16
	addi	s5,s5,16
	fadd.d	fa5,fa5,ft6
	fnmsub.d	ft0,ft0,fa3,ft5
	fsub.d	fa4,fa4,ft4
	addi	s6,s6,16
	addi	s8,s8,16
	addi	s7,s7,16
	addi	a7,a7,16
	fsub.d	fa5,fa5,ft2
	fsd	ft0,-16(a7)
	fld	ft0,0(s4)
	addi	s4,s4,16
	fnmsub.d	fa0,fa0,fa3,ft0
	fsd	fa0,-16(s4)
	fld	fa0,-8(a7)
	fnmsub.d	fa4,fa4,fa3,fa0
	fsd	fa4,-8(a7)
	fld	fa4,-8(s4)
	fnmsub.d	fa5,fa5,fa3,fa4
	fsd	fa5,-8(s4)
	bne	s11,t1,.L12
	fld	fa4,-8(a5)
	fld	fa0,304(s10)
	fld	fa2,304(a2)
	fld	fa5,312(a5)
	fsub.d	fa4,fa4,fa0
	fld	fa0,304(a5)
	fld	ft0,304(a1)
	fld	ft1,304(a0)
	fsub.d	fa5,fa5,fa0
	fld	fa0,304(a4)
	addiw	a6,a6,2
	fadd.d	fa4,fa4,fa2
	addi	a2,a2,640
	addi	a1,a1,640
	addi	a5,a5,640
	fadd.d	fa5,fa5,ft1
	addi	a0,a0,640
	addi	a4,a4,640
	fsub.d	fa4,fa4,ft0
	addi	a3,a3,640
	fsub.d	fa5,fa5,fa2
	fnmsub.d	fa4,fa4,fa3,fa0
	fsd	fa4,-336(a4)
	fld	fa4,-336(a3)
	fnmsub.d	fa5,fa5,fa3,fa4
	fsd	fa5,-336(a3)
	bne	a6,t1,.L11
	fld	fa2,0(t0)
	lla	a5,hz+12160
	lla	a2,ey+12160
	lla	a3,ey+12480
	lla	a4,ex+12168
	li	a1,0
.L13:
	fld	fa5,0(a4)
	fld	ft4,0(a3)
	fld	ft3,8(a3)
	fsub.d	fa4,fa5,fa2
	fld	fa2,8(a4)
	fld	ft2,0(a2)
	fld	ft1,8(a2)
	fsub.d	fa5,fa2,fa5
	fld	ft0,0(a5)
	fld	fa0,8(a5)
	fadd.d	fa4,fa4,ft4
	addiw	a1,a1,2
	addi	a4,a4,16
	addi	a3,a3,16
	fadd.d	fa5,fa5,ft3
	addi	a2,a2,16
	addi	a5,a5,16
	fsub.d	fa4,fa4,ft2
	fsub.d	fa5,fa5,ft1
	fnmsub.d	fa4,fa4,fa3,ft0
	fnmsub.d	fa5,fa5,fa3,fa0
	fsd	fa4,-16(a5)
	fsd	fa5,-8(a5)
	bne	a1,t1,.L13
	fld	fa4,304(t0)
	fld	fa5,312(t0)
	fld	fa0,304(s1)
	fld	fa2,304(s0)
	fsub.d	fa5,fa5,fa4
	fld	fa4,304(t2)
	addi	t6,t6,8
	fadd.d	fa5,fa5,fa0
	fsub.d	fa5,fa5,fa2
	fnmsub.d	fa5,fa5,fa3,fa4
	fsd	fa5,304(t2)
	bne	t6,s2,.L2
	fld	fa5,hz,a5
	ld	s0,88(sp)
	.cfi_restore 8
	ld	s1,80(sp)
	.cfi_restore 9
	ld	s2,72(sp)
	.cfi_restore 18
	ld	s3,64(sp)
	.cfi_restore 19
	ld	s4,56(sp)
	.cfi_restore 20
	ld	s5,48(sp)
	.cfi_restore 21
	ld	s6,40(sp)
	.cfi_restore 22
	ld	s7,32(sp)
	.cfi_restore 23
	ld	s8,24(sp)
	.cfi_restore 24
	ld	s9,16(sp)
	.cfi_restore 25
	ld	s10,8(sp)
	.cfi_restore 26
	ld	s11,0(sp)
	.cfi_restore 27
	fcvt.w.d a0,fa5,rtz
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	_fict_
	.globl	hz
	.globl	ey
	.globl	ex
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	0
	.word	1071644672
	.align	3
.LC1:
	.word	1717986918
	.word	1072064102
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_fict_, @object
	.size	_fict_, 160
_fict_:
	.zero	160
	.type	hz, @object
	.size	hz, 12800
hz:
	.zero	12800
	.type	ey, @object
	.size	ey, 12800
ey:
	.zero	12800
	.type	ex, @object
	.size	ex, 12800
ex:
	.zero	12800
	.ident	"GCC: (GNU) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
