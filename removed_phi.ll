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
	%0 = fcmp olt float 0x3fecccccc0000000, 0x4016666660000000
	br i1 %0, label %b1, label %b2
b1:
	%1 = fadd float 0x3fecccccc0000000, 0x4016666660000000
	call void @putint(float %1)
	%2 = fptosi float %1 to i32
	ret i32 %2
b2:
	%3 = fsub float 0x3fecccccc0000000, 0x4016666660000000
	call void @putint(float %3)
	%4 = fptosi float %3 to i32
	ret i32 %4
}

