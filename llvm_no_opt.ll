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
@a = global [5 x i32] [i32 0, i32 1, i32 2, i32 0, i32 0]
@b = global [10 x i32]zeroinitializer
@A = global i32 5
define void @f(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* @A
	%3 = add i32 %2, 2
	store i32 %3, i32* @A
	%4 = load i32, i32* %1
	%5 = getelementptr [10 x i32], [10 x i32]* @b, i32 0, i32 %4
	%6 = load i32, i32* @A
	store i32 %6, i32* %5
	ret void
}

define i32 @main() {
b0:
	%0 = load i32, i32* @A
	%1 = add i32 %0, 2
	store i32 %1, i32* @A
	%2 = alloca i32
	store i32 1, i32* %2
	%3 = alloca i32
	store i32 0, i32* %3
	br label %b1
b1:
	%4 = load i32, i32* %2
	%5 = icmp sle i32 %4, 10
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b2, label %b3
b2:
	%7 = load i32, i32* @A
	%8 = load i32, i32* %2
	%9 = add i32 %7, %8
	store i32 %9, i32* @A
	%10 = load i32, i32* %3
	call void @f(i32 %10)
	br label %b1
b3:
	%11 = load i32, i32* @A
	call void @putint(i32 %11)
	ret i32 %11
}

