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
	%0 = icmp slt i32 5, 6
	br i1 %0, label %b1, label %b2
b1:
	%1 = add i32 5, 6
	call void @putint(i32 %1)
	ret i32 %1
b2:
	%2 = sub i32 5, 6
	call void @putint(i32 %2)
	ret i32 %2
}

