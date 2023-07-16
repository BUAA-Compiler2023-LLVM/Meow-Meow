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
define i32 @add(i32* %0) {
b0:
	%1 = alloca i32*
	store i32* %0, i32** %1
	br label %b1
b1:
	%2 = load i32*, i32** %1
	%3 = getelementptr i32, i32* %2, i32 0
	%4 = load i32, i32* %3
	%5 = load i32*, i32** %1
	%6 = getelementptr i32, i32* %5, i32 2
	%7 = load i32, i32* %6
	%8 = add i32 %4, %7
	ret i32 %8
}

define i32 @main() {
b0:
	%0 = alloca [4 x i32]
	%1 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 0
	call void @memset(i32* %1, i32 0, i32 16)
	%2 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 0
	store i32 1, i32* %2
	%3 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 1
	store i32 5, i32* %3
	%4 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 2
	store i32 2, i32* %4
	%5 = getelementptr [4 x i32], [4 x i32]* %0, i32 0, i32 0
	%6 = call i32 @add(i32* %5)
	call void @putint(i32 %6)
	ret i32 %6
}

