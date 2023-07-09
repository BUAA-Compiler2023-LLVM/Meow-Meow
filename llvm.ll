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
	store i32 893, i32* %0
	%1 = alloca i32
	store i32 716, i32* %1
	%2 = alloca i32
	store i32 837, i32* %2
	%3 = load i32, i32* %2
	%4 = add i32 %3, 128
	store i32 %4, i32* %2
	%5 = load i32, i32* %1
	%6 = load i32, i32* %2
	%7 = add i32 %5, %6
	store i32 %7, i32* %1
	%8 = alloca i32
	store i32 241, i32* %8
	%9 = load i32, i32* %2
	%10 = load i32, i32* %8
	%11 = add i32 %9, %10
	%12 = sub i32 %11, 412
	store i32 %12, i32* %2
	%13 = alloca i32
	store i32 771, i32* %13
	%14 = load i32, i32* %8
	%15 = load i32, i32* %13
	%16 = add i32 %14, %15
	%17 = sub i32 %16, 18
	store i32 %17, i32* %8
	%18 = load i32, i32* %8
	%19 = add i32 %18, 66
	store i32 %19, i32* %13
	%20 = load i32, i32* %8
	%21 = load i32, i32* %2
	%22 = add i32 %20, %21
	%23 = sub i32 %22, 33
	store i32 %23, i32* %8
	%24 = load i32, i32* %8
	%25 = sub i32 %24, 55
	store i32 %25, i32* %2
	%26 = load i32, i32* %2
	%27 = load i32, i32* %8
	%28 = add i32 %26, %27
	%29 = srem i32 %28, 21
	call void @putint(i32 %29)
	ret i32 %29
}

