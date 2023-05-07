define i32 main() {
%0:
	%1 = alloca i32
	store i32 1, i32* %1
	store i32 2, i32* %1
	%4 = alloca i32
	store i32 3, i32* %4
	%6 = load i32* %1
	ret i32 %6
}

