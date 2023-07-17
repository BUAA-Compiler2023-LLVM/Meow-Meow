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
	%0 = icmp eq i32 1, 99
	%1 = icmp ne i1 %0, 0
	br i1 %1, label %b2, label %b1
b1:
	move 13 --> %71
	move 12 --> %72
	move 11 --> %73
	move 10 --> %74
	move 9 --> %75
	move 8 --> %76
	move 7 --> %77
	move 6 --> %78
	move 5 --> %79
	move 4 --> %80
	move 3 --> %81
	move 2 --> %82
	move 1 --> %83
	br label %b3
b2:
	move 14 --> %71
	move 13 --> %72
	move 12 --> %73
	move 11 --> %74
	move 10 --> %75
	move 9 --> %76
	move 8 --> %77
	move 7 --> %78
	move 6 --> %79
	move 5 --> %80
	move 4 --> %81
	move 3 --> %82
	move 2 --> %83
	br label %b3
b3:
	call void @putint(i32 %81)
	ret i32 %81
}

