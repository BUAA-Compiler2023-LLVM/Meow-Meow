.section	.text
sum:
sum_b0:
	  addi	sp,	sp,	-336
	sd	s4,	328(sp)
	sd	s7,	320(sp)
	sd	s1,	312(sp)
	sd	s8,	304(sp)
	sd	s5,	296(sp)
	sd	s6,	288(sp)
	sd	s2,	280(sp)
	sd	s9,	272(sp)
	sd	s0,	264(sp)
	sd	s3,	256(sp)
	sd	s10,	248(sp)
	sd	s11,	240(sp)
	lw	t3,	120(sp)
	lw	t0,	116(sp)
	sd	t0,	136(sp)
	lw	t0,	112(sp)
	sd	t0,	144(sp)
	lw	t0,	108(sp)
	sd	t0,	152(sp)
	lw	t0,	104(sp)
	sd	t0,	160(sp)
	lw	t1,	100(sp)
	sd	t1,	168(sp)
	lw	t1,	96(sp)
	sd	t1,	176(sp)
	lw	t1,	92(sp)
	lw	t0,	88(sp)
	sd	t0,	184(sp)
	lw	t0,	84(sp)
	sd	t0,	192(sp)
	lw	t0,	80(sp)
	sd	t0,	200(sp)
	move	t0,	a7
	sd	t0,	232(sp)
	move	t0,	a6
	sd	t0,	208(sp)
	move	t0,	a5
	sd	t0,	216(sp)
	move	t0,	a4
	move	t5,	a3
	move	t4,	a2
	move	t6,	a1
	move	t2,	a0
	sd	t2,	224(sp)
	  addi	s10,	sp,	0
	ld	t2,	224(sp)
	sw	t2,	0(s10)
	  addi	s9,	sp,	4
	sw	t6,	0(s9)
	  addi	t2,	sp,	8
	sd	t2,	80(sp)
	ld	t2,	80(sp)
	sw	t4,	0(t2)
	  addi	s8,	sp,	12
	sw	t5,	0(s8)
	  addi	s6,	sp,	16
	sw	t0,	0(s6)
	  addi	t2,	sp,	20
	sd	t2,	88(sp)
	ld	t2,	88(sp)
	ld	t0,	216(sp)
	sw	t0,	0(t2)
	  addi	s11,	sp,	24
	ld	t0,	208(sp)
	sw	t0,	0(s11)
	  addi	s1,	sp,	28
	ld	t0,	232(sp)
	sw	t0,	0(s1)
	  addi	s3,	sp,	32
	ld	t0,	200(sp)
	sw	t0,	0(s3)
	  addi	t2,	sp,	36
	sd	t2,	96(sp)
	ld	t2,	96(sp)
	ld	t0,	192(sp)
	sw	t0,	0(t2)
	  addi	s5,	sp,	40
	ld	t0,	184(sp)
	sw	t0,	0(s5)
	  addi	s4,	sp,	44
	sw	t1,	0(s4)
	  addi	t0,	sp,	48
	sd	t0,	104(sp)
	ld	t0,	104(sp)
	ld	t1,	176(sp)
	sw	t1,	0(t0)
	  addi	t0,	sp,	52
	sd	t0,	112(sp)
	ld	t0,	112(sp)
	ld	t1,	168(sp)
	sw	t1,	0(t0)
	  addi	t2,	sp,	56
	sd	t2,	120(sp)
	ld	t2,	120(sp)
	ld	t0,	160(sp)
	sw	t0,	0(t2)
	  addi	s0,	sp,	60
	ld	t0,	152(sp)
	sw	t0,	0(s0)
	  addi	s7,	sp,	64
	ld	t0,	144(sp)
	sw	t0,	0(s7)
	  addi	s2,	sp,	68
	ld	t0,	136(sp)
	sw	t0,	0(s2)
	  addi	t0,	sp,	72
	sd	t0,	128(sp)
	ld	t0,	128(sp)
	sw	t3,	0(t0)
	   j	sum_b1
sum_b1:
	lw	t0,	0(s10)
	lw	t1,	0(t0)
	lw	t0,	0(s9)
	  addi	t0,	t0,	8
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	ld	t2,	80(sp)
	lw	t0,	0(t2)
	  addi	t0,	t0,	4
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s8)
	  addi	t0,	t0,	8
	  addi	t0,	t0,	32
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s6)
	  addi	t0,	t0,	8
	  addi	t0,	t0,	16
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	ld	t2,	88(sp)
	lw	t0,	0(t2)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	32
	  addi	t0,	t0,	64
	  addi	t0,	t0,	128
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s11)
	  addi	t0,	t0,	8
	  addi	t0,	t0,	16
	  addi	t0,	t0,	32
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s1)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	64
	  addi	t0,	t0,	128
	  addi	t0,	t0,	256
	  addi	t0,	t0,	512
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s3)
	  addi	t0,	t0,	32
	  addi	t0,	t0,	64
	  addi	t0,	t0,	128
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	ld	t2,	96(sp)
	lw	t0,	0(t2)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	32
	  addi	t0,	t0,	256
	  addi	t0,	t0,	512
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	lw	t0,	0(s5)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	8
	  addi	t0,	t0,	64
	  addi	t0,	t0,	128
	  addi	t0,	t0,	256
	  addi	t0,	t0,	512
	  addi	t0,	t0,	1024
	lw	t0,	0(t0)
	   add	t2,	t1,	t0
	lw	t0,	0(s4)
	  addi	t0,	t0,	8
	  addi	t0,	t0,	16
	  addi	t0,	t0,	128
	  addi	t0,	t0,	1024
	li	t1,	2048
	   add	t0,	t0,	t1
	lw	t0,	0(t0)
	   add	t2,	t2,	t0
	ld	t0,	104(sp)
	lw	t0,	0(t0)
	  addi	t0,	t0,	32
	  addi	t0,	t0,	256
	  addi	t0,	t0,	512
	  addi	t0,	t0,	1024
	li	t1,	8192
	   add	t0,	t0,	t1
	li	t1,	16384
	   add	t0,	t0,	t1
	lw	t0,	0(t0)
	   add	t1,	t2,	t0
	ld	t0,	112(sp)
	lw	t0,	0(t0)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	8
	  addi	t0,	t0,	16
	  addi	t0,	t0,	32
	  addi	t0,	t0,	64
	  addi	t0,	t0,	128
	  addi	t0,	t0,	256
	lw	t0,	0(t0)
	   add	t1,	t1,	t0
	ld	t2,	120(sp)
	lw	t0,	0(t2)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	8
	  addi	t0,	t0,	16
	  addi	t0,	t0,	32
	  addi	t0,	t0,	64
	lw	t0,	0(t0)
	   add	t2,	t1,	t0
	lw	t0,	0(s0)
	  addi	t0,	t0,	16
	  addi	t0,	t0,	128
	  addi	t0,	t0,	256
	  addi	t0,	t0,	512
	li	t1,	16384
	   add	t0,	t0,	t1
	li	t1,	32768
	   add	t0,	t0,	t1
	li	t1,	65536
	   add	t0,	t0,	t1
	li	t1,	131072
	   add	t0,	t0,	t1
	lw	t0,	0(t0)
	   add	t2,	t2,	t0
	lw	t0,	0(s7)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	16
	  addi	t0,	t0,	64
	  addi	t0,	t0,	512
	  addi	t0,	t0,	1024
	li	t1,	2048
	   add	t0,	t0,	t1
	li	t1,	4096
	   add	t0,	t0,	t1
	li	t1,	8192
	   add	t0,	t0,	t1
	lw	t0,	0(t0)
	   add	t2,	t2,	t0
	lw	t0,	0(s2)
	  addi	t0,	t0,	4
	  addi	t0,	t0,	8
	  addi	t0,	t0,	64
	  addi	t0,	t0,	128
	  addi	t0,	t0,	256
	  addi	t0,	t0,	512
	li	t1,	8192
	   add	t0,	t0,	t1
	li	t1,	32768
	   add	t0,	t0,	t1
	li	t1,	262144
	   add	t0,	t0,	t1
	li	t1,	524288
	   add	t0,	t0,	t1
	lw	t0,	0(t0)
	   add	t1,	t2,	t0
	ld	t0,	128(sp)
	lw	t0,	0(t0)
	  addi	t0,	t0,	1024
	li	t2,	2048
	   add	t0,	t0,	t2
	li	t2,	16384
	   add	t0,	t0,	t2
	li	t2,	262144
	   add	t0,	t0,	t2
	lw	t0,	0(t0)
	   add	t0,	t1,	t0
	move	a0,	t0
	ld	s11,	240(sp)
	ld	s10,	248(sp)
	ld	s3,	256(sp)
	ld	s0,	264(sp)
	ld	s9,	272(sp)
	ld	s2,	280(sp)
	ld	s6,	288(sp)
	ld	s5,	296(sp)
	ld	s8,	304(sp)
	ld	s1,	312(sp)
	ld	s7,	320(sp)
	ld	s4,	328(sp)
	  addi	sp,	sp,	336
	 ret
.section	.text.startup
.globl	main
main:
main_b0:
	li	t0,	-2097536
	   add	sp,	sp,	t0
	li	t0,	2097528
	   add	t1,	sp,	t0
	sd	s4,	0(t1)
	li	t0,	2097520
	   add	t1,	sp,	t0
	sd	s7,	0(t1)
	li	t0,	2097512
	   add	t1,	sp,	t0
	sd	s1,	0(t1)
	li	t0,	2097504
	   add	t1,	sp,	t0
	sd	s8,	0(t1)
	li	t0,	2097496
	   add	t1,	sp,	t0
	sd	s6,	0(t1)
	li	t0,	2097488
	   add	t1,	sp,	t0
	sd	s5,	0(t1)
	li	t0,	2097480
	   add	t1,	sp,	t0
	sd	s2,	0(t1)
	li	t0,	2097472
	   add	t1,	sp,	t0
	sd	s0,	0(t1)
	li	t0,	2097464
	   add	t1,	sp,	t0
	sd	s3,	0(t1)
	li	t0,	2097200
	   add	t0,	sp,	t0
	sd	ra,	0(t0)
	  addi	t0,	sp,	44
	li	t1,	2097208
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	move	s2,	t0
	move	a0,	s2
	li	a1,	0
	li	t0,	2097152
	move	a2,	t0
	call	memset
	li	t0,	0
	sw	t0,	0(s2)
	li	s3,	0
	li	s2,	0
	   j	main_b1
	li	s2,	-2097208
	li	t1,	2097208
	li	t0,	2097216
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
main_b1:
	  slti	t0,	s3,	2
	bnez	t0,	main_b2
	   j	main_b3
main_b2:
	li	s4,	0
	   j	main_b4
main_b3:
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	move	t2,	t0
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	move	t1,	t0
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t3,	2097360
	   add	t3,	sp,	t3
	sd	t0,	0(t3)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t3,	2097456
	   add	t3,	sp,	t3
	sd	t0,	0(t3)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t3,	2097368
	   add	t3,	sp,	t3
	sd	t0,	0(t3)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t3,	2097376
	   add	t3,	sp,	t3
	sd	t0,	0(t3)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t3,	2097384
	   add	t3,	sp,	t3
	sd	t0,	0(t3)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	move	t3,	t0
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t4,	2097392
	   add	t4,	sp,	t4
	sd	t0,	0(t4)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t4,	2097400
	   add	t4,	sp,	t4
	sd	t0,	0(t4)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t4,	2097408
	   add	t4,	sp,	t4
	sd	t0,	0(t4)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t4,	2097416
	   add	t4,	sp,	t4
	sd	t0,	0(t4)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t4,	2097424
	   add	t4,	sp,	t4
	sd	t0,	0(t4)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	move	t4,	t0
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	move	t5,	t0
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t6,	2097432
	   add	t6,	sp,	t6
	sd	t0,	0(t6)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t6,	2097440
	   add	t6,	sp,	t6
	sd	t0,	0(t6)
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t6,	2097448
	   add	t6,	sp,	t6
	sd	t0,	0(t6)
	li	t0,	2097448
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	move	a0,	t2
	move	a1,	t1
	li	t1,	2097360
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	move	a2,	t0
	li	t1,	2097456
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	move	a3,	t0
	li	t1,	2097368
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	move	a4,	t0
	li	t1,	2097376
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	move	a5,	t0
	li	t1,	2097384
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	move	a6,	t0
	move	a7,	t3
	li	t1,	2097392
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	sw	t0,	0(sp)
	li	t1,	2097400
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	sw	t0,	4(sp)
	li	t1,	2097408
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	sw	t0,	8(sp)
	li	t1,	2097416
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	sw	t0,	12(sp)
	li	t1,	2097424
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	sw	t0,	16(sp)
	sw	t4,	20(sp)
	sw	t5,	24(sp)
	li	t1,	2097432
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	sw	t0,	28(sp)
	li	t1,	2097440
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	sw	t0,	32(sp)
	sw	t0,	36(sp)
	li	t0,	2097448
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	sw	t0,	40(sp)
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
	li	t0,	2097464
	   add	t1,	sp,	t0
	ld	s3,	0(t1)
	li	t0,	2097472
	   add	t1,	sp,	t0
	ld	s0,	0(t1)
	li	t0,	2097480
	   add	t1,	sp,	t0
	ld	s2,	0(t1)
	li	t0,	2097488
	   add	t1,	sp,	t0
	ld	s5,	0(t1)
	li	t0,	2097496
	   add	t1,	sp,	t0
	ld	s6,	0(t1)
	li	t0,	2097504
	   add	t1,	sp,	t0
	ld	s8,	0(t1)
	li	t0,	2097512
	   add	t1,	sp,	t0
	ld	s1,	0(t1)
	li	t0,	2097520
	   add	t1,	sp,	t0
	ld	s7,	0(t1)
	li	t0,	2097528
	   add	t1,	sp,	t0
	ld	s4,	0(t1)
	li	t0,	2097536
	   add	sp,	sp,	t0
	 ret
main_b4:
	move	t1,	s4
	li	t0,	2097224
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097224
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  slti	t0,	t1,	2
	bnez	t0,	main_b5
	   j	main_b6
main_b5:
	li	s4,	0
	   j	main_b7
main_b6:
	  addi	t0,	s3,	1
	move	s3,	t0
	   j	main_b1
main_b7:
	  slti	t0,	s4,	2
	bnez	t0,	main_b8
	   j	main_b9
main_b8:
	li	s5,	0
	   j	main_b10
main_b9:
	li	t0,	2097224
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t0,	t1,	1
	move	s4,	t0
	   j	main_b4
main_b10:
	  slti	t0,	s5,	2
	bnez	t0,	main_b11
	   j	main_b12
main_b11:
	li	s8,	0
	   j	main_b13
main_b12:
	  addi	t0,	s4,	1
	move	s4,	t0
	   j	main_b7
main_b13:
	  slti	t0,	s8,	2
	bnez	t0,	main_b14
	   j	main_b15
main_b14:
	li	s6,	0
	   j	main_b16
main_b15:
	  addi	t0,	s5,	1
	move	s5,	t0
	   j	main_b10
main_b16:
	  slti	t0,	s6,	2
	bnez	t0,	main_b17
	   j	main_b18
main_b17:
	li	s7,	0
	   j	main_b19
main_b18:
	  addi	t0,	s8,	1
	move	s8,	t0
	   j	main_b13
main_b19:
	  slti	t0,	s7,	2
	bnez	t0,	main_b20
	   j	main_b21
main_b20:
	li	s1,	0
	   j	main_b22
main_b21:
	  addi	t0,	s6,	1
	move	s6,	t0
	   j	main_b16
main_b22:
	  slti	t0,	s1,	2
	bnez	t0,	main_b23
	   j	main_b24
main_b23:
	li	s5,	0
	   j	main_b25
main_b24:
	  addi	t0,	s7,	1
	move	s7,	t0
	   j	main_b19
main_b25:
	move	t1,	s5
	li	t0,	2097232
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097232
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  slti	t0,	t1,	2
	bnez	t0,	main_b26
	   j	main_b27
main_b26:
	li	s0,	0
	   j	main_b28
main_b27:
	  addi	t0,	s1,	1
	move	s1,	t0
	   j	main_b22
main_b28:
	  slti	t0,	s0,	2
	bnez	t0,	main_b29
	   j	main_b30
main_b29:
	li	s5,	0
	   j	main_b31
main_b30:
	li	t0,	2097232
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t0,	t1,	1
	move	s5,	t0
	   j	main_b25
main_b31:
	move	t1,	s5
	li	t0,	2097240
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097240
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  slti	t0,	t1,	2
	bnez	t0,	main_b32
	   j	main_b33
main_b32:
	li	s5,	0
	   j	main_b34
main_b33:
	  addi	t0,	s0,	1
	move	s0,	t0
	   j	main_b28
main_b34:
	  slti	t0,	s5,	2
	bnez	t0,	main_b35
	   j	main_b36
main_b35:
	li	s5,	0
	   j	main_b37
main_b36:
	li	t0,	2097240
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t0,	t1,	1
	move	s5,	t0
	   j	main_b31
main_b37:
	  slti	t0,	s5,	2
	bnez	t0,	main_b38
	   j	main_b39
main_b38:
	li	s6,	0
	   j	main_b40
main_b39:
	  addi	t0,	s5,	1
	move	s5,	t0
	   j	main_b34
main_b40:
	move	t1,	s6
	li	t0,	2097248
	   add	t0,	sp,	t0
	sd	t1,	0(t0)
	li	t0,	2097248
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  slti	t0,	t1,	2
	bnez	t0,	main_b41
	   j	main_b42
main_b41:
	li	s0,	0
	move	t0,	s2
	li	t1,	2097256
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	   j	main_b43
main_b42:
	  addi	t0,	s5,	1
	move	s5,	t0
	   j	main_b37
main_b43:
	li	t0,	2097256
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t1,	2097264
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	  slti	t0,	s0,	2
	bnez	t0,	main_b44
	   j	main_b45
main_b44:
	li	s2,	0
	li	t0,	2097264
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t1,	2097272
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	   j	main_b46
main_b45:
	li	t0,	2097248
	   add	t0,	sp,	t0
	ld	t1,	0(t0)
	  addi	t0,	t1,	1
	move	s6,	t0
	li	t0,	2097264
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	move	s2,	t0
	   j	main_b40
main_b46:
	move	t2,	s2
	li	t0,	2097280
	   add	t0,	sp,	t0
	sd	t2,	0(t0)
	li	t0,	2097272
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t1,	2097288
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	li	t0,	2097280
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  slti	t0,	t2,	2
	bnez	t0,	main_b47
	   j	main_b48
main_b47:
	li	s2,	0
	li	t0,	2097288
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t1,	2097296
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	   j	main_b49
main_b48:
	  addi	t0,	s0,	1
	move	s0,	t0
	li	t0,	2097288
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t1,	2097256
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	   j	main_b43
main_b49:
	move	t2,	s2
	li	t0,	2097304
	   add	t0,	sp,	t0
	sd	t2,	0(t0)
	li	t0,	2097296
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t1,	2097312
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	li	t0,	2097304
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  slti	t0,	t2,	2
	bnez	t0,	main_b50
	   j	main_b51
main_b50:
	li	t0,	0
	li	t1,	2097320
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	li	t0,	2097312
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	move	s2,	t0
	   j	main_b52
main_b51:
	li	t0,	2097280
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  addi	t0,	t2,	1
	move	s2,	t0
	li	t0,	2097312
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t1,	2097272
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	   j	main_b46
main_b52:
	li	t0,	2097320
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t1,	2097328
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	move	t0,	s2
	li	t1,	2097336
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	li	t0,	2097328
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	  slti	t0,	t0,	2
	bnez	t0,	main_b53
	   j	main_b54
main_b53:
	li	s2,	0
	li	t0,	2097336
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t1,	2097344
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	   j	main_b55
main_b54:
	li	t0,	2097304
	   add	t0,	sp,	t0
	ld	t2,	0(t0)
	  addi	t0,	t2,	1
	move	s2,	t0
	li	t0,	2097336
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t1,	2097296
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	   j	main_b49
main_b55:
	li	t0,	2097344
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t1,	2097352
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	  slti	t0,	s2,	2
	bnez	t0,	main_b56
	   j	main_b57
main_b56:
	li	t0,	2097208
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	li	t1,	4
	   mul	t1,	s2,	t1
	   add	t0,	t0,	t1
	li	t2,	8
	li	t1,	2097328
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	   mul	t1,	t0,	t2
	   add	t0,	t0,	t1
	li	t1,	16
	li	t2,	2097304
	   add	t2,	sp,	t2
	ld	t2,	0(t2)
	   mul	t1,	t2,	t1
	   add	t0,	t0,	t1
	li	t1,	32
	li	t2,	2097280
	   add	t2,	sp,	t2
	ld	t2,	0(t2)
	   mul	t1,	t2,	t1
	   add	t0,	t0,	t1
	li	t1,	64
	   mul	t1,	s0,	t1
	   add	t0,	t0,	t1
	li	t2,	128
	li	t1,	2097248
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	   mul	t1,	t1,	t2
	   add	t0,	t0,	t1
	li	t1,	256
	   mul	t1,	s5,	t1
	   add	t0,	t0,	t1
	li	t1,	512
	   mul	t1,	s5,	t1
	   add	t0,	t0,	t1
	li	t2,	1024
	li	t1,	2097240
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	   mul	t1,	t1,	t2
	   add	t0,	t0,	t1
	li	t1,	2048
	   mul	t1,	s0,	t1
	   add	t0,	t0,	t1
	li	t2,	4096
	li	t1,	2097232
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	   mul	t1,	t1,	t2
	   add	t0,	t0,	t1
	li	t1,	8192
	   mul	t1,	s1,	t1
	   add	t0,	t0,	t1
	li	t1,	16384
	   mul	t1,	s7,	t1
	   add	t0,	t0,	t1
	li	t1,	32768
	   mul	t1,	s6,	t1
	   add	t0,	t0,	t1
	li	t1,	65536
	   mul	t1,	s8,	t1
	   add	t0,	t0,	t1
	li	t1,	131072
	   mul	t1,	s5,	t1
	   add	t0,	t0,	t1
	li	t1,	262144
	   mul	t1,	s4,	t1
	   add	t0,	t0,	t1
	li	t2,	524288
	li	t1,	2097224
	   add	t1,	sp,	t1
	ld	t1,	0(t1)
	   mul	t1,	t1,	t2
	   add	t0,	t0,	t1
	li	t1,	1048576
	   mul	t1,	s3,	t1
	   add	t0,	t0,	t1
	li	t1,	2097352
	   add	t1,	sp,	t1
	ld	t0,	0(t1)
	sw	t0,	0(t0)
	li	t0,	2097352
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	  addi	t0,	t0,	1
	  addi	t1,	s2,	1
	move	s2,	t1
	li	t1,	2097344
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	   j	main_b55
main_b57:
	li	t0,	2097328
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	  addi	t0,	t0,	1
	li	t1,	2097320
	   add	t1,	sp,	t1
	sd	t0,	0(t1)
	li	t0,	2097352
	   add	t0,	sp,	t0
	ld	t0,	0(t0)
	move	s2,	t0
	   j	main_b52
