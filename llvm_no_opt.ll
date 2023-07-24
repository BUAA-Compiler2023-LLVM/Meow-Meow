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
@A = global i32 5
define i32 @f(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* @A
	%3 = load i32, i32* %1
	%4 = add i32 %2, %3
	store i32 %4, i32* @A
	%5 = load i32, i32* @A
	ret i32 %5
}

define i32 @main() {
b0:
	%0 = alloca i32
	store i32 1, i32* %0
	%1 = load i32, i32* %0
	%2 = icmp sle i32 %1, 5
	%3 = icmp ne i1 %2, 0
	br i1 %3, label %b1, label %b2
b1:
	%4 = load i32, i32* @A
	%5 = call i32 @f(i32 %4)
	store i32 %5, i32* %0
	br label %b2
b2:
	%6 = load i32, i32* @A
	call void @putint(i32 %6)
	ret i32 %6
}

