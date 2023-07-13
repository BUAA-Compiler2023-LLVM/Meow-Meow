main:
addi $sp,	$sp,	-20
addi vr0,	$sp,	0
li vr1,	893
sw vr1,	0(vr0)
addi vr2,	$sp,	4
li vr3,	716
sw vr3,	0(vr2)
addi vr4,	$sp,	8
li vr5,	837
sw vr5,	0(vr4)
lw vr6,	0(vr4)
addi vr7,	vr6,	128
sw vr7,	0(vr4)
lw vr8,	0(vr2)
lw vr9,	0(vr4)
add vr10,	vr8,	vr9
sw vr10,	0(vr2)
addi vr11,	$sp,	12
li vr12,	241
sw vr12,	0(vr11)
lw vr13,	0(vr4)
lw vr14,	0(vr11)
add vr15,	vr13,	vr14
sw vr16,	0(vr4)
addi vr17,	$sp,	16
li vr18,	771
sw vr18,	0(vr17)
lw vr19,	0(vr11)
lw vr20,	0(vr17)
add vr21,	vr19,	vr20
sw vr22,	0(vr11)
lw vr23,	0(vr11)
addi vr24,	vr23,	66
sw vr24,	0(vr17)
lw vr25,	0(vr11)
lw vr26,	0(vr4)
add vr27,	vr25,	vr26
sw vr28,	0(vr11)
lw vr29,	0(vr11)
sw vr30,	0(vr4)
lw vr31,	0(vr4)
lw vr32,	0(vr11)
add vr33,	vr31,	vr32
move $a0,	vr34
ret