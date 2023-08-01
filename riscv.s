.section	.text
sum:
sum_b0:
	  addi	sp,	sp,	-336
	sd	s9,	328(sp)
	sd	s6,	320(sp)
	sd	s2,	312(sp)
	sd	s11,	304(sp)
	sd	s0,	296(sp)
	sd	s4,	288(sp)
	sd	s8,	280(sp)
	sd	s3,	272(sp)
	sd	s10,	264(sp)
	sd	s7,	256(sp)
	sd	s5,	248(sp)
	sd	s1,	240(sp)
	lw	t3,	120(sp)
	lw	t2,	116(sp)
	lw	t0,	112(sp)
	sd	t0,	136(sp)
	lw	t0,	108(sp)
	sd	t0,	144(sp)
	lw	t1,	104(sp)
	sd	t1,	152(sp)
	lw	t1,	100(sp)
	sd	t1,	160(sp)
	lw	t0,	96(sp)
	sd	t0,	168(sp)
	lw	t4,	92(sp)
	lw	t0,	88(sp)
	sd	t0,	176(sp)
	lw	t0,	84(sp)
	sd	t0,	232(sp)
	lw	t0,	80(sp)
	sd	t0,	184(sp)
	move	t0,	a7
	sd	t0,	192(sp)
	move	t5,	a6
	move	t0,	a5
	move	t1,	a4
	sd	t1,	200(sp)
	move	t6,	a3
	sd	t6,	208(sp)
	move	t1,	a2
	sd	t1,	216(sp)
	move	t1,	a1
	sd	t1,	224(sp)
	move	t1,	a0
	  addi	s1,	sp,	0
	sw	t1,	0(s1)
	  addi	s10,	sp,	4
	ld	t1,	224(sp)
	sw	t1,	0(s10)
	  addi	t6,	sp,	8
	sd	t6,	80(sp)
	ld	t6,	80(sp)
	ld	t1,	216(sp)
	sw	t1,	0(t6)
	  addi	t1,	sp,	12
	sd	t1,	88(sp)
	ld	t1,	88(sp)
	ld	t6,	208(sp)
	sw	t6,	0(t1)
	  addi	s8,	sp,	16
	ld	t1,	200(sp)
	sw	t1,	0(s8)
	  addi	s6,	sp,	20
	sw	t0,	0(s6)
	  addi	t0,	sp,	24
	sd	t0,	96(sp)
	ld	t0,	96(sp)
	sw	t5,	0(t0)
	  addi	s11,	sp,	28
	ld	t0,	192(sp)
	sw	t0,	0(s11)
	  addi	s9,	sp,	32
	ld	t0,	184(sp)
	sw	t0,	0(s9)
	  addi	s3,	sp,	36
	ld	t0,	232(sp)
	sw	t0,	0(s3)
	  addi	t5,	sp,	40
	sd	t5,	104(sp)
	ld	t5,	104(sp)
	ld	t0,	176(sp)
	sw	t0,	0(t5)
	  addi	s5,	sp,	44
	sw	t4,	0(s5)
	  addi	s4,	sp,	48
	ld	t0,	168(sp)
	sw	t0,	0(s4)
	  addi	t0,	sp,	52
	sd	t0,	112(sp)
	ld	t0,	112(sp)
	ld	t1,	160(sp)
	sw	t1,	0(t0)
	  addi	t0,	sp,	56
	sd	t0,	120(sp)
	ld	t0,	120(sp)
	ld	t1,	152(sp)
	sw	t1,	0(t0)
	  addi	t4,	sp,	60
	sd	t4,	128(sp)
	ld	t4,	128(sp)
	ld	t0,	144(sp)
	sw	t0,	0(t4)
	  addi	s0,	sp,	64
	ld	t0,	136(sp)
	sw	t0,	0(s0)
	  addi	s7,	sp,	68
	sw	t2,	0(s7)
	  addi	s2,	sp,	72
	sw	t3,	0(s2)
	   j	sum_b1
sum_b1:
	lw	t0,	0(s1)
	  addi	t0,	t0,	0
	lw	t1,	0(t0)
	lw	t0,	0(s10)
	  addi	t0,	t0,	0
	  addi	t0,	t0,	8
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	ld	t6,	80(sp)
	lw	t0,	0(t6)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	lw	t0,	0(t0)
	   add	t2,	t1,	t0
	ld	t1,	88(sp)
	lw	t0,	0(t1)
	  addi	t0,	t0,	0
	  addi	t0,	t0,	8
	  addi	t0,	t0,	0
	  addi	t0,	t0,	32
	lw	t0,	0(t0)
	   add	t1,	t2,	t0
	lw	t0,	0(s8)
	  addi	t0,	t0,	0
	  addi	t0,	t0,	8
	  addi	t0,	t0,	16
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s6)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	32
	  addi	t0,	t0,	64
	  addi	t0,	t0,	128
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	ld	t0,	96(sp)
	lw	t0,	0(t0)
	  addi	t0,	t0,	0
	  addi	t0,	t0,	8
	  addi	t0,	t0,	16
	  addi	t0,	t0,	32
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s11)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	64
	  addi	t0,	t0,	128
	  addi	t0,	t0,	256
	  addi	t0,	t0,	512
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s9)
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	32
	  addi	t0,	t0,	64
	  addi	t0,	t0,	128
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s3)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	32
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	256
	  addi	t0,	t0,	512
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	ld	t5,	104(sp)
	lw	t0,	0(t5)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	8
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	64
	  addi	t0,	t0,	128
	  addi	t0,	t0,	256
	  addi	t0,	t0,	512
	  addi	t0,	t0,	1024
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s5)
	  addi	t0,	t0,	0
	  addi	t0,	t0,	8
	  addi	t0,	t0,	16
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	128
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	1024
	  addi	t0,	t0,	2048
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s4)
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	32
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	256
	  addi	t0,	t0,	512
	  addi	t0,	t0,	1024
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	8192
	  addi	t0,	t0,	16384
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	ld	t0,	112(sp)
	lw	t0,	0(t0)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	8
	  addi	t0,	t0,	16
	  addi	t0,	t0,	32
	  addi	t0,	t0,	64
	  addi	t0,	t0,	128
	  addi	t0,	t0,	256
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	ld	t0,	120(sp)
	lw	t0,	0(t0)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	8
	  addi	t0,	t0,	16
	  addi	t0,	t0,	32
	  addi	t0,	t0,	64
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	ld	t4,	128(sp)
	lw	t0,	0(t4)
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	16
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	128
	  addi	t0,	t0,	256
	  addi	t0,	t0,	512
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	16384
	  addi	t0,	t0,	32768
	  addi	t0,	t0,	65536
	  addi	t0,	t0,	131072
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s0)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	0
	  addi	t0,	t0,	16
	  addi	t0,	t0,	0
	  addi	t0,	t0,	64
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	512
	  addi	t0,	t0,	1024
	  addi	t0,	t0,	2048
	  addi	t0,	t0,	4096
	  addi	t0,	t0,	8192
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s7)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	8
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	64
	  addi	t0,	t0,	128
	  addi	t0,	t0,	256
	  addi	t0,	t0,	512
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	8192
	  addi	t0,	t0,	0
	  addi	t0,	t0,	32768
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	262144
	  addi	t0,	t0,	524288
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s2)
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	1024
	  addi	t0,	t0,	2048
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	16384
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	  addi	t0,	t0,	262144
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	lw	t0,	0(t0)
	   add	t0,	t1,	t0
	move	a0,	t0
	ld	s1,	240(sp)
	ld	s5,	248(sp)
	ld	s7,	256(sp)
	ld	s10,	264(sp)
	ld	s3,	272(sp)
	ld	s8,	280(sp)
	ld	s4,	288(sp)
	ld	s0,	296(sp)
	ld	s11,	304(sp)
	ld	s2,	312(sp)
	ld	s6,	320(sp)
	ld	s9,	328(sp)
	  addi	sp,	sp,	336
	 ret
.section	.text.startup
.globl	main
main:
main_b0:
	li	t0,	-2097472
	   add	sp,	sp,	t0
	li	t0,	2097464
	   add	t1,	sp,	t0
	sd	s6,	0(t1)
	li	t0,	2097456
	   add	t1,	sp,	t0
	sd	s2,	0(t1)
	li	t0,	2097448
	   add	t1,	sp,	t0
	sd	s0,	0(t1)
	li	t0,	2097440
	   add	t1,	sp,	t0
	sd	s4,	0(t1)
	li	t0,	2097432
	   add	t1,	sp,	t0
	sd	s8,	0(t1)
	li	t0,	2097424
	   add	t1,	sp,	t0
	sd	s3,	0(t1)
	li	t0,	2097416
	   add	t1,	sp,	t0
	sd	s7,	0(t1)
	li	t0,	2097408
	   add	t1,	sp,	t0
	sd	s5,	0(t1)
	li	t0,	2097200
	   add	t0,	sp,	t0
	sd	ra,	0(t0)
	  addi	t1,	sp,	44
	li	t0,	2097208
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	move	s2,	t1
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	  addi	s2,	s2,	0
	move	a0,	s2
	li	a1,	0
	li	t0,	2097152
	move	a2,	t0
	call	memset
	li	t0,	0
	sw	t0,	0(s2)
	li	s2,	0
	li	s3,	0
	   j	main_b1
	li	s2,	-2097208
	li	t1,	2097208
	li	t0,	2097216
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
main_b1:
	move	t0,	s2
	li	t1,	2097296
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	li	t0,	2097296
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	  slti	t0,	t0,	2
	bnez	t0,	main_b2
	   j	main_b3
main_b2:
	li	s2,	0
	   j	main_b4
main_b3:
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	move	t3,	t1
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	  addi	t3,	t3,	0
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	move	t2,	t1
	  addi	t2,	t2,	0
	  addi	t2,	t2,	0
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	li	t0,	2097304
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097304
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097304
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097304
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097304
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	li	t0,	2097312
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097312
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097312
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097312
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097312
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	li	t0,	2097320
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097320
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097320
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097320
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097320
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	move	t4,	t1
	  addi	t4,	t4,	0
	  addi	t4,	t4,	0
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	li	t0,	2097328
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097328
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097328
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097328
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097328
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	li	t0,	2097336
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097336
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097336
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097336
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097336
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	li	t0,	2097344
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097344
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097344
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097344
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097344
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	li	t0,	2097352
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097352
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097352
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097352
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	li	t0,	2097352
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	move	t0,	t1
	  addi	t0,	t0,	0
	  addi	t0,	t0,	0
	li	t1,	2097208
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	move	t5,	t1
	  addi	t5,	t5,	0
	  addi	t5,	t5,	0
	li	t1,	2097208
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	li	t6,	2097360
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097360
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	li	t6,	2097360
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097360
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	li	t6,	2097360
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097208
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	li	t6,	2097368
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097368
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	li	t6,	2097368
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097368
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	li	t6,	2097368
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097208
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	li	t6,	2097376
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097376
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	li	t6,	2097376
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097376
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	li	t6,	2097376
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097208
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	li	t6,	2097384
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097384
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	li	t6,	2097384
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097384
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	li	t6,	2097384
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097208
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	li	t6,	2097392
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097392
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	li	t6,	2097392
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097392
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	li	t6,	2097392
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097208
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	li	t6,	2097400
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097400
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	li	t6,	2097400
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097400
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	li	t6,	2097400
	   add	t6,	sp,	t6
	sd	t1,	0(t6)
	li	t1,	2097400
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	  addi	t1,	t1,	0
	  addi	t1,	t1,	0
	move	a0,	t3
	move	a1,	t2
	li	t2,	2097304
	   add	t2,	sp,	t2
	ld	t1,	0(t2)
	move	a2,	t1
	li	t2,	2097312
	   add	t2,	sp,	t2
	ld	t1,	0(t2)
	move	a3,	t1
	li	t2,	2097320
	   add	t2,	sp,	t2
	ld	t1,	0(t2)
	move	a4,	t1
	move	a5,	t4
	li	t2,	2097328
	   add	t2,	sp,	t2
	ld	t1,	0(t2)
	move	a6,	t1
	li	t2,	2097336
	   add	t2,	sp,	t2
	ld	t1,	0(t2)
	move	a7,	t1
	li	t2,	2097344
	   add	t2,	sp,	t2
	ld	t1,	0(t2)
	sw	t1,	0(sp)
	li	t2,	2097352
	   add	t2,	sp,	t2
	ld	t1,	0(t2)
	sw	t1,	4(sp)
	sw	t0,	8(sp)
	sw	t5,	12(sp)
	li	t0,	2097360
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	sw	t1,	16(sp)
	li	t0,	2097368
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	sw	t1,	20(sp)
	li	t0,	2097376
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	sw	t1,	24(sp)
	li	t0,	2097384
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	sw	t1,	28(sp)
	li	t0,	2097392
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	sw	t1,	32(sp)
	sw	t1,	36(sp)
	li	t0,	2097400
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	sw	t1,	40(sp)
	call	sum
	move	t0,	a0
	move	a0,	t0
	call	putint
	li	a0,	10
	call	putch
	li	a0,	0
	call	putint
	li	a0,	0
	li	t0,	2097200
	   add	t0,	sp,	t0
	ld	ra,	0(t0)
	li	t0,	2097216
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	li	t0,	2097408
	   add	t1,	sp,	t0
	ld	s5,	0(t1)
	li	t0,	2097416
	   add	t1,	sp,	t0
	ld	s7,	0(t1)
	li	t0,	2097424
	   add	t1,	sp,	t0
	ld	s3,	0(t1)
	li	t0,	2097432
	   add	t1,	sp,	t0
	ld	s8,	0(t1)
	li	t0,	2097440
	   add	t1,	sp,	t0
	ld	s4,	0(t1)
	li	t0,	2097448
	   add	t1,	sp,	t0
	ld	s0,	0(t1)
	li	t0,	2097456
	   add	t1,	sp,	t0
	ld	s2,	0(t1)
	li	t0,	2097464
	   add	t1,	sp,	t0
	ld	s6,	0(t1)
	li	t0,	2097472
	   add	sp,	sp,	t0
	 ret
main_b4:
	  slti	t0,	s2,	2
	bnez	t0,	main_b5
	   j	main_b6
main_b5:
	li	s4,	0
	   j	main_b7
main_b6:
	li	t0,	2097296
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	  addi	t0,	t0,	1
	move	s2,	t0
	   j	main_b1
main_b7:
	  slti	t0,	s4,	2
	bnez	t0,	main_b8
	   j	main_b9
main_b8:
	li	s6,	0
	   j	main_b10
main_b9:
	  addi	t0,	s2,	1
	move	s2,	t0
	   j	main_b4
main_b10:
	  slti	t0,	s6,	2
	bnez	t0,	main_b11
	   j	main_b12
main_b11:
	li	s5,	0
	   j	main_b13
main_b12:
	  addi	t0,	s4,	1
	move	s4,	t0
	   j	main_b7
main_b13:
	  slti	t0,	s5,	2
	bnez	t0,	main_b14
	   j	main_b15
main_b14:
	li	s7,	0
	   j	main_b16
main_b15:
	  addi	t0,	s6,	1
	move	s6,	t0
	   j	main_b10
main_b16:
	move	t2,	s7
	li	t0,	2097224
	   add	t0,	sp,	t0
	sd	t2,	0(t0)
	li	t0,	2097224
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  slti	t0,	t2,	2
	bnez	t0,	main_b17
	   j	main_b18
main_b17:
	li	s4,	0
	   j	main_b19
main_b18:
	  addi	t0,	s5,	1
	move	s5,	t0
	   j	main_b13
main_b19:
	  slti	t0,	s4,	2
	bnez	t0,	main_b20
	   j	main_b21
main_b20:
	li	s6,	0
	   j	main_b22
main_b21:
	li	t0,	2097224
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  addi	t0,	t2,	1
	move	s7,	t0
	   j	main_b16
main_b22:
	  slti	t0,	s6,	2
	bnez	t0,	main_b23
	   j	main_b24
main_b23:
	li	s7,	0
	   j	main_b25
main_b24:
	  addi	t0,	s4,	1
	move	s4,	t0
	   j	main_b19
main_b25:
	move	t2,	s7
	li	t0,	2097232
	   add	t0,	sp,	t0
	sd	t2,	0(t0)
	li	t0,	2097232
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  slti	t0,	t2,	2
	bnez	t0,	main_b26
	   j	main_b27
main_b26:
	li	s7,	0
	   j	main_b28
main_b27:
	  addi	t0,	s6,	1
	move	s6,	t0
	   j	main_b22
main_b28:
	  slti	t0,	s7,	2
	bnez	t0,	main_b29
	   j	main_b30
main_b29:
	li	s7,	0
	   j	main_b31
main_b30:
	li	t0,	2097232
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  addi	t0,	t2,	1
	move	s7,	t0
	   j	main_b25
main_b31:
	move	t2,	s7
	li	t0,	2097240
	   add	t0,	sp,	t0
	sd	t2,	0(t0)
	li	t0,	2097240
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  slti	t0,	t2,	2
	bnez	t0,	main_b32
	   j	main_b33
main_b32:
	li	s5,	0
	   j	main_b34
main_b33:
	  addi	t0,	s7,	1
	move	s7,	t0
	   j	main_b28
main_b34:
	move	t2,	s5
	li	t0,	2097248
	   add	t0,	sp,	t0
	sd	t2,	0(t0)
	li	t0,	2097248
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  slti	t0,	t2,	2
	bnez	t0,	main_b35
	   j	main_b36
main_b35:
	li	s7,	0
	   j	main_b37
main_b36:
	li	t0,	2097240
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  addi	t0,	t2,	1
	move	s7,	t0
	   j	main_b31
main_b37:
	  slti	t0,	s7,	2
	bnez	t0,	main_b38
	   j	main_b39
main_b38:
	li	s0,	0
	   j	main_b40
main_b39:
	li	t0,	2097248
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  addi	t0,	t2,	1
	move	s5,	t0
	   j	main_b34
main_b40:
	  slti	t0,	s0,	2
	bnez	t0,	main_b41
	   j	main_b42
main_b41:
	li	s5,	0
	   j	main_b43
main_b42:
	  addi	t0,	s7,	1
	move	s7,	t0
	   j	main_b37
main_b43:
	move	t0,	s5
	li	t1,	2097256
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	li	t0,	2097256
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	  slti	t0,	t0,	2
	bnez	t0,	main_b44
	   j	main_b45
main_b44:
	li	s5,	0
	   j	main_b46
main_b45:
	  addi	t0,	s0,	1
	move	s0,	t0
	   j	main_b40
main_b46:
	move	t0,	s5
	li	t1,	2097264
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	li	t0,	2097264
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	  slti	t0,	t0,	2
	bnez	t0,	main_b47
	   j	main_b48
main_b47:
	li	s5,	0
	   j	main_b49
main_b48:
	li	t0,	2097256
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	  addi	t0,	t0,	1
	move	s5,	t0
	   j	main_b43
main_b49:
	move	t2,	s5
	li	t0,	2097272
	   add	t0,	sp,	t0
	sd	t2,	0(t0)
	li	t0,	2097272
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  slti	t0,	t2,	2
	bnez	t0,	main_b50
	   j	main_b51
main_b50:
	li	t0,	0
	li	t1,	2097280
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	   j	main_b52
main_b51:
	li	t0,	2097264
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	  addi	t0,	t0,	1
	move	s5,	t0
	   j	main_b46
main_b52:
	li	t0,	2097280
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t1,	2097288
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	li	t0,	2097288
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	  slti	t0,	t0,	2
	bnez	t0,	main_b53
	   j	main_b54
main_b53:
	li	s8,	0
	   j	main_b55
main_b54:
	li	t0,	2097272
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  addi	t0,	t2,	1
	move	s5,	t0
	   j	main_b49
main_b55:
	  slti	t0,	s8,	2
	bnez	t0,	main_b56
	   j	main_b57
main_b56:
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	li	t0,	4
	   mul	t0,	s8,	t0
	   add	t1,	t1,	t0
	li	t2,	8
	li	t0,	2097288
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	   mul	t0,	t0,	t2
	   add	t1,	t1,	t0
	li	t0,	16
	li	t2,	2097272
	   add	t2,	sp,	t2
	ld	t2,	0(t2)
	   mul	t0,	t2,	t0
	   add	t1,	t1,	t0
	li	t2,	32
	li	t0,	2097264
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	   mul	t0,	t0,	t2
	   add	t1,	t1,	t0
	li	t2,	64
	li	t0,	2097256
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	   mul	t0,	t0,	t2
	   add	t1,	t1,	t0
	li	t0,	128
	   mul	t0,	s0,	t0
	   add	t1,	t1,	t0
	li	t0,	256
	   mul	t0,	s7,	t0
	   add	t1,	t1,	t0
	li	t0,	512
	li	t2,	2097248
	   add	t2,	sp,	t2
	ld	t2,	0(t2)
	   mul	t0,	t2,	t0
	   add	t1,	t1,	t0
	li	t3,	1024
	li	t0,	2097240
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	   mul	t0,	t2,	t3
	   add	t1,	t1,	t0
	li	t0,	2048
	   mul	t0,	s7,	t0
	   add	t1,	t1,	t0
	li	t0,	4096
	li	t2,	2097232
	   add	t2,	sp,	t2
	ld	t2,	0(t2)
	   mul	t0,	t2,	t0
	   add	t1,	t1,	t0
	li	t0,	8192
	   mul	t0,	s6,	t0
	   add	t1,	t1,	t0
	li	t0,	16384
	   mul	t0,	s4,	t0
	   add	t1,	t1,	t0
	li	t0,	32768
	li	t2,	2097224
	   add	t2,	sp,	t2
	ld	t2,	0(t2)
	   mul	t0,	t2,	t0
	   add	t1,	t1,	t0
	li	t0,	65536
	   mul	t0,	s5,	t0
	   add	t1,	t1,	t0
	li	t0,	131072
	   mul	t0,	s6,	t0
	   add	t1,	t1,	t0
	li	t0,	262144
	   mul	t0,	s4,	t0
	   add	t1,	t1,	t0
	li	t0,	524288
	   mul	t0,	s2,	t0
	   add	t1,	t1,	t0
	li	t2,	1048576
	li	t0,	2097296
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	   mul	t0,	t0,	t2
	   add	t1,	t1,	t0
	  addi	t1,	t1,	0
	sw	s3,	0(t1)
	  addi	t0,	s3,	1
	  addi	t1,	s8,	1
	move	s8,	t1
	move	s3,	t0
	   j	main_b55
main_b57:
	li	t0,	2097288
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	  addi	t0,	t0,	1
	li	t1,	2097280
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	   j	main_b52
