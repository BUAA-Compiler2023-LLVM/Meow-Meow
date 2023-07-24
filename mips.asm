main:
b0:
	  addi	$sp,	$sp,	-4
	  sw	$ra,	0($sp)
	  li	vr1,	5
	  slti	vr0,	vr1,	6
	bnez	vr0	b1
	   j	b2
b1:
	  li	vr2,	11
	move	$a0,	vr2
	 ret
b2:
	  li	vr3,	-1
	move	$a0,	vr3
	 ret
