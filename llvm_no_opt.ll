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

define float @my_pow(float %0, i32 %1) {
b0:
	%2 = alloca float
	store float %0, float* %2
	%3 = alloca i32
	store i32 %1, i32* %3
	br label %b1
b1:
	%4 = load i32, i32* %3
	%5 = icmp slt i32 %4, 0
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b2, label %b3
b2:
	%7 = load float, float* %2
	%8 = load i32, i32* %3
	%9 = sub i32 0, %8
	%10 = call float @my_pow(float %7, i32 %9)
	%11 = sitofp i32 1 to float
	%12 = fdiv float %11, %10
	ret float %12
b3:
	%13 = alloca float
	store float 1.0, float* %13
	br label %b4
b4:
	%14 = load i32, i32* %3
	%15 = icmp ne i32 %14, 0
	br i1 %15, label %b5, label %b6
b5:
	%16 = load i32, i32* %3
	%17 = srem i32 %16, 2
	%18 = icmp ne i32 %17, 0
	br i1 %18, label %b7, label %b8
b6:
	%19 = load float, float* %13
	ret float %19
b7:
	%20 = load float, float* %13
	%21 = load float, float* %2
	%22 = fmul float %20, %21
	store float %22, float* %13
	br label %b8
b8:
	%23 = load float, float* %2
	%24 = load float, float* %2
	%25 = fmul float %23, %24
	store float %25, float* %2
	%26 = load i32, i32* %3
	%27 = sdiv i32 %26, 2
	store i32 %27, i32* %3
	br label %b4
}

define float @my_sqrt(float %0) {
b0:
	%1 = alloca float
	store float %0, float* %1
	br label %b1
b1:
	%2 = load float, float* %1
	%3 = sitofp i32 100 to float
	%4 = fcmp ogt float %2, %3
	%5 = icmp ne i1 %4, 0
	br i1 %5, label %b2, label %b3
b2:
	%6 = load float, float* %1
	%7 = sitofp i32 100 to float
	%8 = fdiv float %6, %7
	%9 = call float @my_sqrt(float %8)
	%10 = fmul float 0x4024000000000000, %9
	ret float %10
b3:
	%11 = alloca float
	%12 = load float, float* %1
	%13 = sitofp i32 8 to float
	%14 = fdiv float %12, %13
	%15 = fadd float %14, 0x3fe0000000000000
	%16 = load float, float* %1
	%17 = sitofp i32 2 to float
	%18 = fmul float %17, %16
	%19 = load float, float* %1
	%20 = sitofp i32 4 to float
	%21 = fadd float %20, %19
	%22 = fdiv float %18, %21
	%23 = fadd float %15, %22
	store float %23, float* %11
	%24 = alloca i32
	store i32 10, i32* %24
	br label %b4
b4:
	%25 = load i32, i32* %24
	%26 = icmp ne i32 %25, 0
	br i1 %26, label %b5, label %b6
b5:
	%27 = load float, float* %11
	%28 = load float, float* %1
	%29 = load float, float* %11
	%30 = fdiv float %28, %29
	%31 = fadd float %27, %30
	%32 = sitofp i32 2 to float
	%33 = fdiv float %31, %32
	store float %33, float* %11
	%34 = load i32, i32* %24
	%35 = sub i32 %34, 1
	store i32 %35, i32* %24
	br label %b4
b6:
	%36 = load float, float* %11
	ret float %36
}

define float @F1(float %0) {
b0:
	%1 = alloca float
	store float %0, float* %1
	br label %b1
b1:
	%2 = load float, float* %1
	%3 = sitofp i32 1 to float
	%4 = fdiv float %3, %2
	ret float %4
}

define float @F2(float %0) {
b0:
	%1 = alloca float
	store float %0, float* %1
	br label %b1
b1:
	%2 = load float, float* %1
	%3 = load float, float* %1
	%4 = fmul float %2, %3
	%5 = sitofp i32 1 to float
	%6 = fsub float %5, %4
	%7 = call float @my_sqrt(float %6)
	%8 = sitofp i32 1 to float
	%9 = fdiv float %8, %7
	ret float %9
}

define float @simpson(float %0, float %1, i32 %2) {
b0:
	%3 = alloca float
	store float %0, float* %3
	%4 = alloca float
	store float %1, float* %4
	%5 = alloca i32
	store i32 %2, i32* %5
	br label %b1
b1:
	%6 = alloca float
	%7 = load float, float* %3
	%8 = load float, float* %4
	%9 = load float, float* %3
	%10 = fsub float %8, %9
	%11 = sitofp i32 2 to float
	%12 = fdiv float %10, %11
	%13 = fadd float %7, %12
	store float %13, float* %6
	%14 = load i32, i32* %5
	%15 = icmp eq i32 %14, 1
	%16 = icmp ne i1 %15, 0
	br i1 %16, label %b2, label %b3
b2:
	%17 = load float, float* %3
	%18 = call float @F1(float %17)
	%19 = load float, float* %6
	%20 = call float @F1(float %19)
	%21 = sitofp i32 4 to float
	%22 = fmul float %21, %20
	%23 = fadd float %18, %22
	%24 = load float, float* %4
	%25 = call float @F1(float %24)
	%26 = fadd float %23, %25
	%27 = load float, float* %4
	%28 = load float, float* %3
	%29 = fsub float %27, %28
	%30 = fmul float %26, %29
	%31 = sitofp i32 6 to float
	%32 = fdiv float %30, %31
	ret float %32
b3:
	%33 = load i32, i32* %5
	%34 = icmp eq i32 %33, 2
	%35 = icmp ne i1 %34, 0
	br i1 %35, label %b4, label %b5
b4:
	%36 = load float, float* %3
	%37 = call float @F2(float %36)
	%38 = load float, float* %6
	%39 = call float @F2(float %38)
	%40 = sitofp i32 4 to float
	%41 = fmul float %40, %39
	%42 = fadd float %37, %41
	%43 = load float, float* %4
	%44 = call float @F2(float %43)
	%45 = fadd float %42, %44
	%46 = load float, float* %4
	%47 = load float, float* %3
	%48 = fsub float %46, %47
	%49 = fmul float %45, %48
	%50 = sitofp i32 6 to float
	%51 = fdiv float %49, %50
	ret float %51
b5:
	%52 = sitofp i32 0 to float
	ret float %52
}

define float @asr5(float %0, float %1, float %2, float %3, i32 %4) {
b0:
	%5 = alloca float
	store float %0, float* %5
	%6 = alloca float
	store float %1, float* %6
	%7 = alloca float
	store float %2, float* %7
	%8 = alloca float
	store float %3, float* %8
	%9 = alloca i32
	store i32 %4, i32* %9
	br label %b1
b1:
	%10 = alloca float
	%11 = load float, float* %5
	%12 = load float, float* %6
	%13 = load float, float* %5
	%14 = fsub float %12, %13
	%15 = sitofp i32 2 to float
	%16 = fdiv float %14, %15
	%17 = fadd float %11, %16
	store float %17, float* %10
	%18 = alloca float
	%19 = load float, float* %5
	%20 = load float, float* %10
	%21 = load i32, i32* %9
	%22 = call float @simpson(float %19, float %20, i32 %21)
	store float %22, float* %18
	%23 = alloca float
	%24 = load float, float* %10
	%25 = load float, float* %6
	%26 = load i32, i32* %9
	%27 = call float @simpson(float %24, float %25, i32 %26)
	store float %27, float* %23
	%28 = load float, float* %18
	%29 = load float, float* %23
	%30 = fadd float %28, %29
	%31 = load float, float* %8
	%32 = fsub float %30, %31
	%33 = call float @my_fabs(float %32)
	%34 = load float, float* %7
	%35 = sitofp i32 15 to float
	%36 = fmul float %35, %34
	%37 = fcmp ole float %33, %36
	%38 = icmp ne i1 %37, 0
	br i1 %38, label %b2, label %b3
b2:
	%39 = load float, float* %18
	%40 = load float, float* %23
	%41 = fadd float %39, %40
	%42 = load float, float* %18
	%43 = load float, float* %23
	%44 = fadd float %42, %43
	%45 = load float, float* %8
	%46 = fsub float %44, %45
	%47 = fdiv float %46, 0x402e000000000000
	%48 = fadd float %41, %47
	ret float %48
b3:
	%49 = load float, float* %5
	%50 = load float, float* %10
	%51 = load float, float* %7
	%52 = sitofp i32 2 to float
	%53 = fdiv float %51, %52
	%54 = load float, float* %18
	%55 = load i32, i32* %9
	%56 = call float @asr5(float %49, float %50, float %53, float %54, i32 %55)
	%57 = load float, float* %10
	%58 = load float, float* %6
	%59 = load float, float* %7
	%60 = sitofp i32 2 to float
	%61 = fdiv float %59, %60
	%62 = load float, float* %23
	%63 = load i32, i32* %9
	%64 = call float @asr5(float %57, float %58, float %61, float %62, i32 %63)
	%65 = fadd float %56, %64
	ret float %65
}

define float @asr4(float %0, float %1, float %2, i32 %3) {
b0:
	%4 = alloca float
	store float %0, float* %4
	%5 = alloca float
	store float %1, float* %5
	%6 = alloca float
	store float %2, float* %6
	%7 = alloca i32
	store i32 %3, i32* %7
	br label %b1
b1:
	%8 = load float, float* %4
	%9 = load float, float* %5
	%10 = load float, float* %6
	%11 = load float, float* %4
	%12 = load float, float* %5
	%13 = load i32, i32* %7
	%14 = call float @simpson(float %11, float %12, i32 %13)
	%15 = load i32, i32* %7
	%16 = call float @asr5(float %8, float %9, float %10, float %14, i32 %15)
	ret float %16
}

define float @eee(float %0) {
b0:
	%1 = alloca float
	store float %0, float* %1
	br label %b1
b1:
	%2 = load float, float* %1
	%3 = fcmp ogt float %2, 0x3f50624de0000000
	%4 = icmp ne i1 %3, 0
	br i1 %4, label %b2, label %b3
b2:
	%5 = alloca float
	%6 = load float, float* %1
	%7 = sitofp i32 2 to float
	%8 = fdiv float %6, %7
	%9 = call float @eee(float %8)
	store float %9, float* %5
	%10 = load float, float* %5
	%11 = load float, float* %5
	%12 = fmul float %10, %11
	ret float %12
b3:
	%13 = load float, float* %1
	%14 = sitofp i32 1 to float
	%15 = fadd float %14, %13
	%16 = load float, float* %1
	%17 = load float, float* %1
	%18 = fmul float %16, %17
	%19 = sitofp i32 2 to float
	%20 = fdiv float %18, %19
	%21 = fadd float %15, %20
	%22 = load float, float* %1
	%23 = call float @my_pow(float %22, i32 3)
	%24 = sitofp i32 6 to float
	%25 = fdiv float %23, %24
	%26 = fadd float %21, %25
	%27 = load float, float* %1
	%28 = call float @my_pow(float %27, i32 4)
	%29 = sitofp i32 24 to float
	%30 = fdiv float %28, %29
	%31 = fadd float %26, %30
	%32 = load float, float* %1
	%33 = call float @my_pow(float %32, i32 5)
	%34 = sitofp i32 120 to float
	%35 = fdiv float %33, %34
	%36 = fadd float %31, %35
	ret float %36
}

define float @my_exp(float %0) {
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
	%9 = call float @my_exp(float %8)
	%10 = sitofp i32 1 to float
	%11 = fdiv float %10, %9
	ret float %11
b3:
	%12 = alloca i32
	%13 = load float, float* %1
	%14 = fptosi float %13 to i32
	store i32 %14, i32* %12
	%15 = load float, float* %1
	%16 = load i32, i32* %12
	%17 = sitofp i32 %16 to float
	%18 = fsub float %15, %17
	store float %18, float* %1
	%19 = alloca float
	%20 = load i32, i32* %12
	%21 = call float @my_pow(float 0x4005bf0a80000000, i32 %20)
	store float %21, float* %19
	%22 = alloca float
	%23 = load float, float* %1
	%24 = call float @eee(float %23)
	store float %24, float* %22
	%25 = load float, float* %19
	%26 = load float, float* %22
	%27 = fmul float %25, %26
	ret float %27
}

define float @my_ln(float %0) {
b0:
	%1 = alloca float
	store float %0, float* %1
	br label %b1
b1:
	%2 = load float, float* %1
	%3 = sitofp i32 1 to float
	%4 = call float @asr4(float %3, float %2, float 0x3e45798ee0000000, i32 1)
	ret float %4
}

define float @my_log(float %0, float %1) {
b0:
	%2 = alloca float
	store float %0, float* %2
	%3 = alloca float
	store float %1, float* %3
	br label %b1
b1:
	%4 = load float, float* %3
	%5 = call float @my_ln(float %4)
	%6 = load float, float* %2
	%7 = call float @my_ln(float %6)
	%8 = fdiv float %5, %7
	ret float %8
}

define float @my_powf(float %0, float %1) {
b0:
	%2 = alloca float
	store float %0, float* %2
	%3 = alloca float
	store float %1, float* %3
	br label %b1
b1:
	%4 = load float, float* %3
	%5 = load float, float* %2
	%6 = call float @my_ln(float %5)
	%7 = fmul float %4, %6
	%8 = call float @my_exp(float %7)
	ret float %8
}

define i32 @main() {
b0:
	%0 = alloca i32
	%1 = call i32 @getint()
	store i32 %1, i32* %0
	br label %b1
b1:
	%2 = load i32, i32* %0
	%3 = icmp ne i32 %2, 0
	br i1 %3, label %b2, label %b3
b2:
	%4 = alloca float
	%5 = call float @getfloat()
	store float %5, float* %4
	%6 = alloca float
	%7 = call float @getfloat()
	store float %7, float* %6
	%8 = load float, float* %4
	%9 = call float @my_fabs(float %8)
	call void @putfloat(float %9)
	call void @putch(i32 32)
	%10 = load float, float* %4
	%11 = call float @my_pow(float %10, i32 2)
	call void @putfloat(float %11)
	call void @putch(i32 32)
	%12 = load float, float* %4
	%13 = call float @my_sqrt(float %12)
	call void @putfloat(float %13)
	call void @putch(i32 32)
	%14 = load float, float* %4
	%15 = call float @my_exp(float %14)
	call void @putfloat(float %15)
	call void @putch(i32 32)
	%16 = load float, float* %4
	%17 = sitofp i32 0 to float
	%18 = fcmp ogt float %16, %17
	%19 = icmp ne i1 %18, 0
	br i1 %19, label %b4, label %b6
b3:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b4:
	%20 = load float, float* %4
	%21 = call float @my_ln(float %20)
	call void @putfloat(float %21)
	br label %b5
b5:
	call void @putch(i32 32)
	%22 = load float, float* %4
	%23 = sitofp i32 0 to float
	%24 = fcmp ogt float %22, %23
	%25 = icmp ne i1 %24, 0
	br i1 %25, label %b10, label %b9
b6:
	call void @putch(i32 45)
	br label %b5
b7:
	%26 = load float, float* %4
	%27 = load float, float* %6
	%28 = call float @my_log(float %26, float %27)
	call void @putfloat(float %28)
	br label %b8
b8:
	call void @putch(i32 32)
	%29 = load float, float* %4
	%30 = sitofp i32 0 to float
	%31 = fcmp ogt float %29, %30
	%32 = icmp ne i1 %31, 0
	br i1 %32, label %b11, label %b13
b9:
	call void @putch(i32 45)
	br label %b8
b10:
	%33 = load float, float* %6
	%34 = sitofp i32 0 to float
	%35 = fcmp ogt float %33, %34
	%36 = icmp ne i1 %35, 0
	br i1 %36, label %b7, label %b9
b11:
	%37 = load float, float* %4
	%38 = load float, float* %6
	%39 = call float @my_powf(float %37, float %38)
	call void @putfloat(float %39)
	br label %b12
b12:
	call void @putch(i32 10)
	%40 = load i32, i32* %0
	%41 = sub i32 %40, 1
	store i32 %41, i32* %0
	br label %b1
b13:
	call void @putch(i32 45)
	br label %b12
}

