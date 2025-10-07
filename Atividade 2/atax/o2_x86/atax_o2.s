	.file	"atax_minimal.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	movl	$40, %ecx
	xorl	%eax, %eax
	leaq	y(%rip), %rdi
	rep stosq
	leaq	A(%rip), %rcx
	leaq	tmp(%rip), %r8
	leaq	12800(%rcx), %r9
	leaq	x(%rip), %rsi
	.p2align 4
	.p2align 3
.L4:
	xorl	%eax, %eax
	pxor	%xmm1, %xmm1
	.p2align 6
	.p2align 4
	.p2align 3
.L2:
	movapd	(%rsi,%rax), %xmm0
	mulpd	(%rcx,%rax), %xmm0
	addq	$16, %rax
	addsd	%xmm0, %xmm1
	unpckhpd	%xmm0, %xmm0
	addsd	%xmm0, %xmm1
	cmpq	$320, %rax
	jne	.L2
	movsd	%xmm1, (%r8)
	leaq	y(%rip), %rax
	unpcklpd	%xmm1, %xmm1
	movq	%rcx, %rdx
	.p2align 5
	.p2align 4
	.p2align 3
.L3:
	movapd	(%rdx), %xmm0
	addq	$16, %rax
	addq	$16, %rdx
	mulpd	%xmm1, %xmm0
	addpd	-16(%rax), %xmm0
	movaps	%xmm0, -16(%rax)
	cmpq	%rdi, %rax
	jne	.L3
	addq	$320, %rcx
	addq	$8, %r8
	cmpq	%r9, %rcx
	jne	.L4
	cvttsd2sil	y(%rip), %eax
	cvttsd2sil	tmp(%rip), %edx
	addl	%edx, %eax
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	tmp
	.bss
	.align 32
	.type	tmp, @object
	.size	tmp, 320
tmp:
	.zero	320
	.globl	y
	.align 32
	.type	y, @object
	.size	y, 320
y:
	.zero	320
	.globl	x
	.align 32
	.type	x, @object
	.size	x, 320
x:
	.zero	320
	.globl	A
	.align 32
	.type	A, @object
	.size	A, 12800
A:
	.zero	12800
	.ident	"GCC: (GNU) 15.2.1 20250813"
	.section	.note.GNU-stack,"",@progbits
