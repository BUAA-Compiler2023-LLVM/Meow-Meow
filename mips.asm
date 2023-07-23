main:
b0:
	addi	$sp,	$sp,	-4
	  sw	$ra,	0($sp)
	  li	vrf0,	1075838976
	  li	vrf1,	1084227584
	 fadd.s	vrf2,	vrf0,	vrf1
	move	$a0,	vr0
	 ret
