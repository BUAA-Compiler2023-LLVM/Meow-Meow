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
	%7 = phi i32 [ %0, %b6 ],[ %19, %b17 ]
	%8 = phi i32 [ %0, %b6 ],[ %18, %b17 ]
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
	%15 = load i32, i32* %5
	store i32 %15, i32* %13
	store i32 %14, i32* %5
	br label %b12
b12:
	br label %b18
b13:
	br label %b14
b14:
	br label %b15
b15:
	%16 = load i32, i32* %10
	%17 = load i32, i32* %13
	store i32 %17, i32* %10
	store i32 %16, i32* %13
	br label %b16
b16:
	br label %b17
b17:
	%18 = phi i32 [ %8, %b8 ],[ %28, %b16 ]
	%19 = add i32 %7, 1
	br label %b7
b18:
	%20 = icmp eq i32 %2, %8
	br i1 %20, label %b19, label %b20
b19:
	br label %b21
b20:
	%21 = icmp slt i32 %2, %8
	br i1 %21, label %b23, label %b24
b21:
	%22 = phi i32 [ 0, %b19 ],[ %26, %b22 ]
	%23 = icmp slt i32 %22, %8
	br i1 %23, label %b22, label %b3
b22:
	%24 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %22
	%25 = load i32, i32* %24
	call void @putint(i32 %25)
	call void @putch(i32 32)
	%26 = add i32 %22, 1
	br label %b21
b23:
	%27 = sub i32 %8, 1
	call void @findSmallest(i32 %0, i32 %27, i32 %2, i32 %3)
	br label %b3
b24:
	%28 = add i32 %8, 1
	call void @findSmallest(i32 %28, i32 %1, i32 %2, i32 %3)
	br label %b3
}

define i32 @main() {
b0:
	%0 = call i32 @getint()
	br label %b1
b1:
	%1 = phi i32 [ 0, %b0 ],[ %4, %b2 ]
	%2 = icmp slt i32 %1, %0
	br i1 %2, label %b2, label %b3
b2:
	%3 = getelementptr [1000 x i32], [1000 x i32]* @array, i32 0, i32 %1
	store i32 %0, i32* %3
	%4 = add i32 %1, 1
	br label %b1
b3:
	%5 = sub i32 %0, 1
	call void @findSmallest(i32 0, i32 %5, i32 %0, i32 %0)
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

