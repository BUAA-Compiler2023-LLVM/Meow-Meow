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
	%0 = icmp slt i32 2, 1
	%1 = icmp ne i1 %0, 0
	br i1 %1, label %b1, label %b3
b1:
	%2 = add i32 2, 1
	br label %b2
b2:
	%3 = phi i32 [ %2, %b1 ],[ %4, %b3 ]
	call void @putint(i32 %3)
	ret i32 %3
b3:
	%4 = add i32 2, 2
	br label %b2
}

