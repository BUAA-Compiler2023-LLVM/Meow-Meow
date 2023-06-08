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
define i32 @f() {
%0:
	ret i32 0
}

define i32 @main() {
%0:
	%1 = alloca [2 x i32]
	%2 = getelementptr [2 x i32], [2 x i32]* %1, i32 0, i32 0
	store i32 1, %2
	%3 = getelementptr [2 x i32], [2 x i32]* %1, i32 0, i32 1
	store i32 2, %3
	%4 = getelementptr [2 x i32], [2 x i32]* %1, i32 0, i32 0
	%5 = call i32 @f(i32* %4)
	ret i32 %5
}

