declare void @memset(i32*, i32, i32)
declare i32 @printf(i8*, ...)
declare i32 @getint()

@a = global [2 x i32] [i32 3, i32 1]
@b = global [2 x i32] [i32 0, i32 2]
define i32 @main() {
%0:
	%1 = alloca [3 x i32]
	%2 = getelementptr [3 x i32], [3 x i32]* %1, i32 0, i32 0
	store i32 1, %2
	%3 = getelementptr [3 x i32], [3 x i32]* %2, i32 0, i32 1
	store i32 4, %3
	%4 = alloca [2 x i32]
	%5 = getelementptr [2 x i32], [2 x i32]* %4, i32 0, i32 0
	store i32 1, %5
	ret i32 0
}

