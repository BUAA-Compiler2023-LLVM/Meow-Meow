	.globl	u
	.bss
	.type	u,	@object
	.size	u,	4020
u:
	.zero	4020

	.globl	v
	.bss
	.type	v,	@object
	.size	v,	4020
v:
	.zero	4020

	.globl	c
	.bss
	.type	c,	@object
	.size	c,	4020
c:
	.zero	4020

	.globl	fa
	.bss
	.type	fa,	@object
	.size	fa,	4020
fa:
	.zero	4020

.section	.text
find:
find_b0:
	  addi	sp,	sp,	-24
	sd	s3,	16(sp)
	sd	s2,	8(sp)
	sd	ra,	0(sp)
	move	s2,	a0
	   j	find_b1
find_b1:
	la	s3,	fa
	li	t0,	4
	   mul	t0,	s2,	t0
	   add	s3,	s3,	t0
	lw	t0,	0(s3)
	   xor	t0,	s2,	t0
	  sltu	t0,	zero,	t0
	  xori	t0,	t0,	1
	bnez	t0,	find_b2
	   j	find_b3
find_b2:
	   j	find_b4
find_b3:
	lw	t0,	0(s3)
	move	a0,	t0
	call	find
	move	t0,	a0
	sw	t0,	0(s3)
	move	s2,	t0
	   j	find_b4
find_b4:
	move	t0,	s2
	move	a0,	t0
	ld	ra,	0(sp)
	ld	s2,	8(sp)
	ld	s3,	16(sp)
	  addi	sp,	sp,	24
	 ret
.section	.text
same:
same_b0:
	  addi	sp,	sp,	-24
	sd	s3,	16(sp)
	sd	s2,	8(sp)
	sd	ra,	0(sp)
	move	s3,	a1
	move	s2,	a0
	   j	same_b1
same_b1:
	move	a0,	s2
	call	find
	move	s2,	a0
	move	a0,	s3
	call	find
	move	t0,	a0
	   xor	t0,	s2,	t0
	  sltu	t0,	zero,	t0
	  xori	t0,	t0,	1
	bnez	t0,	same_b2
	   j	same_b3
same_b2:
	li	s2,	1
	   j	same_b4
same_b3:
	li	s2,	0
	   j	same_b4
same_b4:
	move	t0,	s2
	move	a0,	t0
	ld	ra,	0(sp)
	ld	s2,	8(sp)
	ld	s3,	16(sp)
	  addi	sp,	sp,	24
	 ret
.section	.text
prim:
prim_b0:
	  addi	sp,	sp,	-56
	sd	s6,	48(sp)
	sd	s3,	40(sp)
	sd	s4,	32(sp)
	sd	s5,	24(sp)
	sd	s7,	16(sp)
	sd	s2,	8(sp)
	sd	ra,	0(sp)
	li	s4,	0
	   j	prim_b1
prim_b1:
	  slti	t0,	s4,	0
	bnez	t0,	prim_b2
	   j	prim_b3
prim_b2:
	  addi	s3,	s4,	1
	move	s2,	s3
	   j	prim_b4
prim_b3:
	li	s2,	1
	   j	prim_b9
prim_b4:
	  slti	t0,	s2,	0
	bnez	t0,	prim_b5
	   j	prim_b6
prim_b5:
	la	s5,	c
	li	t0,	4
	   mul	t0,	s4,	t0
	   add	s5,	s5,	t0
	lw	t1,	0(s5)
	la	s6,	c
	li	t0,	4
	   mul	t0,	s2,	t0
	   add	s6,	s6,	t0
	lw	t0,	0(s6)
	   slt	t0,	t0,	t1
	bnez	t0,	prim_b7
	   j	prim_b8
prim_b6:
	move	s4,	s3
	   j	prim_b1
prim_b7:
	la	t3,	u
	li	t0,	4
	   mul	t0,	s4,	t0
	   add	t3,	t3,	t0
	lw	t2,	0(t3)
	la	t1,	u
	li	t0,	4
	   mul	t0,	s2,	t0
	   add	t1,	t1,	t0
	lw	t0,	0(t1)
	sw	t0,	0(t3)
	sw	t2,	0(t1)
	la	t2,	v
	li	t0,	4
	   mul	t0,	s4,	t0
	   add	t2,	t2,	t0
	lw	t1,	0(t2)
	la	t3,	v
	li	t0,	4
	   mul	t0,	s2,	t0
	   add	t3,	t3,	t0
	lw	t0,	0(t3)
	sw	t0,	0(t2)
	sw	t1,	0(t3)
	lw	t1,	0(s5)
	lw	t0,	0(s6)
	sw	t0,	0(s5)
	sw	t1,	0(s6)
	   j	prim_b8
prim_b8:
	  addi	t0,	s2,	1
	move	s2,	t0
	   j	prim_b4
prim_b9:
	li	t0,	0
	   slt	t0,	t0,	s2
	  xori	t0,	t0,	1
	bnez	t0,	prim_b10
	   j	prim_b11
prim_b10:
	la	t0,	fa
	li	t1,	4
	   mul	t1,	s2,	t1
	   add	t0,	t0,	t1
	sw	s2,	0(t0)
	  addi	t0,	s2,	1
	move	s2,	t0
	   j	prim_b9
prim_b11:
	li	s5,	0
	li	s2,	0
	   j	prim_b12
prim_b12:
	move	s4,	s5
	move	s3,	s2
	  slti	t0,	s3,	0
	bnez	t0,	prim_b13
	   j	prim_b15
prim_b13:
	la	s7,	u
	li	t0,	4
	   mul	t0,	s3,	t0
	   add	s7,	s7,	t0
	lw	t1,	0(s7)
	la	s6,	v
	li	t0,	4
	   mul	t0,	s3,	t0
	   add	s6,	s6,	t0
	lw	t0,	0(s6)
	move	a0,	t1
	move	a1,	t0
	call	same
	move	t0,	a0
	  xori	t0,	t0,	0
	  sltu	t0,	zero,	t0
	bnez	t0,	prim_b14
	   j	prim_b16
prim_b14:
	move	s5,	s4
	move	s2,	s3
	   j	prim_b12
prim_b15:
	move	a0,	s4
	ld	ra,	0(sp)
	ld	s2,	8(sp)
	ld	s7,	16(sp)
	ld	s5,	24(sp)
	ld	s4,	32(sp)
	ld	s3,	40(sp)
	ld	s6,	48(sp)
	  addi	sp,	sp,	56
	 ret
prim_b16:
	la	t1,	c
	li	t0,	4
	   mul	t0,	s3,	t0
	   add	t1,	t1,	t0
	lw	s2,	0(t1)
	lw	t0,	0(s7)
	move	a0,	t0
	call	find
	move	t0,	a0
	lw	t1,	0(s6)
	la	t3,	fa
	li	t2,	4
	   mul	t0,	t0,	t2
	   add	t3,	t3,	t0
	sw	t1,	0(t3)
	  addi	t1,	s3,	1
	   add	t0,	s4,	s2
	move	s5,	t0
	move	s2,	t1
	   j	prim_b12
.section	.text.startup
.globl	main
main:
main_b0:
	  addi	sp,	sp,	-136
	sd	s10,	128(sp)
	sd	s6,	120(sp)
	sd	s0,	112(sp)
	sd	s3,	104(sp)
	sd	s4,	96(sp)
	sd	s5,	88(sp)
	sd	s9,	80(sp)
	sd	s1,	72(sp)
	sd	s7,	64(sp)
	sd	s2,	56(sp)
	sd	s8,	48(sp)
	sd	ra,	0(sp)
	   j	main_b1
main_b1:
	call	getch
	move	t0,	a0
	li	s2,	0
	move	s1,	t0
	   j	main_b2
main_b2:
	move	t0,	s2
	sd	t0,	8(sp)
	  slti	t0,	s1,	48
	bnez	t0,	main_b3
	   j	main_b5
main_b3:
	  xori	t0,	s1,	45
	  sltu	t0,	zero,	t0
	  xori	t0,	t0,	1
	bnez	t0,	main_b7
	   j	main_b4
main_b4:
	ld	t0,	8(sp)
	move	s9,	t0
	   j	main_b8
main_b5:
	li	t0,	57
	   slt	t0,	t0,	s1
	bnez	t0,	main_b3
	   j	main_b6
main_b6:
	move	t0,	s1
	sd	t0,	16(sp)
	   j	main_b9
main_b7:
	li	s9,	1
	   j	main_b8
main_b8:
	move	s2,	s9
	call	getch
	move	t0,	a0
	move	s1,	t0
	   j	main_b2
main_b9:
	ld	t0,	16(sp)
	move	s2,	t0
	  slti	t0,	s2,	48
	  xori	t0,	t0,	1
	bnez	t0,	main_b12
	   j	main_b11
main_b10:
	call	getch
	move	t0,	a0
	sd	t0,	16(sp)
	   j	main_b9
main_b11:
	ld	t0,	8(sp)
	  xori	t0,	t0,	0
	  sltu	t0,	zero,	t0
	bnez	t0,	main_b13
	   j	main_b14
main_b12:
	li	t0,	57
	   slt	t0,	t0,	s2
	  xori	t0,	t0,	1
	bnez	t0,	main_b10
	   j	main_b11
main_b13:
	   j	main_b15
main_b14:
	   j	main_b15
main_b15:
	   j	main_b16
main_b16:
	call	getch
	move	t0,	a0
	li	s1,	0
	move	s2,	t0
	   j	main_b17
main_b17:
	  slti	t0,	s2,	48
	bnez	t0,	main_b18
	   j	main_b20
main_b18:
	  xori	t0,	s2,	45
	  sltu	t0,	zero,	t0
	  xori	t0,	t0,	1
	bnez	t0,	main_b22
	   j	main_b19
main_b19:
	move	s6,	s1
	   j	main_b23
main_b20:
	li	t0,	57
	   slt	t0,	t0,	s2
	bnez	t0,	main_b18
	   j	main_b21
main_b21:
	li	s7,	0
	move	s9,	s2
	   j	main_b24
main_b22:
	li	s6,	1
	   j	main_b23
main_b23:
	move	s1,	s6
	call	getch
	move	t0,	a0
	move	s2,	t0
	   j	main_b17
main_b24:
	  slti	t0,	s9,	48
	  xori	t0,	t0,	1
	bnez	t0,	main_b27
	   j	main_b26
main_b25:
	call	getch
	move	t0,	a0
	li	t1,	10
	   mul	t1,	s7,	t1
	   add	t1,	t1,	s9
	  addi	t1,	t1,	-48
	move	s7,	t1
	move	s9,	t0
	   j	main_b24
main_b26:
	  xori	t0,	s1,	0
	  sltu	t0,	zero,	t0
	bnez	t0,	main_b28
	   j	main_b29
main_b27:
	li	t0,	57
	   slt	t0,	t0,	s9
	  xori	t0,	t0,	1
	bnez	t0,	main_b25
	   j	main_b26
main_b28:
	li	t0,	0
	   sub	t0,	t0,	s7
	move	s7,	t0
	   j	main_b30
main_b29:
	   j	main_b30
main_b30:
	li	s1,	0
	   j	main_b31
main_b31:
	   slt	t0,	s1,	s7
	bnez	t0,	main_b32
	   j	main_b78
main_b32:
	   j	main_b33
main_b33:
	call	getch
	move	t0,	a0
	li	s6,	0
	move	s2,	t0
	   j	main_b34
main_b34:
	  slti	t0,	s2,	48
	bnez	t0,	main_b35
	   j	main_b37
main_b35:
	  xori	t0,	s2,	45
	  sltu	t0,	zero,	t0
	  xori	t0,	t0,	1
	bnez	t0,	main_b39
	   j	main_b36
main_b36:
	move	s5,	s6
	   j	main_b40
main_b37:
	li	t0,	57
	   slt	t0,	t0,	s2
	bnez	t0,	main_b35
	   j	main_b38
main_b38:
	li	t0,	0
	sd	t0,	24(sp)
	move	s4,	s2
	   j	main_b41
main_b39:
	li	s5,	1
	   j	main_b40
main_b40:
	move	s6,	s5
	call	getch
	move	t0,	a0
	move	s2,	t0
	   j	main_b34
main_b41:
	ld	t0,	24(sp)
	move	s2,	t0
	move	s9,	s4
	  slti	t0,	s9,	48
	  xori	t0,	t0,	1
	bnez	t0,	main_b44
	   j	main_b43
main_b42:
	call	getch
	move	t1,	a0
	li	t0,	10
	   mul	t0,	s2,	t0
	   add	t0,	t0,	s9
	  addi	t0,	t0,	-48
	sd	t0,	24(sp)
	move	s4,	t1
	   j	main_b41
main_b43:
	  xori	t0,	s6,	0
	  sltu	t0,	zero,	t0
	bnez	t0,	main_b45
	   j	main_b46
main_b44:
	li	t0,	57
	   slt	t0,	t0,	s9
	  xori	t0,	t0,	1
	bnez	t0,	main_b42
	   j	main_b43
main_b45:
	li	t0,	0
	   sub	t0,	t0,	s2
	move	s2,	t0
	   j	main_b47
main_b46:
	   j	main_b47
main_b47:
	move	t1,	s2
	la	t2,	u
	li	t0,	4
	   mul	t0,	s1,	t0
	   add	t2,	t2,	t0
	sw	t1,	0(t2)
	   j	main_b48
main_b48:
	call	getch
	move	t0,	a0
	li	s6,	0
	move	s2,	t0
	   j	main_b49
main_b49:
	  slti	t0,	s2,	48
	bnez	t0,	main_b50
	   j	main_b52
main_b50:
	  xori	t0,	s2,	45
	  sltu	t0,	zero,	t0
	  xori	t0,	t0,	1
	bnez	t0,	main_b54
	   j	main_b51
main_b51:
	move	s10,	s6
	   j	main_b55
main_b52:
	li	t0,	57
	   slt	t0,	t0,	s2
	bnez	t0,	main_b50
	   j	main_b53
main_b53:
	li	t0,	0
	sd	t0,	32(sp)
	move	s0,	s2
	   j	main_b56
main_b54:
	li	s10,	1
	   j	main_b55
main_b55:
	move	s6,	s10
	call	getch
	move	t0,	a0
	move	s2,	t0
	   j	main_b49
main_b56:
	ld	t0,	32(sp)
	move	s2,	t0
	move	s9,	s0
	  slti	t0,	s9,	48
	  xori	t0,	t0,	1
	bnez	t0,	main_b59
	   j	main_b58
main_b57:
	call	getch
	move	t1,	a0
	li	t0,	10
	   mul	t0,	s2,	t0
	   add	t0,	t0,	s9
	  addi	t0,	t0,	-48
	sd	t0,	32(sp)
	move	s0,	t1
	   j	main_b56
main_b58:
	  xori	t0,	s6,	0
	  sltu	t0,	zero,	t0
	bnez	t0,	main_b60
	   j	main_b61
main_b59:
	li	t0,	57
	   slt	t0,	t0,	s9
	  xori	t0,	t0,	1
	bnez	t0,	main_b57
	   j	main_b58
main_b60:
	li	t0,	0
	   sub	t0,	t0,	s2
	move	s2,	t0
	   j	main_b62
main_b61:
	   j	main_b62
main_b62:
	move	t2,	s2
	la	t0,	v
	li	t1,	4
	   mul	t1,	s1,	t1
	   add	t0,	t0,	t1
	sw	t2,	0(t0)
	   j	main_b63
main_b63:
	call	getch
	move	t0,	a0
	li	s9,	0
	move	s2,	t0
	   j	main_b64
main_b64:
	  slti	t0,	s2,	48
	bnez	t0,	main_b65
	   j	main_b67
main_b65:
	  xori	t0,	s2,	45
	  sltu	t0,	zero,	t0
	  xori	t0,	t0,	1
	bnez	t0,	main_b69
	   j	main_b66
main_b66:
	move	s3,	s9
	   j	main_b70
main_b67:
	li	t0,	57
	   slt	t0,	t0,	s2
	bnez	t0,	main_b65
	   j	main_b68
main_b68:
	li	s8,	0
	move	t0,	s2
	sd	t0,	40(sp)
	   j	main_b71
main_b69:
	li	s3,	1
	   j	main_b70
main_b70:
	move	s9,	s3
	call	getch
	move	t0,	a0
	move	s2,	t0
	   j	main_b64
main_b71:
	move	s2,	s8
	ld	t0,	40(sp)
	move	s6,	t0
	  slti	t0,	s6,	48
	  xori	t0,	t0,	1
	bnez	t0,	main_b74
	   j	main_b73
main_b72:
	call	getch
	move	t0,	a0
	li	t1,	10
	   mul	t1,	s2,	t1
	   add	t1,	t1,	s6
	  addi	t1,	t1,	-48
	move	s8,	t1
	sd	t0,	40(sp)
	   j	main_b71
main_b73:
	  xori	t0,	s9,	0
	  sltu	t0,	zero,	t0
	bnez	t0,	main_b75
	   j	main_b76
main_b74:
	li	t0,	57
	   slt	t0,	t0,	s6
	  xori	t0,	t0,	1
	bnez	t0,	main_b72
	   j	main_b73
main_b75:
	li	t0,	0
	   sub	t0,	t0,	s2
	move	s2,	t0
	   j	main_b77
main_b76:
	   j	main_b77
main_b77:
	move	t1,	s2
	la	t2,	c
	li	t0,	4
	   mul	t0,	s1,	t0
	   add	t2,	t2,	t0
	sw	t1,	0(t2)
	  addi	t0,	s1,	1
	move	s1,	t0
	   j	main_b31
main_b78:
	call	prim
	move	s2,	a0
	move	a0,	s2
	call	putint
	move	a0,	s2
	ld	ra,	0(sp)
	ld	s8,	48(sp)
	ld	s2,	56(sp)
	ld	s7,	64(sp)
	ld	s1,	72(sp)
	ld	s9,	80(sp)
	ld	s5,	88(sp)
	ld	s4,	96(sp)
	ld	s3,	104(sp)
	ld	s0,	112(sp)
	ld	s6,	120(sp)
	ld	s10,	128(sp)
	  addi	sp,	sp,	136
	 ret
