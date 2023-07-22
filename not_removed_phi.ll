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
	br label %b1
b1:
	%1 = sitofp i32 0 to float
	%2 = fcmp ogt float %0, %1
	%3 = icmp ne i1 %2, 0
	br i1 %3, label %b2, label %b3
b2:
	ret float %0
b3:
	%4 = sitofp i32 0 to float
	%5 = fsub float %4, %0
	ret float %5
}

define float @my_pow(float %0, i32 %1) {
b0:
	br label %b1
b1:
	%2 = icmp slt i32 %1, 0
	%3 = icmp ne i1 %2, 0
	br i1 %3, label %b2, label %b3
b2:
	%4 = sub i32 0, %1
	%5 = call float @my_pow(float %0, i32 %4)
	%6 = sitofp i32 1 to float
	%7 = fdiv float %6, %5
	ret float %7
b3:
	br label %b4
b4:
	%8 = phi float [ 0x3ff0000000000000, %b3 ],[ %15, %b8 ]
	%9 = phi i32 [ %1, %b3 ],[ %17, %b8 ]
	%10 = phi float [ %0, %b3 ],[ %16, %b8 ]
	%11 = icmp ne i32 %9, 0
	br i1 %11, label %b5, label %b6
b5:
	%12 = srem i32 %9, 2
	%13 = icmp ne i32 %12, 0
	br i1 %13, label %b7, label %b8
b6:
	ret float %8
b7:
	%14 = fmul float %8, %10
	br label %b8
b8:
	%15 = phi float [ %8, %b5 ],[ %14, %b7 ]
	%16 = fmul float %10, %10
	%17 = sdiv i32 %9, 2
	br label %b4
}

define float @my_sqrt(float %0) {
b0:
	br label %b1
b1:
	%1 = sitofp i32 100 to float
	%2 = fcmp ogt float %0, %1
	%3 = icmp ne i1 %2, 0
	br i1 %3, label %b2, label %b3
b2:
	%4 = sitofp i32 100 to float
	%5 = fdiv float %0, %4
	%6 = call float @my_sqrt(float %5)
	%7 = fmul float 0x4024000000000000, %6
	ret float %7
b3:
	%8 = sitofp i32 8 to float
	%9 = fdiv float %0, %8
	%10 = fadd float %9, 0x3fe0000000000000
	%11 = sitofp i32 2 to float
	%12 = fmul float %11, %0
	%13 = sitofp i32 4 to float
	%14 = fadd float %13, %0
	%15 = fdiv float %12, %14
	%16 = fadd float %10, %15
	br label %b4
b4:
	%17 = phi i32 [ 10, %b3 ],[ %24, %b5 ]
	%18 = phi float [ %16, %b3 ],[ %23, %b5 ]
	%19 = icmp ne i32 %17, 0
	br i1 %19, label %b5, label %b6
b5:
	%20 = fdiv float %0, %18
	%21 = fadd float %18, %20
	%22 = sitofp i32 2 to float
	%23 = fdiv float %21, %22
	%24 = sub i32 %17, 1
	br label %b4
b6:
	ret float %18
}

define float @F1(float %0) {
b0:
	br label %b1
b1:
	%1 = sitofp i32 1 to float
	%2 = fdiv float %1, %0
	ret float %2
}

define float @F2(float %0) {
b0:
	br label %b1
b1:
	%1 = fmul float %0, %0
	%2 = sitofp i32 1 to float
	%3 = fsub float %2, %1
	%4 = call float @my_sqrt(float %3)
	%5 = sitofp i32 1 to float
	%6 = fdiv float %5, %4
	ret float %6
}

define float @simpson(float %0, float %1, i32 %2) {
b0:
	br label %b1
b1:
	%3 = fsub float %1, %0
	%4 = sitofp i32 2 to float
	%5 = fdiv float %3, %4
	%6 = fadd float %0, %5
	%7 = icmp eq i32 %2, 1
	%8 = icmp ne i1 %7, 0
	br i1 %8, label %b2, label %b3
b2:
	%9 = call float @F1(float %0)
	%10 = call float @F1(float %6)
	%11 = sitofp i32 4 to float
	%12 = fmul float %11, %10
	%13 = fadd float %9, %12
	%14 = call float @F1(float %1)
	%15 = fadd float %13, %14
	%16 = fsub float %1, %0
	%17 = fmul float %15, %16
	%18 = sitofp i32 6 to float
	%19 = fdiv float %17, %18
	ret float %19
b3:
	%20 = icmp eq i32 %2, 2
	%21 = icmp ne i1 %20, 0
	br i1 %21, label %b4, label %b5
b4:
	%22 = call float @F2(float %0)
	%23 = call float @F2(float %6)
	%24 = sitofp i32 4 to float
	%25 = fmul float %24, %23
	%26 = fadd float %22, %25
	%27 = call float @F2(float %1)
	%28 = fadd float %26, %27
	%29 = fsub float %1, %0
	%30 = fmul float %28, %29
	%31 = sitofp i32 6 to float
	%32 = fdiv float %30, %31
	ret float %32
b5:
	%33 = sitofp i32 0 to float
	ret float %33
}

define float @asr5(float %0, float %1, float %2, float %3, i32 %4) {
b0:
	br label %b1
b1:
	%5 = fsub float %1, %0
	%6 = sitofp i32 2 to float
	%7 = fdiv float %5, %6
	%8 = fadd float %0, %7
	%9 = call float @simpson(float %0, float %8, i32 %4)
	%10 = call float @simpson(float %8, float %1, i32 %4)
	%11 = fadd float %9, %10
	%12 = fsub float %11, %3
	%13 = call float @my_fabs(float %12)
	%14 = sitofp i32 15 to float
	%15 = fmul float %14, %2
	%16 = fcmp ole float %13, %15
	%17 = icmp ne i1 %16, 0
	br i1 %17, label %b2, label %b3
b2:
	%18 = fadd float %9, %10
	%19 = fadd float %9, %10
	%20 = fsub float %19, %3
	%21 = fdiv float %20, 0x402e000000000000
	%22 = fadd float %18, %21
	ret float %22
b3:
	%23 = sitofp i32 2 to float
	%24 = fdiv float %2, %23
	%25 = call float @asr5(float %0, float %8, float %24, float %9, i32 %4)
	%26 = sitofp i32 2 to float
	%27 = fdiv float %2, %26
	%28 = call float @asr5(float %8, float %1, float %27, float %10, i32 %4)
	%29 = fadd float %25, %28
	ret float %29
}

define float @asr4(float %0, float %1, float %2, i32 %3) {
b0:
	br label %b1
b1:
	%4 = call float @simpson(float %0, float %1, i32 %3)
	%5 = call float @asr5(float %0, float %1, float %2, float %4, i32 %3)
	ret float %5
}

define float @eee(float %0) {
b0:
	br label %b1
b1:
	%1 = fcmp ogt float %0, 0x3f50624de0000000
	%2 = icmp ne i1 %1, 0
	br i1 %2, label %b2, label %b3
b2:
	%3 = sitofp i32 2 to float
	%4 = fdiv float %0, %3
	%5 = call float @eee(float %4)
	%6 = fmul float %5, %5
	ret float %6
b3:
	%7 = sitofp i32 1 to float
	%8 = fadd float %7, %0
	%9 = fmul float %0, %0
	%10 = sitofp i32 2 to float
	%11 = fdiv float %9, %10
	%12 = fadd float %8, %11
	%13 = call float @my_pow(float %0, i32 3)
	%14 = sitofp i32 6 to float
	%15 = fdiv float %13, %14
	%16 = fadd float %12, %15
	%17 = call float @my_pow(float %0, i32 4)
	%18 = sitofp i32 24 to float
	%19 = fdiv float %17, %18
	%20 = fadd float %16, %19
	%21 = call float @my_pow(float %0, i32 5)
	%22 = sitofp i32 120 to float
	%23 = fdiv float %21, %22
	%24 = fadd float %20, %23
	ret float %24
}

define float @my_exp(float %0) {
b0:
	br label %b1
b1:
	%1 = sitofp i32 0 to float
	%2 = fcmp olt float %0, %1
	%3 = icmp ne i1 %2, 0
	br i1 %3, label %b2, label %b3
b2:
	%4 = sitofp i32 0 to float
	%5 = fsub float %4, %0
	%6 = call float @my_exp(float %5)
	%7 = sitofp i32 1 to float
	%8 = fdiv float %7, %6
	ret float %8
b3:
	%9 = fptosi float %0 to i32
	%10 = sitofp i32 %9 to float
	%11 = fsub float %0, %10
	%12 = call float @my_pow(float 0x4005bf0a80000000, i32 %9)
	%13 = call float @eee(float %11)
	%14 = fmul float %12, %13
	ret float %14
}

define float @my_ln(float %0) {
b0:
	br label %b1
b1:
	%1 = sitofp i32 1 to float
	%2 = call float @asr4(float %1, float %0, float 0x3e45798ee0000000, i32 1)
	ret float %2
}

define float @my_log(float %0, float %1) {
b0:
	br label %b1
b1:
	%2 = call float @my_ln(float %1)
	%3 = call float @my_ln(float %0)
	%4 = fdiv float %2, %3
	ret float %4
}

define float @my_powf(float %0, float %1) {
b0:
	br label %b1
b1:
	%2 = call float @my_ln(float %0)
	%3 = fmul float %1, %2
	%4 = call float @my_exp(float %3)
	ret float %4
}

define i32 @main() {
b0:
	%0 = call i32 @getint()
	br label %b1
b1:
	%1 = phi i32 [ %0, %b0 ],[ %24, %b12 ]
	%2 = icmp ne i32 %1, 0
	br i1 %2, label %b2, label %b3
b2:
	%3 = call float @getfloat()
	%4 = call float @getfloat()
	%5 = call float @my_fabs(float %3)
	call void @putfloat(float %5)
	call void @putch(i32 32)
	%6 = call float @my_pow(float %3, i32 2)
	call void @putfloat(float %6)
	call void @putch(i32 32)
	%7 = call float @my_sqrt(float %3)
	call void @putfloat(float %7)
	call void @putch(i32 32)
	%8 = call float @my_exp(float %3)
	call void @putfloat(float %8)
	call void @putch(i32 32)
	%9 = sitofp i32 0 to float
	%10 = fcmp ogt float %3, %9
	%11 = icmp ne i1 %10, 0
	br i1 %11, label %b4, label %b6
b3:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b4:
	%12 = call float @my_ln(float %3)
	call void @putfloat(float %12)
	br label %b5
b5:
	call void @putch(i32 32)
	%13 = sitofp i32 0 to float
	%14 = fcmp ogt float %3, %13
	%15 = icmp ne i1 %14, 0
	br i1 %15, label %b10, label %b9
b6:
	call void @putch(i32 45)
	br label %b5
b7:
	%16 = call float @my_log(float %3, float %4)
	call void @putfloat(float %16)
	br label %b8
b8:
	call void @putch(i32 32)
	%17 = sitofp i32 0 to float
	%18 = fcmp ogt float %3, %17
	%19 = icmp ne i1 %18, 0
	br i1 %19, label %b11, label %b13
b9:
	call void @putch(i32 45)
	br label %b8
b10:
	%20 = sitofp i32 0 to float
	%21 = fcmp ogt float %4, %20
	%22 = icmp ne i1 %21, 0
	br i1 %22, label %b7, label %b9
b11:
	%23 = call float @my_powf(float %3, float %4)
	call void @putfloat(float %23)
	br label %b12
b12:
	call void @putch(i32 10)
	%24 = sub i32 %1, 1
	br label %b1
b13:
	call void @putch(i32 45)
	br label %b12
}

