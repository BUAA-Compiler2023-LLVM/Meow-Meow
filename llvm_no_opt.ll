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
	%1 = alloca i32
	%2 = alloca i32
	%3 = alloca i32
	%4 = alloca i32
	store i32 5, i32* %0
	store i32 5, i32* %1
	store i32 1, i32* %2
	store i32 -2, i32* %3
	store i32 2, i32* %4
	%5 = load i32, i32* %3
	%6 = mul i32 %5, 1
	%7 = sdiv i32 %6, 2
	%8 = icmp slt i32 %7, 0
	%9 = icmp ne i1 %8, 0
	br i1 %9, label %b1, label %b3
b1:
	%10 = load i32, i32* %4
	call void @putint(i32 %10)
	br label %b2
b2:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b3:
	%11 = load i32, i32* %0
	%12 = load i32, i32* %1
	%13 = sub i32 %11, %12
	%14 = icmp ne i32 %13, 0
	%15 = icmp ne i1 %14, 0
	br i1 %15, label %b4, label %b2
b4:
	%16 = load i32, i32* %2
	%17 = add i32 %16, 3
	%18 = srem i32 %17, 2
	%19 = icmp ne i32 %18, 0
	%20 = icmp ne i1 %19, 0
	br i1 %20, label %b1, label %b2
}

