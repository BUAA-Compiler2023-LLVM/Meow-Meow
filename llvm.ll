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
define i32 @graphColoring([4 x i32]* %0, i32 %1, i32 %2, i32* %3) {
b0:
	%4 = alloca [4 x i32]*
	store [4 x i32]* %0, [4 x i32]** %4
	%5 = alloca i32*
	store i32* %3, i32** %5
	br label %b1
b1:
	%6 = icmp eq i32 %2, 4
	%7 = icmp ne i1 %6, 0
	br i1 %7, label %b2, label %b15
b2:
	%8 = load [4 x i32]*, [4 x i32]** %4
	%9 = load i32*, i32** %5
	br label %b3
b3:
	br label %b4
b4:
	br label %b5
b5:
	%10 = phi i32 [ 0, %b4 ],[ %20, %b10 ]
	%11 = icmp slt i32 %10, 4
	%12 = icmp ne i1 %11, 0
	br i1 %12, label %b6, label %b7
b6:
	%13 = add i32 %10, 1
	br label %b8
b7:
	br label %b14
b8:
	%14 = phi i32 [ %13, %b6 ],[ %21, %b12 ]
	%15 = icmp slt i32 %14, 4
	%16 = icmp ne i1 %15, 0
	br i1 %16, label %b9, label %b10
b9:
	%17 = getelementptr [4 x i32], [4 x i32]* %8, i32 %10, i32 %14
	%18 = load i32, i32* %17
	%19 = icmp ne i32 %18, 0
	br i1 %19, label %b13, label %b12
b10:
	%20 = add i32 %10, 1
	br label %b5
b11:
	br label %b14
b12:
	%21 = add i32 %14, 1
	br label %b8
b13:
	%22 = getelementptr i32, i32* %9, i32 %14
	%23 = load i32, i32* %22
	%24 = getelementptr i32, i32* %9, i32 %10
	%25 = load i32, i32* %24
	%26 = icmp eq i32 %23, %25
	%27 = icmp ne i1 %26, 0
	br i1 %27, label %b11, label %b12
b14:
	%28 = phi i32 [ 1, %b7 ],[ 0, %b11 ]
	%29 = icmp ne i32 %28, 0
	br i1 %29, label %b16, label %b23
b15:
	br label %b24
b16:
	%30 = load i32*, i32** %5
	br label %b17
b17:
	br label %b18
b18:
	br label %b19
b19:
	%31 = phi i32 [ 0, %b18 ],[ %36, %b20 ]
	%32 = icmp slt i32 %31, 4
	%33 = icmp ne i1 %32, 0
	br i1 %33, label %b20, label %b21
b20:
	%34 = getelementptr i32, i32* %30, i32 %31
	%35 = load i32, i32* %34
	call void @putint(i32 %35)
	call void @putch(i32 32)
	%36 = add i32 %31, 1
	br label %b19
b21:
	call void @putch(i32 10)
	br label %b22
b22:
	ret i32 1
b23:
	ret i32 0
b24:
	%37 = phi i32 [ 1, %b15 ],[ %49, %b28 ]
	%38 = icmp sle i32 %37, %1
	%39 = icmp ne i1 %38, 0
	br i1 %39, label %b25, label %b26
b25:
	%40 = load i32*, i32** %5
	%41 = getelementptr i32, i32* %40, i32 %2
	store i32 %37, i32* %41
	%42 = load [4 x i32]*, [4 x i32]** %4
	%43 = add i32 %2, 1
	%44 = load i32*, i32** %5
	%45 = call i32 @graphColoring([4 x i32]* %42, i32 %1, i32 %43, i32* %44)
	%46 = icmp ne i32 %45, 0
	br i1 %46, label %b27, label %b28
b26:
	ret i32 0
b27:
	ret i32 1
b28:
	%47 = load i32*, i32** %5
	%48 = getelementptr i32, i32* %47, i32 %2
	store i32 0, i32* %48
	%49 = add i32 %37, 1
	br label %b24
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
	%18 = alloca [4 x i32]
	%19 = getelementptr [4 x i32], [4 x i32]* %18, i32 0, i32 0
	call void @memset(i32* %19, i32 0, i32 0)
	br label %b1
b1:
	%20 = phi i32 [ 0, %b0 ],[ %24, %b2 ]
	%21 = icmp slt i32 %20, 4
	%22 = icmp ne i1 %21, 0
	br i1 %22, label %b2, label %b3
b2:
	%23 = getelementptr [4 x i32], [4 x i32]* %18, i32 0, i32 %20
	store i32 0, i32* %23
	%24 = add i32 %20, 1
	br label %b1
b3:
	%25 = getelementptr [4 x [4 x i32]], [4 x [4 x i32]]* %0, i32 0, i32 0
	%26 = getelementptr [4 x i32], [4 x i32]* %18, i32 0, i32 0
	%27 = call i32 @graphColoring([4 x i32]* %25, i32 3, i32 0, i32* %26)
	%28 = zext i1 0 to i32
	%29 = icmp eq i32 %27, %28
	%30 = icmp ne i1 %29, 0
	br i1 %30, label %b4, label %b7
b4:
	br label %b5
b5:
	call void @putch(i32 78)
	call void @putch(i32 111)
	call void @putch(i32 116)
	call void @putch(i32 32)
	call void @putch(i32 101)
	call void @putch(i32 120)
	call void @putch(i32 105)
	call void @putch(i32 115)
	call void @putch(i32 116)
	br label %b6
b6:
	br label %b7
b7:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

