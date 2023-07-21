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
define i32 @main() {
b0:
	%0 = alloca i32
	store i32 0, i32* %0
	%1 = alloca i32
	store i32 1, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* %1
	%3 = icmp sgt i32 1000, %2
	%4 = icmp ne i1 %3, 0
	br i1 %4, label %b2, label %b3
b2:
	%5 = alloca i32
	%6 = load i32, i32* %0
	store i32 %6, i32* %5
	%7 = load i32, i32* %1
	store i32 %7, i32* %0
	%8 = load i32, i32* %1
	%9 = load i32, i32* %5
	%10 = add i32 %8, %9
	store i32 %10, i32* %1
	br label %b1
b3:
	%11 = load i32, i32* %1
	call void @putint(i32 %11)
	ret i32 %11
}

