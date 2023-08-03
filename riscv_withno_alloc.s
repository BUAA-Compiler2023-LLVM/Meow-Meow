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
	  addi	sp,	sp,	-8
	sd	ra,	0(sp)
	move	vr1,	a0
	   j	find_b1
find_b1:
	la	vr0,	fa
	li	vr2,	4
	   mul	vr3,	vr1,	vr2
	   add	vr0,	vr0,	vr3
	lw	vr4,	0(vr0)
	   xor	vr6,	vr1,	vr4
	  sltu	vr7,	zero,	vr6
	  xori	vr5,	vr7,	1
	bnez	vr5,	find_b2
	   j	find_b3
find_b2:
	move	vr8,	vr1
	   j	find_b4
find_b3:
	lw	vr9,	0(vr0)
	move	a0,	vr9
	call	find
	move	vr10,	a0
	sw	vr10,	0(vr0)
	move	vr8,	vr10
	   j	find_b4
find_b4:
	move	vr11,	vr8
	move	a0,	vr11
	ld	ra,	0(sp)
	  addi	sp,	sp,	8
	 ret
.section	.text
same:
same_b0:
	  addi	sp,	sp,	-8
	sd	ra,	0(sp)
	move	vr14,	a1
	move	vr12,	a0
	   j	same_b1
same_b1:
	move	a0,	vr12
	call	find
	move	vr13,	a0
	move	a0,	vr14
	call	find
	move	vr15,	a0
	   xor	vr17,	vr13,	vr15
	  sltu	vr18,	zero,	vr17
	  xori	vr16,	vr18,	1
	bnez	vr16,	same_b2
	   j	same_b3
same_b2:
	li	vr19,	1
	   j	same_b4
same_b3:
	li	vr19,	0
	   j	same_b4
same_b4:
	move	vr20,	vr19
	move	a0,	vr20
	ld	ra,	0(sp)
	  addi	sp,	sp,	8
	 ret
.section	.text
prim:
prim_b0:
	  addi	sp,	sp,	-8
	sd	ra,	0(sp)
	li	vr21,	0
	   j	prim_b1
prim_b1:
	move	vr22,	vr21
	  slti	vr23,	vr22,	0
	bnez	vr23,	prim_b2
	   j	prim_b3
prim_b2:
	  addi	vr24,	vr22,	1
	move	vr25,	vr24
	   j	prim_b4
prim_b3:
	li	vr26,	1
	   j	prim_b9
prim_b4:
	move	vr27,	vr25
	  slti	vr28,	vr27,	0
	bnez	vr28,	prim_b5
	   j	prim_b6
prim_b5:
	la	vr29,	c
	li	vr30,	4
	   mul	vr31,	vr22,	vr30
	   add	vr29,	vr29,	vr31
	lw	vr32,	0(vr29)
	la	vr33,	c
	li	vr34,	4
	   mul	vr35,	vr27,	vr34
	   add	vr33,	vr33,	vr35
	lw	vr36,	0(vr33)
	   slt	vr37,	vr36,	vr32
	bnez	vr37,	prim_b7
	   j	prim_b8
prim_b6:
	move	vr21,	vr24
	   j	prim_b1
prim_b7:
	la	vr38,	u
	li	vr39,	4
	   mul	vr40,	vr22,	vr39
	   add	vr38,	vr38,	vr40
	lw	vr41,	0(vr38)
	la	vr42,	u
	li	vr43,	4
	   mul	vr44,	vr27,	vr43
	   add	vr42,	vr42,	vr44
	lw	vr45,	0(vr42)
	sw	vr45,	0(vr38)
	sw	vr41,	0(vr42)
	la	vr46,	v
	li	vr47,	4
	   mul	vr48,	vr22,	vr47
	   add	vr46,	vr46,	vr48
	lw	vr49,	0(vr46)
	la	vr50,	v
	li	vr51,	4
	   mul	vr52,	vr27,	vr51
	   add	vr50,	vr50,	vr52
	lw	vr53,	0(vr50)
	sw	vr53,	0(vr46)
	sw	vr49,	0(vr50)
	lw	vr54,	0(vr29)
	lw	vr55,	0(vr33)
	sw	vr55,	0(vr29)
	sw	vr54,	0(vr33)
	   j	prim_b8
prim_b8:
	  addi	vr56,	vr27,	1
	move	vr25,	vr56
	   j	prim_b4
prim_b9:
	move	vr57,	vr26
	li	vr59,	0
	   slt	vr60,	vr59,	vr57
	  xori	vr58,	vr60,	1
	bnez	vr58,	prim_b10
	   j	prim_b11
prim_b10:
	la	vr61,	fa
	li	vr62,	4
	   mul	vr63,	vr57,	vr62
	   add	vr61,	vr61,	vr63
	sw	vr57,	0(vr61)
	  addi	vr64,	vr57,	1
	move	vr26,	vr64
	   j	prim_b9
prim_b11:
	li	vr65,	0
	li	vr66,	0
	   j	prim_b12
prim_b12:
	move	vr67,	vr65
	move	vr68,	vr66
	  slti	vr69,	vr68,	0
	bnez	vr69,	prim_b13
	   j	prim_b15
prim_b13:
	la	vr70,	u
	li	vr71,	4
	   mul	vr72,	vr68,	vr71
	   add	vr70,	vr70,	vr72
	lw	vr73,	0(vr70)
	la	vr74,	v
	li	vr75,	4
	   mul	vr76,	vr68,	vr75
	   add	vr74,	vr74,	vr76
	lw	vr77,	0(vr74)
	move	a0,	vr73
	move	a1,	vr77
	call	same
	move	vr78,	a0
	  xori	vr80,	vr78,	0
	  sltu	vr79,	zero,	vr80
	bnez	vr79,	prim_b14
	   j	prim_b16
prim_b14:
	move	vr65,	vr67
	move	vr66,	vr68
	   j	prim_b12
prim_b15:
	move	a0,	vr67
	ld	ra,	0(sp)
	  addi	sp,	sp,	8
	 ret
prim_b16:
	la	vr81,	c
	li	vr82,	4
	   mul	vr83,	vr68,	vr82
	   add	vr81,	vr81,	vr83
	lw	vr84,	0(vr81)
	lw	vr85,	0(vr70)
	move	a0,	vr85
	call	find
	move	vr86,	a0
	lw	vr87,	0(vr74)
	la	vr88,	fa
	li	vr89,	4
	   mul	vr90,	vr86,	vr89
	   add	vr88,	vr88,	vr90
	sw	vr87,	0(vr88)
	  addi	vr91,	vr68,	1
	   add	vr92,	vr67,	vr84
	move	vr65,	vr92
	move	vr66,	vr91
	   j	prim_b12
.section	.text.startup
.globl	main
main:
main_b0:
	  addi	sp,	sp,	-8
	sd	ra,	0(sp)
	   j	main_b1
main_b1:
	call	getch
	move	vr93,	a0
	li	vr94,	0
	move	vr95,	vr93
	   j	main_b2
main_b2:
	move	vr96,	vr94
	move	vr97,	vr95
	  slti	vr98,	vr97,	48
	bnez	vr98,	main_b3
	   j	main_b5
main_b3:
	  xori	vr100,	vr97,	45
	  sltu	vr101,	zero,	vr100
	  xori	vr99,	vr101,	1
	bnez	vr99,	main_b7
	   j	main_b4
main_b4:
	move	vr102,	vr96
	   j	main_b8
main_b5:
	li	vr104,	57
	   slt	vr103,	vr104,	vr97
	bnez	vr103,	main_b3
	   j	main_b6
main_b6:
	move	vr105,	vr97
	   j	main_b9
main_b7:
	li	vr102,	1
	   j	main_b8
main_b8:
	move	vr106,	vr102
	call	getch
	move	vr107,	a0
	move	vr94,	vr106
	move	vr95,	vr107
	   j	main_b2
main_b9:
	move	vr108,	vr105
	  slti	vr110,	vr108,	48
	  xori	vr109,	vr110,	1
	bnez	vr109,	main_b12
	   j	main_b11
main_b10:
	call	getch
	move	vr111,	a0
	move	vr105,	vr111
	   j	main_b9
main_b11:
	  xori	vr113,	vr96,	0
	  sltu	vr112,	zero,	vr113
	bnez	vr112,	main_b13
	   j	main_b14
main_b12:
	li	vr115,	57
	   slt	vr116,	vr115,	vr108
	  xori	vr114,	vr116,	1
	bnez	vr114,	main_b10
	   j	main_b11
main_b13:
	   j	main_b15
main_b14:
	   j	main_b15
main_b15:
	   j	main_b16
main_b16:
	call	getch
	move	vr117,	a0
	li	vr118,	0
	move	vr119,	vr117
	   j	main_b17
main_b17:
	move	vr120,	vr118
	move	vr121,	vr119
	  slti	vr122,	vr121,	48
	bnez	vr122,	main_b18
	   j	main_b20
main_b18:
	  xori	vr124,	vr121,	45
	  sltu	vr125,	zero,	vr124
	  xori	vr123,	vr125,	1
	bnez	vr123,	main_b22
	   j	main_b19
main_b19:
	move	vr126,	vr120
	   j	main_b23
main_b20:
	li	vr128,	57
	   slt	vr127,	vr128,	vr121
	bnez	vr127,	main_b18
	   j	main_b21
main_b21:
	li	vr129,	0
	move	vr130,	vr121
	   j	main_b24
main_b22:
	li	vr126,	1
	   j	main_b23
main_b23:
	move	vr131,	vr126
	call	getch
	move	vr132,	a0
	move	vr118,	vr131
	move	vr119,	vr132
	   j	main_b17
main_b24:
	move	vr133,	vr129
	move	vr134,	vr130
	  slti	vr136,	vr134,	48
	  xori	vr135,	vr136,	1
	bnez	vr135,	main_b27
	   j	main_b26
main_b25:
	call	getch
	move	vr137,	a0
	li	vr138,	10
	   mul	vr139,	vr133,	vr138
	   add	vr140,	vr139,	vr134
	  addi	vr141,	vr140,	-48
	move	vr129,	vr141
	move	vr130,	vr137
	   j	main_b24
main_b26:
	  xori	vr143,	vr120,	0
	  sltu	vr142,	zero,	vr143
	bnez	vr142,	main_b28
	   j	main_b29
main_b27:
	li	vr145,	57
	   slt	vr146,	vr145,	vr134
	  xori	vr144,	vr146,	1
	bnez	vr144,	main_b25
	   j	main_b26
main_b28:
	li	vr148,	0
	   sub	vr147,	vr148,	vr133
	move	vr149,	vr147
	   j	main_b30
main_b29:
	move	vr149,	vr133
	   j	main_b30
main_b30:
	move	vr150,	vr149
	li	vr151,	0
	   j	main_b31
main_b31:
	move	vr152,	vr151
	   slt	vr153,	vr152,	vr150
	bnez	vr153,	main_b32
	   j	main_b78
main_b32:
	   j	main_b33
main_b33:
	call	getch
	move	vr154,	a0
	li	vr155,	0
	move	vr156,	vr154
	   j	main_b34
main_b34:
	move	vr157,	vr155
	move	vr158,	vr156
	  slti	vr159,	vr158,	48
	bnez	vr159,	main_b35
	   j	main_b37
main_b35:
	  xori	vr161,	vr158,	45
	  sltu	vr162,	zero,	vr161
	  xori	vr160,	vr162,	1
	bnez	vr160,	main_b39
	   j	main_b36
main_b36:
	move	vr163,	vr157
	   j	main_b40
main_b37:
	li	vr165,	57
	   slt	vr164,	vr165,	vr158
	bnez	vr164,	main_b35
	   j	main_b38
main_b38:
	li	vr166,	0
	move	vr167,	vr158
	   j	main_b41
main_b39:
	li	vr163,	1
	   j	main_b40
main_b40:
	move	vr168,	vr163
	call	getch
	move	vr169,	a0
	move	vr155,	vr168
	move	vr156,	vr169
	   j	main_b34
main_b41:
	move	vr170,	vr166
	move	vr171,	vr167
	  slti	vr173,	vr171,	48
	  xori	vr172,	vr173,	1
	bnez	vr172,	main_b44
	   j	main_b43
main_b42:
	call	getch
	move	vr174,	a0
	li	vr175,	10
	   mul	vr176,	vr170,	vr175
	   add	vr177,	vr176,	vr171
	  addi	vr178,	vr177,	-48
	move	vr166,	vr178
	move	vr167,	vr174
	   j	main_b41
main_b43:
	  xori	vr180,	vr157,	0
	  sltu	vr179,	zero,	vr180
	bnez	vr179,	main_b45
	   j	main_b46
main_b44:
	li	vr182,	57
	   slt	vr183,	vr182,	vr171
	  xori	vr181,	vr183,	1
	bnez	vr181,	main_b42
	   j	main_b43
main_b45:
	li	vr185,	0
	   sub	vr184,	vr185,	vr170
	move	vr186,	vr184
	   j	main_b47
main_b46:
	move	vr186,	vr170
	   j	main_b47
main_b47:
	move	vr187,	vr186
	la	vr188,	u
	li	vr189,	4
	   mul	vr190,	vr152,	vr189
	   add	vr188,	vr188,	vr190
	sw	vr187,	0(vr188)
	   j	main_b48
main_b48:
	call	getch
	move	vr191,	a0
	li	vr192,	0
	move	vr193,	vr191
	   j	main_b49
main_b49:
	move	vr194,	vr192
	move	vr195,	vr193
	  slti	vr196,	vr195,	48
	bnez	vr196,	main_b50
	   j	main_b52
main_b50:
	  xori	vr198,	vr195,	45
	  sltu	vr199,	zero,	vr198
	  xori	vr197,	vr199,	1
	bnez	vr197,	main_b54
	   j	main_b51
main_b51:
	move	vr200,	vr194
	   j	main_b55
main_b52:
	li	vr202,	57
	   slt	vr201,	vr202,	vr195
	bnez	vr201,	main_b50
	   j	main_b53
main_b53:
	li	vr203,	0
	move	vr204,	vr195
	   j	main_b56
main_b54:
	li	vr200,	1
	   j	main_b55
main_b55:
	move	vr205,	vr200
	call	getch
	move	vr206,	a0
	move	vr192,	vr205
	move	vr193,	vr206
	   j	main_b49
main_b56:
	move	vr207,	vr203
	move	vr208,	vr204
	  slti	vr210,	vr208,	48
	  xori	vr209,	vr210,	1
	bnez	vr209,	main_b59
	   j	main_b58
main_b57:
	call	getch
	move	vr211,	a0
	li	vr212,	10
	   mul	vr213,	vr207,	vr212
	   add	vr214,	vr213,	vr208
	  addi	vr215,	vr214,	-48
	move	vr203,	vr215
	move	vr204,	vr211
	   j	main_b56
main_b58:
	  xori	vr217,	vr194,	0
	  sltu	vr216,	zero,	vr217
	bnez	vr216,	main_b60
	   j	main_b61
main_b59:
	li	vr219,	57
	   slt	vr220,	vr219,	vr208
	  xori	vr218,	vr220,	1
	bnez	vr218,	main_b57
	   j	main_b58
main_b60:
	li	vr222,	0
	   sub	vr221,	vr222,	vr207
	move	vr223,	vr221
	   j	main_b62
main_b61:
	move	vr223,	vr207
	   j	main_b62
main_b62:
	move	vr224,	vr223
	la	vr225,	v
	li	vr226,	4
	   mul	vr227,	vr152,	vr226
	   add	vr225,	vr225,	vr227
	sw	vr224,	0(vr225)
	   j	main_b63
main_b63:
	call	getch
	move	vr228,	a0
	li	vr229,	0
	move	vr230,	vr228
	   j	main_b64
main_b64:
	move	vr231,	vr229
	move	vr232,	vr230
	  slti	vr233,	vr232,	48
	bnez	vr233,	main_b65
	   j	main_b67
main_b65:
	  xori	vr235,	vr232,	45
	  sltu	vr236,	zero,	vr235
	  xori	vr234,	vr236,	1
	bnez	vr234,	main_b69
	   j	main_b66
main_b66:
	move	vr237,	vr231
	   j	main_b70
main_b67:
	li	vr239,	57
	   slt	vr238,	vr239,	vr232
	bnez	vr238,	main_b65
	   j	main_b68
main_b68:
	li	vr240,	0
	move	vr241,	vr232
	   j	main_b71
main_b69:
	li	vr237,	1
	   j	main_b70
main_b70:
	move	vr242,	vr237
	call	getch
	move	vr243,	a0
	move	vr229,	vr242
	move	vr230,	vr243
	   j	main_b64
main_b71:
	move	vr244,	vr240
	move	vr245,	vr241
	  slti	vr247,	vr245,	48
	  xori	vr246,	vr247,	1
	bnez	vr246,	main_b74
	   j	main_b73
main_b72:
	call	getch
	move	vr248,	a0
	li	vr249,	10
	   mul	vr250,	vr244,	vr249
	   add	vr251,	vr250,	vr245
	  addi	vr252,	vr251,	-48
	move	vr240,	vr252
	move	vr241,	vr248
	   j	main_b71
main_b73:
	  xori	vr254,	vr231,	0
	  sltu	vr253,	zero,	vr254
	bnez	vr253,	main_b75
	   j	main_b76
main_b74:
	li	vr256,	57
	   slt	vr257,	vr256,	vr245
	  xori	vr255,	vr257,	1
	bnez	vr255,	main_b72
	   j	main_b73
main_b75:
	li	vr259,	0
	   sub	vr258,	vr259,	vr244
	move	vr260,	vr258
	   j	main_b77
main_b76:
	move	vr260,	vr244
	   j	main_b77
main_b77:
	move	vr261,	vr260
	la	vr262,	c
	li	vr263,	4
	   mul	vr264,	vr152,	vr263
	   add	vr262,	vr262,	vr264
	sw	vr261,	0(vr262)
	  addi	vr265,	vr152,	1
	move	vr151,	vr265
	   j	main_b31
main_b78:
	call	prim
	move	vr266,	a0
	move	a0,	vr266
	call	putint
	move	a0,	vr266
	ld	ra,	0(sp)
	  addi	sp,	sp,	8
	 ret
