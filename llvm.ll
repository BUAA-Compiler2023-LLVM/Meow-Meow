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
@value = global [10000 x i32]zeroinitializer
@left_child = global [10000 x i32]zeroinitializer
@right_child = global [10000 x i32]zeroinitializer
@now = global i32 0
define i32 @search(i32 %0, i32 %1) {
b0:
	br label %b1
b1:
	%2 = icmp eq i32 %0, -1
	br i1 %2, label %b2, label %b4
b2:
	ret i32 %0
b3:
	%3 = load i32, i32* %5
	%4 = icmp sgt i32 %1, %3
	br i1 %4, label %b5, label %b6
b4:
	%5 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %0
	%6 = load i32, i32* %5
	%7 = icmp eq i32 %6, %1
	br i1 %7, label %b2, label %b3
b5:
	%8 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %0
	%9 = load i32, i32* %8
	%10 = call i32 @search(i32 %9, i32 %1)
	ret i32 %10
b6:
	%11 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %0
	%12 = load i32, i32* %11
	%13 = call i32 @search(i32 %12, i32 %1)
	ret i32 %13
}

define i32 @find_minimum(i32 %0) {
b0:
	br label %b1
b1:
	%1 = icmp eq i32 %0, -1
	br i1 %1, label %b2, label %b4
b2:
	ret i32 -1
b3:
	ret i32 %0
b4:
	%2 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %0
	%3 = load i32, i32* %2
	%4 = icmp ne i32 %3, -1
	br i1 %4, label %b5, label %b3
b5:
	%5 = load i32, i32* %2
	%6 = call i32 @find_minimum(i32 %5)
	ret i32 %6
}

define i32 @new_node(i32 %0) {
b0:
	br label %b1
b1:
	%1 = load i32, i32* @now
	%2 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %1
	store i32 %0, i32* %2
	%3 = load i32, i32* @now
	%4 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %3
	store i32 -1, i32* %4
	%5 = load i32, i32* @now
	%6 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %5
	store i32 -1, i32* %6
	%7 = load i32, i32* @now
	%8 = add i32 %7, 1
	store i32 %8, i32* @now
	%9 = sub i32 %8, 1
	ret i32 %9
}

define i32 @insert(i32 %0, i32 %1) {
b0:
	br label %b1
b1:
	%2 = icmp eq i32 %0, -1
	br i1 %2, label %b2, label %b4
b2:
	%3 = call i32 @new_node(i32 %1)
	ret i32 %3
b3:
	ret i32 %0
b4:
	%4 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %0
	%5 = load i32, i32* %4
	%6 = icmp sgt i32 %1, %5
	br i1 %6, label %b5, label %b6
b5:
	%7 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %0
	%8 = load i32, i32* %7
	%9 = call i32 @insert(i32 %8, i32 %1)
	store i32 %9, i32* %7
	br label %b3
b6:
	%10 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %0
	%11 = load i32, i32* %10
	%12 = call i32 @insert(i32 %11, i32 %1)
	store i32 %12, i32* %10
	br label %b3
}

define i32 @delete(i32 %0, i32 %1) {
b0:
	br label %b1
b1:
	%2 = icmp eq i32 %0, -1
	br i1 %2, label %b2, label %b3
b2:
	ret i32 -1
b3:
	%3 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %0
	%4 = load i32, i32* %3
	%5 = icmp sgt i32 %1, %4
	br i1 %5, label %b4, label %b6
b4:
	%6 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %0
	%7 = load i32, i32* %6
	%8 = call i32 @delete(i32 %7, i32 %1)
	store i32 %8, i32* %6
	br label %b5
b5:
	ret i32 %0
b6:
	%9 = load i32, i32* %3
	%10 = icmp slt i32 %1, %9
	br i1 %10, label %b7, label %b8
b7:
	%11 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %0
	%12 = load i32, i32* %11
	%13 = call i32 @delete(i32 %12, i32 %1)
	store i32 %13, i32* %11
	br label %b5
b8:
	%14 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %0
	%15 = load i32, i32* %14
	%16 = icmp eq i32 %15, -1
	br i1 %16, label %b11, label %b10
b9:
	ret i32 -1
b10:
	%17 = load i32, i32* %14
	%18 = icmp eq i32 %17, -1
	br i1 %18, label %b12, label %b14
b11:
	%19 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %0
	%20 = load i32, i32* %19
	%21 = icmp eq i32 %20, -1
	br i1 %21, label %b9, label %b10
b12:
	%22 = load i32, i32* %14
	%23 = icmp eq i32 %22, -1
	br i1 %23, label %b15, label %b16
b13:
	%24 = load i32, i32* %31
	%25 = call i32 @find_minimum(i32 %24)
	%26 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %25
	%27 = load i32, i32* %26
	store i32 %27, i32* %3
	%28 = load i32, i32* %31
	%29 = load i32, i32* %26
	%30 = call i32 @delete(i32 %28, i32 %29)
	store i32 %30, i32* %31
	br label %b5
b14:
	%31 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %0
	%32 = load i32, i32* %31
	%33 = icmp eq i32 %32, -1
	br i1 %33, label %b12, label %b13
b15:
	%34 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %0
	%35 = load i32, i32* %34
	ret i32 %35
b16:
	%36 = load i32, i32* %14
	ret i32 %36
}

define void @inorder(i32 %0) {
b0:
	br label %b1
b1:
	%1 = icmp ne i32 %0, -1
	br i1 %1, label %b2, label %b3
b2:
	%2 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %0
	%3 = load i32, i32* %2
	call void @inorder(i32 %3)
	%4 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %0
	%5 = load i32, i32* %4
	call void @putint(i32 %5)
	call void @putch(i32 32)
	%6 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %0
	%7 = load i32, i32* %6
	call void @inorder(i32 %7)
	br label %b3
b3:
	ret void
}

define i32 @main() {
b0:
	store i32 0, i32* @now
	%0 = call i32 @getint()
	%1 = icmp eq i32 %0, 0
	br i1 %1, label %b1, label %b2
b1:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b2:
	%2 = call i32 @new_node(i32 %0)
	br label %b3
b3:
	%3 = phi i32 [ 1, %b2 ],[ %6, %b4 ]
	%4 = icmp slt i32 %3, %0
	br i1 %4, label %b4, label %b5
b4:
	%5 = call i32 @insert(i32 %2, i32 %0)
	%6 = add i32 %3, 1
	br label %b3
b5:
	call void @inorder(i32 %2)
	call void @putch(i32 10)
	br label %b6
b6:
	%7 = phi i32 [ 0, %b5 ],[ %11, %b7 ]
	%8 = phi i32 [ %2, %b5 ],[ %10, %b7 ]
	%9 = icmp slt i32 %7, %0
	br i1 %9, label %b7, label %b8
b7:
	%10 = call i32 @delete(i32 %8, i32 %0)
	%11 = add i32 %7, 1
	br label %b6
b8:
	call void @inorder(i32 %8)
	call void @putch(i32 10)
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

