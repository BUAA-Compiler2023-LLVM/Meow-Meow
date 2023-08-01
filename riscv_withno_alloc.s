	.globl	g
	.data
	.type	g,	@object
	.size	g,	20
g:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4

.section	.text.startup
.globl	main
main:
main_b0:
	  addi	sp,	sp,	-8
	sd	ra,	0(sp)
	la	vr0,	g
	  addi	vr0,	vr0,	4
	lw	vr1,	0(vr0)
	la	vr2,	g
	  addi	vr2,	vr2,	8
	lw	vr3,	0(vr2)
	   add	vr4,	vr1,	vr3
	lw	vr5,	0(vr0)
	lw	vr6,	0(vr2)
	   add	vr7,	vr5,	vr6
	   add	vr8,	vr4,	vr7
	move	a0,	vr8
	call	putint
	move	a0,	vr8
	ld	ra,	0(sp)
	  addi	sp,	sp,	8
	 ret
