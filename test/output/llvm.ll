declare void @memset(i32*, i32, i32)
declare i32 @printf(i8*, ...)
declare i32 @getint()

@arr = global [2 x [3 x [4 x i32]]] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 0, i32 0, i32 0, i32 6, i32 0, i32 0, i32 0, i32 7, i32 8, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0]
define i32 @main() {
%0:
	ret @arr
}

