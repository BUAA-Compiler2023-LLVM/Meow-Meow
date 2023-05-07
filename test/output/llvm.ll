define i32 main() {
%0:
	%1 = alloca float
	store float 7.0, float* %1
	%3 = alloca i32
	%4 = load float* %1
	%5 = fadd 3.1 %4
	%6 = fptosi %5 to i32
	store i32 %6, i32* %3
	%8 = load i32* %3
	%9 = add %8 1
	ret i32 %9
}

