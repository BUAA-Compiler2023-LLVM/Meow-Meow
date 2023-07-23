	.globl	a
	.data
	.type	a,	@object
	.size	a,	20
a:
	.word	0
	.word	1
	.word	2
	.word	0
	.word	0

	.globl	b
	.bss
	.type	b,	@object
	.size	b,	40
b:
	.zero	40

	.globl	A
	.bss
	.type	A,	@object
	.size	A,	4
A:
	.zero	4

main:
b0:
	  addi	$sp,	$sp,	-4
	  sw	$ra,	0($sp)
	  lw	vr0,	0(A)
	  addi	vr1,	vr0,	2
	  sw	vr1,	0(A)
	   j	b1
b1:
	  li	vr3,	10
	  slti	vr4,	vr3,	1
	  xori	vr2,	vr4,	1
	  xori	vr6,	vr2,	0
	  sltu	vr5,	$zero,	vr6
	bnez	vr5	b2
	   j	b6
b2:
	  lw	vr7,	0(A)
	  addi	vr8,	vr7,	1
	  sw	vr8,	0(A)
	   j	b3
b3:
	   j	b4
b4:
	  lw	vr9,	0(A)
	  addi	vr10,	vr9,	2
	  sw	vr10,	0(A)
	move	vr11,	b
	  li	vr12,	4
	  li	vr13,	0
	   mul	vr14,	vr13,	vr12
	   add	vr11,	vr11,	vr14
	  lw	vr15,	0(A)
	  sw	vr15,	0(vr11)
	   j	b5
b5:
	   j	b1
b6:
	  lw	vr16,	0(A)
	move	$a0,	vr16
	 ret
