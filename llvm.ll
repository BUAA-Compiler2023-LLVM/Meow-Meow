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
	store i32 10, i32* %0
	%1 = load i32, i32* %0
	%2 = add i32 %1, 1
	store i32 %2, i32* %0
	%3 = load i32, i32* %0
	%4 = icmp eq i32 %3, 11
	%5 = icmp ne i1 %4, 0
	br i1 %5, label %b1, label %b3
b1:
	%6 = load i32, i32* %0
	call void @putint(i32 %6)
	ret i32 %6
b2:
	ret i32 0
b3:
	call void @putint(i32 0)
	ret i32 0
}

