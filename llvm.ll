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
	%0 = alloca [4 x [2 x i32]]
	%1 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %0, i32 0, i32 0, i32 0
	store i32 0, i32* %1
	%2 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %0, i32 0, i32 0, i32 1
	store i32 0, i32* %2
	%3 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %0, i32 0, i32 0, i32 2
	store i32 0, i32* %3
	%4 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %0, i32 0, i32 0, i32 3
	store i32 0, i32* %4
	%5 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %0, i32 0, i32 0, i32 4
	store i32 0, i32* %5
	%6 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %0, i32 0, i32 0, i32 5
	store i32 0, i32* %6
	%7 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %0, i32 0, i32 0, i32 6
	store i32 0, i32* %7
	%8 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %0, i32 0, i32 0, i32 7
	store i32 0, i32* %8
	%9 = getelementptr [4 x [2 x i32]], [4 x [2 x i32]]* %0, i32 0, i32 0, i32 0
	%10 = load i32, i32* %9
	call void @putint(i32 %10)
	ret i32 %10
}

