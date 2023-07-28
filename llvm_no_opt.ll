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
define i32 @main() {
b0:
	%0 = alloca float
	%1 = sitofp i32 1 to float
	store float %1, float* %0
	%2 = alloca float
	%3 = sitofp i32 2 to float
	store float %3, float* %2
	%4 = alloca float
	%5 = sitofp i32 3 to float
	store float %5, float* %4
	%6 = alloca float
	%7 = sitofp i32 4 to float
	store float %7, float* %6
	%8 = load float, float* %0
	%9 = sitofp i32 2 to float
	%10 = fadd float %8, %9
	store float %10, float* %2
	%11 = load float, float* %2
	%12 = sitofp i32 1 to float
	%13 = fadd float %11, %12
	store float %13, float* %4
	%14 = load float, float* %4
	%15 = sitofp i32 1 to float
	%16 = fadd float %14, %15
	store float %16, float* %6
	%17 = load float, float* %6
	call void @putint(float %17)
	%18 = fptosi float %17 to i32
	ret i32 %18
}

