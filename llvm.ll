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
@seed = global i32 0
define i32 @rand() {
b0:
	%0 = load i32, i32* @seed
	%1 = mul i32 %0, 19980130
	%2 = add i32 %1, 23333
	%3 = srem i32 %2, 100000007
	store i32 %3, i32* @seed
	%4 = load i32, i32* @seed
	%5 = icmp slt i32 %4, 0
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b1, label %b2
b1:
	%7 = load i32, i32* @seed
	%8 = add i32 %7, 100000007
	store i32 %8, i32* @seed
	br label %b2
b2:
	%9 = load i32, i32* @seed
	ret i32 %9
}

define float @my_fabs(float %0) {
b0:
	%1 = alloca float
	store float %0, float* %1
	br label %b1
b1:
	%2 = load float, float* %1
	%3 = sitofp i32 0 to float
	%4 = fcmp ogt float %2, %3
	%5 = icmp ne i1 %4, 0
	br i1 %5, label %b2, label %b3
b2:
	%6 = load float, float* %1
	ret float %6
b3:
	%7 = load float, float* %1
	%8 = sitofp i32 0 to float
	%9 = fsub float %8, %7
	ret float %9
}

define float @my_sqrt(float %0) {
b0:
	%1 = alloca float
	store float %0, float* %1
	br label %b1
b1:
	%2 = alloca float
	%3 = load float, float* %1
	%4 = sitofp i32 8 to float
	%5 = fdiv float %3, %4
	%6 = fadd float %5, 0x3fe0000000000000
	%7 = load float, float* %1
	%8 = sitofp i32 2 to float
	%9 = fmul float %8, %7
	%10 = load float, float* %1
	%11 = sitofp i32 4 to float
	%12 = fadd float %11, %10
	%13 = fdiv float %9, %12
	%14 = fadd float %6, %13
	store float %14, float* %2
	%15 = alloca i32
	store i32 10, i32* %15
	br label %b2
b2:
	%16 = load i32, i32* %15
	%17 = icmp ne i32 %16, 0
	br i1 %17, label %b3, label %b4
b3:
	%18 = load float, float* %2
	%19 = load float, float* %1
	%20 = load float, float* %2
	%21 = fdiv float %19, %20
	%22 = fadd float %18, %21
	%23 = sitofp i32 2 to float
	%24 = fdiv float %22, %23
	store float %24, float* %2
	%25 = load i32, i32* %15
	%26 = sub i32 %25, 1
	store i32 %26, i32* %15
	br label %b2
b4:
	%27 = load float, float* %2
	ret float %27
}

define float @p(float %0) {
b0:
	%1 = alloca float
	store float %0, float* %1
	br label %b1
b1:
	%2 = load float, float* %1
	%3 = sitofp i32 3 to float
	%4 = fmul float %3, %2
	%5 = load float, float* %1
	%6 = sitofp i32 4 to float
	%7 = fmul float %6, %5
	%8 = load float, float* %1
	%9 = fmul float %7, %8
	%10 = load float, float* %1
	%11 = fmul float %9, %10
	%12 = fsub float %4, %11
	ret float %12
}

define float @my_sin_impl(float %0) {
b0:
	%1 = alloca float
	store float %0, float* %1
	br label %b1
b1:
	%2 = load float, float* %1
	%3 = call float @my_fabs(float %2)
	%4 = fcmp ole float %3, 0x3eb0c6f7a0000000
	%5 = icmp ne i1 %4, 0
	br i1 %5, label %b2, label %b3
b2:
	%6 = load float, float* %1
	ret float %6
b3:
	%7 = load float, float* %1
	%8 = fdiv float %7, 0x4008000000000000
	%9 = call float @my_sin_impl(float %8)
	%10 = call float @p(float %9)
	ret float %10
}

define float @my_sin(float %0) {
b0:
	%1 = alloca float
	store float %0, float* %1
	br label %b1
b1:
	%2 = load float, float* %1
	%3 = fcmp ogt float %2, 0x401921fb60000000
	%4 = icmp ne i1 %3, 0
	br i1 %4, label %b2, label %b4
b2:
	%5 = alloca i32
	%6 = load float, float* %1
	%7 = fdiv float %6, 0x401921fb60000000
	%8 = fptosi float %7 to i32
	store i32 %8, i32* %5
	%9 = load float, float* %1
	%10 = load i32, i32* %5
	%11 = sitofp i32 %10 to float
	%12 = fmul float %11, 0x401921fb60000000
	%13 = fsub float %9, %12
	store float %13, float* %1
	br label %b3
b3:
	%14 = load float, float* %1
	%15 = fcmp ogt float %14, 0x400921fb60000000
	%16 = icmp ne i1 %15, 0
	br i1 %16, label %b5, label %b6
b4:
	%17 = load float, float* %1
	%18 = fcmp olt float %17, 0xc01921fb60000000
	%19 = icmp ne i1 %18, 0
	br i1 %19, label %b2, label %b3
b5:
	%20 = load float, float* %1
	%21 = fsub float %20, 0x401921fb60000000
	store float %21, float* %1
	br label %b6
b6:
	%22 = load float, float* %1
	%23 = fcmp olt float %22, 0xc00921fb60000000
	%24 = icmp ne i1 %23, 0
	br i1 %24, label %b7, label %b8
b7:
	%25 = load float, float* %1
	%26 = fadd float %25, 0x401921fb60000000
	store float %26, float* %1
	br label %b8
b8:
	%27 = load float, float* %1
	%28 = call float @my_sin_impl(float %27)
	ret float %28
}

define float @my_cos(float %0) {
b0:
	%1 = alloca float
	store float %0, float* %1
	br label %b1
b1:
	%2 = load float, float* %1
	%3 = fadd float %2, 0x3ff921fb60000000
	%4 = call float @my_sin(float %3)
	ret float %4
}

define float @circle_sdf(float %0, float %1, float %2, float %3, float %4) {
b0:
	%5 = alloca float
	store float %0, float* %5
	%6 = alloca float
	store float %1, float* %6
	%7 = alloca float
	store float %2, float* %7
	%8 = alloca float
	store float %3, float* %8
	%9 = alloca float
	store float %4, float* %9
	br label %b1
b1:
	%10 = alloca float
	%11 = load float, float* %5
	%12 = load float, float* %7
	%13 = fsub float %11, %12
	store float %13, float* %10
	%14 = alloca float
	%15 = load float, float* %6
	%16 = load float, float* %8
	%17 = fsub float %15, %16
	store float %17, float* %14
	%18 = load float, float* %10
	%19 = load float, float* %10
	%20 = fmul float %18, %19
	%21 = load float, float* %14
	%22 = load float, float* %14
	%23 = fmul float %21, %22
	%24 = fadd float %20, %23
	%25 = call float @my_sqrt(float %24)
	%26 = load float, float* %9
	%27 = fsub float %25, %26
	ret float %27
}

define void @scene(float %0, float %1, float* %2) {
b0:
	%3 = alloca float
	store float %0, float* %3
	%4 = alloca float
	store float %1, float* %4
	%5 = alloca float*
	store float* %2, float** %5
	br label %b1
b1:
	%6 = alloca float
	%7 = load float, float* %3
	%8 = load float, float* %4
	%9 = call float @circle_sdf(float %7, float %8, float 0x3fd99999a0000000, float 0x3fd99999a0000000, float 0x3fb99999a0000000)
	store float %9, float* %6
	%10 = alloca float
	%11 = load float, float* %3
	%12 = load float, float* %4
	%13 = call float @circle_sdf(float %11, float %12, float 0x3fe3333340000000, float 0x3fe3333340000000, float 0x3fa99999a0000000)
	store float %13, float* %10
	%14 = load float, float* %6
	%15 = load float, float* %10
	%16 = fcmp olt float %14, %15
	%17 = icmp ne i1 %16, 0
	br i1 %17, label %b2, label %b4
b2:
	%18 = load float*, float** %5
	%19 = getelementptr float, float* %18, i32 0
	%20 = load float, float* %6
	store float %20, float* %19
	%21 = load float*, float** %5
	%22 = getelementptr float, float* %21, i32 1
	store float 3.0, float* %22
	br label %b3
b3:
	ret void
b4:
	%23 = load float*, float** %5
	%24 = getelementptr float, float* %23, i32 0
	%25 = load float, float* %10
	store float %25, float* %24
	%26 = load float*, float** %5
	%27 = getelementptr float, float* %26, i32 1
	store float 0.0, float* %27
	br label %b3
}

define float @trace(float %0, float %1, float %2, float %3) {
b0:
	%4 = alloca float
	store float %0, float* %4
	%5 = alloca float
	store float %1, float* %5
	%6 = alloca float
	store float %2, float* %6
	%7 = alloca float
	store float %3, float* %7
	br label %b1
b1:
	%8 = alloca float
	store float 0.0, float* %8
	%9 = alloca i32
	store i32 0, i32* %9
	br label %b2
b2:
	%10 = load i32, i32* %9
	%11 = icmp slt i32 %10, 10
	%12 = icmp ne i1 %11, 0
	br i1 %12, label %b5, label %b4
b3:
	%13 = alloca [2 x float]
	%14 = load float, float* %4
	%15 = load float, float* %6
	%16 = load float, float* %8
	%17 = fmul float %15, %16
	%18 = fadd float %14, %17
	%19 = load float, float* %5
	%20 = load float, float* %7
	%21 = load float, float* %8
	%22 = fmul float %20, %21
	%23 = fadd float %19, %22
	%24 = getelementptr [2 x float], [2 x float]* %13, i32 0, i32 0
	call void @scene(float %18, float %23, float* %24)
	%25 = getelementptr [2 x float], [2 x float]* %13, i32 0, i32 0
	%26 = load float, float* %25
	%27 = fcmp olt float %26, 0x3eb0c6f7a0000000
	%28 = icmp ne i1 %27, 0
	br i1 %28, label %b6, label %b7
b4:
	ret float 0.0
b5:
	%29 = load float, float* %8
	%30 = fcmp olt float %29, 0x4000000000000000
	%31 = icmp ne i1 %30, 0
	br i1 %31, label %b3, label %b4
b6:
	%32 = getelementptr [2 x float], [2 x float]* %13, i32 0, i32 1
	%33 = load float, float* %32
	ret float %33
b7:
	%34 = load float, float* %8
	%35 = getelementptr [2 x float], [2 x float]* %13, i32 0, i32 0
	%36 = load float, float* %35
	%37 = fadd float %34, %36
	store float %37, float* %8
	%38 = load i32, i32* %9
	%39 = add i32 %38, 1
	store i32 %39, i32* %9
	br label %b2
}

define float @sample(float %0, float %1) {
b0:
	%2 = alloca float
	store float %0, float* %2
	%3 = alloca float
	store float %1, float* %3
	br label %b1
b1:
	%4 = alloca float
	store float 0.0, float* %4
	%5 = alloca i32
	store i32 0, i32* %5
	br label %b2
b2:
	%6 = load i32, i32* %5
	%7 = icmp slt i32 %6, 24
	%8 = icmp ne i1 %7, 0
	br i1 %8, label %b3, label %b4
b3:
	%9 = alloca float
	%10 = call i32 @rand()
	%11 = sitofp i32 %10 to float
	store float %11, float* %9
	%12 = alloca float
	%13 = load i32, i32* %5
	%14 = load float, float* %9
	%15 = sitofp i32 100000006 to float
	%16 = fdiv float %14, %15
	%17 = sitofp i32 %13 to float
	%18 = fadd float %17, %16
	%19 = fmul float 0x401921fb60000000, %18
	%20 = sitofp i32 24 to float
	%21 = fdiv float %19, %20
	store float %21, float* %12
	%22 = load float, float* %4
	%23 = load float, float* %2
	%24 = load float, float* %3
	%25 = load float, float* %12
	%26 = call float @my_cos(float %25)
	%27 = load float, float* %12
	%28 = call float @my_sin(float %27)
	%29 = call float @trace(float %23, float %24, float %26, float %28)
	%30 = fadd float %22, %29
	store float %30, float* %4
	%31 = load i32, i32* %5
	%32 = add i32 %31, 1
	store i32 %32, i32* %5
	br label %b2
b4:
	%33 = load float, float* %4
	%34 = sitofp i32 24 to float
	%35 = fdiv float %33, %34
	ret float %35
}

define void @write_pgm() {
b0:
	call void @putch(i32 80)
	call void @putch(i32 50)
	call void @putch(i32 10)
	call void @putint(i32 192)
	call void @putch(i32 32)
	call void @putint(i32 192)
	call void @putch(i32 32)
	call void @putint(i32 255)
	call void @putch(i32 10)
	%0 = alloca i32
	store i32 0, i32* %0
	br label %b1
b1:
	%1 = load i32, i32* %0
	%2 = icmp slt i32 %1, 192
	%3 = icmp ne i1 %2, 0
	br i1 %3, label %b2, label %b3
b2:
	%4 = alloca i32
	store i32 0, i32* %4
	br label %b4
b3:
	ret void
b4:
	%5 = load i32, i32* %4
	%6 = icmp slt i32 %5, 192
	%7 = icmp ne i1 %6, 0
	br i1 %7, label %b5, label %b6
b5:
	%8 = alloca float
	%9 = load i32, i32* %4
	%10 = sitofp i32 %9 to float
	store float %10, float* %8
	%11 = alloca float
	%12 = load i32, i32* %0
	%13 = sitofp i32 %12 to float
	store float %13, float* %11
	%14 = alloca i32
	%15 = load float, float* %8
	%16 = sitofp i32 192 to float
	%17 = fdiv float %15, %16
	%18 = load float, float* %11
	%19 = sitofp i32 192 to float
	%20 = fdiv float %18, %19
	%21 = call float @sample(float %17, float %20)
	%22 = fmul float %21, 0x406fe00000000000
	%23 = fptosi float %22 to i32
	store i32 %23, i32* %14
	%24 = load i32, i32* %14
	%25 = icmp sgt i32 %24, 255
	%26 = icmp ne i1 %25, 0
	br i1 %26, label %b7, label %b8
b6:
	call void @putch(i32 10)
	%27 = load i32, i32* %0
	%28 = add i32 %27, 1
	store i32 %28, i32* %0
	br label %b1
b7:
	store i32 255, i32* %14
	br label %b8
b8:
	%29 = load i32, i32* %14
	call void @putint(i32 %29)
	call void @putch(i32 32)
	%30 = load i32, i32* %4
	%31 = add i32 %30, 1
	store i32 %31, i32* %4
	br label %b4
}

define i32 @main() {
b0:
	call void @write_pgm()
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

