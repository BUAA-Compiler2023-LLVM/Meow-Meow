main:
b0:
	  addi	$sp,	$sp,	-4
	  sw	$ra,	0($sp)
	  xori	vr2,	vr0,	0
	  sltu	vr1,	$zero,	vr2
	bnez	vr1	b1
	   j	b3
b1:
	  li	vrf0,	1075838976
	move	vr3,	vrf0
	   j	b2
b2:
	move	vr4,	vr3
	move	$a0,	vr5
	 ret
b3:
	  li	vrf1,	1085276160
	move	vr3,	vrf1
	   j	b2
