define i32 main() {
%0:
	%1 = alloca i32
	store i32 2, i32* %1
	%3 = load i32* %1
	%4 = icmp eq %3 1
	%5 = icmp ne %4 0
	br i1 %5, label %17, label %12
%7:
	%8 = load i32* %1
	%9 = add %8 1
	store i32 %9, i32* %1
	br label %12
%12:
	%13 = load i32* %1
	%14 = add %13 1
	store i32 %14, i32* %1
	%16 = load i32* %1
	ret i32 %16
%17:
	%18 = load i32* %1
	%19 = icmp eq %18 2
	%20 = icmp ne %19 0
	br i1 %20, label %7, label %12
}

