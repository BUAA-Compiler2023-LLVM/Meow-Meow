declare void @memset(i32*, i32, i32)
declare i32 @printf(i8*, ...)
declare i32 @getint()

define i32 @main() {
%0:
	%1 = alloca i32
	store i32 1, %1
	%2 = load i32, i32* %1
	%3 = alloca [2 x i32]
	%4 = getelementptr [2 x i32], [2 x i32]* %3, i32 0, i32 0
	store i32 %2, %4
	%5 = getelementptr [2 x i32], [2 x i32]* %4, i32 0, i32 1
	store i32 0, %5
	%6 = load i32, i32* %1
	%7 = getelementptr [2 x i32], [2 x i32]* %3, i32 0, i32 %6
	%8 = load i32, i32* %1
	store i32 %8, %7
	%9 = load i32, i32* %1
	ret i32 %9
}

