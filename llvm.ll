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
	br label %b1
b1:
	%2 = load float, float* @A
	%3 = fadd float %2, 0x3fe99999a0000000
	store float %3, float* @A
	%4 = sitofp i32 %0 to float
	%5 = fadd float %4, %1
	%6 = load float, float* @A
	%7 = fadd float %5, %6
	ret float %7
}

define i32 @main() {
b0:
	%0 = call i32 @getint()
	%1 = sitofp i32 5 to float
	%2 = call float @add(i32 %0, float %1)
	%3 = sitofp i32 %0 to float
	%4 = fadd float %3, %2
	call void @putint(float %4)
	%5 = fptosi float %4 to i32
	ret i32 %5
}

