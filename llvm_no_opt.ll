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
@g = global [4 x i32] [i32 1, i32 2, i32 3, i32 4]
define i32 @main() {
b0:
	%0 = alloca i32
	%1 = alloca i32
	%2 = alloca i32
	%3 = alloca i32
	%4 = getelementptr [4 x i32], [4 x i32]* @g, i32 0, i32 1
	%5 = load i32, i32* %4
	store i32 %5, i32* %0
	%6 = getelementptr [4 x i32], [4 x i32]* @g, i32 0, i32 2
	%7 = load i32, i32* %6
	store i32 %7, i32* %1
	%8 = getelementptr [4 x i32], [4 x i32]* @g, i32 0, i32 3
	%9 = load i32, i32* %8
	store i32 %9, i32* %2
	%10 = getelementptr [4 x i32], [4 x i32]* @g, i32 0, i32 4
	%11 = load i32, i32* %10
	store i32 %11, i32* %3
	%12 = load i32, i32* %0
	%13 = mul i32 %12, 2
	store i32 %13, i32* %1
	%14 = load i32, i32* %1
	%15 = mul i32 3, %14
	store i32 %15, i32* %2
	%16 = load i32, i32* %2
	%17 = mul i32 6, %16
	store i32 %17, i32* %3
	%18 = load i32, i32* %3
	call void @putint(i32 %18)
	ret i32 %18
}

