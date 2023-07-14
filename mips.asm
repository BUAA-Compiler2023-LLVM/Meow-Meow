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
add10:
b0:
	addi $sp,	$sp,	-40
	lw vr26,	44($sp)
	lw vr24,	40($sp)
	move vr22,	$a7
	move vr20,	$a6
	move vr18,	$a5
	move vr16,	$a4
	move vr14,	$a3
	move vr12,	$a2
	move vr10,	$a1
	move vr8,	$a0
	addi vr7,	$sp,	0
	sw vr8,	0(vr7)
	addi vr9,	$sp,	4
	sw vr10,	0(vr9)
	addi vr11,	$sp,	8
	sw vr12,	0(vr11)
	addi vr13,	$sp,	12
	sw vr14,	0(vr13)
	addi vr15,	$sp,	16
	sw vr16,	0(vr15)
	addi vr17,	$sp,	20
	sw vr18,	0(vr17)
	addi vr19,	$sp,	24
	sw vr20,	0(vr19)
	addi vr21,	$sp,	28
	sw vr22,	0(vr21)
	addi vr23,	$sp,	32
	sw vr24,	0(vr23)
	addi vr25,	$sp,	36
	sw vr26,	0(vr25)
	j	b1
b1:
	lw vr27,	0(vr7)
	lw vr28,	0(vr25)
	add vr29,	vr27,	vr28
	move $a0,	vr29
	ret
main:
b0:
	addi $sp,	$sp,	-28
	sw $ra,	24($sp)
	addi vr30,	$sp,	8
	li vr31,	1
	sw vr31,	0(vr30)
	addi vr32,	$sp,	12
	call	zero
	sw vr33,	0(vr32)
	addi vr34,	$sp,	16
	lw vr35,	0(vr30)
	lw vr36,	0(vr32)
	move $a0,	vr35
	move $a1,	vr36
	call	add
	sw vr37,	0(vr34)
	addi vr38,	$sp,	20
	li $a0,	0
	li $a1,	1
	li $a2,	2
	li $a3,	3
	li $a4,	4
	li $a5,	5
	li $a6,	6
	li $a7,	7
	sw 8,	0($sp)
	sw 9,	4($sp)
	call	add10
	sw vr39,	0(vr38)
	lw vr40,	0(vr34)
	lw vr41,	0(vr38)
	add vr42,	vr40,	vr41
	move $a0,	vr42
	ret
