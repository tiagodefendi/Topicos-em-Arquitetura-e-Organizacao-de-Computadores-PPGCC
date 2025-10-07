	.file	"fdtd-2d_minimal.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	leaq	_fict_(%rip), %r11
	movsd	.LC2(%rip), %xmm2
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	12800+hz(%rip), %r8
	movsd	.LC1(%rip), %xmm4
	movsd	.LC1(%rip), %xmm3
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leaq	12480+ex(%rip), %r10
	movapd	%xmm2, %xmm5
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	320+ey(%rip), %r9
	leaq	160(%r11), %rbx
	unpcklpd	%xmm4, %xmm4
	unpcklpd	%xmm5, %xmm5
	.p2align 4
	.p2align 3
.L2:
	movsd	(%r11), %xmm0
	leaq	ey(%rip), %rdi
	leaq	320(%rdi), %rsi
	movq	%rdi, %rax
	unpcklpd	%xmm0, %xmm0
	.p2align 4
	.p2align 4
	.p2align 3
.L3:
	movaps	%xmm0, (%rax)
	addq	$32, %rax
	movaps	%xmm0, -16(%rax)
	cmpq	%r9, %rax
	jne	.L3
	leaq	hz(%rip), %rcx
	leaq	320(%rcx), %rax
	.p2align 4
	.p2align 3
.L4:
	leaq	-320(%rax), %rbp
	xorl	%edx, %edx
	.p2align 6
	.p2align 4
	.p2align 3
.L5:
	movapd	(%rax,%rdx), %xmm0
	subpd	0(%rbp,%rdx), %xmm0
	movapd	(%rsi,%rdx), %xmm1
	mulpd	%xmm4, %xmm0
	subpd	%xmm0, %xmm1
	movaps	%xmm1, (%rsi,%rdx)
	addq	$16, %rdx
	cmpq	$320, %rdx
	jne	.L5
	addq	$320, %rax
	addq	$320, %rsi
	cmpq	%rax, %r8
	jne	.L4
	leaq	ex(%rip), %rax
	leaq	hz(%rip), %rdx
	leaq	8(%rax), %rsi
	.p2align 4
	.p2align 3
.L7:
	leaq	8(%rdx), %r12
	xorl	%ebp, %ebp
	.p2align 6
	.p2align 4
	.p2align 3
.L9:
	movupd	(%r12,%rbp), %xmm0
	subpd	(%rdx,%rbp), %xmm0
	movupd	(%rsi,%rbp), %xmm1
	mulpd	%xmm4, %xmm0
	subpd	%xmm0, %xmm1
	movups	%xmm1, (%rsi,%rbp)
	addq	$16, %rbp
	cmpq	$304, %rbp
	jne	.L9
	movsd	312(%rdx), %xmm0
	subsd	304(%rdx), %xmm0
	addq	$320, %rdx
	addq	$320, %rsi
	movsd	-16(%rsi), %xmm1
	mulsd	%xmm3, %xmm0
	subsd	%xmm0, %xmm1
	movsd	%xmm1, -16(%rsi)
	cmpq	%rdx, %r8
	jne	.L7
	.p2align 4
	.p2align 3
.L11:
	movq	%rdi, %rsi
	leaq	8(%rax), %rbp
	addq	$320, %rdi
	xorl	%edx, %edx
	.p2align 6
	.p2align 4
	.p2align 3
.L13:
	movupd	0(%rbp,%rdx), %xmm0
	subpd	(%rax,%rdx), %xmm0
	addpd	(%rdi,%rdx), %xmm0
	subpd	(%rsi,%rdx), %xmm0
	movapd	(%rcx,%rdx), %xmm1
	mulpd	%xmm5, %xmm0
	subpd	%xmm0, %xmm1
	movaps	%xmm1, (%rcx,%rdx)
	addq	$16, %rdx
	cmpq	$304, %rdx
	jne	.L13
	movsd	312(%rax), %xmm0
	subsd	304(%rax), %xmm0
	addq	$320, %rax
	addq	$320, %rcx
	addsd	624(%rsi), %xmm0
	subsd	304(%rsi), %xmm0
	movsd	-16(%rcx), %xmm1
	mulsd	%xmm2, %xmm0
	subsd	%xmm0, %xmm1
	movsd	%xmm1, -16(%rcx)
	cmpq	%rax, %r10
	jne	.L11
	addq	$8, %r11
	cmpq	%r11, %rbx
	jne	.L2
	popq	%rbx
	.cfi_def_cfa_offset 24
	cvttsd2sil	hz(%rip), %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
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
.LC2:
	.long	1717986918
	.long	1072064102
	.ident	"GCC: (GNU) 15.2.1 20250813"
	.section	.note.GNU-stack,"",@progbits
