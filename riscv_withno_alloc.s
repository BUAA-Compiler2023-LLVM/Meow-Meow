.section	.text.startup
.globl	main
main:
main_b0:
	  addi	sp,	sp,	-8
	sd	ra,	0(sp)
	li	a0,	3
	call	putint
	li	a0,	3
	ld	ra,	0(sp)
	  addi	sp,	sp,	8
	 ret
