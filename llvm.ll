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
define i32 @main() {
b0:
	%0 = icmp sle i32 1, 5
	%1 = icmp ne i1 %0, 0
	br i1 %1, label %b1, label %b5
b1:
	%2 = load i32, i32* @A
	br label %b2
b2:
	br label %b3
b3:
	%3 = load i32, i32* @A
	%4 = add i32 %3, %2
	store i32 %4, i32* @A
	%5 = load i32, i32* @A
	br label %b4
b4:
	br label %b5
b5:
	%6 = load i32, i32* @A
	call void @putint(i32 %6)
	ret i32 %6
}

