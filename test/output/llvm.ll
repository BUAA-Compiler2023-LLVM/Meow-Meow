define i32 main() {
%0:
	%1 = alloca i32
	store i32 10, i32* %1
	%3 = load i32* %1
	%4 = add %3 1
	store i32 %4, i32* %1
	%6 = load i32* %1
	ret i32 %6
}

