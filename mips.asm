main:
b0:
	  addi	$sp,	$sp,	-4
	  sw	$ra,	0($sp)
	  li	vrf0,	1063675494
	  li	vrf1,	1085485875
	 flt.s	vr0,	vrf0,	vrf1
	bnez	vr0	b1
	   j	b2
b1:
	fadd.s	vrf2,	vrf0,	vrf1
	fcvt.w.s	vr1,	vrf2,	rtz
	move	$a0,	vr1
	 ret
b2:
	fsub.s	vrf3,	vrf0,	vrf1
	fcvt.w.s	vr2,	vrf3,	rtz
	move	$a0,	vr2
	 ret
