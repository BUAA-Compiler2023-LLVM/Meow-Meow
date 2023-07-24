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
define i32 @func(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* @g
	%3 = load i32, i32* %1
	%4 = add i32 %2, %3
	store i32 %4, i32* @g
	%5 = load i32, i32* @g
	call void @putint(i32 %5)
	%6 = load i32, i32* @g
	ret i32 %6
}

define i32 @main() {
b0:
	%0 = alloca i32
	%1 = call i32 @getint()
	store i32 %1, i32* %0
	%2 = load i32, i32* %0
	%3 = icmp sgt i32 %2, 10
	%4 = icmp ne i1 %3, 0
	br i1 %4, label %b4, label %b3
b1:
	store i32 1, i32* %0
	br label %b2
b2:
	%5 = call i32 @getint()
	store i32 %5, i32* %0
	%6 = load i32, i32* %0
	%7 = icmp sgt i32 %6, 11
	%8 = icmp ne i1 %7, 0
	br i1 %8, label %b8, label %b7
b3:
	store i32 0, i32* %0
	br label %b2
b4:
	%9 = load i32, i32* %0
	%10 = call i32 @func(i32 %9)
	%11 = icmp ne i32 %10, 0
	br i1 %11, label %b1, label %b3
b5:
	store i32 1, i32* %0
	br label %b6
b6:
	%12 = call i32 @getint()
	store i32 %12, i32* %0
	%13 = load i32, i32* %0
	%14 = icmp sle i32 %13, 99
	%15 = icmp ne i1 %14, 0
	br i1 %15, label %b9, label %b12
b7:
	store i32 0, i32* %0
	br label %b6
b8:
	%16 = load i32, i32* %0
	%17 = call i32 @func(i32 %16)
	%18 = icmp ne i32 %17, 0
	br i1 %18, label %b5, label %b7
b9:
	store i32 1, i32* %0
	br label %b10
b10:
	%19 = call i32 @getint()
	store i32 %19, i32* %0
	%20 = load i32, i32* %0
	%21 = icmp sle i32 %20, 100
	%22 = icmp ne i1 %21, 0
	br i1 %22, label %b13, label %b16
b11:
	store i32 0, i32* %0
	br label %b10
b12:
	%23 = load i32, i32* %0
	%24 = call i32 @func(i32 %23)
	%25 = icmp ne i32 %24, 0
	br i1 %25, label %b9, label %b11
b13:
	store i32 1, i32* %0
	br label %b14
b14:
	%26 = call i32 @func(i32 99)
	%27 = zext i1 0 to i32
	%28 = icmp eq i32 %26, %27
	%29 = icmp ne i1 %28, 0
	br i1 %29, label %b20, label %b19
b15:
	store i32 0, i32* %0
	br label %b14
b16:
	%30 = load i32, i32* %0
	%31 = call i32 @func(i32 %30)
	%32 = icmp ne i32 %31, 0
	br i1 %32, label %b13, label %b15
b17:
	store i32 1, i32* %0
	br label %b18
b18:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b19:
	store i32 0, i32* %0
	br label %b18
b20:
	%33 = call i32 @func(i32 100)
	%34 = icmp ne i32 %33, 0
	br i1 %34, label %b17, label %b19
}

