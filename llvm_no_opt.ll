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
	%2 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	store i32 0, i32* %2
	%3 = alloca i32
	store i32 0, i32* %3
	%4 = alloca i32
	store i32 0, i32* %4
	br label %b1
b1:
	%5 = load i32, i32* %4
	%6 = icmp slt i32 %5, 2
	%7 = icmp ne i1 %6, 0
	br i1 %7, label %b2, label %b3
b2:
	%8 = alloca i32
	store i32 0, i32* %8
	br label %b4
b3:
	%9 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%10 = getelementptr [2 x i32], [2 x i32]* %9, i32 0, i32 0
	%11 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%12 = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %11, i32 0, i32 0
	%13 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%14 = getelementptr [2 x [2 x [2 x i32]]], [2 x [2 x [2 x i32]]]* %13, i32 0, i32 0
	%15 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%16 = getelementptr [2 x [2 x [2 x [2 x i32]]]], [2 x [2 x [2 x [2 x i32]]]]* %15, i32 0, i32 0
	%17 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%18 = getelementptr [2 x [2 x [2 x [2 x [2 x i32]]]]], [2 x [2 x [2 x [2 x [2 x i32]]]]]* %17, i32 0, i32 0
	%19 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%20 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]* %19, i32 0, i32 0
	%21 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%22 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]* %21, i32 0, i32 0
	%23 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%24 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]* %23, i32 0, i32 0
	%25 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%26 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]* %25, i32 0, i32 0
	%27 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%28 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]* %27, i32 0, i32 0
	%29 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%30 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]* %29, i32 0, i32 0
	%31 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%32 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]* %31, i32 0, i32 0
	%33 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%34 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]* %33, i32 0, i32 0
	%35 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
	%36 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]* %35, i32 0, i32 0
	%37 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0, i32 0
	%38 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]* %37, i32 0, i32 0
	%39 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0, i32 0
	%40 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]* %39, i32 0, i32 0
	%41 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0, i32 0
	%42 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]* %41, i32 0, i32 0
	%43 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0
	%44 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]* %43, i32 0, i32 0
	%45 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 0
	%46 = call i32 @sum(i32* %10, [2 x i32]* %12, [2 x [2 x i32]]* %14, [2 x [2 x [2 x i32]]]* %16, [2 x [2 x [2 x [2 x i32]]]]* %18, [2 x [2 x [2 x [2 x [2 x i32]]]]]* %20, [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]* %22, [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]* %24, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]* %26, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]* %28, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]* %30, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]* %32, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]* %34, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]* %36, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]* %38, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]* %40, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]* %42, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]* %44, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]* %45)
	call void @putint(i32 %46)
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b4:
	%47 = load i32, i32* %8
	%48 = icmp slt i32 %47, 2
	%49 = icmp ne i1 %48, 0
	br i1 %49, label %b5, label %b6
b5:
	%50 = alloca i32
	store i32 0, i32* %50
	br label %b7
b6:
	%51 = load i32, i32* %4
	%52 = add i32 %51, 1
	store i32 %52, i32* %4
	br label %b1
b7:
	%53 = load i32, i32* %50
	%54 = icmp slt i32 %53, 2
	%55 = icmp ne i1 %54, 0
	br i1 %55, label %b8, label %b9
b8:
	%56 = alloca i32
	store i32 0, i32* %56
	br label %b10
b9:
	%57 = load i32, i32* %8
	%58 = add i32 %57, 1
	store i32 %58, i32* %8
	br label %b4
b10:
	%59 = load i32, i32* %56
	%60 = icmp slt i32 %59, 2
	%61 = icmp ne i1 %60, 0
	br i1 %61, label %b11, label %b12
b11:
	%62 = alloca i32
	store i32 0, i32* %62
	br label %b13
b12:
	%63 = load i32, i32* %50
	%64 = add i32 %63, 1
	store i32 %64, i32* %50
	br label %b7
b13:
	%65 = load i32, i32* %62
	%66 = icmp slt i32 %65, 2
	%67 = icmp ne i1 %66, 0
	br i1 %67, label %b14, label %b15
b14:
	%68 = alloca i32
	store i32 0, i32* %68
	br label %b16
b15:
	%69 = load i32, i32* %56
	%70 = add i32 %69, 1
	store i32 %70, i32* %56
	br label %b10
b16:
	%71 = load i32, i32* %68
	%72 = icmp slt i32 %71, 2
	%73 = icmp ne i1 %72, 0
	br i1 %73, label %b17, label %b18
b17:
	%74 = alloca i32
	store i32 0, i32* %74
	br label %b19
b18:
	%75 = load i32, i32* %62
	%76 = add i32 %75, 1
	store i32 %76, i32* %62
	br label %b13
b19:
	%77 = load i32, i32* %74
	%78 = icmp slt i32 %77, 2
	%79 = icmp ne i1 %78, 0
	br i1 %79, label %b20, label %b21
b20:
	%80 = alloca i32
	store i32 0, i32* %80
	br label %b22
b21:
	%81 = load i32, i32* %68
	%82 = add i32 %81, 1
	store i32 %82, i32* %68
	br label %b16
b22:
	%83 = load i32, i32* %80
	%84 = icmp slt i32 %83, 2
	%85 = icmp ne i1 %84, 0
	br i1 %85, label %b23, label %b24
b23:
	%86 = alloca i32
	store i32 0, i32* %86
	br label %b25
b24:
	%87 = load i32, i32* %74
	%88 = add i32 %87, 1
	store i32 %88, i32* %74
	br label %b19
b25:
	%89 = load i32, i32* %86
	%90 = icmp slt i32 %89, 2
	%91 = icmp ne i1 %90, 0
	br i1 %91, label %b26, label %b27
b26:
	%92 = alloca i32
	store i32 0, i32* %92
	br label %b28
b27:
	%93 = load i32, i32* %80
	%94 = add i32 %93, 1
	store i32 %94, i32* %80
	br label %b22
b28:
	%95 = load i32, i32* %92
	%96 = icmp slt i32 %95, 2
	%97 = icmp ne i1 %96, 0
	br i1 %97, label %b29, label %b30
b29:
	%98 = alloca i32
	store i32 0, i32* %98
	br label %b31
b30:
	%99 = load i32, i32* %86
	%100 = add i32 %99, 1
	store i32 %100, i32* %86
	br label %b25
b31:
	%101 = load i32, i32* %98
	%102 = icmp slt i32 %101, 2
	%103 = icmp ne i1 %102, 0
	br i1 %103, label %b32, label %b33
b32:
	%104 = alloca i32
	store i32 0, i32* %104
	br label %b34
b33:
	%105 = load i32, i32* %92
	%106 = add i32 %105, 1
	store i32 %106, i32* %92
	br label %b28
b34:
	%107 = load i32, i32* %104
	%108 = icmp slt i32 %107, 2
	%109 = icmp ne i1 %108, 0
	br i1 %109, label %b35, label %b36
b35:
	%110 = alloca i32
	store i32 0, i32* %110
	br label %b37
b36:
	%111 = load i32, i32* %98
	%112 = add i32 %111, 1
	store i32 %112, i32* %98
	br label %b31
b37:
	%113 = load i32, i32* %110
	%114 = icmp slt i32 %113, 2
	%115 = icmp ne i1 %114, 0
	br i1 %115, label %b38, label %b39
b38:
	%116 = alloca i32
	store i32 0, i32* %116
	br label %b40
b39:
	%117 = load i32, i32* %104
	%118 = add i32 %117, 1
	store i32 %118, i32* %104
	br label %b34
b40:
	%119 = load i32, i32* %116
	%120 = icmp slt i32 %119, 2
	%121 = icmp ne i1 %120, 0
	br i1 %121, label %b41, label %b42
b41:
	%122 = alloca i32
	store i32 0, i32* %122
	br label %b43
b42:
	%123 = load i32, i32* %110
	%124 = add i32 %123, 1
	store i32 %124, i32* %110
	br label %b37
b43:
	%125 = load i32, i32* %122
	%126 = icmp slt i32 %125, 2
	%127 = icmp ne i1 %126, 0
	br i1 %127, label %b44, label %b45
b44:
	%128 = alloca i32
	store i32 0, i32* %128
	br label %b46
b45:
	%129 = load i32, i32* %116
	%130 = add i32 %129, 1
	store i32 %130, i32* %116
	br label %b40
b46:
	%131 = load i32, i32* %128
	%132 = icmp slt i32 %131, 2
	%133 = icmp ne i1 %132, 0
	br i1 %133, label %b47, label %b48
b47:
	%134 = alloca i32
	store i32 0, i32* %134
	br label %b49
b48:
	%135 = load i32, i32* %122
	%136 = add i32 %135, 1
	store i32 %136, i32* %122
	br label %b43
b49:
	%137 = load i32, i32* %134
	%138 = icmp slt i32 %137, 2
	%139 = icmp ne i1 %138, 0
	br i1 %139, label %b50, label %b51
b50:
	%140 = alloca i32
	store i32 0, i32* %140
	br label %b52
b51:
	%141 = load i32, i32* %128
	%142 = add i32 %141, 1
	store i32 %142, i32* %128
	br label %b46
b52:
	%143 = load i32, i32* %140
	%144 = icmp slt i32 %143, 2
	%145 = icmp ne i1 %144, 0
	br i1 %145, label %b53, label %b54
b53:
	%146 = alloca i32
	store i32 0, i32* %146
	br label %b55
b54:
	%147 = load i32, i32* %134
	%148 = add i32 %147, 1
	store i32 %148, i32* %134
	br label %b49
b55:
	%149 = load i32, i32* %146
	%150 = icmp slt i32 %149, 2
	%151 = icmp ne i1 %150, 0
	br i1 %151, label %b56, label %b57
b56:
	%152 = load i32, i32* %4
	%153 = load i32, i32* %8
	%154 = load i32, i32* %50
	%155 = load i32, i32* %56
	%156 = load i32, i32* %62
	%157 = load i32, i32* %68
	%158 = load i32, i32* %74
	%159 = load i32, i32* %80
	%160 = load i32, i32* %86
	%161 = load i32, i32* %92
	%162 = load i32, i32* %98
	%163 = load i32, i32* %104
	%164 = load i32, i32* %110
	%165 = load i32, i32* %116
	%166 = load i32, i32* %122
	%167 = load i32, i32* %128
	%168 = load i32, i32* %134
	%169 = load i32, i32* %140
	%170 = load i32, i32* %146
	%171 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 %152, i32 %153, i32 %154, i32 %155, i32 %156, i32 %157, i32 %158, i32 %159, i32 %160, i32 %161, i32 %162, i32 %163, i32 %164, i32 %165, i32 %166, i32 %167, i32 %168, i32 %169, i32 %170
	%172 = load i32, i32* %3
	store i32 %172, i32* %171
	%173 = load i32, i32* %3
	%174 = add i32 %173, 1
	store i32 %174, i32* %3
	%175 = load i32, i32* %146
	%176 = add i32 %175, 1
	store i32 %176, i32* %146
	br label %b55
b57:
	%177 = load i32, i32* %140
	%178 = add i32 %177, 1
	store i32 %178, i32* %140
	br label %b52
}

