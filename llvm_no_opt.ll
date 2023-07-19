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
@to = global [5005 x i32]zeroinitializer
@next = global [5005 x i32]zeroinitializer
@head = global [1005 x i32]zeroinitializer
@cnt = global i32 0
@que = global [1005 x i32]zeroinitializer
@h = global i32 0
@tail = global i32 0
@inq = global [1005 x i32]zeroinitializer
define i32 @quick_read() {
b0:
	%0 = alloca i32
	%1 = call i32 @getch()
	store i32 %1, i32* %0
	%2 = alloca i32
	store i32 0, i32* %2
	%3 = alloca i32
	store i32 0, i32* %3
	br label %b1
b1:
	%4 = load i32, i32* %0
	%5 = icmp slt i32 %4, 48
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b2, label %b4
b2:
	%7 = load i32, i32* %0
	%8 = icmp eq i32 %7, 45
	%9 = icmp ne i1 %8, 0
	br i1 %9, label %b5, label %b6
b3:
	br label %b7
b4:
	%10 = load i32, i32* %0
	%11 = icmp sgt i32 %10, 57
	%12 = icmp ne i1 %11, 0
	br i1 %12, label %b2, label %b3
b5:
	store i32 1, i32* %3
	br label %b6
b6:
	%13 = call i32 @getch()
	store i32 %13, i32* %0
	br label %b1
b7:
	%14 = load i32, i32* %0
	%15 = icmp sge i32 %14, 48
	%16 = icmp ne i1 %15, 0
	br i1 %16, label %b10, label %b9
b8:
	%17 = load i32, i32* %2
	%18 = mul i32 %17, 10
	%19 = load i32, i32* %0
	%20 = add i32 %18, %19
	%21 = sub i32 %20, 48
	store i32 %21, i32* %2
	%22 = call i32 @getch()
	store i32 %22, i32* %0
	br label %b7
b9:
	%23 = load i32, i32* %3
	%24 = icmp ne i32 %23, 0
	br i1 %24, label %b11, label %b13
b10:
	%25 = load i32, i32* %0
	%26 = icmp sle i32 %25, 57
	%27 = icmp ne i1 %26, 0
	br i1 %27, label %b8, label %b9
b11:
	%28 = load i32, i32* %2
	%29 = sub i32 0, %28
	ret i32 %29
b12:
	ret i32 0
b13:
	%30 = load i32, i32* %2
	ret i32 %30
}

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

define void @inqueue(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* %1
	%3 = getelementptr [1005 x i32], [1005 x i32]* @inq, i32 0, i32 %2
	store i32 1, i32* %3
	%4 = load i32, i32* @tail
	%5 = add i32 %4, 1
	store i32 %5, i32* @tail
	%6 = load i32, i32* @tail
	%7 = getelementptr [1005 x i32], [1005 x i32]* @que, i32 0, i32 %6
	%8 = load i32, i32* %1
	store i32 %8, i32* %7
	ret void
}

define i32 @pop_queue() {
b0:
	%0 = load i32, i32* @h
	%1 = add i32 %0, 1
	store i32 %1, i32* @h
	%2 = alloca i32
	%3 = load i32, i32* @h
	%4 = getelementptr [1005 x i32], [1005 x i32]* @que, i32 0, i32 %3
	%5 = load i32, i32* %4
	store i32 %5, i32* %2
	%6 = load i32, i32* @h
	%7 = getelementptr [1005 x i32], [1005 x i32]* @que, i32 0, i32 %6
	%8 = load i32, i32* %7
	ret i32 %8
}

define i32 @same(i32 %0, i32 %1) {
b0:
	%2 = alloca i32
	store i32 %0, i32* %2
	%3 = alloca i32
	store i32 %1, i32* %3
	br label %b1
b1:
	store i32 0, i32* @h
	store i32 0, i32* @tail
	%4 = load i32, i32* %2
	call void @inqueue(i32 %4)
	%5 = alloca i32
	store i32 0, i32* %5
	br label %b2
b2:
	%6 = load i32, i32* @h
	%7 = load i32, i32* @tail
	%8 = icmp slt i32 %6, %7
	%9 = icmp ne i1 %8, 0
	br i1 %9, label %b3, label %b4
b3:
	%10 = alloca i32
	%11 = call i32 @pop_queue()
	store i32 %11, i32* %10
	%12 = load i32, i32* %10
	%13 = load i32, i32* %3
	%14 = icmp eq i32 %12, %13
	%15 = icmp ne i1 %14, 0
	br i1 %15, label %b5, label %b6
b4:
	%16 = alloca i32
	store i32 0, i32* %16
	br label %b12
b5:
	store i32 1, i32* %5
	br label %b6
b6:
	%17 = alloca i32
	%18 = load i32, i32* %10
	%19 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %18
	%20 = load i32, i32* %19
	store i32 %20, i32* %17
	br label %b7
b7:
	%21 = load i32, i32* %17
	%22 = icmp ne i32 %21, -1
	%23 = icmp ne i1 %22, 0
	br i1 %23, label %b8, label %b9
b8:
	%24 = load i32, i32* %17
	%25 = getelementptr [5005 x i32], [5005 x i32]* @to, i32 0, i32 %24
	%26 = load i32, i32* %25
	%27 = getelementptr [1005 x i32], [1005 x i32]* @inq, i32 0, i32 %26
	%28 = load i32, i32* %27
	%29 = zext i1 0 to i32
	%30 = icmp eq i32 %28, %29
	%31 = icmp ne i1 %30, 0
	br i1 %31, label %b10, label %b11
b9:
	br label %b2
b10:
	%32 = load i32, i32* %17
	%33 = getelementptr [5005 x i32], [5005 x i32]* @to, i32 0, i32 %32
	%34 = load i32, i32* %33
	call void @inqueue(i32 %34)
	br label %b11
b11:
	%35 = load i32, i32* %17
	%36 = getelementptr [5005 x i32], [5005 x i32]* @next, i32 0, i32 %35
	%37 = load i32, i32* %36
	store i32 %37, i32* %17
	br label %b7
b12:
	%38 = load i32, i32* %16
	%39 = load i32, i32* @tail
	%40 = icmp sle i32 %38, %39
	%41 = icmp ne i1 %40, 0
	br i1 %41, label %b13, label %b14
b13:
	%42 = load i32, i32* %16
	%43 = getelementptr [1005 x i32], [1005 x i32]* @que, i32 0, i32 %42
	%44 = load i32, i32* %43
	%45 = getelementptr [1005 x i32], [1005 x i32]* @inq, i32 0, i32 %44
	store i32 0, i32* %45
	%46 = load i32, i32* %16
	%47 = add i32 %46, 1
	store i32 %47, i32* %16
	br label %b12
b14:
	%48 = load i32, i32* %5
	ret i32 %48
}

define i32 @main() {
b0:
	%0 = call i32 @quick_read()
	store i32 %0, i32* @n
	%1 = call i32 @quick_read()
	store i32 %1, i32* @m
	br label %b1
b1:
	%2 = load i32, i32* @m
	%3 = icmp ne i32 %2, 0
	br i1 %3, label %b2, label %b3
b2:
	%4 = alloca i32
	%5 = call i32 @getch()
	store i32 %5, i32* %4
	%6 = load i32, i32* %4
	%7 = icmp eq i32 %6, 81
	%8 = icmp ne i1 %7, 0
	br i1 %8, label %b4, label %b5
b3:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b4:
	%9 = alloca i32
	%10 = call i32 @quick_read()
	store i32 %10, i32* %9
	%11 = alloca i32
	%12 = call i32 @quick_read()
	store i32 %12, i32* %11
	%13 = load i32, i32* %9
	%14 = load i32, i32* %11
	%15 = call i32 @same(i32 %13, i32 %14)
	call void @putint(i32 %15)
	call void @putch(i32 10)
	br label %b5
b5:
	%16 = load i32, i32* @m
	%17 = sub i32 %16, 1
	store i32 %17, i32* @m
	br label %b1
}

