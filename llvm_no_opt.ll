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
	%2 = alloca i32
	store i32 %0, i32* %2
	%3 = alloca i32
	store i32 %1, i32* %3
	br label %b1
b1:
	%4 = load i32, i32* %2
	%5 = icmp eq i32 %4, -1
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b2, label %b5
b2:
	%7 = load i32, i32* %2
	ret i32 %7
b3:
	ret i32 0
b4:
	%8 = load i32, i32* %3
	%9 = load i32, i32* %2
	%10 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %9
	%11 = load i32, i32* %10
	%12 = icmp sgt i32 %8, %11
	%13 = icmp ne i1 %12, 0
	br i1 %13, label %b6, label %b8
b5:
	%14 = load i32, i32* %2
	%15 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %14
	%16 = load i32, i32* %15
	%17 = load i32, i32* %3
	%18 = icmp eq i32 %16, %17
	%19 = icmp ne i1 %18, 0
	br i1 %19, label %b2, label %b4
b6:
	%20 = load i32, i32* %2
	%21 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %20
	%22 = load i32, i32* %21
	%23 = load i32, i32* %3
	%24 = call i32 @search(i32 %22, i32 %23)
	ret i32 %24
b7:
	br label %b3
b8:
	%25 = load i32, i32* %2
	%26 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %25
	%27 = load i32, i32* %26
	%28 = load i32, i32* %3
	%29 = call i32 @search(i32 %27, i32 %28)
	ret i32 %29
}

define i32 @find_minimum(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* %1
	%3 = icmp eq i32 %2, -1
	%4 = icmp ne i1 %3, 0
	br i1 %4, label %b2, label %b4
b2:
	ret i32 -1
b3:
	%5 = load i32, i32* %1
	ret i32 %5
b4:
	%6 = load i32, i32* %1
	%7 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %6
	%8 = load i32, i32* %7
	%9 = icmp ne i32 %8, -1
	%10 = icmp ne i1 %9, 0
	br i1 %10, label %b5, label %b6
b5:
	%11 = load i32, i32* %1
	%12 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %11
	%13 = load i32, i32* %12
	%14 = call i32 @find_minimum(i32 %13)
	ret i32 %14
b6:
	br label %b3
}

define i32 @new_node(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* @now
	%3 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %2
	%4 = load i32, i32* %1
	store i32 %4, i32* %3
	%5 = load i32, i32* @now
	%6 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %5
	store i32 -1, i32* %6
	%7 = load i32, i32* @now
	%8 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %7
	store i32 -1, i32* %8
	%9 = load i32, i32* @now
	%10 = add i32 %9, 1
	store i32 %10, i32* @now
	%11 = load i32, i32* @now
	%12 = sub i32 %11, 1
	ret i32 %12
}

define i32 @insert(i32 %0, i32 %1) {
b0:
	%2 = alloca i32
	store i32 %0, i32* %2
	%3 = alloca i32
	store i32 %1, i32* %3
	br label %b1
b1:
	%4 = load i32, i32* %2
	%5 = icmp eq i32 %4, -1
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b2, label %b4
b2:
	%7 = load i32, i32* %3
	%8 = call i32 @new_node(i32 %7)
	ret i32 %8
b3:
	%9 = load i32, i32* %2
	ret i32 %9
b4:
	%10 = load i32, i32* %3
	%11 = load i32, i32* %2
	%12 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %11
	%13 = load i32, i32* %12
	%14 = icmp sgt i32 %10, %13
	%15 = icmp ne i1 %14, 0
	br i1 %15, label %b5, label %b7
b5:
	%16 = load i32, i32* %2
	%17 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %16
	%18 = load i32, i32* %2
	%19 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %18
	%20 = load i32, i32* %19
	%21 = load i32, i32* %3
	%22 = call i32 @insert(i32 %20, i32 %21)
	store i32 %22, i32* %17
	br label %b6
b6:
	br label %b3
b7:
	%23 = load i32, i32* %2
	%24 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %23
	%25 = load i32, i32* %2
	%26 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %25
	%27 = load i32, i32* %26
	%28 = load i32, i32* %3
	%29 = call i32 @insert(i32 %27, i32 %28)
	store i32 %29, i32* %24
	br label %b6
}

define i32 @delete(i32 %0, i32 %1) {
b0:
	%2 = alloca i32
	store i32 %0, i32* %2
	%3 = alloca i32
	store i32 %1, i32* %3
	br label %b1
b1:
	%4 = load i32, i32* %2
	%5 = icmp eq i32 %4, -1
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b2, label %b3
b2:
	ret i32 -1
b3:
	%7 = load i32, i32* %3
	%8 = load i32, i32* %2
	%9 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %8
	%10 = load i32, i32* %9
	%11 = icmp sgt i32 %7, %10
	%12 = icmp ne i1 %11, 0
	br i1 %12, label %b4, label %b6
b4:
	%13 = load i32, i32* %2
	%14 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %13
	%15 = load i32, i32* %2
	%16 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %15
	%17 = load i32, i32* %16
	%18 = load i32, i32* %3
	%19 = call i32 @delete(i32 %17, i32 %18)
	store i32 %19, i32* %14
	br label %b5
b5:
	%20 = load i32, i32* %2
	ret i32 %20
b6:
	%21 = load i32, i32* %3
	%22 = load i32, i32* %2
	%23 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %22
	%24 = load i32, i32* %23
	%25 = icmp slt i32 %21, %24
	%26 = icmp ne i1 %25, 0
	br i1 %26, label %b7, label %b9
b7:
	%27 = load i32, i32* %2
	%28 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %27
	%29 = load i32, i32* %2
	%30 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %29
	%31 = load i32, i32* %30
	%32 = load i32, i32* %3
	%33 = call i32 @delete(i32 %31, i32 %32)
	store i32 %33, i32* %28
	br label %b8
b8:
	br label %b5
b9:
	%34 = load i32, i32* %2
	%35 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %34
	%36 = load i32, i32* %35
	%37 = icmp eq i32 %36, -1
	%38 = icmp ne i1 %37, 0
	br i1 %38, label %b13, label %b12
b10:
	ret i32 -1
b11:
	br label %b8
b12:
	%39 = load i32, i32* %2
	%40 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %39
	%41 = load i32, i32* %40
	%42 = icmp eq i32 %41, -1
	%43 = icmp ne i1 %42, 0
	br i1 %43, label %b14, label %b17
b13:
	%44 = load i32, i32* %2
	%45 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %44
	%46 = load i32, i32* %45
	%47 = icmp eq i32 %46, -1
	%48 = icmp ne i1 %47, 0
	br i1 %48, label %b10, label %b12
b14:
	%49 = load i32, i32* %2
	%50 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %49
	%51 = load i32, i32* %50
	%52 = icmp eq i32 %51, -1
	%53 = icmp ne i1 %52, 0
	br i1 %53, label %b18, label %b20
b15:
	br label %b11
b16:
	%54 = alloca i32
	%55 = load i32, i32* %2
	%56 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %55
	%57 = load i32, i32* %56
	%58 = call i32 @find_minimum(i32 %57)
	store i32 %58, i32* %54
	%59 = load i32, i32* %2
	%60 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %59
	%61 = load i32, i32* %54
	%62 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %61
	%63 = load i32, i32* %62
	store i32 %63, i32* %60
	%64 = load i32, i32* %2
	%65 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %64
	%66 = load i32, i32* %2
	%67 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %66
	%68 = load i32, i32* %67
	%69 = load i32, i32* %54
	%70 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %69
	%71 = load i32, i32* %70
	%72 = call i32 @delete(i32 %68, i32 %71)
	store i32 %72, i32* %65
	br label %b15
b17:
	%73 = load i32, i32* %2
	%74 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %73
	%75 = load i32, i32* %74
	%76 = icmp eq i32 %75, -1
	%77 = icmp ne i1 %76, 0
	br i1 %77, label %b14, label %b16
b18:
	%78 = load i32, i32* %2
	%79 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %78
	%80 = load i32, i32* %79
	ret i32 %80
b19:
	br label %b15
b20:
	%81 = load i32, i32* %2
	%82 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %81
	%83 = load i32, i32* %82
	ret i32 %83
}

define void @inorder(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* %1
	%3 = icmp ne i32 %2, -1
	%4 = icmp ne i1 %3, 0
	br i1 %4, label %b2, label %b3
b2:
	%5 = load i32, i32* %1
	%6 = getelementptr [10000 x i32], [10000 x i32]* @left_child, i32 0, i32 %5
	%7 = load i32, i32* %6
	call void @inorder(i32 %7)
	%8 = load i32, i32* %1
	%9 = getelementptr [10000 x i32], [10000 x i32]* @value, i32 0, i32 %8
	%10 = load i32, i32* %9
	call void @putint(i32 %10)
	call void @putch(i32 32)
	%11 = load i32, i32* %1
	%12 = getelementptr [10000 x i32], [10000 x i32]* @right_child, i32 0, i32 %11
	%13 = load i32, i32* %12
	call void @inorder(i32 %13)
	br label %b3
b3:
	ret void
}

define i32 @main() {
b0:
	store i32 0, i32* @now
	%0 = alloca i32
	%1 = call i32 @getint()
	store i32 %1, i32* %0
	%2 = load i32, i32* %0
	%3 = zext i1 0 to i32
	%4 = icmp eq i32 %2, %3
	%5 = icmp ne i1 %4, 0
	br i1 %5, label %b1, label %b2
b1:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b2:
	%6 = alloca i32
	%7 = call i32 @getint()
	%8 = call i32 @new_node(i32 %7)
	store i32 %8, i32* %6
	%9 = alloca i32
	store i32 1, i32* %9
	br label %b3
b3:
	%10 = load i32, i32* %9
	%11 = load i32, i32* %0
	%12 = icmp slt i32 %10, %11
	%13 = icmp ne i1 %12, 0
	br i1 %13, label %b4, label %b5
b4:
	%14 = load i32, i32* %6
	%15 = call i32 @getint()
	%16 = call i32 @insert(i32 %14, i32 %15)
	%17 = load i32, i32* %9
	%18 = add i32 %17, 1
	store i32 %18, i32* %9
	br label %b3
b5:
	%19 = load i32, i32* %6
	call void @inorder(i32 %19)
	call void @putch(i32 10)
	%20 = call i32 @getint()
	store i32 %20, i32* %0
	store i32 0, i32* %9
	br label %b6
b6:
	%21 = load i32, i32* %9
	%22 = load i32, i32* %0
	%23 = icmp slt i32 %21, %22
	%24 = icmp ne i1 %23, 0
	br i1 %24, label %b7, label %b8
b7:
	%25 = load i32, i32* %6
	%26 = call i32 @getint()
	%27 = call i32 @delete(i32 %25, i32 %26)
	store i32 %27, i32* %6
	%28 = load i32, i32* %9
	%29 = add i32 %28, 1
	store i32 %29, i32* %9
	br label %b6
b8:
	%30 = load i32, i32* %6
	call void @inorder(i32 %30)
	call void @putch(i32 10)
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

