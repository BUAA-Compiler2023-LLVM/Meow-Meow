.section	.text
sum:
sum_b0:
	  addi	sp,	sp,	-80
	lw	vr37,	120(sp)
	lw	vr35,	116(sp)
	lw	vr33,	112(sp)
	lw	vr31,	108(sp)
	lw	vr29,	104(sp)
	lw	vr27,	100(sp)
	lw	vr25,	96(sp)
	lw	vr23,	92(sp)
	lw	vr21,	88(sp)
	lw	vr19,	84(sp)
	lw	vr17,	80(sp)
	move	vr15,	a7
	move	vr13,	a6
	move	vr11,	a5
	move	vr9,	a4
	move	vr7,	a3
	move	vr5,	a2
	move	vr3,	a1
	move	vr1,	a0
	  addi	vr0,	sp,	0
	sw	vr1,	0(vr0)
	  addi	vr2,	sp,	4
	sw	vr3,	0(vr2)
	  addi	vr4,	sp,	8
	sw	vr5,	0(vr4)
	  addi	vr6,	sp,	12
	sw	vr7,	0(vr6)
	  addi	vr8,	sp,	16
	sw	vr9,	0(vr8)
	  addi	vr10,	sp,	20
	sw	vr11,	0(vr10)
	  addi	vr12,	sp,	24
	sw	vr13,	0(vr12)
	  addi	vr14,	sp,	28
	sw	vr15,	0(vr14)
	  addi	vr16,	sp,	32
	sw	vr17,	0(vr16)
	  addi	vr18,	sp,	36
	sw	vr19,	0(vr18)
	  addi	vr20,	sp,	40
	sw	vr21,	0(vr20)
	  addi	vr22,	sp,	44
	sw	vr23,	0(vr22)
	  addi	vr24,	sp,	48
	sw	vr25,	0(vr24)
	  addi	vr26,	sp,	52
	sw	vr27,	0(vr26)
	  addi	vr28,	sp,	56
	sw	vr29,	0(vr28)
	  addi	vr30,	sp,	60
	sw	vr31,	0(vr30)
	  addi	vr32,	sp,	64
	sw	vr33,	0(vr32)
	  addi	vr34,	sp,	68
	sw	vr35,	0(vr34)
	  addi	vr36,	sp,	72
	sw	vr37,	0(vr36)
	   j	sum_b1
sum_b1:
	lw	vr38,	0(vr0)
	move	vr39,	vr38
	  addi	vr39,	vr39,	0
	lw	vr40,	0(vr39)
	lw	vr41,	0(vr2)
	move	vr42,	vr41
	  addi	vr42,	vr42,	0
	  addi	vr42,	vr42,	8
	lw	vr43,	0(vr42)
	   add	vr44,	vr40,	vr43
	lw	vr45,	0(vr4)
	move	vr46,	vr45
	  addi	vr46,	vr46,	4
	  addi	vr46,	vr46,	0
	  addi	vr46,	vr46,	0
	lw	vr47,	0(vr46)
	   add	vr48,	vr44,	vr47
	lw	vr49,	0(vr6)
	move	vr50,	vr49
	  addi	vr50,	vr50,	0
	  addi	vr50,	vr50,	8
	  addi	vr50,	vr50,	0
	  addi	vr50,	vr50,	32
	lw	vr51,	0(vr50)
	   add	vr52,	vr48,	vr51
	lw	vr53,	0(vr8)
	move	vr54,	vr53
	  addi	vr54,	vr54,	0
	  addi	vr54,	vr54,	8
	  addi	vr54,	vr54,	16
	  addi	vr54,	vr54,	0
	  addi	vr54,	vr54,	0
	lw	vr55,	0(vr54)
	   add	vr56,	vr52,	vr55
	lw	vr57,	0(vr10)
	move	vr58,	vr57
	  addi	vr58,	vr58,	4
	  addi	vr58,	vr58,	0
	  addi	vr58,	vr58,	0
	  addi	vr58,	vr58,	32
	  addi	vr58,	vr58,	64
	  addi	vr58,	vr58,	128
	lw	vr59,	0(vr58)
	   add	vr60,	vr56,	vr59
	lw	vr61,	0(vr12)
	move	vr62,	vr61
	  addi	vr62,	vr62,	0
	  addi	vr62,	vr62,	8
	  addi	vr62,	vr62,	16
	  addi	vr62,	vr62,	32
	  addi	vr62,	vr62,	0
	  addi	vr62,	vr62,	0
	  addi	vr62,	vr62,	0
	lw	vr63,	0(vr62)
	   add	vr64,	vr60,	vr63
	lw	vr65,	0(vr14)
	move	vr66,	vr65
	  addi	vr66,	vr66,	4
	  addi	vr66,	vr66,	0
	  addi	vr66,	vr66,	0
	  addi	vr66,	vr66,	0
	  addi	vr66,	vr66,	64
	  addi	vr66,	vr66,	128
	  addi	vr66,	vr66,	256
	  addi	vr66,	vr66,	512
	lw	vr67,	0(vr66)
	   add	vr68,	vr64,	vr67
	lw	vr69,	0(vr16)
	move	vr70,	vr69
	  addi	vr70,	vr70,	0
	  addi	vr70,	vr70,	0
	  addi	vr70,	vr70,	0
	  addi	vr70,	vr70,	32
	  addi	vr70,	vr70,	64
	  addi	vr70,	vr70,	128
	  addi	vr70,	vr70,	0
	  addi	vr70,	vr70,	0
	  addi	vr70,	vr70,	0
	lw	vr71,	0(vr70)
	   add	vr72,	vr68,	vr71
	lw	vr73,	0(vr18)
	move	vr74,	vr73
	  addi	vr74,	vr74,	4
	  addi	vr74,	vr74,	0
	  addi	vr74,	vr74,	0
	  addi	vr74,	vr74,	32
	  addi	vr74,	vr74,	0
	  addi	vr74,	vr74,	0
	  addi	vr74,	vr74,	256
	  addi	vr74,	vr74,	512
	  addi	vr74,	vr74,	0
	  addi	vr74,	vr74,	0
	lw	vr75,	0(vr74)
	   add	vr76,	vr72,	vr75
	lw	vr77,	0(vr20)
	move	vr78,	vr77
	  addi	vr78,	vr78,	4
	  addi	vr78,	vr78,	8
	  addi	vr78,	vr78,	0
	  addi	vr78,	vr78,	0
	  addi	vr78,	vr78,	64
	  addi	vr78,	vr78,	128
	  addi	vr78,	vr78,	256
	  addi	vr78,	vr78,	512
	  addi	vr78,	vr78,	1024
	  addi	vr78,	vr78,	0
	  addi	vr78,	vr78,	0
	lw	vr79,	0(vr78)
	   add	vr80,	vr76,	vr79
	lw	vr81,	0(vr22)
	move	vr82,	vr81
	  addi	vr82,	vr82,	0
	  addi	vr82,	vr82,	8
	  addi	vr82,	vr82,	16
	  addi	vr82,	vr82,	0
	  addi	vr82,	vr82,	0
	  addi	vr82,	vr82,	128
	  addi	vr82,	vr82,	0
	  addi	vr82,	vr82,	0
	  addi	vr82,	vr82,	1024
	  addi	vr82,	vr82,	2048
	  addi	vr82,	vr82,	0
	  addi	vr82,	vr82,	0
	lw	vr83,	0(vr82)
	   add	vr84,	vr80,	vr83
	lw	vr85,	0(vr24)
	move	vr86,	vr85
	  addi	vr86,	vr86,	0
	  addi	vr86,	vr86,	0
	  addi	vr86,	vr86,	0
	  addi	vr86,	vr86,	32
	  addi	vr86,	vr86,	0
	  addi	vr86,	vr86,	0
	  addi	vr86,	vr86,	256
	  addi	vr86,	vr86,	512
	  addi	vr86,	vr86,	1024
	  addi	vr86,	vr86,	0
	  addi	vr86,	vr86,	0
	  addi	vr86,	vr86,	8192
	  addi	vr86,	vr86,	16384
	lw	vr87,	0(vr86)
	   add	vr88,	vr84,	vr87
	lw	vr89,	0(vr26)
	move	vr90,	vr89
	  addi	vr90,	vr90,	4
	  addi	vr90,	vr90,	8
	  addi	vr90,	vr90,	16
	  addi	vr90,	vr90,	32
	  addi	vr90,	vr90,	64
	  addi	vr90,	vr90,	128
	  addi	vr90,	vr90,	256
	  addi	vr90,	vr90,	0
	  addi	vr90,	vr90,	0
	  addi	vr90,	vr90,	0
	  addi	vr90,	vr90,	0
	  addi	vr90,	vr90,	0
	  addi	vr90,	vr90,	0
	  addi	vr90,	vr90,	0
	lw	vr91,	0(vr90)
	   add	vr92,	vr88,	vr91
	lw	vr93,	0(vr28)
	move	vr94,	vr93
	  addi	vr94,	vr94,	4
	  addi	vr94,	vr94,	8
	  addi	vr94,	vr94,	16
	  addi	vr94,	vr94,	32
	  addi	vr94,	vr94,	64
	  addi	vr94,	vr94,	0
	  addi	vr94,	vr94,	0
	  addi	vr94,	vr94,	0
	  addi	vr94,	vr94,	0
	  addi	vr94,	vr94,	0
	  addi	vr94,	vr94,	0
	  addi	vr94,	vr94,	0
	  addi	vr94,	vr94,	0
	  addi	vr94,	vr94,	0
	  addi	vr94,	vr94,	0
	lw	vr95,	0(vr94)
	   add	vr96,	vr92,	vr95
	lw	vr97,	0(vr30)
	move	vr98,	vr97
	  addi	vr98,	vr98,	0
	  addi	vr98,	vr98,	0
	  addi	vr98,	vr98,	16
	  addi	vr98,	vr98,	0
	  addi	vr98,	vr98,	0
	  addi	vr98,	vr98,	128
	  addi	vr98,	vr98,	256
	  addi	vr98,	vr98,	512
	  addi	vr98,	vr98,	0
	  addi	vr98,	vr98,	0
	  addi	vr98,	vr98,	0
	  addi	vr98,	vr98,	0
	  addi	vr98,	vr98,	16384
	  addi	vr98,	vr98,	32768
	  addi	vr98,	vr98,	65536
	  addi	vr98,	vr98,	131072
	lw	vr99,	0(vr98)
	   add	vr100,	vr96,	vr99
	lw	vr101,	0(vr32)
	move	vr102,	vr101
	  addi	vr102,	vr102,	4
	  addi	vr102,	vr102,	0
	  addi	vr102,	vr102,	16
	  addi	vr102,	vr102,	0
	  addi	vr102,	vr102,	64
	  addi	vr102,	vr102,	0
	  addi	vr102,	vr102,	0
	  addi	vr102,	vr102,	512
	  addi	vr102,	vr102,	1024
	  addi	vr102,	vr102,	2048
	  addi	vr102,	vr102,	4096
	  addi	vr102,	vr102,	8192
	  addi	vr102,	vr102,	0
	  addi	vr102,	vr102,	0
	  addi	vr102,	vr102,	0
	  addi	vr102,	vr102,	0
	  addi	vr102,	vr102,	0
	lw	vr103,	0(vr102)
	   add	vr104,	vr100,	vr103
	lw	vr105,	0(vr34)
	move	vr106,	vr105
	  addi	vr106,	vr106,	4
	  addi	vr106,	vr106,	8
	  addi	vr106,	vr106,	0
	  addi	vr106,	vr106,	0
	  addi	vr106,	vr106,	64
	  addi	vr106,	vr106,	128
	  addi	vr106,	vr106,	256
	  addi	vr106,	vr106,	512
	  addi	vr106,	vr106,	0
	  addi	vr106,	vr106,	0
	  addi	vr106,	vr106,	0
	  addi	vr106,	vr106,	8192
	  addi	vr106,	vr106,	0
	  addi	vr106,	vr106,	32768
	  addi	vr106,	vr106,	0
	  addi	vr106,	vr106,	0
	  addi	vr106,	vr106,	262144
	  addi	vr106,	vr106,	524288
	lw	vr107,	0(vr106)
	   add	vr108,	vr104,	vr107
	lw	vr109,	0(vr36)
	move	vr110,	vr109
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	1024
	  addi	vr110,	vr110,	2048
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	16384
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	262144
	  addi	vr110,	vr110,	0
	  addi	vr110,	vr110,	0
	lw	vr111,	0(vr110)
	   add	vr112,	vr108,	vr111
	move	a0,	vr112
	  addi	sp,	sp,	80
	 ret
.section	.text.startup
.globl	main
main:
main_b0:
	   add	sp,	sp,	vr322
	li	vr318,	2097200
	   add	vr319,	sp,	vr318
	sd	ra,	0(vr319)
	  addi	vr113,	sp,	44
	move	vr114,	vr113
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	  addi	vr114,	vr114,	0
	move	a0,	vr114
	li	a1,	0
	li	vr115,	2097152
	move	a2,	vr115
	call	memset
	li	vr116,	0
	sw	vr116,	0(vr114)
	li	vr117,	0
	li	vr118,	0
	   j	main_b1
	li	vr322,	-2097208
	li	vr323,	2097208
main_b1:
	move	vr119,	vr117
	move	vr120,	vr118
	  slti	vr121,	vr119,	2
	bnez	vr121,	main_b2
	   j	main_b3
main_b2:
	li	vr122,	0
	move	vr123,	vr120
	   j	main_b4
main_b3:
	move	vr124,	vr113
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	  addi	vr124,	vr124,	0
	move	vr125,	vr124
	  addi	vr125,	vr125,	0
	  addi	vr125,	vr125,	0
	move	vr126,	vr113
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	  addi	vr126,	vr126,	0
	move	vr127,	vr126
	  addi	vr127,	vr127,	0
	  addi	vr127,	vr127,	0
	move	vr128,	vr113
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	  addi	vr128,	vr128,	0
	move	vr129,	vr128
	  addi	vr129,	vr129,	0
	  addi	vr129,	vr129,	0
	move	vr130,	vr113
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	  addi	vr130,	vr130,	0
	move	vr131,	vr130
	  addi	vr131,	vr131,	0
	  addi	vr131,	vr131,	0
	move	vr132,	vr113
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	  addi	vr132,	vr132,	0
	move	vr133,	vr132
	  addi	vr133,	vr133,	0
	  addi	vr133,	vr133,	0
	move	vr134,	vr113
	  addi	vr134,	vr134,	0
	  addi	vr134,	vr134,	0
	  addi	vr134,	vr134,	0
	  addi	vr134,	vr134,	0
	  addi	vr134,	vr134,	0
	  addi	vr134,	vr134,	0
	  addi	vr134,	vr134,	0
	  addi	vr134,	vr134,	0
	  addi	vr134,	vr134,	0
	  addi	vr134,	vr134,	0
	  addi	vr134,	vr134,	0
	  addi	vr134,	vr134,	0
	  addi	vr134,	vr134,	0
	  addi	vr134,	vr134,	0
	move	vr135,	vr134
	  addi	vr135,	vr135,	0
	  addi	vr135,	vr135,	0
	move	vr136,	vr113
	  addi	vr136,	vr136,	0
	  addi	vr136,	vr136,	0
	  addi	vr136,	vr136,	0
	  addi	vr136,	vr136,	0
	  addi	vr136,	vr136,	0
	  addi	vr136,	vr136,	0
	  addi	vr136,	vr136,	0
	  addi	vr136,	vr136,	0
	  addi	vr136,	vr136,	0
	  addi	vr136,	vr136,	0
	  addi	vr136,	vr136,	0
	  addi	vr136,	vr136,	0
	  addi	vr136,	vr136,	0
	move	vr137,	vr136
	  addi	vr137,	vr137,	0
	  addi	vr137,	vr137,	0
	move	vr138,	vr113
	  addi	vr138,	vr138,	0
	  addi	vr138,	vr138,	0
	  addi	vr138,	vr138,	0
	  addi	vr138,	vr138,	0
	  addi	vr138,	vr138,	0
	  addi	vr138,	vr138,	0
	  addi	vr138,	vr138,	0
	  addi	vr138,	vr138,	0
	  addi	vr138,	vr138,	0
	  addi	vr138,	vr138,	0
	  addi	vr138,	vr138,	0
	  addi	vr138,	vr138,	0
	move	vr139,	vr138
	  addi	vr139,	vr139,	0
	  addi	vr139,	vr139,	0
	move	vr140,	vr113
	  addi	vr140,	vr140,	0
	  addi	vr140,	vr140,	0
	  addi	vr140,	vr140,	0
	  addi	vr140,	vr140,	0
	  addi	vr140,	vr140,	0
	  addi	vr140,	vr140,	0
	  addi	vr140,	vr140,	0
	  addi	vr140,	vr140,	0
	  addi	vr140,	vr140,	0
	  addi	vr140,	vr140,	0
	  addi	vr140,	vr140,	0
	move	vr141,	vr140
	  addi	vr141,	vr141,	0
	  addi	vr141,	vr141,	0
	move	vr142,	vr113
	  addi	vr142,	vr142,	0
	  addi	vr142,	vr142,	0
	  addi	vr142,	vr142,	0
	  addi	vr142,	vr142,	0
	  addi	vr142,	vr142,	0
	  addi	vr142,	vr142,	0
	  addi	vr142,	vr142,	0
	  addi	vr142,	vr142,	0
	  addi	vr142,	vr142,	0
	  addi	vr142,	vr142,	0
	move	vr143,	vr142
	  addi	vr143,	vr143,	0
	  addi	vr143,	vr143,	0
	move	vr144,	vr113
	  addi	vr144,	vr144,	0
	  addi	vr144,	vr144,	0
	  addi	vr144,	vr144,	0
	  addi	vr144,	vr144,	0
	  addi	vr144,	vr144,	0
	  addi	vr144,	vr144,	0
	  addi	vr144,	vr144,	0
	  addi	vr144,	vr144,	0
	  addi	vr144,	vr144,	0
	move	vr145,	vr144
	  addi	vr145,	vr145,	0
	  addi	vr145,	vr145,	0
	move	vr146,	vr113
	  addi	vr146,	vr146,	0
	  addi	vr146,	vr146,	0
	  addi	vr146,	vr146,	0
	  addi	vr146,	vr146,	0
	  addi	vr146,	vr146,	0
	  addi	vr146,	vr146,	0
	  addi	vr146,	vr146,	0
	  addi	vr146,	vr146,	0
	move	vr147,	vr146
	  addi	vr147,	vr147,	0
	  addi	vr147,	vr147,	0
	move	vr148,	vr113
	  addi	vr148,	vr148,	0
	  addi	vr148,	vr148,	0
	  addi	vr148,	vr148,	0
	  addi	vr148,	vr148,	0
	  addi	vr148,	vr148,	0
	  addi	vr148,	vr148,	0
	  addi	vr148,	vr148,	0
	move	vr149,	vr148
	  addi	vr149,	vr149,	0
	  addi	vr149,	vr149,	0
	move	vr150,	vr113
	  addi	vr150,	vr150,	0
	  addi	vr150,	vr150,	0
	  addi	vr150,	vr150,	0
	  addi	vr150,	vr150,	0
	  addi	vr150,	vr150,	0
	  addi	vr150,	vr150,	0
	move	vr151,	vr150
	  addi	vr151,	vr151,	0
	  addi	vr151,	vr151,	0
	move	vr152,	vr113
	  addi	vr152,	vr152,	0
	  addi	vr152,	vr152,	0
	  addi	vr152,	vr152,	0
	  addi	vr152,	vr152,	0
	  addi	vr152,	vr152,	0
	move	vr153,	vr152
	  addi	vr153,	vr153,	0
	  addi	vr153,	vr153,	0
	move	vr154,	vr113
	  addi	vr154,	vr154,	0
	  addi	vr154,	vr154,	0
	  addi	vr154,	vr154,	0
	  addi	vr154,	vr154,	0
	move	vr155,	vr154
	  addi	vr155,	vr155,	0
	  addi	vr155,	vr155,	0
	move	vr156,	vr113
	  addi	vr156,	vr156,	0
	  addi	vr156,	vr156,	0
	  addi	vr156,	vr156,	0
	move	vr157,	vr156
	  addi	vr157,	vr157,	0
	  addi	vr157,	vr157,	0
	move	vr158,	vr113
	  addi	vr158,	vr158,	0
	  addi	vr158,	vr158,	0
	move	vr159,	vr158
	  addi	vr159,	vr159,	0
	  addi	vr159,	vr159,	0
	move	a0,	vr125
	move	a1,	vr127
	move	a2,	vr129
	move	a3,	vr131
	move	a4,	vr133
	move	a5,	vr135
	move	a6,	vr137
	move	a7,	vr139
	sw	vr141,	0(sp)
	sw	vr143,	4(sp)
	sw	vr145,	8(sp)
	sw	vr147,	12(sp)
	sw	vr149,	16(sp)
	sw	vr151,	20(sp)
	sw	vr153,	24(sp)
	sw	vr155,	28(sp)
	sw	vr157,	32(sp)
	sw	vr159,	36(sp)
	sw	vr158,	40(sp)
	call	sum
	move	vr160,	a0
	move	a0,	vr160
	call	putint
	li	a0,	10
	call	putch
	li	a0,	0
	call	putint
	li	a0,	0
	li	vr320,	2097200
	   add	vr321,	sp,	vr320
	ld	ra,	0(vr321)
	   add	sp,	sp,	vr323
	 ret
main_b4:
	move	vr161,	vr122
	move	vr162,	vr123
	  slti	vr163,	vr161,	2
	bnez	vr163,	main_b5
	   j	main_b6
main_b5:
	li	vr164,	0
	move	vr165,	vr162
	   j	main_b7
main_b6:
	  addi	vr166,	vr119,	1
	move	vr117,	vr166
	move	vr118,	vr162
	   j	main_b1
main_b7:
	move	vr167,	vr164
	move	vr168,	vr165
	  slti	vr169,	vr167,	2
	bnez	vr169,	main_b8
	   j	main_b9
main_b8:
	li	vr170,	0
	move	vr171,	vr168
	   j	main_b10
main_b9:
	  addi	vr172,	vr161,	1
	move	vr122,	vr172
	move	vr123,	vr168
	   j	main_b4
main_b10:
	move	vr173,	vr170
	move	vr174,	vr171
	  slti	vr175,	vr173,	2
	bnez	vr175,	main_b11
	   j	main_b12
main_b11:
	li	vr176,	0
	move	vr177,	vr174
	   j	main_b13
main_b12:
	  addi	vr178,	vr167,	1
	move	vr164,	vr178
	move	vr165,	vr174
	   j	main_b7
main_b13:
	move	vr179,	vr176
	move	vr180,	vr177
	  slti	vr181,	vr179,	2
	bnez	vr181,	main_b14
	   j	main_b15
main_b14:
	li	vr182,	0
	move	vr183,	vr180
	   j	main_b16
main_b15:
	  addi	vr184,	vr173,	1
	move	vr170,	vr184
	move	vr171,	vr180
	   j	main_b10
main_b16:
	move	vr185,	vr182
	move	vr186,	vr183
	  slti	vr187,	vr185,	2
	bnez	vr187,	main_b17
	   j	main_b18
main_b17:
	li	vr188,	0
	move	vr189,	vr186
	   j	main_b19
main_b18:
	  addi	vr190,	vr179,	1
	move	vr176,	vr190
	move	vr177,	vr186
	   j	main_b13
main_b19:
	move	vr191,	vr188
	move	vr192,	vr189
	  slti	vr193,	vr191,	2
	bnez	vr193,	main_b20
	   j	main_b21
main_b20:
	li	vr194,	0
	move	vr195,	vr192
	   j	main_b22
main_b21:
	  addi	vr196,	vr185,	1
	move	vr182,	vr196
	move	vr183,	vr192
	   j	main_b16
main_b22:
	move	vr197,	vr194
	move	vr198,	vr195
	  slti	vr199,	vr197,	2
	bnez	vr199,	main_b23
	   j	main_b24
main_b23:
	li	vr200,	0
	move	vr201,	vr198
	   j	main_b25
main_b24:
	  addi	vr202,	vr191,	1
	move	vr188,	vr202
	move	vr189,	vr198
	   j	main_b19
main_b25:
	move	vr203,	vr200
	move	vr204,	vr201
	  slti	vr205,	vr203,	2
	bnez	vr205,	main_b26
	   j	main_b27
main_b26:
	li	vr206,	0
	move	vr207,	vr204
	   j	main_b28
main_b27:
	  addi	vr208,	vr197,	1
	move	vr194,	vr208
	move	vr195,	vr204
	   j	main_b22
main_b28:
	move	vr209,	vr206
	move	vr210,	vr207
	  slti	vr211,	vr209,	2
	bnez	vr211,	main_b29
	   j	main_b30
main_b29:
	li	vr212,	0
	move	vr213,	vr210
	   j	main_b31
main_b30:
	  addi	vr214,	vr203,	1
	move	vr200,	vr214
	move	vr201,	vr210
	   j	main_b25
main_b31:
	move	vr215,	vr212
	move	vr216,	vr213
	  slti	vr217,	vr215,	2
	bnez	vr217,	main_b32
	   j	main_b33
main_b32:
	li	vr218,	0
	move	vr219,	vr216
	   j	main_b34
main_b33:
	  addi	vr220,	vr209,	1
	move	vr206,	vr220
	move	vr207,	vr216
	   j	main_b28
main_b34:
	move	vr221,	vr218
	move	vr222,	vr219
	  slti	vr223,	vr221,	2
	bnez	vr223,	main_b35
	   j	main_b36
main_b35:
	li	vr224,	0
	move	vr225,	vr222
	   j	main_b37
main_b36:
	  addi	vr226,	vr215,	1
	move	vr212,	vr226
	move	vr213,	vr222
	   j	main_b31
main_b37:
	move	vr227,	vr224
	move	vr228,	vr225
	  slti	vr229,	vr227,	2
	bnez	vr229,	main_b38
	   j	main_b39
main_b38:
	li	vr230,	0
	move	vr231,	vr228
	   j	main_b40
main_b39:
	  addi	vr232,	vr221,	1
	move	vr218,	vr232
	move	vr219,	vr228
	   j	main_b34
main_b40:
	move	vr233,	vr230
	move	vr234,	vr231
	  slti	vr235,	vr233,	2
	bnez	vr235,	main_b41
	   j	main_b42
main_b41:
	li	vr236,	0
	move	vr237,	vr234
	   j	main_b43
main_b42:
	  addi	vr238,	vr227,	1
	move	vr224,	vr238
	move	vr225,	vr234
	   j	main_b37
main_b43:
	move	vr239,	vr236
	move	vr240,	vr237
	  slti	vr241,	vr239,	2
	bnez	vr241,	main_b44
	   j	main_b45
main_b44:
	li	vr242,	0
	move	vr243,	vr240
	   j	main_b46
main_b45:
	  addi	vr244,	vr233,	1
	move	vr230,	vr244
	move	vr231,	vr240
	   j	main_b40
main_b46:
	move	vr245,	vr242
	move	vr246,	vr243
	  slti	vr247,	vr245,	2
	bnez	vr247,	main_b47
	   j	main_b48
main_b47:
	li	vr248,	0
	move	vr249,	vr246
	   j	main_b49
main_b48:
	  addi	vr250,	vr239,	1
	move	vr236,	vr250
	move	vr237,	vr246
	   j	main_b43
main_b49:
	move	vr251,	vr248
	move	vr252,	vr249
	  slti	vr253,	vr251,	2
	bnez	vr253,	main_b50
	   j	main_b51
main_b50:
	li	vr254,	0
	move	vr255,	vr252
	   j	main_b52
main_b51:
	  addi	vr256,	vr245,	1
	move	vr242,	vr256
	move	vr243,	vr252
	   j	main_b46
main_b52:
	move	vr257,	vr254
	move	vr258,	vr255
	  slti	vr259,	vr257,	2
	bnez	vr259,	main_b53
	   j	main_b54
main_b53:
	li	vr260,	0
	move	vr261,	vr258
	   j	main_b55
main_b54:
	  addi	vr262,	vr251,	1
	move	vr248,	vr262
	move	vr249,	vr258
	   j	main_b49
main_b55:
	move	vr263,	vr260
	move	vr264,	vr261
	  slti	vr265,	vr263,	2
	bnez	vr265,	main_b56
	   j	main_b57
main_b56:
	move	vr266,	vr113
	li	vr267,	4
	   mul	vr268,	vr263,	vr267
	   add	vr266,	vr266,	vr268
	li	vr269,	8
	   mul	vr270,	vr257,	vr269
	   add	vr266,	vr266,	vr270
	li	vr271,	16
	   mul	vr272,	vr251,	vr271
	   add	vr266,	vr266,	vr272
	li	vr273,	32
	   mul	vr274,	vr245,	vr273
	   add	vr266,	vr266,	vr274
	li	vr275,	64
	   mul	vr276,	vr239,	vr275
	   add	vr266,	vr266,	vr276
	li	vr277,	128
	   mul	vr278,	vr233,	vr277
	   add	vr266,	vr266,	vr278
	li	vr279,	256
	   mul	vr280,	vr227,	vr279
	   add	vr266,	vr266,	vr280
	li	vr281,	512
	   mul	vr282,	vr221,	vr281
	   add	vr266,	vr266,	vr282
	li	vr283,	1024
	   mul	vr284,	vr215,	vr283
	   add	vr266,	vr266,	vr284
	li	vr285,	2048
	move	vr286,	vr285
	   mul	vr287,	vr209,	vr286
	   add	vr266,	vr266,	vr287
	li	vr288,	4096
	move	vr289,	vr288
	   mul	vr290,	vr203,	vr289
	   add	vr266,	vr266,	vr290
	li	vr291,	8192
	move	vr292,	vr291
	   mul	vr293,	vr197,	vr292
	   add	vr266,	vr266,	vr293
	li	vr294,	16384
	move	vr295,	vr294
	   mul	vr296,	vr191,	vr295
	   add	vr266,	vr266,	vr296
	li	vr297,	32768
	move	vr298,	vr297
	   mul	vr299,	vr185,	vr298
	   add	vr266,	vr266,	vr299
	li	vr300,	65536
	move	vr301,	vr300
	   mul	vr302,	vr179,	vr301
	   add	vr266,	vr266,	vr302
	li	vr303,	131072
	move	vr304,	vr303
	   mul	vr305,	vr173,	vr304
	   add	vr266,	vr266,	vr305
	li	vr306,	262144
	move	vr307,	vr306
	   mul	vr308,	vr167,	vr307
	   add	vr266,	vr266,	vr308
	li	vr309,	524288
	move	vr310,	vr309
	   mul	vr311,	vr161,	vr310
	   add	vr266,	vr266,	vr311
	li	vr312,	1048576
	move	vr313,	vr312
	   mul	vr314,	vr119,	vr313
	   add	vr266,	vr266,	vr314
	  addi	vr266,	vr266,	0
	sw	vr264,	0(vr266)
	  addi	vr315,	vr264,	1
	  addi	vr316,	vr263,	1
	move	vr260,	vr316
	move	vr261,	vr315
	   j	main_b55
main_b57:
	  addi	vr317,	vr257,	1
	move	vr254,	vr317
	move	vr255,	vr264
	   j	main_b52
