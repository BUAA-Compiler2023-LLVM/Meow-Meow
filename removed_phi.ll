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
	%0 = fcmp olt float 0x4004000000000000, 0x4016000000000000
	%1 = icmp ne i1 %0, 0
	br i1 %1, label %b1, label %b3
b1:
	%2 = move 0x4004000000000000
	br label %b2
b2:
	%3 = move %2
	call void @putint(i32 %3)
	%4 = fptosi i32 %3 to i32
	ret i32 %4
b3:
	%2 = move 0x4016000000000000
	br label %b2
}

