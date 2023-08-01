.section	.text.startup
.globl	main
main:
mainb0:
	  addi	sp,	sp,	-16
	sd	ra,	8(sp)
	  addi	t1,	sp,	0
	move	t0,	t1
	li	s0,	4
	li	t2,	0
	   mul	t2,	t2,	s0
	   add	t0,	t0,	t2
	move	a0,	t0
	li	a1,	0
	li	a2,	4
	call	memset
	li	t0,	4
	li	t2,	0
	   mul	t0,	t2,	t0
	   add	t1,	t1,	t0
	li	t0,	1
	sw	t0,	0(t1)
	li	a0,	0
	call	putint
	li	a0,	0
	ld	ra,	-8(sp)
	  addi	sp,	sp,	16
	 ret
