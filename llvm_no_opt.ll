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
	store i32 5, i32* %0
	%1 = alloca i32
	store i32 6, i32* %1
	%2 = load i32, i32* %0
	%3 = load i32, i32* %1
	%4 = icmp slt i32 %2, %3
	%5 = icmp ne i1 %4, 0
	br i1 %5, label %b1, label %b2
b1:
	%6 = load i32, i32* %0
	%7 = load i32, i32* %1
	%8 = add i32 %6, %7
	call void @putint(i32 %8)
	ret i32 %8
b2:
	%9 = load i32, i32* %0
	%10 = load i32, i32* %1
	%11 = sub i32 %9, %10
	call void @putint(i32 %11)
	ret i32 %11
}

