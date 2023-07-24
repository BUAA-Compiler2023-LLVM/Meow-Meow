	.globl	A
	.data
	.type	A,	@object
	.size	A,	4
A:
	.word	5

main:
b0:
	  addi	$sp,	$sp,	-4
	  sw	$ra,	0($sp)
	  li	vr1,	5
	  slti	vr2,	vr1,	1
	  xori	vr0,	vr2,	1
	  xori	vr4,	vr0,	0
	  sltu	vr3,	$zero,	vr4
	bnez	vr3	b1
	   j	b5
b1:
	  lw	vr5,	0(A)
	   j	b2
b2:
	   j	b3
b3:
	  lw	vr6,	0(A)
	   add	vr7,	vr6,	vr5
	  sw	vr7,	0(A)
	  lw	vr8,	0(A)
	   j	b4
b4:
	   j	b5
b5:
	  lw	vr9,	0(A)
	move	$a0,	vr9
	 ret
