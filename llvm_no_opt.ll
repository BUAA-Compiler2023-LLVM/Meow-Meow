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
@last_char = global i32 32
@num = global i32 0
@other = global i32 0
@cur_token = global i32 0
define i32 @next_char() {
b0:
	%0 = call i32 @getch()
	store i32 %0, i32* @last_char
	%1 = load i32, i32* @last_char
	ret i32 %1
}

define i32 @is_space(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* %1
	%3 = icmp eq i32 %2, 32
	%4 = icmp ne i1 %3, 0
	br i1 %4, label %b2, label %b5
b2:
	ret i32 1
b3:
	ret i32 0
b4:
	ret i32 0
b5:
	%5 = load i32, i32* %1
	%6 = icmp eq i32 %5, 10
	%7 = icmp ne i1 %6, 0
	br i1 %7, label %b2, label %b4
}

define i32 @is_num(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* %1
	%3 = icmp sge i32 %2, 48
	%4 = icmp ne i1 %3, 0
	br i1 %4, label %b5, label %b4
b2:
	ret i32 1
b3:
	ret i32 0
b4:
	ret i32 0
b5:
	%5 = load i32, i32* %1
	%6 = icmp sle i32 %5, 57
	%7 = icmp ne i1 %6, 0
	br i1 %7, label %b2, label %b4
}

define i32 @next_token() {
b0:
	br label %b1
b1:
	%0 = load i32, i32* @last_char
	%1 = call i32 @is_space(i32 %0)
	%2 = icmp ne i32 %1, 0
	br i1 %2, label %b2, label %b3
b2:
	%3 = call i32 @next_char()
	br label %b1
b3:
	%4 = load i32, i32* @last_char
	%5 = call i32 @is_num(i32 %4)
	%6 = icmp ne i32 %5, 0
	br i1 %6, label %b4, label %b6
b4:
	%7 = load i32, i32* @last_char
	%8 = sub i32 %7, 48
	store i32 %8, i32* @num
	br label %b7
b5:
	%9 = load i32, i32* @cur_token
	ret i32 %9
b6:
	%10 = load i32, i32* @last_char
	store i32 %10, i32* @other
	%11 = call i32 @next_char()
	store i32 1, i32* @cur_token
	br label %b5
b7:
	%12 = call i32 @next_char()
	%13 = call i32 @is_num(i32 %12)
	%14 = icmp ne i32 %13, 0
	br i1 %14, label %b8, label %b9
b8:
	%15 = load i32, i32* @num
	%16 = mul i32 %15, 10
	%17 = load i32, i32* @last_char
	%18 = add i32 %16, %17
	%19 = sub i32 %18, 48
	store i32 %19, i32* @num
	br label %b7
b9:
	store i32 0, i32* @cur_token
	br label %b5
}

define i32 @panic() {
b0:
	call void @putch(i32 112)
	call void @putch(i32 97)
	call void @putch(i32 110)
	call void @putch(i32 105)
	call void @putch(i32 99)
	call void @putch(i32 33)
	call void @putch(i32 10)
	ret i32 -1
}

define i32 @get_op_prec(i32 %0) {
b0:
	%1 = alloca i32
	store i32 %0, i32* %1
	br label %b1
b1:
	%2 = load i32, i32* %1
	%3 = icmp eq i32 %2, 43
	%4 = icmp ne i1 %3, 0
	br i1 %4, label %b2, label %b4
b2:
	ret i32 10
b3:
	%5 = load i32, i32* %1
	%6 = icmp eq i32 %5, 42
	%7 = icmp ne i1 %6, 0
	br i1 %7, label %b5, label %b7
b4:
	%8 = load i32, i32* %1
	%9 = icmp eq i32 %8, 45
	%10 = icmp ne i1 %9, 0
	br i1 %10, label %b2, label %b3
b5:
	ret i32 20
b6:
	ret i32 0
b7:
	%11 = load i32, i32* %1
	%12 = icmp eq i32 %11, 47
	%13 = icmp ne i1 %12, 0
	br i1 %13, label %b5, label %b8
b8:
	%14 = load i32, i32* %1
	%15 = icmp eq i32 %14, 37
	%16 = icmp ne i1 %15, 0
	br i1 %16, label %b5, label %b6
}

define void @stack_push(i32* %0, i32 %1) {
b0:
	%2 = alloca i32*
	store i32* %0, i32** %2
	%3 = alloca i32
	store i32 %1, i32* %3
	br label %b1
b1:
	%4 = load i32*, i32** %2
	%5 = getelementptr i32, i32* %4, i32 0
	%6 = load i32*, i32** %2
	%7 = getelementptr i32, i32* %6, i32 0
	%8 = load i32, i32* %7
	%9 = add i32 %8, 1
	store i32 %9, i32* %5
	%10 = load i32*, i32** %2
	%11 = load i32*, i32** %2
	%12 = getelementptr i32, i32* %11, i32 0
	%13 = load i32, i32* %12
	%14 = getelementptr i32, i32* %10, i32 %13
	%15 = load i32, i32* %3
	store i32 %15, i32* %14
	ret void
}

define i32 @stack_pop(i32* %0) {
b0:
	%1 = alloca i32*
	store i32* %0, i32** %1
	br label %b1
b1:
	%2 = alloca i32
	%3 = load i32*, i32** %1
	%4 = load i32*, i32** %1
	%5 = getelementptr i32, i32* %4, i32 0
	%6 = load i32, i32* %5
	%7 = getelementptr i32, i32* %3, i32 %6
	%8 = load i32, i32* %7
	store i32 %8, i32* %2
	%9 = load i32*, i32** %1
	%10 = getelementptr i32, i32* %9, i32 0
	%11 = load i32*, i32** %1
	%12 = getelementptr i32, i32* %11, i32 0
	%13 = load i32, i32* %12
	%14 = sub i32 %13, 1
	store i32 %14, i32* %10
	%15 = load i32, i32* %2
	ret i32 %15
}

define i32 @stack_peek(i32* %0) {
b0:
	%1 = alloca i32*
	store i32* %0, i32** %1
	br label %b1
b1:
	%2 = load i32*, i32** %1
	%3 = load i32*, i32** %1
	%4 = getelementptr i32, i32* %3, i32 0
	%5 = load i32, i32* %4
	%6 = getelementptr i32, i32* %2, i32 %5
	%7 = load i32, i32* %6
	ret i32 %7
}

define i32 @stack_size(i32* %0) {
b0:
	%1 = alloca i32*
	store i32* %0, i32** %1
	br label %b1
b1:
	%2 = load i32*, i32** %1
	%3 = getelementptr i32, i32* %2, i32 0
	%4 = load i32, i32* %3
	ret i32 %4
}

define i32 @eval_op(i32 %0, i32 %1, i32 %2) {
b0:
	%3 = alloca i32
	store i32 %0, i32* %3
	%4 = alloca i32
	store i32 %1, i32* %4
	%5 = alloca i32
	store i32 %2, i32* %5
	br label %b1
b1:
	%6 = load i32, i32* %3
	%7 = icmp eq i32 %6, 43
	%8 = icmp ne i1 %7, 0
	br i1 %8, label %b2, label %b3
b2:
	%9 = load i32, i32* %4
	%10 = load i32, i32* %5
	%11 = add i32 %9, %10
	ret i32 %11
b3:
	%12 = load i32, i32* %3
	%13 = icmp eq i32 %12, 45
	%14 = icmp ne i1 %13, 0
	br i1 %14, label %b4, label %b5
b4:
	%15 = load i32, i32* %4
	%16 = load i32, i32* %5
	%17 = sub i32 %15, %16
	ret i32 %17
b5:
	%18 = load i32, i32* %3
	%19 = icmp eq i32 %18, 42
	%20 = icmp ne i1 %19, 0
	br i1 %20, label %b6, label %b7
b6:
	%21 = load i32, i32* %4
	%22 = load i32, i32* %5
	%23 = mul i32 %21, %22
	ret i32 %23
b7:
	%24 = load i32, i32* %3
	%25 = icmp eq i32 %24, 47
	%26 = icmp ne i1 %25, 0
	br i1 %26, label %b8, label %b9
b8:
	%27 = load i32, i32* %4
	%28 = load i32, i32* %5
	%29 = sdiv i32 %27, %28
	ret i32 %29
b9:
	%30 = load i32, i32* %3
	%31 = icmp eq i32 %30, 37
	%32 = icmp ne i1 %31, 0
	br i1 %32, label %b10, label %b11
b10:
	%33 = load i32, i32* %4
	%34 = load i32, i32* %5
	%35 = srem i32 %33, %34
	ret i32 %35
b11:
	ret i32 0
}

define i32 @eval() {
b0:
	%0 = alloca [256 x i32]
	%1 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i32 0
	call void @memset(i32* %1, i32 0, i32 1024)
	%2 = alloca [256 x i32]
	%3 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i32 0
	call void @memset(i32* %3, i32 0, i32 1024)
	%4 = load i32, i32* @cur_token
	%5 = icmp ne i32 %4, 0
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b1, label %b2
b1:
	%7 = call i32 @panic()
	ret i32 %7
b2:
	%8 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i32 0
	%9 = load i32, i32* @num
	call void @stack_push(i32* %8, i32 %9)
	%10 = call i32 @next_token()
	br label %b3
b3:
	%11 = load i32, i32* @cur_token
	%12 = icmp eq i32 %11, 1
	%13 = icmp ne i1 %12, 0
	br i1 %13, label %b4, label %b5
b4:
	%14 = alloca i32
	%15 = load i32, i32* @other
	store i32 %15, i32* %14
	%16 = load i32, i32* %14
	%17 = call i32 @get_op_prec(i32 %16)
	%18 = zext i1 0 to i32
	%19 = icmp eq i32 %17, %18
	%20 = icmp ne i1 %19, 0
	br i1 %20, label %b6, label %b7
b5:
	%21 = call i32 @next_token()
	br label %b15
b6:
	br label %b5
b7:
	%22 = call i32 @next_token()
	br label %b9
b8:
	br label %b7
b9:
	%23 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i32 0
	%24 = call i32 @stack_size(i32* %23)
	%25 = icmp ne i32 %24, 0
	br i1 %25, label %b12, label %b11
b10:
	%26 = alloca i32
	%27 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i32 0
	%28 = call i32 @stack_pop(i32* %27)
	store i32 %28, i32* %26
	%29 = alloca i32
	%30 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i32 0
	%31 = call i32 @stack_pop(i32* %30)
	store i32 %31, i32* %29
	%32 = alloca i32
	%33 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i32 0
	%34 = call i32 @stack_pop(i32* %33)
	store i32 %34, i32* %32
	%35 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i32 0
	%36 = load i32, i32* %26
	%37 = load i32, i32* %32
	%38 = load i32, i32* %29
	%39 = call i32 @eval_op(i32 %36, i32 %37, i32 %38)
	call void @stack_push(i32* %35, i32 %39)
	br label %b9
b11:
	%40 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i32 0
	%41 = load i32, i32* %14
	call void @stack_push(i32* %40, i32 %41)
	%42 = load i32, i32* @cur_token
	%43 = icmp ne i32 %42, 0
	%44 = icmp ne i1 %43, 0
	br i1 %44, label %b13, label %b14
b12:
	%45 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i32 0
	%46 = call i32 @stack_peek(i32* %45)
	%47 = call i32 @get_op_prec(i32 %46)
	%48 = load i32, i32* %14
	%49 = call i32 @get_op_prec(i32 %48)
	%50 = icmp sge i32 %47, %49
	%51 = icmp ne i1 %50, 0
	br i1 %51, label %b10, label %b11
b13:
	%52 = call i32 @panic()
	ret i32 %52
b14:
	%53 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i32 0
	%54 = load i32, i32* @num
	call void @stack_push(i32* %53, i32 %54)
	%55 = call i32 @next_token()
	br label %b3
b15:
	%56 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i32 0
	%57 = call i32 @stack_size(i32* %56)
	%58 = icmp ne i32 %57, 0
	br i1 %58, label %b16, label %b17
b16:
	%59 = alloca i32
	%60 = getelementptr [256 x i32], [256 x i32]* %2, i32 0, i32 0
	%61 = call i32 @stack_pop(i32* %60)
	store i32 %61, i32* %59
	%62 = alloca i32
	%63 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i32 0
	%64 = call i32 @stack_pop(i32* %63)
	store i32 %64, i32* %62
	%65 = alloca i32
	%66 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i32 0
	%67 = call i32 @stack_pop(i32* %66)
	store i32 %67, i32* %65
	%68 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i32 0
	%69 = load i32, i32* %59
	%70 = load i32, i32* %65
	%71 = load i32, i32* %62
	%72 = call i32 @eval_op(i32 %69, i32 %70, i32 %71)
	call void @stack_push(i32* %68, i32 %72)
	br label %b15
b17:
	%73 = getelementptr [256 x i32], [256 x i32]* %0, i32 0, i32 0
	%74 = call i32 @stack_peek(i32* %73)
	ret i32 %74
}

define i32 @main() {
b0:
	%0 = alloca i32
	%1 = call i32 @getint()
	store i32 %1, i32* %0
	%2 = call i32 @getch()
	%3 = call i32 @next_token()
	br label %b1
b1:
	%4 = load i32, i32* %0
	%5 = icmp ne i32 %4, 0
	br i1 %5, label %b2, label %b3
b2:
	%6 = call i32 @eval()
	call void @putint(i32 %6)
	call void @putch(i32 10)
	%7 = load i32, i32* %0
	%8 = sub i32 %7, 1
	store i32 %8, i32* %0
	br label %b1
b3:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

