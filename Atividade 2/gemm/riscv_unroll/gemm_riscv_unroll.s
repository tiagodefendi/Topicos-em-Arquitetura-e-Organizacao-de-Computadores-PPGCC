	.file	"gemm_minimal.c"
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
	fld	ft2,.LC0,a5
	fld	fa4,.LC1,a5
	li	a0,-12288
	addi	t0,a0,-512
	lla	a1,A
	lla	t1,C
	lla	t3,A+12800
	lla	a6,B+13120
.L2:
	lla	a3,B+12800
	mv	a5,t1
.L4:
	fld	fa5,0(a5)
	add	t2,a3,t0
	mv	a2,a1
	fmul.d	fa1,fa5,ft2
	fsd	fa1,0(a5)
.L3:
	fld	fa3,0(a2)
	fld	fa2,0(t2)
	fld	ft1,8(a2)
	fmul.d	ft4,fa3,fa4
	fld	ft3,320(t2)
	fmul.d	fa6,ft1,fa4
	fld	ft0,16(a2)
	fld	ft7,640(t2)
	fld	fa0,24(a2)
	fmul.d	fa7,ft0,fa4
	fmadd.d	ft8,ft4,fa2,fa1
	fmul.d	ft9,fa0,fa4
	fld	ft6,960(t2)
	fld	fa1,32(a2)
	fld	ft5,1280(t2)
	fld	ft10,40(a2)
	fmul.d	ft11,fa1,fa4
	fmadd.d	ft1,fa6,ft3,ft8
	fmul.d	fa2,ft10,fa4
	fld	ft4,1600(t2)
	fld	fa3,48(a2)
	fld	ft3,1920(t2)
	fld	fa5,56(a2)
	fmul.d	fa6,fa3,fa4
	fmadd.d	ft0,fa7,ft7,ft1
	fmul.d	ft7,fa5,fa4
	addi	a7,t2,320
	fld	fa7,1920(a7)
	addi	a4,t2,2047
	addi	t2,a4,513
	addi	a2,a2,64
	fmadd.d	fa0,ft9,ft6,ft0
	fmadd.d	ft8,ft11,ft5,fa0
	fmadd.d	ft9,fa2,ft4,ft8
	fmadd.d	ft6,fa6,ft3,ft9
	fmadd.d	fa1,ft7,fa7,ft6
	bne	a3,t2,.L3
	fsd	fa1,0(a5)
	addi	a3,a3,8
	addi	a5,a5,8
	bne	a6,a3,.L4
	addi	a1,a1,320
	addi	t1,t1,320
	bne	t3,a1,.L2
	fld	ft2,C,a5
	fcvt.w.d a0,ft2,rtz
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	B
	.globl	A
	.globl	C
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	858993459
	.word	1072902963
	.align	3
.LC1:
	.word	0
	.word	1073217536
	.bss
	.align	3
	.type	B, @object
	.size	B, 12800
B:
	.zero	12800
	.type	A, @object
	.size	A, 12800
A:
	.zero	12800
	.type	C, @object
	.size	C, 12800
C:
	.zero	12800
	.ident	"GCC: (GNU) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
