define i32 main() {
%0:
	%1 = sitofp 3 to float
	%2 = fmul 2.1 %1
	%3 = sitofp 1 to float
	%4 = fadd %3 %2
	ret float i32 %4
}

