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
	store float 2.5, float* %0
	%1 = alloca float
	store float 5.5, float* %1
	%2 = alloca float
	%3 = load float, float* %0
	%4 = load float, float* %1
	%5 = fcmp olt float %3, %4
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b1, label %b3
b1:
	%7 = load float, float* %0
	store float %7, float* %2
	br label %b2
b2:
	%8 = load float, float* %2
	call void @putint(float %8)
	%9 = fptosi float %8 to i32
	ret i32 %9
b3:
	%10 = load float, float* %1
	store float %10, float* %2
	br label %b2
}

