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
	%0 = move 4
	br label %b3
b3:
	%1 = move %0
	%2 = icmp slt i32 %1, 75
	br i1 %2, label %b4, label %b6
b4:
	%3 = icmp slt i32 %1, 100
	br i1 %3, label %b7, label %b5
b5:
	%0 = move %1
	br label %b3
b6:
	br label %b12
b7:
	%4 = add i32 %1, 42
	%5 = icmp sgt i32 %4, 99
	br i1 %5, label %b9, label %b8
b8:
	%0 = move %4
	br label %b3
b9:
	br i1 1, label %b11, label %b10
b10:
	%0 = move %4
	br label %b3
b11:
	%0 = move 168
	br label %b3
b12:
	call void @putint(i32 %1)
	ret i32 %1
}

