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
	br i1 %8, label %b2, label %b12
b2:
	br label %b3
b3:
	br label %b4
b4:
	%9 = sitofp i32 1 to float
	%10 = fdiv float %9, %0
	ret float %10
b5:
	br label %b6
b6:
	br label %b7
b7:
	%11 = sitofp i32 1 to float
	%12 = fdiv float %11, %6
	ret float %12
b8:
	%13 = sitofp i32 4 to float
	%14 = fmul float %13, %20
	%15 = fadd float %18, %14
	br label %b9
b9:
	br label %b10
b10:
	%16 = sitofp i32 1 to float
	%17 = fdiv float %16, %1
	ret float %17
b11:
	%18 = fadd float %15, %25
	%19 = fsub float %1, %0
	%20 = fmul float %18, %19
	%21 = sitofp i32 6 to float
	%22 = fdiv float %20, %21
	ret float %22
b12:
	%23 = icmp eq i32 %2, 2
	%24 = icmp ne i1 %23, 0
	br i1 %24, label %b13, label %b14
b13:
	%25 = call float @F2(float %0)
	%26 = call float @F2(float %6)
	%27 = sitofp i32 4 to float
	%28 = fmul float %27, %26
	%29 = fadd float %25, %28
	%30 = call float @F2(float %1)
	%31 = fadd float %29, %30
	%32 = fsub float %1, %0
	%33 = fmul float %31, %32
	%34 = sitofp i32 6 to float
	%35 = fdiv float %33, %34
	ret float %35
b14:
	%36 = sitofp i32 0 to float
	ret float %36
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
	br label %b2
b2:
	br label %b3
b3:
	%13 = sitofp i32 0 to float
	%14 = fcmp ogt float %12, %13
	%15 = icmp ne i1 %14, 0
	br i1 %15, label %b4, label %b5
b4:
	ret float %12
b5:
	%16 = sitofp i32 0 to float
	%17 = fsub float %16, %12
	ret float %17
b6:
	%18 = sitofp i32 15 to float
	%19 = fmul float %18, %2
	%20 = fcmp ole float %33, %19
	%21 = icmp ne i1 %20, 0
	br i1 %21, label %b7, label %b8
b7:
	%22 = fadd float %9, %10
	%23 = fadd float %9, %10
	%24 = fsub float %23, %3
	%25 = fdiv float %24, 0x402e000000000000
	%26 = fadd float %22, %25
	ret float %26
b8:
	%27 = sitofp i32 2 to float
	%28 = fdiv float %2, %27
	%29 = call float @asr5(float %0, float %8, float %28, float %9, i32 %4)
	%30 = sitofp i32 2 to float
	%31 = fdiv float %2, %30
	%32 = call float @asr5(float %8, float %1, float %31, float %10, i32 %4)
	%33 = fadd float %29, %32
	ret float %33
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
	%1 = phi i32 [ %0, %b0 ],[ %28, %b17 ]
	%2 = icmp ne i32 %1, 0
	br i1 %2, label %b2, label %b8
b2:
	%3 = call float @getfloat()
	%4 = call float @getfloat()
	br label %b3
b3:
	br label %b4
b4:
	%5 = sitofp i32 0 to float
	%6 = fcmp ogt float %3, %5
	%7 = icmp ne i1 %6, 0
	br i1 %7, label %b5, label %b6
b5:
	ret float %3
b6:
	%8 = sitofp i32 0 to float
	%9 = fsub float %8, %3
	ret float %9
b7:
	call void @putfloat(float %9)
	call void @putch(i32 32)
	%10 = call float @my_pow(float %3, i32 2)
	call void @putfloat(float %10)
	call void @putch(i32 32)
	%11 = call float @my_sqrt(float %3)
	call void @putfloat(float %11)
	call void @putch(i32 32)
	%12 = call float @my_exp(float %3)
	call void @putfloat(float %12)
	call void @putch(i32 32)
	%13 = sitofp i32 0 to float
	%14 = fcmp ogt float %3, %13
	%15 = icmp ne i1 %14, 0
	br i1 %15, label %b9, label %b11
b8:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b9:
	%16 = call float @my_ln(float %3)
	call void @putfloat(float %16)
	br label %b10
b10:
	call void @putch(i32 32)
	%17 = sitofp i32 0 to float
	%18 = fcmp ogt float %3, %17
	%19 = icmp ne i1 %18, 0
	br i1 %19, label %b15, label %b14
b11:
	call void @putch(i32 45)
	br label %b10
b12:
	%20 = call float @my_log(float %3, float %4)
	call void @putfloat(float %20)
	br label %b13
b13:
	call void @putch(i32 32)
	%21 = sitofp i32 0 to float
	%22 = fcmp ogt float %3, %21
	%23 = icmp ne i1 %22, 0
	br i1 %23, label %b16, label %b18
b14:
	call void @putch(i32 45)
	br label %b13
b15:
	%24 = sitofp i32 0 to float
	%25 = fcmp ogt float %4, %24
	%26 = icmp ne i1 %25, 0
	br i1 %26, label %b12, label %b14
b16:
	%27 = call float @my_powf(float %3, float %4)
	call void @putfloat(float %27)
	br label %b17
b17:
	call void @putch(i32 10)
	%28 = sub i32 %1, 1
	br label %b1
b18:
	call void @putch(i32 45)
	br label %b17
}

