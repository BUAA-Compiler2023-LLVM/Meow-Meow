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
define i32 @func(i32 %0, i32 %1) {
b0:
	br label %b1
b1:
	%2 = add i32 10000, %0
	%3 = sub i32 %2, %1
	ret i32 %3
}

define i32 @main() {
b0:
	%0 = call i32 @getint()
	call void @starttime()
	br label %b1
b1:
	%1 = phi i32 [ 0, %b0 ],[ %7, %b6 ]
	%2 = phi i32 [ 0, %b0 ],[ %14, %b6 ]
	%3 = phi i32 [ 0, %b0 ],[ %17, %b6 ]
	%4 = phi i32 [ 0, %b0 ],[ %16, %b6 ]
	%5 = icmp slt i32 %3, %0
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b2, label %b3
b2:
	br label %b4
b3:
	call void @stoptime()
	call void @putint(i32 %4)
	call void @putch(i32 10)
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b4:
	%7 = phi i32 [ 0, %b2 ],[ %13, %b5 ]
	%8 = phi i32 [ 0, %b2 ],[ %12, %b5 ]
	%9 = icmp slt i32 %7, 60
	%10 = icmp ne i1 %9, 0
	br i1 %10, label %b5, label %b6
b5:
	%11 = call i32 @func(i32 %3, i32 10000)
	%12 = add i32 %8, %11
	%13 = add i32 %7, 1
	br label %b4
b6:
	%14 = sdiv i32 %8, 60
	%15 = add i32 %4, %14
	%16 = srem i32 %15, 536854529
	%17 = add i32 %3, 1
	br label %b1
}

