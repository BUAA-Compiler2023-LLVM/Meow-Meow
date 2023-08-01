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
	%2 = move 0
	%3 = move 0
	br label %b1
b1:
	%4 = move %2
	%5 = move %3
	%6 = icmp slt i32 %4, 2
	br i1 %6, label %b2, label %b3
b2:
	%7 = move 0
	%8 = move %5
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
	%45 = call i32 @sum(i32* %10, [2 x i32]* %12, [2 x [2 x i32]]* %14, [2 x [2 x [2 x i32]]]* %16, [2 x [2 x [2 x [2 x i32]]]]* %18, [2 x [2 x [2 x [2 x [2 x i32]]]]]* %20, [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]* %22, [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]* %24, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]* %26, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]* %28, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]* %30, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]* %32, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]* %34, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]* %36, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]* %38, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]* %40, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]* %42, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]* %44, [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]* %43)
	call void @putint(i32 %45)
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b4:
	%46 = move %7
	%47 = move %8
	%48 = icmp slt i32 %46, 2
	br i1 %48, label %b5, label %b6
b5:
	%49 = move 0
	%50 = move %47
	br label %b7
b6:
	%51 = add i32 %4, 1
	%2 = move %51
	%3 = move %47
	br label %b1
b7:
	%52 = move %49
	%53 = move %50
	%54 = icmp slt i32 %52, 2
	br i1 %54, label %b8, label %b9
b8:
	%55 = move 0
	%56 = move %53
	br label %b10
b9:
	%57 = add i32 %46, 1
	%7 = move %57
	%8 = move %53
	br label %b4
b10:
	%58 = move %55
	%59 = move %56
	%60 = icmp slt i32 %58, 2
	br i1 %60, label %b11, label %b12
b11:
	%61 = move 0
	%62 = move %59
	br label %b13
b12:
	%63 = add i32 %52, 1
	%49 = move %63
	%50 = move %59
	br label %b7
b13:
	%64 = move %61
	%65 = move %62
	%66 = icmp slt i32 %64, 2
	br i1 %66, label %b14, label %b15
b14:
	%67 = move 0
	%68 = move %65
	br label %b16
b15:
	%69 = add i32 %58, 1
	%55 = move %69
	%56 = move %65
	br label %b10
b16:
	%70 = move %67
	%71 = move %68
	%72 = icmp slt i32 %70, 2
	br i1 %72, label %b17, label %b18
b17:
	%73 = move 0
	%74 = move %71
	br label %b19
b18:
	%75 = add i32 %64, 1
	%61 = move %75
	%62 = move %71
	br label %b13
b19:
	%76 = move %73
	%77 = move %74
	%78 = icmp slt i32 %76, 2
	br i1 %78, label %b20, label %b21
b20:
	%79 = move 0
	%80 = move %77
	br label %b22
b21:
	%81 = add i32 %70, 1
	%67 = move %81
	%68 = move %77
	br label %b16
b22:
	%82 = move %79
	%83 = move %80
	%84 = icmp slt i32 %82, 2
	br i1 %84, label %b23, label %b24
b23:
	%85 = move 0
	%86 = move %83
	br label %b25
b24:
	%87 = add i32 %76, 1
	%73 = move %87
	%74 = move %83
	br label %b19
b25:
	%88 = move %85
	%89 = move %86
	%90 = icmp slt i32 %88, 2
	br i1 %90, label %b26, label %b27
b26:
	%91 = move 0
	%92 = move %89
	br label %b28
b27:
	%93 = add i32 %82, 1
	%79 = move %93
	%80 = move %89
	br label %b22
b28:
	%94 = move %91
	%95 = move %92
	%96 = icmp slt i32 %94, 2
	br i1 %96, label %b29, label %b30
b29:
	%97 = move 0
	%98 = move %95
	br label %b31
b30:
	%99 = add i32 %88, 1
	%85 = move %99
	%86 = move %95
	br label %b25
b31:
	%100 = move %97
	%101 = move %98
	%102 = icmp slt i32 %100, 2
	br i1 %102, label %b32, label %b33
b32:
	%103 = move 0
	%104 = move %101
	br label %b34
b33:
	%105 = add i32 %94, 1
	%91 = move %105
	%92 = move %101
	br label %b28
b34:
	%106 = move %103
	%107 = move %104
	%108 = icmp slt i32 %106, 2
	br i1 %108, label %b35, label %b36
b35:
	%109 = move 0
	%110 = move %107
	br label %b37
b36:
	%111 = add i32 %100, 1
	%97 = move %111
	%98 = move %107
	br label %b31
b37:
	%112 = move %109
	%113 = move %110
	%114 = icmp slt i32 %112, 2
	br i1 %114, label %b38, label %b39
b38:
	%115 = move 0
	%116 = move %113
	br label %b40
b39:
	%117 = add i32 %106, 1
	%103 = move %117
	%104 = move %113
	br label %b34
b40:
	%118 = move %115
	%119 = move %116
	%120 = icmp slt i32 %118, 2
	br i1 %120, label %b41, label %b42
b41:
	%121 = move 0
	%122 = move %119
	br label %b43
b42:
	%123 = add i32 %112, 1
	%109 = move %123
	%110 = move %119
	br label %b37
b43:
	%124 = move %121
	%125 = move %122
	%126 = icmp slt i32 %124, 2
	br i1 %126, label %b44, label %b45
b44:
	%127 = move 0
	%128 = move %125
	br label %b46
b45:
	%129 = add i32 %118, 1
	%115 = move %129
	%116 = move %125
	br label %b40
b46:
	%130 = move %127
	%131 = move %128
	%132 = icmp slt i32 %130, 2
	br i1 %132, label %b47, label %b48
b47:
	%133 = move 0
	%134 = move %131
	br label %b49
b48:
	%135 = add i32 %124, 1
	%121 = move %135
	%122 = move %131
	br label %b43
b49:
	%136 = move %133
	%137 = move %134
	%138 = icmp slt i32 %136, 2
	br i1 %138, label %b50, label %b51
b50:
	%139 = move 0
	%140 = move %137
	br label %b52
b51:
	%141 = add i32 %130, 1
	%127 = move %141
	%128 = move %137
	br label %b46
b52:
	%142 = move %139
	%143 = move %140
	%144 = icmp slt i32 %142, 2
	br i1 %144, label %b53, label %b54
b53:
	%145 = move 0
	%146 = move %143
	br label %b55
b54:
	%147 = add i32 %136, 1
	%133 = move %147
	%134 = move %143
	br label %b49
b55:
	%148 = move %145
	%149 = move %146
	%150 = icmp slt i32 %148, 2
	br i1 %150, label %b56, label %b57
b56:
	%151 = getelementptr [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]], [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x [2 x i32]]]]]]]]]]]]]]]]]]]* %0, i32 0, i32 %4, i32 %46, i32 %52, i32 %58, i32 %64, i32 %70, i32 %76, i32 %82, i32 %88, i32 %94, i32 %100, i32 %106, i32 %112, i32 %118, i32 %124, i32 %130, i32 %136, i32 %142, i32 %148
	store i32 %149, i32* %151
	%152 = add i32 %149, 1
	%153 = add i32 %148, 1
	%145 = move %153
	%146 = move %152
	br label %b55
b57:
	%154 = add i32 %142, 1
	%139 = move %154
	%140 = move %149
	br label %b52
}

