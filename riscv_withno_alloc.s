.section	.text.startup
.globl	main
main:
main_b0:
	  addi	sp,	sp,	-8
	sd	ra,	0(sp)
	   j	main_b1
main_b1:
	   j	main_b2
main_b2:
	li	vr0,	4
	   j	main_b3
main_b3:
	move	vr1,	vr0
	  slti	vr2,	vr1,	75
	bnez	vr2,	main_b4
	   j	main_b6
main_b4:
	  slti	vr3,	vr1,	100
	bnez	vr3,	main_b7
	   j	main_b5
main_b5:
	move	vr0,	vr1
	   j	main_b3
main_b6:
	   j	main_b12
main_b7:
	  addi	vr4,	vr1,	42
	li	vr6,	99
	   slt	vr5,	vr6,	vr4
	bnez	vr5,	main_b9
	   j	main_b8
main_b8:
	move	vr0,	vr4
	   j	main_b3
main_b9:
	   j	main_b11
main_b10:
	move	vr0,	vr4
	   j	main_b3
main_b11:
	li	vr0,	168
	   j	main_b3
main_b12:
	move	a0,	vr1
	call	putint
	move	a0,	vr1
	ld	ra,	0(sp)
	  addi	sp,	sp,	8
	 ret
