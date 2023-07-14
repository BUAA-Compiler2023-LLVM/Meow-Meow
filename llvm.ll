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
define i32 @add(i32 %0, i32 %1) {
b0:
	%2 = alloca i32
	store i32 %0, i32* %2
	%3 = alloca i32
	store i32 %1, i32* %3
	br label %b1
b1:
	%4 = load i32, i32* %2
	%5 = load i32, i32* %3
	%6 = add i32 %4, %5
	ret i32 %6
}

define i32 @zero() {
b0:
	ret i32 0
}

define i32 @main() {
b0:
	%0 = alloca i32
	store i32 1, i32* %0
	%1 = alloca i32
	%2 = call i32 @zero()
	store i32 %2, i32* %1
	%3 = alloca i32
	%4 = load i32, i32* %0
	%5 = load i32, i32* %1
	%6 = call i32 @add(i32 %4, i32 %5)
	store i32 %6, i32* %3
	%7 = load i32, i32* %3
	call void @putint(i32 %7)
	ret i32 %7
}

