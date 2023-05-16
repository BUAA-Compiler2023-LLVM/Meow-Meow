declare void @memset(i32*, i32, i32)
declare i32 @printf(i8*, ...)
declare i32 @getint()

@arr = global [2 x [2 x i32]] [i32 1, i32 0, i32 0, i32 0]
define i32 @main() {
%0:
	%1 = alloca i32
	store i32 3, %1
	%2 = load i32, i32* %1
	ret i32 %2
}

