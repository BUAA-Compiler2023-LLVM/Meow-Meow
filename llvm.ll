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
define i32 @sum(i32* %0, [2 x i32]* %1, [2 x [2 x i32]]* %2, [2 x [2 x [2 x i32]]]* %3, [2 x [2 x [2 x [2 x i32]]]]* %4, [2 x [2 x [2 x [2 x [2 x i32]]]]]* %5, [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]* %6, [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]* %7, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]* %8, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]* %9, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]* %10, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]* %11, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]* %12, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]* %13, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]* %14, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]* %15, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]* %16, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]* %17, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]* %18) {
b0:
	%19 = alloca i32*
	store i32* %0, i32** %19
	%20 = alloca [2 x i32]*
	store [2 x i32]* %1, [2 x i32]** %20
	%21 = alloca [2 x [2 x i32]]*
	store [2 x [2 x i32]]* %2, [2 x [2 x i32]]** %21
	%22 = alloca [2 x [2 x [2 x i32]]]*
	store [2 x [2 x [2 x i32]]]* %3, [2 x [2 x [2 x i32]]]** %22
	%23 = alloca [2 x [2 x [2 x [2 x i32]]]]*
	store [2 x [2 x [2 x [2 x i32]]]]* %4, [2 x [2 x [2 x [2 x i32]]]]** %23
	%24 = alloca [2 x [2 x [2 x [2 x [2 x i32]]]]]*
	store [2 x [2 x [2 x [2 x [2 x i32]]]]]* %5, [2 x [2 x [2 x [2 x [2 x i32]]]]]** %24
	%25 = alloca [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]*
	store [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]* %6, [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]** %25
	%26 = alloca [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]*
	store [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]* %7, [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]** %26
	%27 = alloca [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]*
	store [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]* %8, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]** %27
	%28 = alloca [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]*
	store [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]* %9, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]** %28
	%29 = alloca [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]*
	store [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]* %10, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]** %29
	%30 = alloca [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]*
	store [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]* %11, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]** %30
	%31 = alloca [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]*
	store [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]* %12, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]** %31
	%32 = alloca [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]*
	store [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]* %13, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]** %32
	%33 = alloca [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]*
	store [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]* %14, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]** %33
	%34 = alloca [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]*
	store [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]* %15, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]** %34
	%35 = alloca [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]*
	store [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]* %16, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]** %35
	%36 = alloca [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]*
	store [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]* %17, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]** %36
	%37 = alloca [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]*
	store [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]* %18, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]** %37
	br label %b1
b1:
	%38 = load i32*, i32** %19
	%39 = getelementptr i32, i32* %38, i32 0
	%40 = load i32, i32* %39
	%41 = load [2 x i32]*, [2 x i32]** %20
	%42 = getelementptr [2 x i32], [2 x i32]* %41, i32 1, i32 0
	%43 = load i32, i32* %42
	%44 = add i32 %40, %43
	%45 = load [2 x [2 x i32]]*, [2 x [2 x i32]]** %21
	%46 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %45, i32 0, i32 0, i32 1
	%47 = load i32, i32* %46
	%48 = add i32 %44, %47
	%49 = load [2 x [2 x [2 x i32]]]*, [2 x [2 x [2 x i32]]]** %22
	%50 = getelementptr [2 x [2 x [2 x i32]]], [2 x [2 x [2 x i32]]]* %49, i32 1, i32 0, i32 1, i32 0
	%51 = load i32, i32* %50
	%52 = add i32 %48, %51
	%53 = load [2 x [2 x [2 x [2 x i32]]]]*, [2 x [2 x [2 x [2 x i32]]]]** %23
	%54 = getelementptr [2 x [2 x [2 x [2 x i32]]]], [2 x [2 x [2 x [2 x i32]]]]* %53, i32 0, i32 0, i32 1, i32 1, i32 0
	%55 = load i32, i32* %54
	%56 = add i32 %52, %55
	%57 = load [2 x [2 x [2 x [2 x [2 x i32]]]]]*, [2 x [2 x [2 x [2 x [2 x i32]]]]]** %24
	%58 = getelementptr [2 x [2 x [2 x [2 x [2 x i32]]]]], [2 x [2 x [2 x [2 x [2 x i32]]]]]* %57, i32 1, i32 1, i32 1, i32 0, i32 0, i32 1
	%59 = load i32, i32* %58
	%60 = add i32 %56, %59
	%61 = load [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]*, [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]** %25
	%62 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]* %61, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 0
	%63 = load i32, i32* %62
	%64 = add i32 %60, %63
	%65 = load [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]*, [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]** %26
	%66 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]* %65, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 1
	%67 = load i32, i32* %66
	%68 = add i32 %64, %67
	%69 = load [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]*, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]** %27
	%70 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]* %69, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0
	%71 = load i32, i32* %70
	%72 = add i32 %68, %71
	%73 = load [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]*, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]** %28
	%74 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]* %73, i32 0, i32 0, i32 1, i32 1, i32 0, i32 0, i32 1, i32 0, i32 0, i32 1
	%75 = load i32, i32* %74
	%76 = add i32 %72, %75
	%77 = load [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]*, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]** %29
	%78 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]* %77, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 1, i32 1
	%79 = load i32, i32* %78
	%80 = add i32 %76, %79
	%81 = load [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]*, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]** %30
	%82 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]* %81, i32 0, i32 0, i32 1, i32 1, i32 0, i32 0, i32 1, i32 0, i32 0, i32 1, i32 1, i32 0
	%83 = load i32, i32* %82
	%84 = add i32 %80, %83
	%85 = load [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]*, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]** %31
	%86 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]* %85, i32 1, i32 1, i32 0, i32 0, i32 1, i32 1, i32 1, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0
	%87 = load i32, i32* %86
	%88 = add i32 %84, %87
	%89 = load [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]*, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]** %32
	%90 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]* %89, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1
	%91 = load i32, i32* %90
	%92 = add i32 %88, %91
	%93 = load [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]*, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]** %33
	%94 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]* %93, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1
	%95 = load i32, i32* %94
	%96 = add i32 %92, %95
	%97 = load [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]*, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]** %34
	%98 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]* %97, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 0, i32 0, i32 1, i32 0, i32 0
	%99 = load i32, i32* %98
	%100 = add i32 %96, %99
	%101 = load [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]*, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]** %35
	%102 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]* %101, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 1, i32 0, i32 1, i32 0, i32 1
	%103 = load i32, i32* %102
	%104 = add i32 %100, %103
	%105 = load [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]*, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]** %36
	%106 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]* %105, i32 1, i32 1, i32 0, i32 0, i32 1, i32 0, i32 1, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 1, i32 1
	%107 = load i32, i32* %106
	%108 = add i32 %104, %107
	%109 = load [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]*, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]** %37
	%110 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]* %109, i32 0, i32 0, i32 1, i32 0, i32 0, i32 0, i32 1, i32 0, i32 0, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%111 = load i32, i32* %110
	%112 = add i32 %108, %111
	ret i32 %112
}

define i32 @main() {
b0:
	%0 = alloca [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]
	%1 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	call void @memset(i32* %1, i32 0, i32 2097152)
	store i32 0, i32* %1
	br label %b1
b1:
	%2 = phi i32 [ 0, %b0 ],[ %45, %b6 ]
	%3 = phi i32 [ 0, %b0 ],[ %43, %b6 ]
	%4 = icmp slt i32 %2, 2
	br i1 %4, label %b2, label %b3
b2:
	br label %b4
b3:
	%5 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%6 = getelementptr [2 x i32], [2 x i32]* %5, i32 0, i32 0
	%7 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%8 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %7, i32 0, i32 0
	%9 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%10 = getelementptr [2 x [2 x [2 x i32]]], [2 x [2 x [2 x i32]]]* %9, i32 0, i32 0
	%11 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%12 = getelementptr [2 x [2 x [2 x [2 x i32]]]], [2 x [2 x [2 x [2 x i32]]]]* %11, i32 0, i32 0
	%13 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%14 = getelementptr [2 x [2 x [2 x [2 x [2 x i32]]]]], [2 x [2 x [2 x [2 x [2 x i32]]]]]* %13, i32 0, i32 0
	%15 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%16 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]* %15, i32 0, i32 0
	%17 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%18 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]* %17, i32 0, i32 0
	%19 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%20 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]* %19, i32 0, i32 0
	%21 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%22 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]* %21, i32 0, i32 0
	%23 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%24 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]* %23, i32 0, i32 0
	%25 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%26 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]* %25, i32 0, i32 0
	%27 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%28 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]* %27, i32 0, i32 0
	%29 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%30 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]* %29, i32 0, i32 0
	%31 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%32 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]* %31, i32 0, i32 0
	%33 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0
	%34 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]* %33, i32 0, i32 0
	%35 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0
	%36 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]* %35, i32 0, i32 0
	%37 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0
	%38 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]* %37, i32 0, i32 0
	%39 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0
	%40 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]* %39, i32 0, i32 0
	%41 = call i32 @sum(i32* %6, [2 x i32]* %8, [2 x [2 x i32]]* %10, [2 x [2 x [2 x i32]]]* %12, [2 x [2 x [2 x [2 x i32]]]]* %14, [2 x [2 x [2 x [2 x [2 x i32]]]]]* %16, [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]* %18, [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]* %20, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]* %22, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]* %24, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]* %26, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]* %28, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]* %30, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]* %32, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]* %34, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]* %36, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]* %38, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]* %40, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]* %39)
	call void @putint(i32 %41)
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b4:
	%42 = phi i32 [ 0, %b2 ],[ %49, %b9 ]
	%43 = phi i32 [ %3, %b2 ],[ %47, %b9 ]
	%44 = icmp slt i32 %42, 2
	br i1 %44, label %b5, label %b6
b5:
	br label %b7
b6:
	%45 = add i32 %2, 1
	br label %b1
b7:
	%46 = phi i32 [ 0, %b5 ],[ %53, %b12 ]
	%47 = phi i32 [ %43, %b5 ],[ %51, %b12 ]
	%48 = icmp slt i32 %46, 2
	br i1 %48, label %b8, label %b9
b8:
	br label %b10
b9:
	%49 = add i32 %42, 1
	br label %b4
b10:
	%50 = phi i32 [ 0, %b8 ],[ %57, %b15 ]
	%51 = phi i32 [ %47, %b8 ],[ %55, %b15 ]
	%52 = icmp slt i32 %50, 2
	br i1 %52, label %b11, label %b12
b11:
	br label %b13
b12:
	%53 = add i32 %46, 1
	br label %b7
b13:
	%54 = phi i32 [ 0, %b11 ],[ %61, %b18 ]
	%55 = phi i32 [ %51, %b11 ],[ %59, %b18 ]
	%56 = icmp slt i32 %54, 2
	br i1 %56, label %b14, label %b15
b14:
	br label %b16
b15:
	%57 = add i32 %50, 1
	br label %b10
b16:
	%58 = phi i32 [ 0, %b14 ],[ %65, %b21 ]
	%59 = phi i32 [ %55, %b14 ],[ %63, %b21 ]
	%60 = icmp slt i32 %58, 2
	br i1 %60, label %b17, label %b18
b17:
	br label %b19
b18:
	%61 = add i32 %54, 1
	br label %b13
b19:
	%62 = phi i32 [ 0, %b17 ],[ %69, %b24 ]
	%63 = phi i32 [ %59, %b17 ],[ %67, %b24 ]
	%64 = icmp slt i32 %62, 2
	br i1 %64, label %b20, label %b21
b20:
	br label %b22
b21:
	%65 = add i32 %58, 1
	br label %b16
b22:
	%66 = phi i32 [ 0, %b20 ],[ %73, %b27 ]
	%67 = phi i32 [ %63, %b20 ],[ %71, %b27 ]
	%68 = icmp slt i32 %66, 2
	br i1 %68, label %b23, label %b24
b23:
	br label %b25
b24:
	%69 = add i32 %62, 1
	br label %b19
b25:
	%70 = phi i32 [ 0, %b23 ],[ %77, %b30 ]
	%71 = phi i32 [ %67, %b23 ],[ %75, %b30 ]
	%72 = icmp slt i32 %70, 2
	br i1 %72, label %b26, label %b27
b26:
	br label %b28
b27:
	%73 = add i32 %66, 1
	br label %b22
b28:
	%74 = phi i32 [ 0, %b26 ],[ %81, %b33 ]
	%75 = phi i32 [ %71, %b26 ],[ %79, %b33 ]
	%76 = icmp slt i32 %74, 2
	br i1 %76, label %b29, label %b30
b29:
	br label %b31
b30:
	%77 = add i32 %70, 1
	br label %b25
b31:
	%78 = phi i32 [ 0, %b29 ],[ %85, %b36 ]
	%79 = phi i32 [ %75, %b29 ],[ %83, %b36 ]
	%80 = icmp slt i32 %78, 2
	br i1 %80, label %b32, label %b33
b32:
	br label %b34
b33:
	%81 = add i32 %74, 1
	br label %b28
b34:
	%82 = phi i32 [ 0, %b32 ],[ %89, %b39 ]
	%83 = phi i32 [ %79, %b32 ],[ %87, %b39 ]
	%84 = icmp slt i32 %82, 2
	br i1 %84, label %b35, label %b36
b35:
	br label %b37
b36:
	%85 = add i32 %78, 1
	br label %b31
b37:
	%86 = phi i32 [ 0, %b35 ],[ %93, %b42 ]
	%87 = phi i32 [ %83, %b35 ],[ %91, %b42 ]
	%88 = icmp slt i32 %86, 2
	br i1 %88, label %b38, label %b39
b38:
	br label %b40
b39:
	%89 = add i32 %82, 1
	br label %b34
b40:
	%90 = phi i32 [ 0, %b38 ],[ %97, %b45 ]
	%91 = phi i32 [ %87, %b38 ],[ %95, %b45 ]
	%92 = icmp slt i32 %90, 2
	br i1 %92, label %b41, label %b42
b41:
	br label %b43
b42:
	%93 = add i32 %86, 1
	br label %b37
b43:
	%94 = phi i32 [ 0, %b41 ],[ %101, %b48 ]
	%95 = phi i32 [ %91, %b41 ],[ %99, %b48 ]
	%96 = icmp slt i32 %94, 2
	br i1 %96, label %b44, label %b45
b44:
	br label %b46
b45:
	%97 = add i32 %90, 1
	br label %b40
b46:
	%98 = phi i32 [ 0, %b44 ],[ %105, %b51 ]
	%99 = phi i32 [ %95, %b44 ],[ %103, %b51 ]
	%100 = icmp slt i32 %98, 2
	br i1 %100, label %b47, label %b48
b47:
	br label %b49
b48:
	%101 = add i32 %94, 1
	br label %b43
b49:
	%102 = phi i32 [ 0, %b47 ],[ %109, %b54 ]
	%103 = phi i32 [ %99, %b47 ],[ %107, %b54 ]
	%104 = icmp slt i32 %102, 2
	br i1 %104, label %b50, label %b51
b50:
	br label %b52
b51:
	%105 = add i32 %98, 1
	br label %b46
b52:
	%106 = phi i32 [ 0, %b50 ],[ %116, %b57 ]
	%107 = phi i32 [ %103, %b50 ],[ %111, %b57 ]
	%108 = icmp slt i32 %106, 2
	br i1 %108, label %b53, label %b54
b53:
	br label %b55
b54:
	%109 = add i32 %102, 1
	br label %b49
b55:
	%110 = phi i32 [ 0, %b53 ],[ %115, %b56 ]
	%111 = phi i32 [ %107, %b53 ],[ %114, %b56 ]
	%112 = icmp slt i32 %110, 2
	br i1 %112, label %b56, label %b57
b56:
	%113 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 %2, i32 %42, i32 %46, i32 %50, i32 %54, i32 %58, i32 %62, i32 %66, i32 %70, i32 %74, i32 %78, i32 %82, i32 %86, i32 %90, i32 %94, i32 %98, i32 %102, i32 %106, i32 %110
	store i32 %111, i32* %113
	%114 = add i32 %111, 1
	%115 = add i32 %110, 1
	br label %b55
b57:
	%116 = add i32 %106, 1
	br label %b52
}

