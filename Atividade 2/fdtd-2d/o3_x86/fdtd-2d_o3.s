	.file	"fdtd-2d_minimal.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movsd	.LC1(%rip), %xmm3
	leaq	_fict_(%rip), %rdi
	leaq	12160+ex(%rip), %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movsd	.LC3(%rip), %xmm4
	leaq	12160+hz(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movsd	.LC1(%rip), %xmm2
	unpcklpd	%xmm3, %xmm3
	leaq	12800+hz(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movsd	.LC3(%rip), %xmm1
	unpcklpd	%xmm4, %xmm4
	leaq	320+ey(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	.p2align 4
	.p2align 3
.L2:
	movsd	(%rdi), %xmm0
	leaq	320+ey(%rip), %rdx
	leaq	-320(%rdx), %rax
	unpcklpd	%xmm0, %xmm0
	.p2align 4
	.p2align 4
	.p2align 3
.L3:
	movaps	%xmm0, (%rax)
	addq	$32, %rax
	movaps	%xmm0, -16(%rax)
	cmpq	%rax, %r12
	jne	.L3
	leaq	320+hz(%rip), %rax
	movl	$1, %esi
	.p2align 4
	.p2align 3
.L4:
	leaq	-320(%rax), %r10
	leaq	320(%rdx), %r8
	xorl	%ecx, %ecx
	leaq	320(%rax), %r9
	.p2align 4
	.p2align 3
.L5:
	movapd	(%rax,%rcx), %xmm6
	movapd	(%rdx,%rcx), %xmm0
	movapd	%xmm6, %xmm5
	subpd	(%r10,%rcx), %xmm5
	mulpd	%xmm3, %xmm5
	subpd	%xmm5, %xmm0
	movaps	%xmm0, (%rdx,%rcx)
	movapd	(%r9,%rcx), %xmm0
	movapd	(%r8,%rcx), %xmm5
	subpd	%xmm6, %xmm0
	mulpd	%xmm3, %xmm0
	subpd	%xmm0, %xmm5
	movaps	%xmm5, (%r8,%rcx)
	addq	$16, %rcx
	cmpq	$320, %rcx
	jne	.L5
	addl	$2, %esi
	addq	$640, %rdx
	addq	$640, %rax
	cmpl	$39, %esi
	jne	.L4
	xorl	%eax, %eax
	.p2align 6
	.p2align 4
	.p2align 3
.L6:
	leaq	12480+hz(%rip), %rbx
	movapd	(%rbx,%rax), %xmm0
	subpd	(%r14,%rax), %xmm0
	leaq	12480+ey(%rip), %rbx
	movapd	(%rbx,%rax), %xmm5
	mulpd	%xmm3, %xmm0
	subpd	%xmm0, %xmm5
	movaps	%xmm5, (%rbx,%rax)
	addq	$16, %rax
	cmpq	$320, %rax
	jne	.L6
	leaq	8+ex(%rip), %rdx
	leaq	hz(%rip), %rax
.L7:
	leaq	8(%rax), %rsi
	xorl	%ecx, %ecx
	.p2align 6
	.p2align 4
	.p2align 3
.L9:
	movupd	(%rsi,%rcx), %xmm0
	subpd	(%rax,%rcx), %xmm0
	movupd	(%rdx,%rcx), %xmm5
	mulpd	%xmm3, %xmm0
	subpd	%xmm0, %xmm5
	movups	%xmm5, (%rdx,%rcx)
	addq	$16, %rcx
	cmpq	$304, %rcx
	jne	.L9
	movsd	312(%rax), %xmm0
	subsd	304(%rax), %xmm0
	addq	$320, %rax
	addq	$320, %rdx
	movsd	-16(%rdx), %xmm5
	mulsd	%xmm2, %xmm0
	subsd	%xmm0, %xmm5
	movsd	%xmm5, -16(%rdx)
	cmpq	%r13, %rax
	jne	.L7
	movq	%rdi, -16(%rsp)
	leaq	ey(%rip), %rsi
	xorl	%r8d, %r8d
	leaq	ex(%rip), %rax
	leaq	hz(%rip), %rdx
	.p2align 4
	.p2align 3
.L8:
	leaq	320(%rsi), %rbp
	movq	%rsi, %rdi
	leaq	8(%rax), %rbx
	xorl	%ecx, %ecx
	leaq	320(%rdx), %r9
	leaq	328(%rax), %r11
	addq	$640, %rsi
	leaq	320(%rax), %r10
	.p2align 4
	.p2align 3
.L11:
	movupd	(%rbx,%rcx), %xmm0
	subpd	(%rax,%rcx), %xmm0
	movapd	0(%rbp,%rcx), %xmm6
	movapd	(%rdx,%rcx), %xmm5
	addpd	%xmm6, %xmm0
	subpd	(%rdi,%rcx), %xmm0
	mulpd	%xmm4, %xmm0
	subpd	%xmm0, %xmm5
	movupd	(%r11,%rcx), %xmm0
	subpd	(%r10,%rcx), %xmm0
	addpd	(%rsi,%rcx), %xmm0
	movaps	%xmm5, (%rdx,%rcx)
	movapd	(%r9,%rcx), %xmm5
	subpd	%xmm6, %xmm0
	mulpd	%xmm4, %xmm0
	subpd	%xmm0, %xmm5
	movaps	%xmm5, (%r9,%rcx)
	addq	$16, %rcx
	cmpq	$304, %rcx
	jne	.L11
	movsd	312(%rax), %xmm0
	subsd	304(%rax), %xmm0
	addl	$2, %r8d
	addq	$640, %rdx
	movsd	624(%rdi), %xmm6
	movsd	-336(%rdx), %xmm5
	addq	$640, %rax
	addsd	%xmm6, %xmm0
	subsd	304(%rdi), %xmm0
	mulsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm5
	movsd	-8(%rax), %xmm0
	subsd	-16(%rax), %xmm0
	addsd	944(%rdi), %xmm0
	movsd	%xmm5, -336(%rdx)
	movsd	-16(%rdx), %xmm5
	subsd	%xmm6, %xmm0
	mulsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm5
	movsd	%xmm5, -16(%rdx)
	cmpl	$38, %r8d
	jne	.L8
	movq	-16(%rsp), %rdi
	xorl	%eax, %eax
	.p2align 4
	.p2align 3
.L12:
	leaq	12168+ex(%rip), %rbx
	movapd	(%r14,%rax), %xmm5
	movupd	(%rbx,%rax), %xmm0
	leaq	12480+ey(%rip), %rbx
	subpd	(%r15,%rax), %xmm0
	addpd	(%rbx,%rax), %xmm0
	subpd	-320(%rax,%rbx), %xmm0
	mulpd	%xmm4, %xmm0
	subpd	%xmm0, %xmm5
	movaps	%xmm5, (%r14,%rax)
	addq	$16, %rax
	cmpq	$304, %rax
	jne	.L12
	movsd	312(%r15), %xmm0
	addq	$8, %rdi
	subsd	304(%r15), %xmm0
	leaq	160+_fict_(%rip), %rax
	addsd	304(%rbx), %xmm0
	subsd	-16(%rbx), %xmm0
	movsd	304(%r14), %xmm5
	mulsd	%xmm1, %xmm0
	subsd	%xmm0, %xmm5
	movsd	%xmm5, 304(%r14)
	cmpq	%rax, %rdi
	jne	.L2
	popq	%rbx
	.cfi_def_cfa_offset 48
	cvttsd2sil	hz(%rip), %eax
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	_fict_
	.bss
	.align 32
	.type	_fict_, @object
	.size	_fict_, 160
_fict_:
	.zero	160
	.globl	hz
	.align 32
	.type	hz, @object
	.size	hz, 12800
hz:
	.zero	12800
	.globl	ey
	.align 32
	.type	ey, @object
	.size	ey, 12800
ey:
	.zero	12800
	.globl	ex
	.align 32
	.type	ex, @object
	.size	ex, 12800
ex:
	.zero	12800
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1071644672
	.align 8
.LC3:
	.long	1717986918
	.long	1072064102
	.ident	"GCC: (GNU) 15.2.1 20250813"
	.section	.note.GNU-stack,"",@progbits
