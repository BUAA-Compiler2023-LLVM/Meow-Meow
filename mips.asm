add:
b0:
	addi	$sp,	$sp,	-4
	move	vr1,	$a0
	addi	vr0,	$sp,	0
	  sw	vr1,	0(vr0)
	   j	b1
b1:
	  lw	vr2,	0(vr0)
	move	vr3,	vr2
	  lw	vr4,	0(vr3)
	  lw	vr5,	0(vr0)
	move	vr6,	vr5
	  lw	vr7,	0(vr6)
	 add	vr8,	vr4,	vr7
	move	$a0,	vr8
	 ret
main:
b0:
	addi	$sp,	$sp,	-20
	  sw	$ra,	16($sp)
	addi	vr9,	$sp,	0
	move	vr10,	vr9
	  li	vr11,	4
	  li	vr12,	0
	 mul	vr13,	vr12,	vr11
	 add	vr10,	vr10,	vr13
	move	vr14,	vr9
	  li	vr15,	4
	  li	vr16,	0
	 mul	vr17,	vr16,	vr15
	 add	vr14,	vr14,	vr17
	  li	vr18,	1
	  sw	vr18,	0(vr14)
	move	vr19,	vr9
	  li	vr20,	4
	  li	vr21,	1
	 mul	vr22,	vr21,	vr20
	 add	vr19,	vr19,	vr22
	  li	vr23,	5
	  sw	vr23,	0(vr19)
	move	vr24,	vr9
	  li	vr25,	4
	  li	vr26,	2
	 mul	vr27,	vr26,	vr25
	 add	vr24,	vr24,	vr27
	  li	vr28,	2
	  sw	vr28,	0(vr24)
	move	vr29,	vr9
	  li	vr30,	4
	  li	vr31,	0
	 mul	vr32,	vr31,	vr30
	 add	vr29,	vr29,	vr32
	move	$a0,	vr29
	call	add
	move	$a0,	vr33
	 ret
