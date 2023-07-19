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
@n = global i32 0
@m = global i32 0
@head = global [1005 x i32]zeroinitializer
define void @init() {
b0:
	%0 = alloca i32
	store i32 0, i32* %0
	br label %b1
b1:
	%1 = load i32, i32* %0
	%2 = icmp slt i32 %1, 1005
	%3 = icmp ne i1 %2, 0
	br i1 %3, label %b2, label %b3
b2:
	%4 = load i32, i32* %0
	%5 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %4
	store i32 -1, i32* %5
	%6 = load i32, i32* %0
	%7 = add i32 %6, 1
	store i32 %7, i32* %0
	br label %b1
b3:
	ret void
}

define i32 @main() {
b0:
	store i32 5, i32* @n
	store i32 5, i32* @m
	call void @init()
	call void @putint(i32 0)
	ret i32 0
}

