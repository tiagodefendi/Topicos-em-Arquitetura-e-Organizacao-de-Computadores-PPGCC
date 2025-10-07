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
	fld	fa3,.LC0,a5
	fld	fa1,.LC1,a5
	li	a0,-12288
	addi	a0,a0,-512
	lla	a1,A
	lla	a7,C
	lla	t1,A+12800
	lla	a6,B+13120
.L2:
	lla	a4,B+12800
	mv	a5,a7
.L4:
	fld	fa5,0(a5)
	add	a3,a4,a0
	mv	a2,a1
	fmul.d	fa5,fa5,fa3
	fsd	fa5,0(a5)
.L3:
	fld	fa4,0(a2)
	fld	fa2,0(a3)
	addi	a3,a3,320
	fmul.d	fa4,fa4,fa1
	addi	a2,a2,8
	fmadd.d	fa5,fa4,fa2,fa5
	bne	a4,a3,.L3
	fsd	fa5,0(a5)
	addi	a4,a4,8
	addi	a5,a5,8
	bne	a6,a4,.L4
	addi	a1,a1,320
	addi	a7,a7,320
	bne	t1,a1,.L2
	fld	fa5,C,a5
	fcvt.w.d a0,fa5,rtz
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
