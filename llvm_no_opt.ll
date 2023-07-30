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
	%0 = alloca i32
	store i32 0, i32* %0
	br label %b1
b1:
	%1 = load i32, i32* %0
	%2 = icmp sle i32 %1, 3
	%3 = icmp ne i1 %2, 0
	br i1 %3, label %b2, label %b3
b2:
	%4 = alloca i32
	store i32 0, i32* %4
	br label %b4
b3:
	%5 = load i32, i32* %0
	call void @putint(i32 %5)
	ret i32 %5
b4:
	%6 = load i32, i32* %4
	%7 = icmp sle i32 %6, 3
	%8 = icmp ne i1 %7, 0
	br i1 %8, label %b5, label %b6
b5:
	%9 = load i32, i32* %4
	%10 = add i32 %9, 1
	store i32 %10, i32* %4
	br label %b4
b6:
	%11 = load i32, i32* %0
	%12 = add i32 %11, 1
	store i32 %12, i32* %0
	br label %b1
}

