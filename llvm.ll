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
@b = global [5 x [3 x i32]] [[3 x i32] [i32 0, i32 0, i32 0], [3 x i32] [i32 0, i32 0, i32 0], [3 x i32] [i32 0, i32 0, i32 0], [3 x i32] [i32 0, i32 0, i32 0], [3 x i32] [i32 0, i32 0, i32 0]]
define i32 @main() {
b0:
	call void @putint(i32 5)
	ret i32 5
}

