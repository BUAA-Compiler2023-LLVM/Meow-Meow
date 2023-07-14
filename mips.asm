main:
b0:
	addi $sp,	$sp,	-8
	addi vr0,	$sp,	0
	addi vr1,	$sp,	4
	li vr2,	1
	sw vr2,	0(vr1)
	lw vr3,	0(vr1)
	li vr5,	0
	slt vr4,	vr5,	vr3
	xori vr7,	vr4,	0
	sltu vr6,	$zero,	vr7
	bnez	vr6	b1
	j	b3
b1:
	li vr8,	1
	sw vr8,	0(vr0)
	j	b2
b2:
	lw vr9,	0(vr0)
	move $a0,	vr9
	ret
b3:
	li vr10,	-1
	sw vr10,	0(vr0)
	j	b2
