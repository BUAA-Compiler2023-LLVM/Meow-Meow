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
	%0 = zext i1 0 to i32
	%1 = icmp eq i32 0, %0
	%2 = zext i1 %1 to i32
	%3 = sub i32 0, %2
	%4 = icmp eq i32 -1, %3
	%5 = icmp ne i1 %4, 0
	br i1 %5, label %b1, label %b2
b1:
	call void @putint(i32 1)
	br label %b2
b2:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

