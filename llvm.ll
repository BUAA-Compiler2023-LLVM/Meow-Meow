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
@array = global [1000 x i32]zeroinitializer
define void @findSmallest(i32 %0, i32 %1, i32 %2, i32 %3) {
b0:
	%4 = alloca i32
	store i32 %0, i32* %4
	%5 = alloca i32
	store i32 %1, i32* %5
	%6 = alloca i32
	store i32 %2, i32* %6
	%7 = alloca i32
	store i32 %3, i32* %7
	br label %b1
b1:
	%8 = load i32, i32* %4
	%9 = load i32, i32* %5
	%10 = icmp eq i32 %8, %9
	%11 = icmp ne i1 %10, 0
	br i1 %11, label %b2, label %b4
b2:
	ret void
b3:
	ret void
b4:
	%12 = load i32, i32* %5
	%13 = load i32, i32* %6
	%14 = load i32, i32* %7
	call void @findSmallest(i32 1, i32 %12, i32 %13, i32 %14)
	br label %b3
}

define i32 @main() {
b0:
	%0 = alloca i32
	%1 = call i32 @getint()
	store i32 %1, i32* %0
	%2 = alloca i32
	%3 = call i32 @getint()
	store i32 %3, i32* %2
	%4 = alloca i32
	store i32 0, i32* %4
	%5 = alloca i32
	%6 = load i32, i32* %0
	%7 = sub i32 %6, 1
	store i32 %7, i32* %5
	%8 = load i32, i32* %4
	%9 = load i32, i32* %5
	%10 = load i32, i32* %2
	%11 = load i32, i32* %0
	call void @findSmallest(i32 %8, i32 %9, i32 %10, i32 %11)
	call void @putint(i32 0)
	ret i32 0
}

