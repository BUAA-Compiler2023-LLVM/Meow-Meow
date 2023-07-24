main:
b0:
	  addi	$sp,	$sp,	-4
	  sw	$ra,	0($sp)
	  li	vr1,	5
	  xori	vr2,	vr1,	0
	  sltu	vr0,	$zero,	vr2
	bnez	vr0	b3
	   j	b2
b1:
	  li	vr3,	-1
	move	$a0,	vr3
	 ret
b2:
	  li	vr4,	11
	move	$a0,	vr4
	 ret
b3:
	  li	vr6,	6
	  xori	vr7,	vr6,	0
	  sltu	vr5,	$zero,	vr7
	bnez	vr5	b1
	   j	b2
