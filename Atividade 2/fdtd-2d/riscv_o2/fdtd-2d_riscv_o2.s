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
	fld	fa3,.LC0,a5
	fld	ft0,.LC1,a5
	lla	t6,.LANCHOR0
	lla	t0,.LANCHOR0+160
	lla	t5,hz+12800
	lla	t4,ey+320
	lla	t3,hz+12480
	lla	t1,hz+12808
.L2:
	fld	fa5,0(t6)
	lla	a5,ey
	lla	a2,ey+320
.L3:
	fsd	fa5,0(a5)
	addi	a5,a5,8
	bne	a5,t4,.L3
	lla	a4,hz
	lla	a3,hz+320
	lla	a5,ey+320
.L4:
	addi	a6,a5,320
	addi	a0,a3,-320
	mv	a1,a3
.L5:
	fld	fa5,0(a1)
	fld	fa2,0(a0)
	fld	fa4,0(a5)
	addi	a5,a5,8
	fsub.d	fa5,fa5,fa2
	addi	a1,a1,8
	addi	a0,a0,8
	fnmsub.d	fa5,fa5,fa3,fa4
	fsd	fa5,-8(a5)
	bne	a5,a6,.L5
	addi	a3,a3,320
	bne	a3,t5,.L4
	lla	a3,ex+8
	mv	a1,a3
	lla	a5,hz+8
.L8:
	fld	fa5,-8(a5)
	mv	a6,a5
	mv	a0,a1
	addi	a7,a1,312
.L7:
	fmv.d	fa4,fa5
	fld	fa5,0(a6)
	fld	fa2,0(a0)
	addi	a0,a0,8
	fsub.d	fa4,fa5,fa4
	addi	a6,a6,8
	fnmsub.d	fa4,fa4,fa3,fa2
	fsd	fa4,-8(a0)
	bne	a7,a0,.L7
	addi	a5,a5,320
	addi	a1,a1,320
	bne	t1,a5,.L8
.L9:
	fld	fa4,-8(a3)
	addi	a6,a2,-320
	mv	a0,a2
	mv	a1,a3
	mv	a5,a4
	addi	a7,a4,312
.L10:
	fmv.d	fa5,fa4
	fld	fa4,0(a1)
	fld	fa0,0(a0)
	fld	fa1,0(a6)
	fsub.d	fa5,fa4,fa5
	fld	fa2,0(a5)
	addi	a5,a5,8
	addi	a1,a1,8
	addi	a0,a0,8
	addi	a6,a6,8
	fadd.d	fa5,fa5,fa0
	fsub.d	fa5,fa5,fa1
	fnmsub.d	fa5,fa5,ft0,fa2
	fsd	fa5,-8(a5)
	bne	a7,a5,.L10
	addi	a4,a4,320
	addi	a3,a3,320
	addi	a2,a2,320
	bne	t3,a4,.L9
	addi	t6,t6,8
	bne	t6,t0,.L2
	fld	fa5,hz,a5
	fcvt.w.d a0,fa5,rtz
	ret
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
