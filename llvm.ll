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
	br label %b2
b2:
	br label %b3
b3:
	%0 = phi i32 [ 4, %b2 ],[ %0, %b4 ],[ %3, %b6 ],[ %3, %b7 ],[ 168, %b8 ]
	%1 = icmp slt i32 %0, 75
	br i1 %1, label %b4, label %b5
b4:
	%2 = icmp slt i32 %0, 100
	br i1 %2, label %b6, label %b3
b5:
	br label %b9
b6:
	%3 = add i32 %0, 42
	%4 = icmp sgt i32 %3, 99
	br i1 %4, label %b7, label %b3
b7:
	br i1 1, label %b8, label %b3
b8:
	br label %b3
b9:
	call void @putint(i32 %0)
	ret i32 %0
}

