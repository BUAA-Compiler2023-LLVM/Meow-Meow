declare void @memset(i32*, i32, i32)
declare i32 @printf(i8*, ...)
declare i32 @getint()

@var = global i32 0
define i32 @main() {
%0:
	%1 = load i32, i32* @var
	%2 = add i32 %1 1
	ret i32 %2
}

