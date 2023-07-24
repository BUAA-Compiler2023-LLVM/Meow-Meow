main:
b0:
	  addi	$sp,	$sp,	-4
	  sw	$ra,	0($sp)
	  li	vr0,	15
	  li	vr1,	7
	   div	vr2,	vr0,	vr1
	  li	vr3,	7
	   mul	vr4,	vr2,	vr3
	  li	vr6,	15
	   sub	vr5,	vr6,	vr4
	move	$a0,	vr5
	 ret
