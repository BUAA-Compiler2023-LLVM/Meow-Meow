declare void @memset(i32*, i32, i32)
declare i32 @getint()
declare i32 @getch()
declare i32 @getfarray(float*)
declare void @putint(i32)
declare void @putfarray(i32, float*)
declare void @_sysy_starttime(i32)
declare void @_sysy_stoptime(i32)
declare i32 @getarray(i32*)
declare void @putarray(i32, i32*)
declare void @putfloat(float)
declare void @putch(i32)
declare float @getfloat()
declare i32 @parallel_start()
declare void @parallel_end(i32)
define i32 @main() {
block1:
	%0 = icmp ne i32 1, 0
	br i1 %0, label %block5, label %block4
block2:
	%2 = icmp ne i32 5, 0
	br i1 %2, label %block6, label %block9
block4:
	call void @putint(i32 1)
	ret i32 1
block5:
	%1 = icmp ne i32 1, 0
	br i1 %1, label %block2, label %block4
block6:
	%8 = icmp ne i32 0, 0
	br i1 %8, label %block13, label %block12
block8:
	call void @putint(i32 2)
	ret i32 2
block9:
	%3 = zext i1 0 to i32
	%4 = icmp eq i32 1, %3
	%5 = zext i1 %4 to i32
	%6 = add i32 %5, 0
	%7 = icmp ne i32 %6, 0
	br i1 %7, label %block6, label %block8
block10:
	call void @putint(i32 3)
	ret i32 3
block12:
	%10 = icmp ne i32 0, 0
	br i1 %10, label %block17, label %block16
block13:
	%9 = icmp ne i32 1, 0
	br i1 %9, label %block10, label %block12
block14:
	call void @putint(i32 4)
	ret i32 4
block16:
	%12 = icmp ne i32 1, 0
	br i1 %12, label %block18, label %block20
block17:
	%11 = icmp ne i32 5, 0
	br i1 %11, label %block14, label %block16
block18:
	%13 = icmp ne i32 0, 0
	br i1 %13, label %block21, label %block24
block20:
	call void @putint(i32 5)
	ret i32 5
block21:
	call void @putint(i32 6)
	ret i32 6
block23:
	%15 = icmp ne i32 1, 0
	br i1 %15, label %block25, label %block27
block24:
	%14 = icmp ne i32 0, 0
	br i1 %14, label %block21, label %block23
block25:
	%16 = icmp ne i32 1, 0
	br i1 %16, label %block28, label %block30
block27:
	call void @putint(i32 7)
	ret i32 7
block28:
	%17 = zext i1 0 to i32
	%18 = icmp eq i32 6, %17
	%19 = icmp ne i1 %18, 0
	br i1 %19, label %block31, label %block33
block30:
	call void @putint(i32 8)
	ret i32 8
block31:
	call void @putint(i32 9)
	ret i32 9
block33:
	call void @putint(i32 10)
	ret i32 10
}

