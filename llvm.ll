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
	br label %b1
b1:
	%0 = phi i32 [ 0, %b0 ],[ %5, %b6 ]
	%1 = icmp sle i32 %0, 3
	br i1 %1, label %b2, label %b3
b2:
	br label %b4
b3:
	call void @putint(i32 %0)
	ret i32 %0
b4:
	%2 = phi i32 [ 0, %b2 ],[ %4, %b5 ]
	%3 = icmp sle i32 %2, 3
	br i1 %3, label %b5, label %b6
b5:
	%4 = add i32 %2, 1
	br label %b4
b6:
	%5 = add i32 %0, 1
	br label %b1
}

