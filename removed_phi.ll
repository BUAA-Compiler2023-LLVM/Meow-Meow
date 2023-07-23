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
define i32 @main() {
b0:
	%0 = load i32, i32* @A
	%1 = add i32 %0, 2
	store i32 %1, i32* @A
	br label %b1
b1:
	%2 = icmp sle i32 1, 10
	%3 = icmp ne i1 %2, 0
	br i1 %3, label %b2, label %b6
b2:
	%4 = load i32, i32* @A
	%5 = add i32 %4, 1
	store i32 %5, i32* @A
	br label %b3
b3:
	br label %b4
b4:
	%6 = load i32, i32* @A
	%7 = add i32 %6, 2
	store i32 %7, i32* @A
	%8 = getelementptr [10 x i32], [10 x i32]* @b, i32 0, i32 0
	%9 = load i32, i32* @A
	store i32 %9, i32* %8
	br label %b5
b5:
	br label %b1
b6:
	%10 = load i32, i32* @A
	call void @putint(i32 %10)
	ret i32 %10
}

