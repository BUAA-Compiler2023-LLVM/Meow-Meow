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
	  lw	vr0,	0(vr1)
	  addi	vr2,	vr0,	2
	  sw	vr2,	0(vr1)
	   j	b1
b1:
	  li	vr4,	10
	  slti	vr5,	vr4,	1
	  xori	vr3,	vr5,	1
	  xori	vr7,	vr3,	0
	  sltu	vr6,	$zero,	vr7
	bnez	vr6	b2
	   j	b6
b2:
	  lw	vr8,	0(vr1)
	  addi	vr9,	vr8,	1
	  sw	vr9,	0(vr1)
	   j	b3
b3:
	   j	b4
b4:
	  lw	vr10,	0(vr1)
	  addi	vr11,	vr10,	2
	  sw	vr11,	0(vr1)
	move	vr13,	vr12
	  li	vr14,	4
	  li	vr15,	0
	   mul	vr16,	vr15,	vr14
	   add	vr13,	vr13,	vr16
	  lw	vr17,	0(vr1)
	  sw	vr17,	0(vr13)
	   j	b5
b5:
	   j	b1
b6:
	  lw	vr18,	0(vr1)
	move	$a0,	vr18
	 ret
