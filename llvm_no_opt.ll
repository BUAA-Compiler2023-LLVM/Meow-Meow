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
define void @printSolution(i32* %0) {
b0:
	%1 = alloca i32*
	store i32* %0, i32** %1
	br label %b1
b1:
	%2 = alloca i32
	store i32 0, i32* %2
	br label %b2
b2:
	%3 = load i32, i32* %2
	%4 = icmp slt i32 %3, 4
	%5 = icmp ne i1 %4, 0
	br i1 %5, label %b3, label %b4
b3:
	%6 = load i32*, i32** %1
	%7 = load i32, i32* %2
	%8 = getelementptr i32, i32* %6, i32 %7
	%9 = load i32, i32* %8
	call void @putint(i32 %9)
	call void @putch(i32 32)
	%10 = load i32, i32* %2
	%11 = add i32 %10, 1
	store i32 %11, i32* %2
	br label %b2
b4:
	call void @putch(i32 10)
	ret void
}

define void @printMessage() {
b0:
	call void @putch(i32 78)
	call void @putch(i32 111)
	call void @putch(i32 116)
	call void @putch(i32 32)
	call void @putch(i32 101)
	call void @putch(i32 120)
	call void @putch(i32 105)
	call void @putch(i32 115)
	call void @putch(i32 116)
	ret void
}

define i32 @isSafe([4 x i32]* %0, i32* %1) {
b0:
	%2 = alloca [4 x i32]*
	store [4 x i32]* %0, [4 x i32]** %2
	%3 = alloca i32*
	store i32* %1, i32** %3
	br label %b1
b1:
	%4 = alloca i32
	store i32 0, i32* %4
	br label %b2
b2:
	%5 = load i32, i32* %4
	%6 = icmp slt i32 %5, 4
	%7 = icmp ne i1 %6, 0
	br i1 %7, label %b3, label %b4
b3:
	%8 = alloca i32
	%9 = load i32, i32* %4
	%10 = add i32 %9, 1
	store i32 %10, i32* %8
	br label %b5
b4:
	ret i32 1
b5:
	%11 = load i32, i32* %8
	%12 = icmp slt i32 %11, 4
	%13 = icmp ne i1 %12, 0
	br i1 %13, label %b6, label %b7
b6:
	%14 = load [4 x i32]*, [4 x i32]** %2
	%15 = load i32, i32* %4
	%16 = load i32, i32* %8
	%17 = getelementptr [4 x i32], [4 x i32]* %14, i32 %15, i32 %16
	%18 = load i32, i32* %17
	%19 = icmp ne i32 %18, 0
	br i1 %19, label %b10, label %b9
b7:
	%20 = load i32, i32* %4
	%21 = add i32 %20, 1
	store i32 %21, i32* %4
	br label %b2
b8:
	ret i32 0
b9:
	%22 = load i32, i32* %8
	%23 = add i32 %22, 1
	store i32 %23, i32* %8
	br label %b5
b10:
	%24 = load i32*, i32** %3
	%25 = load i32, i32* %8
	%26 = getelementptr i32, i32* %24, i32 %25
	%27 = load i32, i32* %26
	%28 = load i32*, i32** %3
	%29 = load i32, i32* %4
	%30 = getelementptr i32, i32* %28, i32 %29
	%31 = load i32, i32* %30
	%32 = icmp eq i32 %27, %31
	%33 = icmp ne i1 %32, 0
	br i1 %33, label %b8, label %b9
}

define i32 @graphColoring([4 x i32]* %0, i32 %1, i32 %2, i32* %3) {
b0:
	%4 = alloca [4 x i32]*
	store [4 x i32]* %0, [4 x i32]** %4
	%5 = alloca i32
	store i32 %1, i32* %5
	%6 = alloca i32
	store i32 %2, i32* %6
	%7 = alloca i32*
	store i32* %3, i32** %7
	br label %b1
b1:
	%8 = load i32, i32* %6
	%9 = icmp eq i32 %8, 4
	%10 = icmp ne i1 %9, 0
	br i1 %10, label %b2, label %b3
b2:
	%11 = load [4 x i32]*, [4 x i32]** %4
	%12 = load i32*, i32** %7
	%13 = call i32 @isSafe([4 x i32]* %11, i32* %12)
	%14 = icmp ne i32 %13, 0
	br i1 %14, label %b4, label %b5
b3:
	%15 = alloca i32
	store i32 1, i32* %15
	br label %b6
b4:
	%16 = load i32*, i32** %7
	call void @printSolution(i32* %16)
	ret i32 1
b5:
	ret i32 0
b6:
	%17 = load i32, i32* %15
	%18 = load i32, i32* %5
	%19 = icmp sle i32 %17, %18
	%20 = icmp ne i1 %19, 0
	br i1 %20, label %b7, label %b8
b7:
	%21 = load i32*, i32** %7
	%22 = load i32, i32* %6
	%23 = getelementptr i32, i32* %21, i32 %22
	%24 = load i32, i32* %15
	store i32 %24, i32* %23
	%25 = load [4 x i32]*, [4 x i32]** %4
	%26 = load i32, i32* %5
	%27 = load i32, i32* %6
	%28 = add i32 %27, 1
	%29 = load i32*, i32** %7
	%30 = call i32 @graphColoring([4 x i32]* %25, i32 %26, i32 %28, i32* %29)
	%31 = icmp ne i32 %30, 0
	br i1 %31, label %b9, label %b10
b8:
	ret i32 0
b9:
	ret i32 1
b10:
	%32 = load i32*, i32** %7
	%33 = load i32, i32* %6
	%34 = getelementptr i32, i32* %32, i32 %33
	store i32 0, i32* %34
	%35 = load i32, i32* %15
	%36 = add i32 %35, 1
	store i32 %36, i32* %15
	br label %b6
}

define i32 @main() {
b0:
	%0 = alloca [4 x [4 x i32]]
	%1 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 0
	call void @memset(i32* %1, i32 0, i32 64)
	%2 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 0
	store i32 0, i32* %2
	%3 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 1
	store i32 1, i32* %3
	%4 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 2
	store i32 1, i32* %4
	%5 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 3
	store i32 1, i32* %5
	%6 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 4
	store i32 1, i32* %6
	%7 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 5
	store i32 0, i32* %7
	%8 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 6
	store i32 1, i32* %8
	%9 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 7
	store i32 0, i32* %9
	%10 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 8
	store i32 1, i32* %10
	%11 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 9
	store i32 1, i32* %11
	%12 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 10
	store i32 0, i32* %12
	%13 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 11
	store i32 1, i32* %13
	%14 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 12
	store i32 1, i32* %14
	%15 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 13
	store i32 0, i32* %15
	%16 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 14
	store i32 1, i32* %16
	%17 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0, i32 15
	store i32 0, i32* %17
	%18 = alloca i32
	store i32 3, i32* %18
	%19 = alloca [4 x i32]
	%20 = getelementptr [4 x i32], [4 x i32]* %19, i32 0, i32 0
	call void @memset(i32* %20, i32 0, i32 0)
	%21 = alloca i32
	store i32 0, i32* %21
	br label %b1
b1:
	%22 = load i32, i32* %21
	%23 = icmp slt i32 %22, 4
	%24 = icmp ne i1 %23, 0
	br i1 %24, label %b2, label %b3
b2:
	%25 = load i32, i32* %21
	%26 = getelementptr [4 x i32], [4 x i32]* %19, i32 0, i32 %25
	store i32 0, i32* %26
	%27 = load i32, i32* %21
	%28 = add i32 %27, 1
	store i32 %28, i32* %21
	br label %b1
b3:
	%29 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0
	%30 = load i32, i32* %18
	%31 = getelementptr [4 x i32], [4 x i32]* %19, i32 0, i32 0
	%32 = call i32 @graphColoring([4 x i32]* %29, i32 %30, i32 0, i32* %31)
	%33 = zext i1 0 to i32
	%34 = icmp eq i32 %32, %33
	%35 = icmp ne i1 %34, 0
	br i1 %35, label %b4, label %b5
b4:
	call void @printMessage()
	br label %b5
b5:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

