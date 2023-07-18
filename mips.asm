f:
b0:
	addi	$sp,	$sp,	0
	move	vr1,	$a0
	   j	b1
b1:
	addi	vr0,	vr1,	5
	move	$a0,	vr0
	 ret
main:
b0:
	addi	$sp,	$sp,	-4
	  sw	$ra,	0($sp)
	   j	b1
b1:
	   j	b2
b2:
	  li	vr2,	10
	   j	b3
b3:
	move	$a0,	vr2
	 ret
