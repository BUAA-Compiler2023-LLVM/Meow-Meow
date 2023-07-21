main:
b0:
	addi	$sp,	$sp,	-4
	  sw	$ra,	0($sp)
	  li	vr0,	1
	  li	vr1,	0
	   j	b1
b1:
	move	vr2,	vr0
	move	vr3,	vr1
	 slti	vr4,	vr2,	1000
	 xori	vr6,	vr4,	0
	 sltu	vr5,	$zero,	vr6
	bnez	vr5	b2
	   j	b3
b2:
	 add	vr7,	vr2,	vr3
	move	vr0,	vr7
	move	vr1,	vr2
	   j	b1
b3:
	move	$a0,	vr2
	 ret
