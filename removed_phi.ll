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
	%4 = move %0
	br label %b4
b3:
	%5 = load i32, i32* %1
	%6 = call i32 @find(i32 %5)
	store i32 %6, i32* %1
	%4 = move %6
	br label %b4
b4:
	%7 = move %4
	ret i32 %7
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
	%5 = move 1
	br label %b4
b3:
	%5 = move 0
	br label %b4
b4:
	%6 = move %5
	ret i32 %6
}

define i32 @prim() {
b0:
	%0 = move 0
	br label %b1
b1:
	%1 = move %0
	%2 = icmp slt i32 %1, 0
	br i1 %2, label %b2, label %b3
b2:
	%3 = add i32 %1, 1
	%4 = move %3
	br label %b4
b3:
	%5 = move 1
	br label %b9
b4:
	%6 = move %4
	%7 = icmp slt i32 %6, 0
	br i1 %7, label %b5, label %b6
b5:
	%8 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %1
	%9 = load i32, i32* %8
	%10 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %6
	%11 = load i32, i32* %10
	%12 = icmp sgt i32 %9, %11
	br i1 %12, label %b7, label %b8
b6:
	%0 = move %3
	br label %b1
b7:
	%13 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %1
	%14 = load i32, i32* %13
	%15 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %6
	%16 = load i32, i32* %15
	store i32 %16, i32* %13
	store i32 %14, i32* %15
	%17 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %1
	%18 = load i32, i32* %17
	%19 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %6
	%20 = load i32, i32* %19
	store i32 %20, i32* %17
	store i32 %18, i32* %19
	%21 = load i32, i32* %8
	%22 = load i32, i32* %10
	store i32 %22, i32* %8
	store i32 %21, i32* %10
	br label %b8
b8:
	%23 = add i32 %6, 1
	%4 = move %23
	br label %b4
b9:
	%24 = move %5
	%25 = icmp sle i32 %24, 0
	br i1 %25, label %b10, label %b11
b10:
	%26 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %24
	store i32 %24, i32* %26
	%27 = add i32 %24, 1
	%5 = move %27
	br label %b9
b11:
	%28 = move 0
	%29 = move 0
	br label %b12
b12:
	%30 = move %28
	%31 = move %29
	%32 = icmp slt i32 %31, 0
	br i1 %32, label %b13, label %b15
b13:
	%33 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %31
	%34 = load i32, i32* %33
	%35 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %31
	%36 = load i32, i32* %35
	%37 = call i32 @same(i32 %34, i32 %36)
	%38 = icmp ne i32 %37, 0
	br i1 %38, label %b14, label %b16
b14:
	%28 = move %30
	%29 = move %31
	br label %b12
b15:
	ret i32 %30
b16:
	%39 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %31
	%40 = load i32, i32* %39
	%41 = load i32, i32* %33
	%42 = call i32 @find(i32 %41)
	%43 = load i32, i32* %35
	%44 = getelementptr [1005 x i32], [1005 x i32]* @fa, i32 0, i32 %42
	store i32 %43, i32* %44
	%45 = add i32 %31, 1
	%46 = add i32 %30, %40
	%28 = move %46
	%29 = move %45
	br label %b12
}

define i32 @main() {
b0:
	br label %b1
b1:
	%0 = call i32 @getch()
	%1 = move 0
	%2 = move %0
	br label %b2
b2:
	%3 = move %1
	%4 = move %2
	%5 = icmp slt i32 %4, 48
	br i1 %5, label %b3, label %b5
b3:
	%6 = icmp eq i32 %4, 45
	br i1 %6, label %b7, label %b4
b4:
	%7 = move %3
	br label %b8
b5:
	%8 = icmp sgt i32 %4, 57
	br i1 %8, label %b3, label %b6
b6:
	%9 = move %4
	br label %b9
b7:
	%7 = move 1
	br label %b8
b8:
	%10 = move %7
	%11 = call i32 @getch()
	%1 = move %10
	%2 = move %11
	br label %b2
b9:
	%12 = move %9
	%13 = icmp sge i32 %12, 48
	br i1 %13, label %b12, label %b11
b10:
	%14 = call i32 @getch()
	%9 = move %14
	br label %b9
b11:
	%15 = icmp ne i32 %3, 0
	br i1 %15, label %b13, label %b14
b12:
	%16 = icmp sle i32 %12, 57
	br i1 %16, label %b10, label %b11
b13:
	br label %b15
b14:
	br label %b15
b15:
	br label %b16
b16:
	%17 = call i32 @getch()
	%18 = move 0
	%19 = move %17
	br label %b17
b17:
	%20 = move %18
	%21 = move %19
	%22 = icmp slt i32 %21, 48
	br i1 %22, label %b18, label %b20
b18:
	%23 = icmp eq i32 %21, 45
	br i1 %23, label %b22, label %b19
b19:
	%24 = move %20
	br label %b23
b20:
	%25 = icmp sgt i32 %21, 57
	br i1 %25, label %b18, label %b21
b21:
	%26 = move 0
	%27 = move %21
	br label %b24
b22:
	%24 = move 1
	br label %b23
b23:
	%28 = move %24
	%29 = call i32 @getch()
	%18 = move %28
	%19 = move %29
	br label %b17
b24:
	%30 = move %26
	%31 = move %27
	%32 = icmp sge i32 %31, 48
	br i1 %32, label %b27, label %b26
b25:
	%33 = call i32 @getch()
	%34 = mul i32 %30, 10
	%35 = add i32 %34, %31
	%36 = sub i32 %35, 48
	%26 = move %36
	%27 = move %33
	br label %b24
b26:
	%37 = icmp ne i32 %20, 0
	br i1 %37, label %b28, label %b29
b27:
	%38 = icmp sle i32 %31, 57
	br i1 %38, label %b25, label %b26
b28:
	%39 = sub i32 0, %30
	%40 = move %39
	br label %b30
b29:
	%40 = move %30
	br label %b30
b30:
	%41 = move %40
	%42 = move 0
	br label %b31
b31:
	%43 = move %42
	%44 = icmp slt i32 %43, %41
	br i1 %44, label %b32, label %b78
b32:
	br label %b33
b33:
	%45 = call i32 @getch()
	%46 = move 0
	%47 = move %45
	br label %b34
b34:
	%48 = move %46
	%49 = move %47
	%50 = icmp slt i32 %49, 48
	br i1 %50, label %b35, label %b37
b35:
	%51 = icmp eq i32 %49, 45
	br i1 %51, label %b39, label %b36
b36:
	%52 = move %48
	br label %b40
b37:
	%53 = icmp sgt i32 %49, 57
	br i1 %53, label %b35, label %b38
b38:
	%54 = move 0
	%55 = move %49
	br label %b41
b39:
	%52 = move 1
	br label %b40
b40:
	%56 = move %52
	%57 = call i32 @getch()
	%46 = move %56
	%47 = move %57
	br label %b34
b41:
	%58 = move %54
	%59 = move %55
	%60 = icmp sge i32 %59, 48
	br i1 %60, label %b44, label %b43
b42:
	%61 = call i32 @getch()
	%62 = mul i32 %58, 10
	%63 = add i32 %62, %59
	%64 = sub i32 %63, 48
	%54 = move %64
	%55 = move %61
	br label %b41
b43:
	%65 = icmp ne i32 %48, 0
	br i1 %65, label %b45, label %b46
b44:
	%66 = icmp sle i32 %59, 57
	br i1 %66, label %b42, label %b43
b45:
	%67 = sub i32 0, %58
	%68 = move %67
	br label %b47
b46:
	%68 = move %58
	br label %b47
b47:
	%69 = move %68
	%70 = getelementptr [1005 x i32], [1005 x i32]* @u, i32 0, i32 %43
	store i32 %69, i32* %70
	br label %b48
b48:
	%71 = call i32 @getch()
	%72 = move 0
	%73 = move %71
	br label %b49
b49:
	%74 = move %72
	%75 = move %73
	%76 = icmp slt i32 %75, 48
	br i1 %76, label %b50, label %b52
b50:
	%77 = icmp eq i32 %75, 45
	br i1 %77, label %b54, label %b51
b51:
	%78 = move %74
	br label %b55
b52:
	%79 = icmp sgt i32 %75, 57
	br i1 %79, label %b50, label %b53
b53:
	%80 = move 0
	%81 = move %75
	br label %b56
b54:
	%78 = move 1
	br label %b55
b55:
	%82 = move %78
	%83 = call i32 @getch()
	%72 = move %82
	%73 = move %83
	br label %b49
b56:
	%84 = move %80
	%85 = move %81
	%86 = icmp sge i32 %85, 48
	br i1 %86, label %b59, label %b58
b57:
	%87 = call i32 @getch()
	%88 = mul i32 %84, 10
	%89 = add i32 %88, %85
	%90 = sub i32 %89, 48
	%80 = move %90
	%81 = move %87
	br label %b56
b58:
	%91 = icmp ne i32 %74, 0
	br i1 %91, label %b60, label %b61
b59:
	%92 = icmp sle i32 %85, 57
	br i1 %92, label %b57, label %b58
b60:
	%93 = sub i32 0, %84
	%94 = move %93
	br label %b62
b61:
	%94 = move %84
	br label %b62
b62:
	%95 = move %94
	%96 = getelementptr [1005 x i32], [1005 x i32]* @v, i32 0, i32 %43
	store i32 %95, i32* %96
	br label %b63
b63:
	%97 = call i32 @getch()
	%98 = move 0
	%99 = move %97
	br label %b64
b64:
	%100 = move %98
	%101 = move %99
	%102 = icmp slt i32 %101, 48
	br i1 %102, label %b65, label %b67
b65:
	%103 = icmp eq i32 %101, 45
	br i1 %103, label %b69, label %b66
b66:
	%104 = move %100
	br label %b70
b67:
	%105 = icmp sgt i32 %101, 57
	br i1 %105, label %b65, label %b68
b68:
	%106 = move 0
	%107 = move %101
	br label %b71
b69:
	%104 = move 1
	br label %b70
b70:
	%108 = move %104
	%109 = call i32 @getch()
	%98 = move %108
	%99 = move %109
	br label %b64
b71:
	%110 = move %106
	%111 = move %107
	%112 = icmp sge i32 %111, 48
	br i1 %112, label %b74, label %b73
b72:
	%113 = call i32 @getch()
	%114 = mul i32 %110, 10
	%115 = add i32 %114, %111
	%116 = sub i32 %115, 48
	%106 = move %116
	%107 = move %113
	br label %b71
b73:
	%117 = icmp ne i32 %100, 0
	br i1 %117, label %b75, label %b76
b74:
	%118 = icmp sle i32 %111, 57
	br i1 %118, label %b72, label %b73
b75:
	%119 = sub i32 0, %110
	%120 = move %119
	br label %b77
b76:
	%120 = move %110
	br label %b77
b77:
	%121 = move %120
	%122 = getelementptr [1005 x i32], [1005 x i32]* @c, i32 0, i32 %43
	store i32 %121, i32* %122
	%123 = add i32 %43, 1
	%42 = move %123
	br label %b31
b78:
	%124 = call i32 @prim()
	call void @putint(i32 %124)
	ret i32 %124
}

