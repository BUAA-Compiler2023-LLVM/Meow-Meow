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
	store float 0.9, float* %0
	%1 = alloca float
	store float 5.6, float* %1
	%2 = load float, float* %0
	%3 = load float, float* %1
	%4 = fcmp olt float %2, %3
	%5 = icmp ne i1 %4, 0
	br i1 %5, label %b1, label %b2
b1:
	%6 = load float, float* %0
	%7 = load float, float* %1
	%8 = fadd float %6, %7
	call void @putint(float %8)
	%9 = fptosi float %8 to i32
	ret i32 %9
b2:
	%10 = load float, float* %0
	%11 = load float, float* %1
	%12 = fsub float %10, %11
	call void @putint(float %12)
	%13 = fptosi float %12 to i32
	ret i32 %13
}

