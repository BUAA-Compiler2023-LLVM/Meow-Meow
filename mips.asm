add:
b0:
	addi $sp,	$sp,	-8
	move vr3,	$a1
	move vr1,	$a0
	addi vr0,	$sp,	0
	sw vr1,	0(vr0)
	addi vr2,	$sp,	4
	sw vr3,	0(vr2)
	j	b1
b1:
	lw vr4,	0(vr0)
	lw vr5,	0(vr2)
	add vr6,	vr4,	vr5
	move $a0,	vr6
	ret
zero:
b0:
	addi $sp,	$sp,	0
	li $a0,	0
	ret
main:
b0:
	addi $sp,	$sp,	-16
	sw $ra,	12($sp)
	addi vr7,	$sp,	0
	li vr8,	1
	sw vr8,	0(vr7)
	addi vr9,	$sp,	4
	call	zero
	sw vr10,	0(vr9)
	addi vr11,	$sp,	8
	lw vr12,	0(vr7)
	lw vr13,	0(vr9)
	move $a0,	vr12
	move $a1,	vr13
	call	add
	sw vr14,	0(vr11)
	lw vr15,	0(vr11)
	move $a0,	vr15
	ret
