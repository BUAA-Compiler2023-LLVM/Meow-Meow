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
	%0 = icmp ne i32 1, 0
	br i1 %0, label %b4, label %b3
b1:
	%1 = icmp ne i32 5, 0
	br i1 %1, label %b5, label %b8
b2:
	ret i32 0
b3:
	call void @putint(i32 1)
	ret i32 1
b4:
	%2 = icmp ne i32 1, 0
	br i1 %2, label %b1, label %b3
b5:
	%3 = icmp ne i32 0, 0
	br i1 %3, label %b12, label %b11
b6:
	br label %b2
b7:
	call void @putint(i32 2)
	ret i32 2
b8:
	%4 = zext i1 0 to i32
	%5 = icmp eq i32 1, %4
	%6 = zext i1 %5 to i32
	%7 = add i32 %6, 0
	%8 = icmp ne i32 %7, 0
	br i1 %8, label %b5, label %b7
b9:
	call void @putint(i32 3)
	ret i32 3
b10:
	br label %b6
b11:
	%9 = icmp ne i32 0, 0
	br i1 %9, label %b16, label %b15
b12:
	%10 = icmp ne i32 1, 0
	br i1 %10, label %b9, label %b11
b13:
	call void @putint(i32 4)
	ret i32 4
b14:
	br label %b10
b15:
	%11 = icmp ne i32 1, 0
	br i1 %11, label %b17, label %b19
b16:
	%12 = icmp ne i32 5, 0
	br i1 %12, label %b13, label %b15
b17:
	%13 = icmp ne i32 0, 0
	br i1 %13, label %b20, label %b23
b18:
	br label %b14
b19:
	call void @putint(i32 5)
	ret i32 5
b20:
	call void @putint(i32 6)
	ret i32 6
b21:
	br label %b18
b22:
	%14 = icmp ne i32 1, 0
	br i1 %14, label %b24, label %b26
b23:
	%15 = icmp ne i32 0, 0
	br i1 %15, label %b20, label %b22
b24:
	%16 = icmp ne i32 1, 0
	br i1 %16, label %b27, label %b29
b25:
	br label %b21
b26:
	call void @putint(i32 7)
	ret i32 7
b27:
	%17 = zext i1 0 to i32
	%18 = icmp eq i32 6, %17
	%19 = icmp ne i1 %18, 0
	br i1 %19, label %b30, label %b32
b28:
	br label %b25
b29:
	call void @putint(i32 8)
	ret i32 8
b30:
	call void @putint(i32 9)
	ret i32 9
b31:
	br label %b28
b32:
	call void @putint(i32 10)
	ret i32 10
}

