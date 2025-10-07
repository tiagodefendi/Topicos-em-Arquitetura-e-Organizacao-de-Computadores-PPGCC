	.file	"gemm_minimal.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	movsd	.LC2(%rip), %xmm4
	leaq	A(%rip), %rdi
	movsd	.LC0(%rip), %xmm2
	leaq	C(%rip), %r10
	leaq	12800(%rdi), %r11
	leaq	320+B(%rip), %r9
	unpcklpd	%xmm4, %xmm4
	.p2align 4
	.p2align 3
.L2:
	leaq	B(%rip), %rdx
	movq	%r10, %rax
	.p2align 4
	.p2align 3
.L4:
	movsd	(%rax), %xmm0
	movq	%rdi, %rsi
	movq	%rdx, %rcx
	leaq	12800(%rdx), %r8
	mulsd	%xmm2, %xmm0
	movsd	%xmm0, (%rax)
	.p2align 6
	.p2align 4
	.p2align 3
.L3:
	movapd	(%rsi), %xmm3
	movsd	(%rcx), %xmm1
	movhpd	320(%rcx), %xmm1
	addq	$16, %rsi
	addq	$640, %rcx
	mulpd	%xmm4, %xmm3
	mulpd	%xmm3, %xmm1
	addsd	%xmm1, %xmm0
	unpckhpd	%xmm1, %xmm1
	addsd	%xmm1, %xmm0
	cmpq	%r8, %rcx
	jne	.L3
	addq	$8, %rdx
	movsd	%xmm0, (%rax)
	addq	$8, %rax
	cmpq	%rdx, %r9
	jne	.L4
	addq	$320, %rdi
	addq	$320, %r10
	cmpq	%r11, %rdi
	jne	.L2
	cvttsd2sil	C(%rip), %eax
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	B
	.bss
	.align 32
	.type	B, @object
	.size	B, 12800
B:
	.zero	12800
	.globl	A
	.align 32
	.type	A, @object
	.size	A, 12800
A:
	.zero	12800
	.globl	C
	.align 32
	.type	C, @object
	.size	C, 12800
C:
	.zero	12800
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	858993459
	.long	1072902963
	.align 8
.LC2:
	.long	0
	.long	1073217536
	.ident	"GCC: (GNU) 15.2.1 20250813"
	.section	.note.GNU-stack,"",@progbits
