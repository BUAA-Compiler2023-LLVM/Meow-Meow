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
@u = global [1005 x i32]zeroinitializer
@v = global [1005 x i32]zeroinitializer
@c = global [1005 x i32]zeroinitializer
@fa = global [1005 x i32]zeroinitializer
define i32 @find(i32 %0) {
b0:
	br label %b1
b1:
	%1 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %0
	%2 = load i32, i32* %1
	%3 = icmp eq i32 %0, %2
	br i1 %3, label %b2, label %b3
b2:
	ret i32 %0
b3:
	%4 = load i32, i32* %1
	%5 = call i32 @find(i32 %4)
	store i32 %5, i32* %1
	ret i32 %5
}

define i32 @same(i32 %0, i32 %1) {
b0:
	br label %b1
b1:
	%2 = call i32 @find(i32 %0)
	%3 = call i32 @find(i32 %1)
	%4 = icmp eq i32 %2, %3
	br i1 %4, label %b2, label %b3
b2:
	ret i32 1
b3:
	ret i32 0
}

define i32 @prim() {
b0:
	br label %b1
b1:
	%0 = phi i32 [ 0, %b0 ],[ %2, %b6 ]
	%1 = icmp slt i32 %0, 0
	br i1 %1, label %b2, label %b3
b2:
	%2 = add i32 %0, 1
	br label %b4
b3:
	br label %b9
b4:
	%3 = phi i32 [ %2, %b2 ],[ %20, %b8 ]
	%4 = icmp slt i32 %3, 0
	br i1 %4, label %b5, label %b6
b5:
	%5 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %0
	%6 = load i32, i32* %5
	%7 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %3
	%8 = load i32, i32* %7
	%9 = icmp sgt i32 %6, %8
	br i1 %9, label %b7, label %b8
b6:
	br label %b1
b7:
	%10 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %0
	%11 = load i32, i32* %10
	%12 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %3
	%13 = load i32, i32* %12
	store i32 %13, i32* %10
	store i32 %11, i32* %12
	%14 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %0
	%15 = load i32, i32* %14
	%16 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %3
	%17 = load i32, i32* %16
	store i32 %17, i32* %14
	store i32 %15, i32* %16
	%18 = load i32, i32* %5
	%19 = load i32, i32* %7
	store i32 %19, i32* %5
	store i32 %18, i32* %7
	br label %b8
b8:
	%20 = add i32 %3, 1
	br label %b4
b9:
	%21 = phi i32 [ 1, %b3 ],[ %24, %b10 ]
	%22 = icmp sle i32 %21, 0
	br i1 %22, label %b10, label %b11
b10:
	%23 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %21
	store i32 %21, i32* %23
	%24 = add i32 %21, 1
	br label %b9
b11:
	br label %b12
b12:
	%25 = phi i32 [ 0, %b11 ],[ %25, %b13 ],[ %41, %b15 ]
	%26 = phi i32 [ 0, %b11 ],[ %26, %b13 ],[ %40, %b15 ]
	%27 = icmp slt i32 %26, 0
	br i1 %27, label %b13, label %b14
b13:
	%28 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %26
	%29 = load i32, i32* %28
	%30 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %26
	%31 = load i32, i32* %30
	%32 = call i32 @same(i32 %29, i32 %31)
	%33 = icmp ne i32 %32, 0
	br i1 %33, label %b12, label %b15
b14:
	ret i32 %25
b15:
	%34 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %26
	%35 = load i32, i32* %34
	%36 = load i32, i32* %28
	%37 = call i32 @find(i32 %36)
	%38 = load i32, i32* %30
	%39 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %37
	store i32 %38, i32* %39
	%40 = add i32 %26, 1
	%41 = add i32 %25, %35
	br label %b12
}

define i32 @main() {
b0:
	br label %b1
b1:
	%0 = call i32 @getch()
	br label %b2
b2:
	%1 = phi i32 [ 0, %b1 ],[ %6, %b6 ]
	%2 = phi i32 [ %0, %b1 ],[ %7, %b6 ]
	%3 = icmp slt i32 %2, 48
	br i1 %3, label %b3, label %b4
b3:
	%4 = icmp eq i32 %2, 45
	br i1 %4, label %b5, label %b6
b4:
	%5 = icmp sgt i32 %2, 57
	br i1 %5, label %b3, label %b7
b5:
	br label %b6
b6:
	%6 = phi i32 [ %1, %b3 ],[ 1, %b5 ]
	%7 = call i32 @getch()
	br label %b2
b7:
	%8 = phi i32 [ %2, %b4 ],[ %10, %b8 ]
	%9 = icmp sge i32 %8, 48
	br i1 %9, label %b10, label %b9
b8:
	%10 = call i32 @getch()
	br label %b7
b9:
	%11 = icmp ne i32 %1, 0
	br i1 %11, label %b11, label %b12
b10:
	%12 = icmp sle i32 %8, 57
	br i1 %12, label %b8, label %b9
b11:
	br label %b13
b12:
	br label %b13
b13:
	br label %b14
b14:
	%13 = call i32 @getch()
	br label %b15
b15:
	%14 = phi i32 [ 0, %b14 ],[ %19, %b19 ]
	%15 = phi i32 [ %13, %b14 ],[ %20, %b19 ]
	%16 = icmp slt i32 %15, 48
	br i1 %16, label %b16, label %b17
b16:
	%17 = icmp eq i32 %15, 45
	br i1 %17, label %b18, label %b19
b17:
	%18 = icmp sgt i32 %15, 57
	br i1 %18, label %b16, label %b20
b18:
	br label %b19
b19:
	%19 = phi i32 [ %14, %b16 ],[ 1, %b18 ]
	%20 = call i32 @getch()
	br label %b15
b20:
	%21 = phi i32 [ 0, %b17 ],[ %27, %b21 ]
	%22 = phi i32 [ %15, %b17 ],[ %24, %b21 ]
	%23 = icmp sge i32 %22, 48
	br i1 %23, label %b23, label %b22
b21:
	%24 = call i32 @getch()
	%25 = mul i32 %21, 10
	%26 = add i32 %25, %22
	%27 = sub i32 %26, 48
	br label %b20
b22:
	%28 = icmp ne i32 %14, 0
	br i1 %28, label %b24, label %b25
b23:
	%29 = icmp sle i32 %22, 57
	br i1 %29, label %b21, label %b22
b24:
	%30 = sub i32 0, %21
	br label %b26
b25:
	br label %b26
b26:
	%31 = phi i32 [ %30, %b24 ],[ %21, %b25 ]
	br label %b27
b27:
	%32 = phi i32 [ 0, %b26 ],[ %94, %b67 ]
	%33 = icmp slt i32 %32, %31
	br i1 %33, label %b28, label %b68
b28:
	br label %b29
b29:
	%34 = call i32 @getch()
	br label %b30
b30:
	%35 = phi i32 [ 0, %b29 ],[ %40, %b34 ]
	%36 = phi i32 [ %34, %b29 ],[ %41, %b34 ]
	%37 = icmp slt i32 %36, 48
	br i1 %37, label %b31, label %b32
b31:
	%38 = icmp eq i32 %36, 45
	br i1 %38, label %b33, label %b34
b32:
	%39 = icmp sgt i32 %36, 57
	br i1 %39, label %b31, label %b35
b33:
	br label %b34
b34:
	%40 = phi i32 [ %35, %b31 ],[ 1, %b33 ]
	%41 = call i32 @getch()
	br label %b30
b35:
	%42 = phi i32 [ 0, %b32 ],[ %48, %b36 ]
	%43 = phi i32 [ %36, %b32 ],[ %45, %b36 ]
	%44 = icmp sge i32 %43, 48
	br i1 %44, label %b38, label %b37
b36:
	%45 = call i32 @getch()
	%46 = mul i32 %42, 10
	%47 = add i32 %46, %43
	%48 = sub i32 %47, 48
	br label %b35
b37:
	%49 = icmp ne i32 %35, 0
	br i1 %49, label %b39, label %b40
b38:
	%50 = icmp sle i32 %43, 57
	br i1 %50, label %b36, label %b37
b39:
	%51 = sub i32 0, %42
	br label %b41
b40:
	br label %b41
b41:
	%52 = phi i32 [ %51, %b39 ],[ %42, %b40 ]
	%53 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %32
	store i32 %52, i32* %53
	br label %b42
b42:
	%54 = call i32 @getch()
	br label %b43
b43:
	%55 = phi i32 [ 0, %b42 ],[ %60, %b47 ]
	%56 = phi i32 [ %54, %b42 ],[ %61, %b47 ]
	%57 = icmp slt i32 %56, 48
	br i1 %57, label %b44, label %b45
b44:
	%58 = icmp eq i32 %56, 45
	br i1 %58, label %b46, label %b47
b45:
	%59 = icmp sgt i32 %56, 57
	br i1 %59, label %b44, label %b48
b46:
	br label %b47
b47:
	%60 = phi i32 [ %55, %b44 ],[ 1, %b46 ]
	%61 = call i32 @getch()
	br label %b43
b48:
	%62 = phi i32 [ 0, %b45 ],[ %68, %b49 ]
	%63 = phi i32 [ %56, %b45 ],[ %65, %b49 ]
	%64 = icmp sge i32 %63, 48
	br i1 %64, label %b51, label %b50
b49:
	%65 = call i32 @getch()
	%66 = mul i32 %62, 10
	%67 = add i32 %66, %63
	%68 = sub i32 %67, 48
	br label %b48
b50:
	%69 = icmp ne i32 %55, 0
	br i1 %69, label %b52, label %b53
b51:
	%70 = icmp sle i32 %63, 57
	br i1 %70, label %b49, label %b50
b52:
	%71 = sub i32 0, %62
	br label %b54
b53:
	br label %b54
b54:
	%72 = phi i32 [ %71, %b52 ],[ %62, %b53 ]
	%73 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %32
	store i32 %72, i32* %73
	br label %b55
b55:
	%74 = call i32 @getch()
	br label %b56
b56:
	%75 = phi i32 [ 0, %b55 ],[ %80, %b60 ]
	%76 = phi i32 [ %74, %b55 ],[ %81, %b60 ]
	%77 = icmp slt i32 %76, 48
	br i1 %77, label %b57, label %b58
b57:
	%78 = icmp eq i32 %76, 45
	br i1 %78, label %b59, label %b60
b58:
	%79 = icmp sgt i32 %76, 57
	br i1 %79, label %b57, label %b61
b59:
	br label %b60
b60:
	%80 = phi i32 [ %75, %b57 ],[ 1, %b59 ]
	%81 = call i32 @getch()
	br label %b56
b61:
	%82 = phi i32 [ 0, %b58 ],[ %88, %b62 ]
	%83 = phi i32 [ %76, %b58 ],[ %85, %b62 ]
	%84 = icmp sge i32 %83, 48
	br i1 %84, label %b64, label %b63
b62:
	%85 = call i32 @getch()
	%86 = mul i32 %82, 10
	%87 = add i32 %86, %83
	%88 = sub i32 %87, 48
	br label %b61
b63:
	%89 = icmp ne i32 %75, 0
	br i1 %89, label %b65, label %b66
b64:
	%90 = icmp sle i32 %83, 57
	br i1 %90, label %b62, label %b63
b65:
	%91 = sub i32 0, %82
	br label %b67
b66:
	br label %b67
b67:
	%92 = phi i32 [ %91, %b65 ],[ %82, %b66 ]
	%93 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %32
	store i32 %92, i32* %93
	%94 = add i32 %32, 1
	br label %b27
b68:
	%95 = call i32 @prim()
	call void @putint(i32 %95)
	ret i32 %95
}

