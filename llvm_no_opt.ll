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
	%0 = alloca i32
	store i32 0, i32* %0
	%1 = alloca i32
	store i32 0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* %1
	%3 = icmp slt i32 %2, 20
	%4 = icmp ne i1 %3, 0
	br i1 %4, label %b2, label %b3
b2:
	%5 = alloca i32
	store i32 0, i32* %5
	br label %b4
b3:
	%6 = load i32, i32* %0
	call void @putint(i32 %6)
	ret i32 %6
b4:
	%7 = load i32, i32* %5
	%8 = icmp slt i32 %7, 10
	%9 = icmp ne i1 %8, 0
	br i1 %9, label %b5, label %b6
b5:
	%10 = alloca i32
	store i32 0, i32* %10
	br label %b7
b6:
	%11 = load i32, i32* %1
	%12 = add i32 %11, 1
	store i32 %12, i32* %1
	br label %b1
b7:
	%13 = load i32, i32* %10
	%14 = icmp slt i32 %13, 5
	%15 = icmp ne i1 %14, 0
	br i1 %15, label %b8, label %b9
b8:
	%16 = alloca i32
	store i32 0, i32* %16
	br label %b10
b9:
	%17 = load i32, i32* %5
	%18 = add i32 %17, 1
	store i32 %18, i32* %5
	br label %b4
b10:
	%19 = load i32, i32* %16
	%20 = icmp slt i32 %19, 3
	%21 = icmp ne i1 %20, 0
	br i1 %21, label %b11, label %b12
b11:
	%22 = load i32, i32* %16
	%23 = add i32 %22, 1
	%24 = icmp sge i32 %23, 3
	%25 = icmp ne i1 %24, 0
	br i1 %25, label %b13, label %b14
b12:
	br label %b29
b13:
	%26 = load i32, i32* %16
	%27 = icmp ne i32 %26, 0
	br i1 %27, label %b15, label %b16
b14:
	%28 = alloca i32
	store i32 0, i32* %28
	br label %b24
b15:
	%29 = load i32, i32* %16
	%30 = icmp ne i32 %29, 0
	br i1 %30, label %b17, label %b19
b16:
	br label %b14
b17:
	%31 = load i32, i32* %16
	%32 = sub i32 %31, -1
	%33 = icmp sge i32 %32, 3
	%34 = icmp ne i1 %33, 0
	br i1 %34, label %b20, label %b21
b18:
	br label %b16
b19:
	%35 = load i32, i32* %16
	%36 = zext i1 0 to i32
	%37 = icmp eq i32 %35, %36
	%38 = icmp ne i1 %37, 0
	br i1 %38, label %b17, label %b18
b20:
	br label %b12
b21:
	br label %b18
b22:
	br label %b10
b23:
	br label %b21
b24:
	%39 = load i32, i32* %28
	%40 = icmp slt i32 %39, 2
	%41 = icmp ne i1 %40, 0
	br i1 %41, label %b25, label %b26
b25:
	%42 = load i32, i32* %28
	%43 = add i32 %42, 1
	store i32 %43, i32* %28
	br label %b24
b26:
	%44 = load i32, i32* %16
	%45 = add i32 %44, 1
	store i32 %45, i32* %16
	%46 = load i32, i32* %0
	%47 = add i32 %46, 1
	store i32 %47, i32* %0
	br label %b10
b27:
	br label %b26
b28:
	%48 = load i32, i32* %0
	%49 = add i32 %48, 1
	store i32 %49, i32* %0
	br label %b24
b29:
	%50 = icmp ne i32 1, 0
	br i1 %50, label %b30, label %b31
b30:
	br label %b32
b31:
	%51 = load i32, i32* %10
	%52 = add i32 %51, 1
	store i32 %52, i32* %10
	br label %b7
b32:
	%53 = icmp ne i32 1, 0
	br i1 %53, label %b33, label %b34
b33:
	br label %b34
b34:
	br label %b31
b35:
	br label %b32
b36:
	br label %b29
b37:
	%54 = load i32, i32* %5
	%55 = add i32 %54, 1
	store i32 %55, i32* %5
	br label %b4
}

