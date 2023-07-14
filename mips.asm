add:
b0:
	addi $sp,	$sp,	-12
	addi vr0,	$sp,	0
	li vr1,	1
	sw vr1,	0(vr0)
	addi vr2,	$sp,	4
	li vr3,	2
	sw vr3,	0(vr2)
	addi vr4,	$sp,	8
	lw vr5,	0(vr0)
	lw vr6,	0(vr2)
	add vr7,	vr5,	vr6
	sw vr7,	0(vr4)
	lw vr8,	0(vr4)
	move $a0,	vr8
	ret
main:
b0:
	addi $sp,	$sp,	-8
	addi vr9,	$sp,	0
	li vr10,	1
	sw vr10,	0(vr9)
	addi vr11,	$sp,	4
	li vr12,	2
	sw vr12,	0(vr11)
	lw vr13,	0(vr9)
	xori vr15,	vr13,	1
	sltu vr16,	$zero,	vr15
	xori vr14,	vr16,	1
	xori vr18,	vr14,	0
	sltu vr17,	$zero,	vr18
	bnez	vr17	b1
	j	b3
b1:
	lw vr19,	0(vr11)
	xori vr21,	vr19,	1
	sltu vr22,	$zero,	vr21
	xori vr20,	vr22,	1
	xori vr24,	vr20,	0
	sltu vr23,	$zero,	vr24
	bnez	vr23	b4
	j	b6
b2:
	li $a0,	0
	ret
b3:
	lw vr25,	0(vr9)
	xori vr27,	vr25,	2
	sltu vr28,	$zero,	vr27
	xori vr26,	vr28,	1
	xori vr30,	vr26,	0
	sltu vr29,	$zero,	vr30
	bnez	vr29	b7
	j	b9
b4:
	lw vr31,	0(vr9)
	move $a0,	vr31
	ret
b5:
	j	b2
b6:
	lw vr32,	0(vr11)
	move $a0,	vr32
	ret
b7:
	lw vr33,	0(vr11)
	move $a0,	vr33
	ret
b8:
	j	b2
b9:
	li $a0,	0
	ret
