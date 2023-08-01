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
	  addi	sp,	sp,	-16
	sd	s2,	8(sp)
	sd	ra,	0(sp)
	la	t2,	g
	  addi	t2,	t2,	4
	lw	t0,	0(t2)
	la	t3,	g
	  addi	t3,	t3,	8
	lw	t1,	0(t3)
	   add	t4,	t0,	t1
	lw	t1,	0(t2)
	lw	t0,	0(t3)
	   add	t0,	t1,	t0
	   add	s2,	t4,	t0
	move	a0,	s2
	call	putint
	move	a0,	s2
	ld	ra,	0(sp)
	ld	s2,	8(sp)
	  addi	sp,	sp,	16
	 ret
