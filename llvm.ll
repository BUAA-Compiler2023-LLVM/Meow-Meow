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
	br label %b1
b1:
	%4 = icmp eq i32 %0, %1
	br i1 %4, label %b2, label %b4
b2:
	ret void
b3:
	ret void
b4:
	br label %b5
b5:
	br label %b6
b6:
	%5 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %1
	%6 = load i32, i32* %5
	br label %b7
b7:
	%7 = phi i32 [ %0, %b6 ],[ %27, %b17 ]
	%8 = phi i32 [ %0, %b6 ],[ %26, %b17 ]
	%9 = icmp slt i32 %7, %1
	br i1 %9, label %b8, label %b9
b8:
	%10 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %7
	%11 = load i32, i32* %10
	%12 = icmp sle i32 %11, %6
	br i1 %12, label %b13, label %b17
b9:
	br label %b10
b10:
	br label %b11
b11:
	%13 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %8
	%14 = load i32, i32* %13
	%15 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %8
	%16 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %1
	%17 = load i32, i32* %16
	store i32 %17, i32* %15
	%18 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %1
	store i32 %14, i32* %18
	br label %b12
b12:
	br label %b18
b13:
	br label %b14
b14:
	br label %b15
b15:
	%19 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %7
	%20 = load i32, i32* %19
	%21 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %7
	%22 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %8
	%23 = load i32, i32* %22
	store i32 %23, i32* %21
	%24 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %8
	store i32 %20, i32* %24
	br label %b16
b16:
	%25 = add i32 %8, 1
	br label %b17
b17:
	%26 = phi i32 [ %8, %b8 ],[ %25, %b16 ]
	%27 = add i32 %7, 1
	br label %b7
b18:
	%28 = icmp eq i32 %2, %8
	br i1 %28, label %b19, label %b20
b19:
	br label %b21
b20:
	%29 = icmp slt i32 %2, %8
	br i1 %29, label %b23, label %b24
b21:
	%30 = phi i32 [ 0, %b19 ],[ %34, %b22 ]
	%31 = icmp slt i32 %30, %8
	br i1 %31, label %b22, label %b3
b22:
	%32 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %30
	%33 = load i32, i32* %32
	call void @putint(i32 %33)
	call void @putch(i32 32)
	%34 = add i32 %30, 1
	br label %b21
b23:
	%35 = sub i32 %8, 1
	call void @findSmallest(i32 %0, i32 %35, i32 %2, i32 %3)
	br label %b3
b24:
	%36 = add i32 %8, 1
	call void @findSmallest(i32 %36, i32 %1, i32 %2, i32 %3)
	br label %b3
}

define i32 @main() {
b0:
	%0 = call i32 @getint()
	%1 = call i32 @getint()
	br label %b1
b1:
	%2 = phi i32 [ 0, %b0 ],[ %6, %b2 ]
	%3 = icmp slt i32 %2, %0
	br i1 %3, label %b2, label %b3
b2:
	%4 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %2
	%5 = call i32 @getint()
	store i32 %5, i32* %4
	%6 = add i32 %2, 1
	br label %b1
b3:
	%7 = sub i32 %0, 1
	call void @findSmallest(i32 0, i32 %7, i32 %1, i32 %0)
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

