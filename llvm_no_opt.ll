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
@u = global [1005 x i32]zeroinitializer
@v = global [1005 x i32]zeroinitializer
@c = global [1005 x i32]zeroinitializer
@fa = global [1005 x i32]zeroinitializer
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

define i32 @find(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* %1
	%3 = load i32, i32* %1
	%4 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %3
	%5 = load i32, i32* %4
	%6 = icmp eq i32 %2, %5
	%7 = icmp ne i1 %6, 0
	br i1 %7, label %b2, label %b3
b2:
	%8 = load i32, i32* %1
	ret i32 %8
b3:
	%9 = alloca i32
	%10 = load i32, i32* %1
	%11 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %10
	%12 = load i32, i32* %11
	%13 = call i32 @find(i32 %12)
	store i32 %13, i32* %9
	%14 = load i32, i32* %1
	%15 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %14
	%16 = load i32, i32* %9
	store i32 %16, i32* %15
	%17 = load i32, i32* %9
	ret i32 %17
}

define i32 @same(i32 %0, i32 %1) {
b0:
	%2 = alloca i32
	store i32 %0, i32* %2
	%3 = alloca i32
	store i32 %1, i32* %3
	br label %b1
b1:
	%4 = load i32, i32* %2
	%5 = call i32 @find(i32 %4)
	store i32 %5, i32* %2
	%6 = load i32, i32* %3
	%7 = call i32 @find(i32 %6)
	store i32 %7, i32* %3
	%8 = load i32, i32* %2
	%9 = load i32, i32* %3
	%10 = icmp eq i32 %8, %9
	%11 = icmp ne i1 %10, 0
	br i1 %11, label %b2, label %b3
b2:
	ret i32 1
b3:
	ret i32 0
}

define i32 @prim() {
b0:
	%0 = alloca i32
	store i32 0, i32* %0
	br label %b1
b1:
	%1 = load i32, i32* %0
	%2 = load i32, i32* @m
	%3 = icmp slt i32 %1, %2
	%4 = icmp ne i1 %3, 0
	br i1 %4, label %b2, label %b3
b2:
	%5 = alloca i32
	%6 = load i32, i32* %0
	%7 = add i32 %6, 1
	store i32 %7, i32* %5
	br label %b4
b3:
	store i32 1, i32* %0
	br label %b9
b4:
	%8 = load i32, i32* %5
	%9 = load i32, i32* @m
	%10 = icmp slt i32 %8, %9
	%11 = icmp ne i1 %10, 0
	br i1 %11, label %b5, label %b6
b5:
	%12 = load i32, i32* %0
	%13 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %12
	%14 = load i32, i32* %13
	%15 = load i32, i32* %5
	%16 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %15
	%17 = load i32, i32* %16
	%18 = icmp sgt i32 %14, %17
	%19 = icmp ne i1 %18, 0
	br i1 %19, label %b7, label %b8
b6:
	%20 = load i32, i32* %0
	%21 = add i32 %20, 1
	store i32 %21, i32* %0
	br label %b1
b7:
	%22 = alloca i32
	%23 = load i32, i32* %0
	%24 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %23
	%25 = load i32, i32* %24
	store i32 %25, i32* %22
	%26 = load i32, i32* %0
	%27 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %26
	%28 = load i32, i32* %5
	%29 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %28
	%30 = load i32, i32* %29
	store i32 %30, i32* %27
	%31 = load i32, i32* %5
	%32 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %31
	%33 = load i32, i32* %22
	store i32 %33, i32* %32
	%34 = load i32, i32* %0
	%35 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %34
	%36 = load i32, i32* %35
	store i32 %36, i32* %22
	%37 = load i32, i32* %0
	%38 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %37
	%39 = load i32, i32* %5
	%40 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %39
	%41 = load i32, i32* %40
	store i32 %41, i32* %38
	%42 = load i32, i32* %5
	%43 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %42
	%44 = load i32, i32* %22
	store i32 %44, i32* %43
	%45 = load i32, i32* %0
	%46 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %45
	%47 = load i32, i32* %46
	store i32 %47, i32* %22
	%48 = load i32, i32* %0
	%49 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %48
	%50 = load i32, i32* %5
	%51 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %50
	%52 = load i32, i32* %51
	store i32 %52, i32* %49
	%53 = load i32, i32* %5
	%54 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %53
	%55 = load i32, i32* %22
	store i32 %55, i32* %54
	br label %b8
b8:
	%56 = load i32, i32* %5
	%57 = add i32 %56, 1
	store i32 %57, i32* %5
	br label %b4
b9:
	%58 = load i32, i32* %0
	%59 = load i32, i32* @n
	%60 = icmp sle i32 %58, %59
	%61 = icmp ne i1 %60, 0
	br i1 %61, label %b10, label %b11
b10:
	%62 = load i32, i32* %0
	%63 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %62
	%64 = load i32, i32* %0
	store i32 %64, i32* %63
	%65 = load i32, i32* %0
	%66 = add i32 %65, 1
	store i32 %66, i32* %0
	br label %b9
b11:
	store i32 0, i32* %0
	%67 = alloca i32
	store i32 0, i32* %67
	br label %b12
b12:
	%68 = load i32, i32* %0
	%69 = load i32, i32* @m
	%70 = icmp slt i32 %68, %69
	%71 = icmp ne i1 %70, 0
	br i1 %71, label %b13, label %b14
b13:
	%72 = load i32, i32* %0
	%73 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %72
	%74 = load i32, i32* %73
	%75 = load i32, i32* %0
	%76 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %75
	%77 = load i32, i32* %76
	%78 = call i32 @same(i32 %74, i32 %77)
	%79 = icmp ne i32 %78, 0
	br i1 %79, label %b15, label %b16
b14:
	%80 = load i32, i32* %67
	ret i32 %80
b15:
	br label %b12
b16:
	%81 = load i32, i32* %67
	%82 = load i32, i32* %0
	%83 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %82
	%84 = load i32, i32* %83
	%85 = add i32 %81, %84
	store i32 %85, i32* %67
	%86 = load i32, i32* %0
	%87 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %86
	%88 = load i32, i32* %87
	%89 = call i32 @find(i32 %88)
	%90 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %89
	%91 = load i32, i32* %0
	%92 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %91
	%93 = load i32, i32* %92
	store i32 %93, i32* %90
	%94 = load i32, i32* %0
	%95 = add i32 %94, 1
	store i32 %95, i32* %0
	br label %b12
b17:
	br label %b16
}

define i32 @main() {
b0:
	%0 = alloca i32
	%1 = call i32 @quick_read()
	store i32 %1, i32* %0
	%2 = alloca i32
	%3 = call i32 @quick_read()
	store i32 %3, i32* %2
	%4 = alloca i32
	store i32 0, i32* %4
	br label %b1
b1:
	%5 = load i32, i32* %4
	%6 = load i32, i32* %2
	%7 = icmp slt i32 %5, %6
	%8 = icmp ne i1 %7, 0
	br i1 %8, label %b2, label %b3
b2:
	%9 = load i32, i32* %4
	%10 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %9
	%11 = call i32 @quick_read()
	store i32 %11, i32* %10
	%12 = load i32, i32* %4
	%13 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %12
	%14 = call i32 @quick_read()
	store i32 %14, i32* %13
	%15 = load i32, i32* %4
	%16 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %15
	%17 = call i32 @quick_read()
	store i32 %17, i32* %16
	%18 = load i32, i32* %4
	%19 = add i32 %18, 1
	store i32 %19, i32* %4
	br label %b1
b3:
	%20 = call i32 @prim()
	call void @putint(i32 %20)
	ret i32 %20
}

