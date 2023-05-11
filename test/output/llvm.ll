define i32 @half(i32 %0) {
%1:
	%2 = alloca i32
	store i32 %0, i32* %2
%4:
	%5 = load i32* %2
	%6 = div %5 2
	ret i32 %6
}

define void @f() {
%0:
	ret void
}

define i32 @main() {
%0:
	call @f()
	%1 = call @half(i32 10)
	ret i32 %1
}

