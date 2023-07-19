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
@head = global [1005 x i32]zeroinitializer
define void @init() {
b0:
	br label %b1
b1:
	%0 = phi i32 [ 0, %b0 ],[ %4, %b2 ]
	%1 = icmp slt i32 %0, 1005
	%2 = icmp ne i1 %1, 0
	br i1 %2, label %b2, label %b3
b2:
	%3 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %0
	store i32 -1, i32* %3
	%4 = add i32 %0, 1
	br label %b1
b3:
	ret void
}

define i32 @main() {
b0:
	call void @init()
	call void @putint(i32 0)
	ret i32 0
}

