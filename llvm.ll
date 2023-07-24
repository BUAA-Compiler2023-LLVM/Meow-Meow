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
@g = global i32 0
define i32 @main() {
b0:
	%0 = call i32 @getint()
	%1 = icmp sgt i32 %0, 10
	br i1 %1, label %b4, label %b3
b1:
	br label %b2
b2:
	%2 = call i32 @getint()
	%3 = icmp sgt i32 %2, 11
	br i1 %3, label %b11, label %b10
b3:
	br label %b2
b4:
	br label %b5
b5:
	br label %b6
b6:
	%4 = load i32, i32* @g
	%5 = add i32 %4, %0
	store i32 %5, i32* @g
	%6 = load i32, i32* @g
	call void @putint(i32 %6)
	%7 = load i32, i32* @g
	br label %b7
b7:
	%8 = icmp ne i32 %7, 0
	br i1 %8, label %b1, label %b3
b8:
	br label %b9
b9:
	%9 = call i32 @getint()
	%10 = icmp sle i32 %9, 99
	br i1 %10, label %b15, label %b18
b10:
	br label %b9
b11:
	br label %b12
b12:
	br label %b13
b13:
	%11 = load i32, i32* @g
	%12 = add i32 %11, %2
	store i32 %12, i32* @g
	%13 = load i32, i32* @g
	call void @putint(i32 %13)
	%14 = load i32, i32* @g
	br label %b14
b14:
	%15 = icmp ne i32 %14, 0
	br i1 %15, label %b8, label %b10
b15:
	br label %b16
b16:
	%16 = call i32 @getint()
	%17 = icmp sle i32 %16, 100
	br i1 %17, label %b22, label %b28
b17:
	br label %b16
b18:
	br label %b19
b19:
	br label %b20
b20:
	%18 = load i32, i32* @g
	%19 = add i32 %18, %9
	store i32 %19, i32* @g
	%20 = load i32, i32* @g
	call void @putint(i32 %20)
	%21 = load i32, i32* @g
	br label %b21
b21:
	%22 = icmp ne i32 %21, 0
	br i1 %22, label %b15, label %b17
b22:
	br label %b23
b23:
	br label %b24
b24:
	br label %b25
b25:
	%23 = load i32, i32* @g
	%24 = add i32 %23, 99
	store i32 %24, i32* @g
	%25 = load i32, i32* @g
	call void @putint(i32 %25)
	%26 = load i32, i32* @g
	br label %b26
b26:
	%27 = zext i1 0 to i32
	%28 = icmp eq i32 %26, %27
	br i1 %28, label %b35, label %b34
b27:
	br label %b23
b28:
	br label %b29
b29:
	br label %b30
b30:
	%29 = load i32, i32* @g
	%30 = add i32 %29, %16
	store i32 %30, i32* @g
	%31 = load i32, i32* @g
	call void @putint(i32 %31)
	%32 = load i32, i32* @g
	br label %b31
b31:
	%33 = icmp ne i32 %32, 0
	br i1 %33, label %b22, label %b27
b32:
	br label %b33
b33:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b34:
	br label %b33
b35:
	br label %b36
b36:
	br label %b37
b37:
	%34 = load i32, i32* @g
	%35 = add i32 %34, 100
	store i32 %35, i32* @g
	%36 = load i32, i32* @g
	call void @putint(i32 %36)
	%37 = load i32, i32* @g
	br label %b38
b38:
	%38 = icmp ne i32 %37, 0
	br i1 %38, label %b32, label %b34
}

