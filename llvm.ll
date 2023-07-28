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
@g = global [4 x i32] [i32 1, i32 2, i32 3, i32 4]
define i32 @main() {
b0:
	%0 = getelementptr [4 x i32], [4 x i32]* @g, i32 0, i32 1
	%1 = load i32, i32* %0
	%2 = sdiv i32 %1, 2
	%3 = mul i32 18, %2
	call void @putint(i32 %3)
	ret i32 %3
}

