.section	.text.startup
.globl	main
main:
mainb0:
	  addi	sp,	sp,	-16
	sd	ra,	8(sp)
	  addi	vr0,	sp,	0
	move	vr1,	vr0
	li	vr2,	4
	li	vr3,	0
	   mul	vr4,	vr3,	vr2
	   add	vr1,	vr1,	vr4
	move	a0,	vr1
	li	a1,	0
	li	a2,	4
	call	memset
	move	vr5,	vr0
	li	vr6,	4
	li	vr7,	0
	   mul	vr8,	vr7,	vr6
	   add	vr5,	vr5,	vr8
	li	vr9,	1
	sw	vr9,	0(vr5)
	li	a0,	0
	call	putint
	li	a0,	0
	ld	ra,	-8(sp)
	  addi	sp,	sp,	16
	 ret
