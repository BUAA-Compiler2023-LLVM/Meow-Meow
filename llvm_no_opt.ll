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
define void @swap(i32 %0, i32 %1) {
b0:
	%2 = alloca i32
	store i32 %0, i32* %2
	%3 = alloca i32
	store i32 %1, i32* %3
	br label %b1
b1:
	%4 = alloca i32
	%5 = load i32, i32* %2
	%6 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %5
	%7 = load i32, i32* %6
	store i32 %7, i32* %4
	%8 = load i32, i32* %2
	%9 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %8
	%10 = load i32, i32* %3
	%11 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %10
	%12 = load i32, i32* %11
	store i32 %12, i32* %9
	%13 = load i32, i32* %3
	%14 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %13
	%15 = load i32, i32* %4
	store i32 %15, i32* %14
	ret void
}

define i32 @findPivot(i32 %0, i32 %1) {
b0:
	%2 = alloca i32
	store i32 %0, i32* %2
	%3 = alloca i32
	store i32 %1, i32* %3
	br label %b1
b1:
	%4 = alloca i32
	%5 = load i32, i32* %3
	%6 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %5
	%7 = load i32, i32* %6
	store i32 %7, i32* %4
	%8 = alloca i32
	%9 = load i32, i32* %2
	store i32 %9, i32* %8
	%10 = alloca i32
	%11 = load i32, i32* %2
	store i32 %11, i32* %10
	br label %b2
b2:
	%12 = load i32, i32* %10
	%13 = load i32, i32* %3
	%14 = icmp slt i32 %12, %13
	%15 = icmp ne i1 %14, 0
	br i1 %15, label %b3, label %b4
b3:
	%16 = load i32, i32* %10
	%17 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %16
	%18 = load i32, i32* %17
	%19 = load i32, i32* %4
	%20 = icmp sle i32 %18, %19
	%21 = icmp ne i1 %20, 0
	br i1 %21, label %b5, label %b6
b4:
	%22 = load i32, i32* %8
	%23 = load i32, i32* %3
	call void @swap(i32 %22, i32 %23)
	%24 = load i32, i32* %8
	ret i32 %24
b5:
	%25 = load i32, i32* %10
	%26 = load i32, i32* %8
	call void @swap(i32 %25, i32 %26)
	%27 = load i32, i32* %8
	%28 = add i32 %27, 1
	store i32 %28, i32* %8
	br label %b6
b6:
	%29 = load i32, i32* %10
	%30 = add i32 %29, 1
	store i32 %30, i32* %10
	br label %b2
}

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
	%12 = alloca i32
	%13 = load i32, i32* %4
	%14 = load i32, i32* %5
	%15 = call i32 @findPivot(i32 %13, i32 %14)
	store i32 %15, i32* %12
	%16 = load i32, i32* %6
	%17 = load i32, i32* %12
	%18 = icmp eq i32 %16, %17
	%19 = icmp ne i1 %18, 0
	br i1 %19, label %b5, label %b7
b5:
	%20 = alloca i32
	store i32 0, i32* %20
	br label %b8
b6:
	br label %b3
b7:
	%21 = load i32, i32* %6
	%22 = load i32, i32* %12
	%23 = icmp slt i32 %21, %22
	%24 = icmp ne i1 %23, 0
	br i1 %24, label %b11, label %b13
b8:
	%25 = load i32, i32* %20
	%26 = load i32, i32* %12
	%27 = icmp slt i32 %25, %26
	%28 = icmp ne i1 %27, 0
	br i1 %28, label %b9, label %b10
b9:
	%29 = load i32, i32* %20
	%30 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %29
	%31 = load i32, i32* %30
	call void @putint(i32 %31)
	call void @putch(i32 32)
	%32 = load i32, i32* %20
	%33 = add i32 %32, 1
	store i32 %33, i32* %20
	br label %b8
b10:
	br label %b6
b11:
	%34 = load i32, i32* %4
	%35 = load i32, i32* %12
	%36 = sub i32 %35, 1
	%37 = load i32, i32* %6
	%38 = load i32, i32* %7
	call void @findSmallest(i32 %34, i32 %36, i32 %37, i32 %38)
	br label %b12
b12:
	br label %b6
b13:
	%39 = load i32, i32* %12
	%40 = add i32 %39, 1
	%41 = load i32, i32* %5
	%42 = load i32, i32* %6
	%43 = load i32, i32* %7
	call void @findSmallest(i32 %40, i32 %41, i32 %42, i32 %43)
	br label %b12
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
	br label %b1
b1:
	%5 = load i32, i32* %4
	%6 = load i32, i32* %0
	%7 = icmp slt i32 %5, %6
	%8 = icmp ne i1 %7, 0
	br i1 %8, label %b2, label %b3
b2:
	%9 = load i32, i32* %4
	%10 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %9
	%11 = call i32 @getint()
	store i32 %11, i32* %10
	%12 = load i32, i32* %4
	%13 = add i32 %12, 1
	store i32 %13, i32* %4
	br label %b1
b3:
	%14 = alloca i32
	store i32 0, i32* %14
	%15 = alloca i32
	%16 = load i32, i32* %0
	%17 = sub i32 %16, 1
	store i32 %17, i32* %15
	%18 = load i32, i32* %14
	%19 = load i32, i32* %15
	%20 = load i32, i32* %2
	%21 = load i32, i32* %0
	call void @findSmallest(i32 %18, i32 %19, i32 %20, i32 %21)
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

