f:
    addi $sp,	$sp,	-4
    addi vr0,	$sp,	0
    sw vr1,	0(vr0)
    lw vr2,	0(vr0)
    lw vr3,	0(vr4)
    move $a0,	vr3
    ret
main:
    addi $sp,	$sp,	-4
    addi vr5,	$sp,	0
    li vr6,	1
    sw vr6,	0(vr7)
    li vr8,	2
    sw vr8,	0(vr9)
    move $a0,	vr10
    ret