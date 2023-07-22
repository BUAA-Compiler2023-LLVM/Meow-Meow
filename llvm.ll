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
define float @my_sin_impl(float %0) {
b0:
	br label %b1
b1:
	br label %b2
b2:
	br label %b3
b3:
	%1 = sitofp i32 0 to float
	%2 = fcmp ogt float %0, %1
	%3 = icmp ne i1 %2, 0
	br i1 %3, label %b4, label %b5
b4:
	br label %b6
b5:
	%4 = sitofp i32 0 to float
	%5 = fsub float %4, %0
	br label %b6
b6:
	%6 = phi float [ %0, %b4 ],[ %5, %b5 ]
	%7 = fcmp ole float %6, 0x3eb0c6f7a0000000
	%8 = icmp ne i1 %7, 0
	br i1 %8, label %b7, label %b8
b7:
	ret float %0
b8:
	%9 = fdiv float %0, 0x4008000000000000
	%10 = call float @my_sin_impl(float %9)
	br label %b9
b9:
	br label %b10
b10:
	%11 = sitofp i32 3 to float
	%12 = fmul float %11, %10
	%13 = sitofp i32 4 to float
	%14 = fmul float %13, %10
	%15 = fmul float %14, %10
	%16 = fmul float %15, %10
	%17 = fsub float %12, %16
	br label %b11
b11:
	ret float %17
}

define float @my_sin(float %0) {
b0:
	br label %b1
b1:
	%1 = call float @my_sin_impl(float %0)
	ret float %1
}

define float @my_cos(float %0) {
b0:
	br label %b1
b1:
	%1 = fadd float %0, 0x3ff921fb60000000
	%2 = call float @my_sin(float %1)
	ret float %2
}

define float @sample(float %0, float %1) {
b0:
	br label %b1
b1:
	br label %b2
b2:
	%2 = phi i32 [ 0, %b1 ],[ %78, %b30 ]
	%3 = phi float [ 0x0, %b1 ],[ %77, %b30 ]
	%4 = icmp slt i32 %2, 24
	%5 = icmp ne i1 %4, 0
	br i1 %5, label %b3, label %b31
b3:
	%6 = sitofp i32 10 to float
	%7 = sitofp i32 100000006 to float
	%8 = fdiv float %6, %7
	%9 = sitofp i32 %2 to float
	%10 = fadd float %9, %8
	%11 = fmul float 0x401921fb60000000, %10
	%12 = sitofp i32 24 to float
	%13 = fdiv float %11, %12
	%14 = call float @my_cos(float %13)
	%15 = call float @my_sin(float %13)
	br label %b4
b4:
	br label %b5
b5:
	br label %b6
b6:
	%16 = phi i32 [ 0, %b5 ],[ %75, %b29 ]
	%17 = phi float [ 0x0, %b5 ],[ %74, %b29 ]
	%18 = icmp slt i32 %16, 10
	%19 = icmp ne i1 %18, 0
	br i1 %19, label %b27, label %b26
b7:
	%20 = alloca [2 x float]
	%21 = getelementptr [2 x float], [2 x float]* %20, i32 0, i32 0
	%22 = bitcast float* %21 to i32*
	call void @memset(i32* %22, i32 0, i32 0)
	%23 = fmul float %14, %17
	%24 = fadd float %0, %23
	%25 = fmul float %15, %17
	%26 = fadd float %1, %25
	%27 = getelementptr [2 x float], [2 x float]* %20, i32 0, i32 0
	br label %b8
b8:
	br label %b9
b9:
	br label %b10
b10:
	br label %b11
b11:
	%28 = fsub float %24, 0x3fd99999a0000000
	%29 = fsub float %26, 0x3fd99999a0000000
	%30 = fmul float %28, %28
	%31 = fmul float %29, %29
	%32 = fadd float %30, %31
	br label %b12
b12:
	br label %b13
b13:
	%33 = sitofp i32 8 to float
	%34 = fdiv float %32, %33
	%35 = fadd float %34, 0x3fe0000000000000
	%36 = sitofp i32 2 to float
	%37 = fmul float %36, %32
	%38 = sitofp i32 4 to float
	%39 = fadd float %38, %32
	%40 = fdiv float %37, %39
	%41 = fadd float %35, %40
	br label %b14
b14:
	%42 = fsub float %41, 0x3fb99999a0000000
	br label %b15
b15:
	br label %b16
b16:
	br label %b17
b17:
	%43 = fsub float %24, 0x3fe3333340000000
	%44 = fsub float %26, 0x3fe3333340000000
	%45 = fmul float %43, %43
	%46 = fmul float %44, %44
	%47 = fadd float %45, %46
	br label %b18
b18:
	br label %b19
b19:
	%48 = sitofp i32 8 to float
	%49 = fdiv float %47, %48
	%50 = fadd float %49, 0x3fe0000000000000
	%51 = sitofp i32 2 to float
	%52 = fmul float %51, %47
	%53 = sitofp i32 4 to float
	%54 = fadd float %53, %47
	%55 = fdiv float %52, %54
	%56 = fadd float %50, %55
	br label %b20
b20:
	%57 = fsub float %56, 0x3fa99999a0000000
	br label %b21
b21:
	%58 = fcmp olt float %42, %57
	%59 = icmp ne i1 %58, 0
	br i1 %59, label %b22, label %b24
b22:
	%60 = getelementptr float, float* %27, i32 0
	store float %42, float* %60
	%61 = getelementptr float, float* %27, i32 1
	store float 3.0, float* %61
	br label %b23
b23:
	br label %b25
b24:
	%62 = getelementptr float, float* %27, i32 0
	store float %57, float* %62
	%63 = getelementptr float, float* %27, i32 1
	store float 0.0, float* %63
	br label %b23
b25:
	%64 = getelementptr [2 x float], [2 x float]* %20, i32 0, i32 0
	%65 = load float, float* %64
	%66 = fcmp olt float %65, 0x3eb0c6f7a0000000
	%67 = icmp ne i1 %66, 0
	br i1 %67, label %b28, label %b29
b26:
	br label %b30
b27:
	%68 = fcmp olt float %17, 0x4000000000000000
	%69 = icmp ne i1 %68, 0
	br i1 %69, label %b7, label %b26
b28:
	%70 = getelementptr [2 x float], [2 x float]* %20, i32 0, i32 1
	%71 = load float, float* %70
	br label %b30
b29:
	%72 = getelementptr [2 x float], [2 x float]* %20, i32 0, i32 0
	%73 = load float, float* %72
	%74 = fadd float %17, %73
	%75 = add i32 %16, 1
	br label %b6
b30:
	%76 = phi float [ 0x0, %b26 ],[ %71, %b28 ]
	%77 = fadd float %3, %76
	%78 = add i32 %2, 1
	br label %b2
b31:
	%79 = sitofp i32 24 to float
	%80 = fdiv float %3, %79
	ret float %80
}

define void @write_pgm() {
b0:
	br label %b1
b1:
	%0 = phi i32 [ 0, %b0 ],[ %14, %b6 ]
	%1 = icmp slt i32 %0, 192
	%2 = icmp ne i1 %1, 0
	br i1 %2, label %b2, label %b3
b2:
	br label %b4
b3:
	ret void
b4:
	%3 = phi i32 [ 0, %b2 ],[ %13, %b5 ]
	%4 = icmp slt i32 %3, 192
	%5 = icmp ne i1 %4, 0
	br i1 %5, label %b5, label %b6
b5:
	%6 = sitofp i32 %3 to float
	%7 = sitofp i32 %0 to float
	%8 = sitofp i32 192 to float
	%9 = fdiv float %6, %8
	%10 = sitofp i32 192 to float
	%11 = fdiv float %7, %10
	%12 = call float @sample(float %9, float %11)
	%13 = add i32 %3, 1
	br label %b4
b6:
	call void @putch(i32 10)
	%14 = add i32 %0, 1
	br label %b1
}

define i32 @main() {
b0:
	call void @write_pgm()
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

