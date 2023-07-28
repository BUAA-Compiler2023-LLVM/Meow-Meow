	.globl	g
	.data
	.type	g,	@object
	.size	g,	16
g:
	.word	1
	.word	2
	.word	3
	.word	4

.section	.text.startup
.globl	main
main:
mainb0:
	  addi	sp,	sp,	-8
	sd	ra,	0(sp)
	la	vr0,	g
	li	vr1,	4
	li	vr2,	0
	   mul	vr3,	vr2,	vr1
	   add	vr0,	vr0,	vr3
	lw	vr4,	0(vr0)
	li	vr5,	2
	   div	vr6,	vr4,	vr5
	li	vr7,	18
	   mul	vr8,	vr7,	vr6
	move	a0,	vr8
	call	putint
	move	a0,	vr8
	ld	ra,	0(sp)
	  addi	sp,	sp,	8
	 ret
