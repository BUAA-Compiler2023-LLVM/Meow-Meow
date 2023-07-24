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
	%3 = icmp ne i32 %2, 0
	br i1 %3, label %b3, label %b2
b1:
	%4 = load i32, i32* %0
	%5 = load i32, i32* %1
	%6 = sub i32 %4, %5
	call void @putint(i32 %6)
	ret i32 %6
b2:
	%7 = load i32, i32* %0
	%8 = load i32, i32* %1
	%9 = add i32 %7, %8
	call void @putint(i32 %9)
	ret i32 %9
b3:
	%10 = load i32, i32* %1
	%11 = icmp ne i32 %10, 0
	br i1 %11, label %b1, label %b2
}

