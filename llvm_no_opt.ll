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
define i32 @deepWhileBr(i32 %0, i32 %1) {
b0:
	%2 = alloca i32
	store i32 %0, i32* %2
	%3 = alloca i32
	store i32 %1, i32* %3
	br label %b1
b1:
	%4 = alloca i32
	%5 = load i32, i32* %2
	%6 = load i32, i32* %3
	%7 = add i32 %5, %6
	store i32 %7, i32* %4
	br label %b2
b2:
	%8 = load i32, i32* %4
	%9 = icmp slt i32 %8, 75
	%10 = icmp ne i1 %9, 0
	br i1 %10, label %b3, label %b4
b3:
	%11 = alloca i32
	store i32 42, i32* %11
	%12 = load i32, i32* %4
	%13 = icmp slt i32 %12, 100
	%14 = icmp ne i1 %13, 0
	br i1 %14, label %b5, label %b6
b4:
	%15 = load i32, i32* %4
	ret i32 %15
b5:
	%16 = load i32, i32* %4
	%17 = load i32, i32* %11
	%18 = add i32 %16, %17
	store i32 %18, i32* %4
	%19 = load i32, i32* %4
	%20 = icmp sgt i32 %19, 99
	%21 = icmp ne i1 %20, 0
	br i1 %21, label %b7, label %b8
b6:
	br label %b2
b7:
	%22 = alloca i32
	%23 = load i32, i32* %11
	%24 = mul i32 %23, 2
	store i32 %24, i32* %22
	%25 = icmp ne i32 1, 0
	br i1 %25, label %b9, label %b10
b8:
	br label %b6
b9:
	%26 = load i32, i32* %22
	%27 = mul i32 %26, 2
	store i32 %27, i32* %4
	br label %b10
b10:
	br label %b8
}

define i32 @main() {
b0:
	%0 = alloca i32
	store i32 2, i32* %0
	%1 = load i32, i32* %0
	%2 = load i32, i32* %0
	%3 = call i32 @deepWhileBr(i32 %1, i32 %2)
	call void @putint(i32 %3)
	ret i32 %3
}

