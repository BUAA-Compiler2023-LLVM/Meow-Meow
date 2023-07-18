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
define i32 @f(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* %1
	%3 = add i32 %2, 5
	ret i32 %3
}

define i32 @main() {
b0:
	%0 = alloca i32
	%1 = call i32 @f(i32 5)
	store i32 %1, i32* %0
	%2 = load i32, i32* %0
	call void @putint(i32 %2)
	ret i32 %2
}

