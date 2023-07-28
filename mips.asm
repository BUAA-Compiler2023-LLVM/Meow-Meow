.section	.text.startup
.globl	main
main:
mainb0:
	  addi	sp,	sp,	-8
	sd	ra,	0(sp)
	  li	vr1,	-1
	  slti	vr0,	vr1,	0
	bnez	vr0,	mainb1
	   j	mainb3
mainb1:
	  li	a0,	2
	call	putint
	   j	mainb2
mainb2:
	  li	a0,	10
	call	putch
	  li	a0,	0
	call	putint
	  li	a0,	0
	ld	ra,	0(sp)
	  addi	sp,	sp,	8
	 ret
mainb3:
	  li	vr3,	0
	  xori	vr4,	vr3,	0
	  sltu	vr2,	zero,	vr4
	bnez	vr2,	mainb4
	   j	mainb2
mainb4:
	  li	vr6,	0
	  xori	vr7,	vr6,	0
	  sltu	vr5,	zero,	vr7
	bnez	vr5,	mainb1
	   j	mainb2
