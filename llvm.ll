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

define i32 @add10(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9) {
b0:
	%10 = alloca i32
	store i32 %0, i32* %10
	%11 = alloca i32
	store i32 %1, i32* %11
	%12 = alloca i32
	store i32 %2, i32* %12
	%13 = alloca i32
	store i32 %3, i32* %13
	%14 = alloca i32
	store i32 %4, i32* %14
	%15 = alloca i32
	store i32 %5, i32* %15
	%16 = alloca i32
	store i32 %6, i32* %16
	%17 = alloca i32
	store i32 %7, i32* %17
	%18 = alloca i32
	store i32 %8, i32* %18
	%19 = alloca i32
	store i32 %9, i32* %19
	br label %b1
b1:
	%20 = load i32, i32* %10
	%21 = load i32, i32* %19
	%22 = add i32 %20, %21
	ret i32 %22
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
	%7 = alloca i32
	%8 = call i32 @add10(i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9)
	store i32 %8, i32* %7
	%9 = load i32, i32* %3
	%10 = load i32, i32* %7
	%11 = add i32 %9, %10
	call void @putint(i32 %11)
	ret i32 %11
}

