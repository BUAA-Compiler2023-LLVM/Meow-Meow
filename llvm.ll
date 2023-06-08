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
@a = global null
define i32 @f(i32 %0) {
%1:
	%2 = alloca i32
	store i32 %0, %2
	br label %4
%4:
	%5 = load i32, i32* %2
	%6 = getelementptr [3 x i32], [3 x i32]* @a, i32 0, i32 %5
	%7 = load i32, i32* %6
	ret i32 %7
	br label block3
}

define i32 @main() {
%0:
	%1 = alloca i32
	store i32 2, %1
	%2 = load i32, i32* %1
	%3 = call i32 @f(i32 %2)
	ret i32 %3
}

