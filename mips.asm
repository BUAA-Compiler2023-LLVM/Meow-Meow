	.globl	A
	.data
	.type	A,	@object
	.size	A,	4
A:
	.word	1085276160

add:
b0:
	  addi	$sp,	$sp,	0
	fcvt.d.w	vrf4,	$a1
	move	vr0,	$a0
	   j	b1
b1:
	flw	vrf0,	0(A)
	  li	vrf1,	1061997773
	fadd.s	vrf2,	vrf0,	vrf1
	ssw	vrf2,	0(A)
	fcvt.d.w	vrf3,	vr0
	fadd.s	vrf5,	vrf3,	vrf4
	flw	vrf6,	0(A)
	fadd.s	vrf7,	vrf5,	vrf6
	move	$a0,	vrf7
	 ret
main:
b0:
	  addi	$sp,	$sp,	-4
	sw	$ra,	0($sp)
	call	getint
	move	vr1,	$a0
	  li	vr2,	5
	fcvt.d.w	vrf8,	vr2
	move	$a0,	vr1
	move	$a1,	vrf8
	call	add
	fcvt.d.w	vrf9,	$a0
	fcvt.d.w	vrf10,	vr1
	fadd.s	vrf11,	vrf10,	vrf9
	move	$a0,	vrf11
	call	putint
	fcvt.w.s	vr3,	vrf11,	rtz
	move	$a0,	vr3
	 ret
