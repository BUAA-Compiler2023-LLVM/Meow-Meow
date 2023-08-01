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
	lw	vr40,	0(vr39)
	lw	vr41,	0(vr2)
	move	vr42,	vr41
	  addi	vr42,	vr42,	8
	lw	vr43,	0(vr42)
	   add	vr44,	vr40,	vr43
	lw	vr45,	0(vr4)
	move	vr46,	vr45
	  addi	vr46,	vr46,	4
	lw	vr47,	0(vr46)
	   add	vr48,	vr44,	vr47
	lw	vr49,	0(vr6)
	move	vr50,	vr49
	  addi	vr50,	vr50,	8
	  addi	vr50,	vr50,	32
	lw	vr51,	0(vr50)
	   add	vr52,	vr48,	vr51
	lw	vr53,	0(vr8)
	move	vr54,	vr53
	  addi	vr54,	vr54,	8
	  addi	vr54,	vr54,	16
	lw	vr55,	0(vr54)
	   add	vr56,	vr52,	vr55
	lw	vr57,	0(vr10)
	move	vr58,	vr57
	  addi	vr58,	vr58,	4
	  addi	vr58,	vr58,	32
	  addi	vr58,	vr58,	64
	  addi	vr58,	vr58,	128
	lw	vr59,	0(vr58)
	   add	vr60,	vr56,	vr59
	lw	vr61,	0(vr12)
	move	vr62,	vr61
	  addi	vr62,	vr62,	8
	  addi	vr62,	vr62,	16
	  addi	vr62,	vr62,	32
	lw	vr63,	0(vr62)
	   add	vr64,	vr60,	vr63
	lw	vr65,	0(vr14)
	move	vr66,	vr65
	  addi	vr66,	vr66,	4
	  addi	vr66,	vr66,	64
	  addi	vr66,	vr66,	128
	  addi	vr66,	vr66,	256
	  addi	vr66,	vr66,	512
	lw	vr67,	0(vr66)
	   add	vr68,	vr64,	vr67
	lw	vr69,	0(vr16)
	move	vr70,	vr69
	  addi	vr70,	vr70,	32
	  addi	vr70,	vr70,	64
	  addi	vr70,	vr70,	128
	lw	vr71,	0(vr70)
	   add	vr72,	vr68,	vr71
	lw	vr73,	0(vr18)
	move	vr74,	vr73
	  addi	vr74,	vr74,	4
	  addi	vr74,	vr74,	32
	  addi	vr74,	vr74,	256
	  addi	vr74,	vr74,	512
	lw	vr75,	0(vr74)
	   add	vr76,	vr72,	vr75
	lw	vr77,	0(vr20)
	move	vr78,	vr77
	  addi	vr78,	vr78,	4
	  addi	vr78,	vr78,	8
	  addi	vr78,	vr78,	64
	  addi	vr78,	vr78,	128
	  addi	vr78,	vr78,	256
	  addi	vr78,	vr78,	512
	  addi	vr78,	vr78,	1024
	lw	vr79,	0(vr78)
	   add	vr80,	vr76,	vr79
	lw	vr81,	0(vr22)
	move	vr82,	vr81
	  addi	vr82,	vr82,	8
	  addi	vr82,	vr82,	16
	  addi	vr82,	vr82,	128
	  addi	vr82,	vr82,	1024
	li	vr83,	2048
	   add	vr82,	vr82,	vr83
	lw	vr84,	0(vr82)
	   add	vr85,	vr80,	vr84
	lw	vr86,	0(vr24)
	move	vr87,	vr86
	  addi	vr87,	vr87,	32
	  addi	vr87,	vr87,	256
	  addi	vr87,	vr87,	512
	  addi	vr87,	vr87,	1024
	li	vr88,	8192
	   add	vr87,	vr87,	vr88
	li	vr89,	16384
	   add	vr87,	vr87,	vr89
	lw	vr90,	0(vr87)
	   add	vr91,	vr85,	vr90
	lw	vr92,	0(vr26)
	move	vr93,	vr92
	  addi	vr93,	vr93,	4
	  addi	vr93,	vr93,	8
	  addi	vr93,	vr93,	16
	  addi	vr93,	vr93,	32
	  addi	vr93,	vr93,	64
	  addi	vr93,	vr93,	128
	  addi	vr93,	vr93,	256
	lw	vr94,	0(vr93)
	   add	vr95,	vr91,	vr94
	lw	vr96,	0(vr28)
	move	vr97,	vr96
	  addi	vr97,	vr97,	4
	  addi	vr97,	vr97,	8
	  addi	vr97,	vr97,	16
	  addi	vr97,	vr97,	32
	  addi	vr97,	vr97,	64
	lw	vr98,	0(vr97)
	   add	vr99,	vr95,	vr98
	lw	vr100,	0(vr30)
	move	vr101,	vr100
	  addi	vr101,	vr101,	16
	  addi	vr101,	vr101,	128
	  addi	vr101,	vr101,	256
	  addi	vr101,	vr101,	512
	li	vr102,	16384
	   add	vr101,	vr101,	vr102
	li	vr103,	32768
	   add	vr101,	vr101,	vr103
	li	vr104,	65536
	   add	vr101,	vr101,	vr104
	li	vr105,	131072
	   add	vr101,	vr101,	vr105
	lw	vr106,	0(vr101)
	   add	vr107,	vr99,	vr106
	lw	vr108,	0(vr32)
	move	vr109,	vr108
	  addi	vr109,	vr109,	4
	  addi	vr109,	vr109,	16
	  addi	vr109,	vr109,	64
	  addi	vr109,	vr109,	512
	  addi	vr109,	vr109,	1024
	li	vr110,	2048
	   add	vr109,	vr109,	vr110
	li	vr111,	4096
	   add	vr109,	vr109,	vr111
	li	vr112,	8192
	   add	vr109,	vr109,	vr112
	lw	vr113,	0(vr109)
	   add	vr114,	vr107,	vr113
	lw	vr115,	0(vr34)
	move	vr116,	vr115
	  addi	vr116,	vr116,	4
	  addi	vr116,	vr116,	8
	  addi	vr116,	vr116,	64
	  addi	vr116,	vr116,	128
	  addi	vr116,	vr116,	256
	  addi	vr116,	vr116,	512
	li	vr117,	8192
	   add	vr116,	vr116,	vr117
	li	vr118,	32768
	   add	vr116,	vr116,	vr118
	li	vr119,	262144
	   add	vr116,	vr116,	vr119
	li	vr120,	524288
	   add	vr116,	vr116,	vr120
	lw	vr121,	0(vr116)
	   add	vr122,	vr114,	vr121
	lw	vr123,	0(vr36)
	move	vr124,	vr123
	  addi	vr124,	vr124,	1024
	li	vr125,	2048
	   add	vr124,	vr124,	vr125
	li	vr126,	16384
	   add	vr124,	vr124,	vr126
	li	vr127,	262144
	   add	vr124,	vr124,	vr127
	lw	vr128,	0(vr124)
	   add	vr129,	vr122,	vr128
	move	a0,	vr129
	  addi	sp,	sp,	80
	 ret
.section	.text.startup
.globl	main
main:
main_b0:
	   add	sp,	sp,	vr329
	li	vr325,	2097200
	   add	vr326,	sp,	vr325
	sd	ra,	0(vr326)
	  addi	vr130,	sp,	44
	move	vr131,	vr130
	move	a0,	vr131
	li	a1,	0
	li	vr132,	2097152
	move	a2,	vr132
	call	memset
	li	vr133,	0
	sw	vr133,	0(vr131)
	li	vr134,	0
	li	vr135,	0
	   j	main_b1
	li	vr329,	-2097208
	li	vr330,	2097208
main_b1:
	move	vr136,	vr134
	move	vr137,	vr135
	  slti	vr138,	vr136,	2
	bnez	vr138,	main_b2
	   j	main_b3
main_b2:
	li	vr139,	0
	move	vr140,	vr137
	   j	main_b4
main_b3:
	move	vr141,	vr130
	move	vr142,	vr141
	move	vr143,	vr130
	move	vr144,	vr143
	move	vr145,	vr130
	move	vr146,	vr145
	move	vr147,	vr130
	move	vr148,	vr147
	move	vr149,	vr130
	move	vr150,	vr149
	move	vr151,	vr130
	move	vr152,	vr151
	move	vr153,	vr130
	move	vr154,	vr153
	move	vr155,	vr130
	move	vr156,	vr155
	move	vr157,	vr130
	move	vr158,	vr157
	move	vr159,	vr130
	move	vr160,	vr159
	move	vr161,	vr130
	move	vr162,	vr161
	move	vr163,	vr130
	move	vr164,	vr163
	move	vr165,	vr130
	move	vr166,	vr165
	move	vr167,	vr130
	move	vr168,	vr167
	move	vr169,	vr130
	move	vr170,	vr169
	move	vr171,	vr130
	move	vr172,	vr171
	move	vr173,	vr130
	move	vr174,	vr173
	move	vr175,	vr130
	move	vr176,	vr175
	move	a0,	vr142
	move	a1,	vr144
	move	a2,	vr146
	move	a3,	vr148
	move	a4,	vr150
	move	a5,	vr152
	move	a6,	vr154
	move	a7,	vr156
	sw	vr158,	0(sp)
	sw	vr160,	4(sp)
	sw	vr162,	8(sp)
	sw	vr164,	12(sp)
	sw	vr166,	16(sp)
	sw	vr168,	20(sp)
	sw	vr170,	24(sp)
	sw	vr172,	28(sp)
	sw	vr174,	32(sp)
	sw	vr176,	36(sp)
	sw	vr175,	40(sp)
	call	sum
	move	vr177,	a0
	move	a0,	vr177
	call	putint
	li	a0,	10
	call	putch
	li	a0,	0
	call	putint
	li	a0,	0
	li	vr327,	2097200
	   add	vr328,	sp,	vr327
	ld	ra,	0(vr328)
	   add	sp,	sp,	vr330
	 ret
main_b4:
	move	vr178,	vr139
	move	vr179,	vr140
	  slti	vr180,	vr178,	2
	bnez	vr180,	main_b5
	   j	main_b6
main_b5:
	li	vr181,	0
	move	vr182,	vr179
	   j	main_b7
main_b6:
	  addi	vr183,	vr136,	1
	move	vr134,	vr183
	move	vr135,	vr179
	   j	main_b1
main_b7:
	move	vr184,	vr181
	move	vr185,	vr182
	  slti	vr186,	vr184,	2
	bnez	vr186,	main_b8
	   j	main_b9
main_b8:
	li	vr187,	0
	move	vr188,	vr185
	   j	main_b10
main_b9:
	  addi	vr189,	vr178,	1
	move	vr139,	vr189
	move	vr140,	vr185
	   j	main_b4
main_b10:
	move	vr190,	vr187
	move	vr191,	vr188
	  slti	vr192,	vr190,	2
	bnez	vr192,	main_b11
	   j	main_b12
main_b11:
	li	vr193,	0
	move	vr194,	vr191
	   j	main_b13
main_b12:
	  addi	vr195,	vr184,	1
	move	vr181,	vr195
	move	vr182,	vr191
	   j	main_b7
main_b13:
	move	vr196,	vr193
	move	vr197,	vr194
	  slti	vr198,	vr196,	2
	bnez	vr198,	main_b14
	   j	main_b15
main_b14:
	li	vr199,	0
	move	vr200,	vr197
	   j	main_b16
main_b15:
	  addi	vr201,	vr190,	1
	move	vr187,	vr201
	move	vr188,	vr197
	   j	main_b10
main_b16:
	move	vr202,	vr199
	move	vr203,	vr200
	  slti	vr204,	vr202,	2
	bnez	vr204,	main_b17
	   j	main_b18
main_b17:
	li	vr205,	0
	move	vr206,	vr203
	   j	main_b19
main_b18:
	  addi	vr207,	vr196,	1
	move	vr193,	vr207
	move	vr194,	vr203
	   j	main_b13
main_b19:
	move	vr208,	vr205
	move	vr209,	vr206
	  slti	vr210,	vr208,	2
	bnez	vr210,	main_b20
	   j	main_b21
main_b20:
	li	vr211,	0
	move	vr212,	vr209
	   j	main_b22
main_b21:
	  addi	vr213,	vr202,	1
	move	vr199,	vr213
	move	vr200,	vr209
	   j	main_b16
main_b22:
	move	vr214,	vr211
	move	vr215,	vr212
	  slti	vr216,	vr214,	2
	bnez	vr216,	main_b23
	   j	main_b24
main_b23:
	li	vr217,	0
	move	vr218,	vr215
	   j	main_b25
main_b24:
	  addi	vr219,	vr208,	1
	move	vr205,	vr219
	move	vr206,	vr215
	   j	main_b19
main_b25:
	move	vr220,	vr217
	move	vr221,	vr218
	  slti	vr222,	vr220,	2
	bnez	vr222,	main_b26
	   j	main_b27
main_b26:
	li	vr223,	0
	move	vr224,	vr221
	   j	main_b28
main_b27:
	  addi	vr225,	vr214,	1
	move	vr211,	vr225
	move	vr212,	vr221
	   j	main_b22
main_b28:
	move	vr226,	vr223
	move	vr227,	vr224
	  slti	vr228,	vr226,	2
	bnez	vr228,	main_b29
	   j	main_b30
main_b29:
	li	vr229,	0
	move	vr230,	vr227
	   j	main_b31
main_b30:
	  addi	vr231,	vr220,	1
	move	vr217,	vr231
	move	vr218,	vr227
	   j	main_b25
main_b31:
	move	vr232,	vr229
	move	vr233,	vr230
	  slti	vr234,	vr232,	2
	bnez	vr234,	main_b32
	   j	main_b33
main_b32:
	li	vr235,	0
	move	vr236,	vr233
	   j	main_b34
main_b33:
	  addi	vr237,	vr226,	1
	move	vr223,	vr237
	move	vr224,	vr233
	   j	main_b28
main_b34:
	move	vr238,	vr235
	move	vr239,	vr236
	  slti	vr240,	vr238,	2
	bnez	vr240,	main_b35
	   j	main_b36
main_b35:
	li	vr241,	0
	move	vr242,	vr239
	   j	main_b37
main_b36:
	  addi	vr243,	vr232,	1
	move	vr229,	vr243
	move	vr230,	vr239
	   j	main_b31
main_b37:
	move	vr244,	vr241
	move	vr245,	vr242
	  slti	vr246,	vr244,	2
	bnez	vr246,	main_b38
	   j	main_b39
main_b38:
	li	vr247,	0
	move	vr248,	vr245
	   j	main_b40
main_b39:
	  addi	vr249,	vr238,	1
	move	vr235,	vr249
	move	vr236,	vr245
	   j	main_b34
main_b40:
	move	vr250,	vr247
	move	vr251,	vr248
	  slti	vr252,	vr250,	2
	bnez	vr252,	main_b41
	   j	main_b42
main_b41:
	li	vr253,	0
	move	vr254,	vr251
	   j	main_b43
main_b42:
	  addi	vr255,	vr244,	1
	move	vr241,	vr255
	move	vr242,	vr251
	   j	main_b37
main_b43:
	move	vr256,	vr253
	move	vr257,	vr254
	  slti	vr258,	vr256,	2
	bnez	vr258,	main_b44
	   j	main_b45
main_b44:
	li	vr259,	0
	move	vr260,	vr257
	   j	main_b46
main_b45:
	  addi	vr261,	vr250,	1
	move	vr247,	vr261
	move	vr248,	vr257
	   j	main_b40
main_b46:
	move	vr262,	vr259
	move	vr263,	vr260
	  slti	vr264,	vr262,	2
	bnez	vr264,	main_b47
	   j	main_b48
main_b47:
	li	vr265,	0
	move	vr266,	vr263
	   j	main_b49
main_b48:
	  addi	vr267,	vr256,	1
	move	vr253,	vr267
	move	vr254,	vr263
	   j	main_b43
main_b49:
	move	vr268,	vr265
	move	vr269,	vr266
	  slti	vr270,	vr268,	2
	bnez	vr270,	main_b50
	   j	main_b51
main_b50:
	li	vr271,	0
	move	vr272,	vr269
	   j	main_b52
main_b51:
	  addi	vr273,	vr262,	1
	move	vr259,	vr273
	move	vr260,	vr269
	   j	main_b46
main_b52:
	move	vr274,	vr271
	move	vr275,	vr272
	  slti	vr276,	vr274,	2
	bnez	vr276,	main_b53
	   j	main_b54
main_b53:
	li	vr277,	0
	move	vr278,	vr275
	   j	main_b55
main_b54:
	  addi	vr279,	vr268,	1
	move	vr265,	vr279
	move	vr266,	vr275
	   j	main_b49
main_b55:
	move	vr280,	vr277
	move	vr281,	vr278
	  slti	vr282,	vr280,	2
	bnez	vr282,	main_b56
	   j	main_b57
main_b56:
	move	vr283,	vr130
	li	vr284,	4
	   mul	vr285,	vr280,	vr284
	   add	vr283,	vr283,	vr285
	li	vr286,	8
	   mul	vr287,	vr274,	vr286
	   add	vr283,	vr283,	vr287
	li	vr288,	16
	   mul	vr289,	vr268,	vr288
	   add	vr283,	vr283,	vr289
	li	vr290,	32
	   mul	vr291,	vr262,	vr290
	   add	vr283,	vr283,	vr291
	li	vr292,	64
	   mul	vr293,	vr256,	vr292
	   add	vr283,	vr283,	vr293
	li	vr294,	128
	   mul	vr295,	vr250,	vr294
	   add	vr283,	vr283,	vr295
	li	vr296,	256
	   mul	vr297,	vr244,	vr296
	   add	vr283,	vr283,	vr297
	li	vr298,	512
	   mul	vr299,	vr238,	vr298
	   add	vr283,	vr283,	vr299
	li	vr300,	1024
	   mul	vr301,	vr232,	vr300
	   add	vr283,	vr283,	vr301
	li	vr302,	2048
	   mul	vr303,	vr226,	vr302
	   add	vr283,	vr283,	vr303
	li	vr304,	4096
	   mul	vr305,	vr220,	vr304
	   add	vr283,	vr283,	vr305
	li	vr306,	8192
	   mul	vr307,	vr214,	vr306
	   add	vr283,	vr283,	vr307
	li	vr308,	16384
	   mul	vr309,	vr208,	vr308
	   add	vr283,	vr283,	vr309
	li	vr310,	32768
	   mul	vr311,	vr202,	vr310
	   add	vr283,	vr283,	vr311
	li	vr312,	65536
	   mul	vr313,	vr196,	vr312
	   add	vr283,	vr283,	vr313
	li	vr314,	131072
	   mul	vr315,	vr190,	vr314
	   add	vr283,	vr283,	vr315
	li	vr316,	262144
	   mul	vr317,	vr184,	vr316
	   add	vr283,	vr283,	vr317
	li	vr318,	524288
	   mul	vr319,	vr178,	vr318
	   add	vr283,	vr283,	vr319
	li	vr320,	1048576
	   mul	vr321,	vr136,	vr320
	   add	vr283,	vr283,	vr321
	sw	vr281,	0(vr283)
	  addi	vr322,	vr281,	1
	  addi	vr323,	vr280,	1
	move	vr277,	vr323
	move	vr278,	vr322
	   j	main_b55
main_b57:
	  addi	vr324,	vr274,	1
	move	vr271,	vr324
	move	vr272,	vr281
	   j	main_b52
