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
b0:
	%0 = icmp ne i32 1, 0
	br i1 %0, label %b3, label %b2
b1:
	%1 = icmp ne i32 5, 0
	br i1 %1, label %b4, label %b6
b2:
	call void @putint(i32 1)
	ret i32 1
b3:
	%2 = icmp ne i32 1, 0
	br i1 %2, label %b1, label %b2
b4:
	%3 = icmp ne i32 0, 0
	br i1 %3, label %b9, label %b8
b5:
	call void @putint(i32 2)
	ret i32 2
b6:
	%4 = zext i1 0 to i32
	%5 = icmp eq i32 1, %4
	%6 = zext i1 %5 to i32
	%7 = add i32 %6, 0
	%8 = icmp ne i32 %7, 0
	br i1 %8, label %b4, label %b5
b7:
	call void @putint(i32 3)
	ret i32 3
b8:
	call void @putint(i32 5)
	ret i32 5
b9:
	%9 = icmp ne i32 1, 0
	br i1 %9, label %b7, label %b8
}

