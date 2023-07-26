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
@A = global float 5.5
define float @add(i32 %0, float %1) {
b0:
	%2 = alloca i32
	store i32 %0, i32* %2
	%3 = alloca float
	store float %1, float* %3
	br label %b1
b1:
	%4 = load float, float* @A
	%5 = fadd float %4, 0x3fe99999a0000000
	store float %5, float* @A
	%6 = load i32, i32* %2
	%7 = load float, float* %3
	%8 = sitofp i32 %6 to float
	%9 = fadd float %8, %7
	%10 = load float, float* @A
	%11 = fadd float %9, %10
	ret float %11
}

define i32 @main() {
b0:
	%0 = alloca i32
	%1 = call i32 @getint()
	store i32 %1, i32* %0
	%2 = alloca float
	%3 = sitofp i32 5 to float
	store float %3, float* %2
	%4 = load i32, i32* %0
	%5 = load float, float* %2
	%6 = call float @add(i32 %4, float %5)
	store float %6, float* %2
	%7 = load i32, i32* %0
	%8 = load float, float* %2
	%9 = sitofp i32 %7 to float
	%10 = fadd float %9, %8
	call void @putint(float %10)
	%11 = fptosi float %10 to i32
	ret i32 %11
}

