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
define float @float_abs(float %0) {
b0:
	%1 = alloca float
	store float %0, float* %1
	br label %b1
b1:
	%2 = load float, float* %1
	%3 = sitofp i32 0 to float
	%4 = fcmp olt float %2, %3
	%5 = icmp ne i1 %4, 0
	br i1 %5, label %b2, label %b3
b2:
	%6 = load float, float* %1
	%7 = sitofp i32 0 to float
	%8 = fsub float %7, %6
	ret float %8
b3:
	%9 = load float, float* %1
	ret float %9
}

define float @circle_area(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* %1
	%3 = sitofp i32 %2 to float
	%4 = fmul float 0x400921fb60000000, %3
	%5 = load i32, i32* %1
	%6 = sitofp i32 %5 to float
	%7 = fmul float %4, %6
	%8 = load i32, i32* %1
	%9 = load i32, i32* %1
	%10 = mul i32 %8, %9
	%11 = sitofp i32 %10 to float
	%12 = fmul float %11, 0x400921fb60000000
	%13 = fadd float %7, %12
	%14 = sitofp i32 2 to float
	%15 = fdiv float %13, %14
	ret float %15
}

define i32 @float_eq(float %0, float %1) {
b0:
	%2 = alloca float
	store float %0, float* %2
	%3 = alloca float
	store float %1, float* %3
	br label %b1
b1:
	%4 = load float, float* %2
	%5 = load float, float* %3
	%6 = fsub float %4, %5
	%7 = call float @float_abs(float %6)
	%8 = fcmp olt float %7, 0x3eb0c6f7a0000000
	%9 = icmp ne i1 %8, 0
	br i1 %9, label %b2, label %b4
b2:
	%10 = fptosi float 1.0 to i32
	ret i32 %10
b3:
	ret i32 0
b4:
	ret i32 0
}

define void @error() {
b0:
	call void @putch(i32 101)
	call void @putch(i32 114)
	call void @putch(i32 114)
	call void @putch(i32 111)
	call void @putch(i32 114)
	call void @putch(i32 10)
	ret void
}

define void @ok() {
b0:
	call void @putch(i32 111)
	call void @putch(i32 107)
	call void @putch(i32 10)
	ret void
}

define void @assert(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* %1
	%3 = zext i1 0 to i32
	%4 = icmp eq i32 %2, %3
	%5 = icmp ne i1 %4, 0
	br i1 %5, label %b2, label %b4
b2:
	call void @error()
	br label %b3
b3:
	ret void
b4:
	call void @ok()
	br label %b3
}

define void @assert_not(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* %1
	%3 = icmp ne i32 %2, 0
	br i1 %3, label %b2, label %b4
b2:
	call void @error()
	br label %b3
b3:
	ret void
b4:
	call void @ok()
	br label %b3
}

define i32 @main() {
b0:
	%0 = call i32 @float_eq(float 0x3fb4000000000000, float 0xc0e01d0000000000)
	call void @assert_not(i32 %0)
	%1 = call i32 @float_eq(float 0x4057c21fc0000000, float 0x4041475ce0000000)
	call void @assert_not(i32 %1)
	%2 = call i32 @float_eq(float 0x4041475ce0000000, float 0x4041475ce0000000)
	call void @assert(i32 %2)
	%3 = fptosi float 5.5 to i32
	%4 = call float @circle_area(i32 %3)
	%5 = call float @circle_area(i32 5)
	%6 = call i32 @float_eq(float %4, float %5)
	call void @assert(i32 %6)
	%7 = call i32 @float_eq(float 0x406d200000000000, float 0x40affe0000000000)
	call void @assert_not(i32 %7)
	%8 = zext i1 0 to i32
	%9 = sitofp i32 %8 to float
	%10 = fcmp one float 0x3ff8000000000000, %9
	br i1 %10, label %b1, label %b2
b1:
	call void @ok()
	br label %b2
b2:
	%11 = zext i1 0 to i32
	%12 = sitofp i32 %11 to float
	%13 = fcmp oeq float 0x400a666660000000, %12
	%14 = icmp eq i1 %13, 0
	%15 = icmp ne i1 %14, 0
	br i1 %15, label %b3, label %b4
b3:
	call void @ok()
	br label %b4
b4:
	%16 = zext i1 0 to i32
	%17 = sitofp i32 %16 to float
	%18 = fcmp one float 0x0, %17
	br i1 %18, label %b7, label %b6
b5:
	call void @error()
	br label %b6
b6:
	%19 = icmp ne i32 0, 0
	br i1 %19, label %b8, label %b10
b7:
	%20 = icmp ne i32 3, 0
	br i1 %20, label %b5, label %b6
b8:
	call void @ok()
	br label %b9
b9:
	%21 = alloca i32
	store i32 1, i32* %21
	%22 = alloca i32
	store i32 0, i32* %22
	%23 = alloca [10 x float]
	%24 = getelementptr [10 x float], [10 x float]* %23, i32 0, i32 0
	%25 = bitcast float* %24 to i32*
	call void @memset(i32* %25, i32 0, i32 40)
	%26 = getelementptr [10 x float], [10 x float]* %23, i32 0, i32 0
	store float 1.0, float* %26
	%27 = getelementptr [10 x float], [10 x float]* %23, i32 0, i32 1
	%28 = sitofp i32 2 to float
	store float %28, float* %27
	%29 = alloca i32
	%30 = getelementptr [10 x float], [10 x float]* %23, i32 0, i32 0
	%31 = call i32 @getfarray(float* %30)
	store i32 %31, i32* %29
	br label %b11
b10:
	%32 = zext i1 0 to i32
	%33 = sitofp i32 %32 to float
	%34 = fcmp one float 0x3fd3333340000000, %33
	br i1 %34, label %b8, label %b9
b11:
	%35 = load i32, i32* %21
	%36 = icmp slt i32 %35, 1000000000
	%37 = icmp ne i1 %36, 0
	br i1 %37, label %b12, label %b13
b12:
	%38 = alloca float
	%39 = call float @getfloat()
	store float %39, float* %38
	%40 = alloca float
	%41 = load float, float* %38
	%42 = fmul float 0x400921fb60000000, %41
	%43 = load float, float* %38
	%44 = fmul float %42, %43
	store float %44, float* %40
	%45 = alloca float
	%46 = load float, float* %38
	%47 = fptosi float %46 to i32
	%48 = call float @circle_area(i32 %47)
	store float %48, float* %45
	%49 = load i32, i32* %22
	%50 = getelementptr [10 x float], [10 x float]* %23, i32 0, i32 %49
	%51 = load i32, i32* %22
	%52 = getelementptr [10 x float], [10 x float]* %23, i32 0, i32 %51
	%53 = load float, float* %52
	%54 = load float, float* %38
	%55 = fadd float %53, %54
	store float %55, float* %50
	%56 = load float, float* %40
	call void @putfloat(float %56)
	call void @putch(i32 32)
	%57 = load float, float* %45
	%58 = fptosi float %57 to i32
	call void @putint(i32 %58)
	call void @putch(i32 10)
	%59 = load i32, i32* %21
	%60 = sitofp i32 %59 to float
	%61 = fmul float %60, 0x4024000000000000
	%62 = fptosi float %61 to i32
	store i32 %62, i32* %21
	%63 = load i32, i32* %22
	%64 = add i32 %63, 1
	store i32 %64, i32* %22
	br label %b11
b13:
	%65 = load i32, i32* %29
	%66 = getelementptr [10 x float], [10 x float]* %23, i32 0, i32 0
	call void @putfarray(i32 %65, float* %66)
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

