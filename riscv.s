.section	.text.startup
.globl	main
main:
main_b0:
	  addi	sp,	sp,	-24
	sd	s3,	16(sp)
	sd	s2,	8(sp)
	sd	ra,	0(sp)
	   j	main_b1
main_b1:
	   j	main_b2
main_b2:
	li	s3,	4
	   j	main_b3
main_b3:
	move	s2,	s3
	  slti	t0,	s2,	75
	bnez	t0,	main_b4
	   j	main_b6
main_b4:
	  slti	t0,	s2,	100
	bnez	t0,	main_b7
	   j	main_b5
main_b5:
	move	s3,	s2
	   j	main_b3
main_b6:
	   j	main_b12
main_b7:
	  addi	s2,	s2,	42
	li	t0,	99
	   slt	t0,	t0,	s2
	bnez	t0,	main_b9
	   j	main_b8
main_b8:
	move	s3,	s2
	   j	main_b3
main_b9:
	   j	main_b11
main_b10:
	move	s3,	s2
	   j	main_b3
main_b11:
	li	s3,	168
	   j	main_b3
main_b12:
	move	a0,	s2
	call	putint
	move	a0,	s2
	ld	ra,	0(sp)
	ld	s2,	8(sp)
	ld	s3,	16(sp)
	  addi	sp,	sp,	24
	 ret
