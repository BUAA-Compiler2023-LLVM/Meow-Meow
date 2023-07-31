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
	br label %b1
b1:
	br label %b2
b2:
	br label %b3
b3:
	br label %b4
b4:
	br i1 0, label %b5, label %b6
b5:
	br label %b7
b6:
	br label %b7
b7:
	%0 = phi float [ 0xc0e01d0280000000, %b5 ],[ 0x40e01d0280000000, %b6 ]
	%1 = fcmp olt float %0, 0x3eb0c6f7a0000000
	%2 = icmp ne i1 %1, 0
	br i1 %2, label %b8, label %b9
b8:
	br label %b10
b9:
	br label %b10
b10:
	%3 = phi i32 [ 1, %b8 ],[ 0, %b9 ]
	br label %b11
b11:
	br label %b12
b12:
	%4 = icmp ne i32 %3, 0
	br i1 %4, label %b13, label %b17
b13:
	br label %b14
b14:
	call void @putch(i32 101)
	call void @putch(i32 114)
	call void @putch(i32 114)
	call void @putch(i32 111)
	call void @putch(i32 114)
	call void @putch(i32 10)
	br label %b15
b15:
	br label %b16
b16:
	br label %b20
b17:
	br label %b18
b18:
	call void @putch(i32 111)
	call void @putch(i32 107)
	call void @putch(i32 10)
	br label %b19
b19:
	br label %b16
b20:
	br label %b21
b21:
	br label %b22
b22:
	br label %b23
b23:
	br label %b24
b24:
	br i1 0, label %b25, label %b26
b25:
	br label %b27
b26:
	br label %b27
b27:
	%5 = phi float [ 0xc04e3ce2a0000000, %b25 ],[ 0x404e3ce2a0000000, %b26 ]
	%6 = fcmp olt float %5, 0x3eb0c6f7a0000000
	%7 = icmp ne i1 %6, 0
	br i1 %7, label %b28, label %b29
b28:
	br label %b30
b29:
	br label %b30
b30:
	%8 = phi i32 [ 1, %b28 ],[ 0, %b29 ]
	br label %b31
b31:
	br label %b32
b32:
	%9 = icmp ne i32 %8, 0
	br i1 %9, label %b33, label %b37
b33:
	br label %b34
b34:
	call void @putch(i32 101)
	call void @putch(i32 114)
	call void @putch(i32 114)
	call void @putch(i32 111)
	call void @putch(i32 114)
	call void @putch(i32 10)
	br label %b35
b35:
	br label %b36
b36:
	br label %b40
b37:
	br label %b38
b38:
	call void @putch(i32 111)
	call void @putch(i32 107)
	call void @putch(i32 10)
	br label %b39
b39:
	br label %b36
b40:
	br label %b41
b41:
	br label %b42
b42:
	br label %b43
b43:
	br label %b44
b44:
	br i1 0, label %b45, label %b46
b45:
	br label %b47
b46:
	br label %b47
b47:
	%10 = phi float [ 0x0, %b45 ],[ 0x0, %b46 ]
	%11 = fcmp olt float %10, 0x3eb0c6f7a0000000
	%12 = icmp ne i1 %11, 0
	br i1 %12, label %b48, label %b49
b48:
	br label %b50
b49:
	br label %b50
b50:
	%13 = phi i32 [ 1, %b48 ],[ 0, %b49 ]
	br label %b51
b51:
	br label %b52
b52:
	%14 = icmp eq i32 %13, 0
	%15 = icmp ne i1 %14, 0
	br i1 %15, label %b53, label %b57
b53:
	br label %b54
b54:
	call void @putch(i32 101)
	call void @putch(i32 114)
	call void @putch(i32 114)
	call void @putch(i32 111)
	call void @putch(i32 114)
	call void @putch(i32 10)
	br label %b55
b55:
	br label %b56
b56:
	br label %b60
b57:
	br label %b58
b58:
	call void @putch(i32 111)
	call void @putch(i32 107)
	call void @putch(i32 10)
	br label %b59
b59:
	br label %b56
b60:
	br label %b61
b61:
	br label %b62
b62:
	br label %b63
b63:
	br label %b64
b64:
	br label %b65
b65:
	br label %b66
b66:
	br label %b67
b67:
	br label %b68
b68:
	br label %b69
b69:
	br label %b70
b70:
	br i1 0, label %b71, label %b72
b71:
	br label %b73
b72:
	br label %b73
b73:
	%16 = phi float [ 0x0, %b71 ],[ 0x0, %b72 ]
	%17 = fcmp olt float %16, 0x3eb0c6f7a0000000
	%18 = icmp ne i1 %17, 0
	br i1 %18, label %b74, label %b75
b74:
	br label %b76
b75:
	br label %b76
b76:
	%19 = phi i32 [ 1, %b74 ],[ 0, %b75 ]
	br label %b77
b77:
	br label %b78
b78:
	%20 = icmp eq i32 %19, 0
	%21 = icmp ne i1 %20, 0
	br i1 %21, label %b79, label %b83
b79:
	br label %b80
b80:
	call void @putch(i32 101)
	call void @putch(i32 114)
	call void @putch(i32 114)
	call void @putch(i32 111)
	call void @putch(i32 114)
	call void @putch(i32 10)
	br label %b81
b81:
	br label %b82
b82:
	br label %b86
b83:
	br label %b84
b84:
	call void @putch(i32 111)
	call void @putch(i32 107)
	call void @putch(i32 10)
	br label %b85
b85:
	br label %b82
b86:
	br label %b87
b87:
	br label %b88
b88:
	br label %b89
b89:
	br label %b90
b90:
	br i1 1, label %b91, label %b92
b91:
	br label %b93
b92:
	br label %b93
b93:
	%22 = phi float [ 0x40ae2c0000000000, %b91 ],[ 0xc0ae2c0000000000, %b92 ]
	%23 = fcmp olt float %22, 0x3eb0c6f7a0000000
	%24 = icmp ne i1 %23, 0
	br i1 %24, label %b94, label %b95
b94:
	br label %b96
b95:
	br label %b96
b96:
	%25 = phi i32 [ 1, %b94 ],[ 0, %b95 ]
	br label %b97
b97:
	br label %b98
b98:
	%26 = icmp ne i32 %25, 0
	br i1 %26, label %b99, label %b103
b99:
	br label %b100
b100:
	call void @putch(i32 101)
	call void @putch(i32 114)
	call void @putch(i32 114)
	call void @putch(i32 111)
	call void @putch(i32 114)
	call void @putch(i32 10)
	br label %b101
b101:
	br label %b102
b102:
	br label %b106
b103:
	br label %b104
b104:
	call void @putch(i32 111)
	call void @putch(i32 107)
	call void @putch(i32 10)
	br label %b105
b105:
	br label %b102
b106:
	br i1 1, label %b107, label %b110
b107:
	br label %b108
b108:
	call void @putch(i32 111)
	call void @putch(i32 107)
	call void @putch(i32 10)
	br label %b109
b109:
	br label %b110
b110:
	br i1 1, label %b111, label %b114
b111:
	br label %b112
b112:
	call void @putch(i32 111)
	call void @putch(i32 107)
	call void @putch(i32 10)
	br label %b113
b113:
	br label %b114
b114:
	br i1 0, label %b119, label %b118
b115:
	br label %b116
b116:
	call void @putch(i32 101)
	call void @putch(i32 114)
	call void @putch(i32 114)
	call void @putch(i32 111)
	call void @putch(i32 114)
	call void @putch(i32 10)
	br label %b117
b117:
	br label %b118
b118:
	br i1 0, label %b120, label %b124
b119:
	br i1 1, label %b115, label %b118
b120:
	br label %b121
b121:
	call void @putch(i32 111)
	call void @putch(i32 107)
	call void @putch(i32 10)
	br label %b122
b122:
	br label %b123
b123:
	%27 = alloca [10 x float]
	%28 = getelementptr [10 x float], [10 x float]* %27, i32 0, i32 0
	%29 = bitcast float* %28 to i32*
	call void @memset(i32* %29, i32 0, i32 40)
	%30 = getelementptr [10 x float], [10 x float]* %27, i32 0, i32 0
	store float 1.0, float* %30
	%31 = getelementptr [10 x float], [10 x float]* %27, i32 0, i32 1
	store float 2.0, float* %31
	%32 = getelementptr [10 x float], [10 x float]* %27, i32 0, i32 0
	%33 = call i32 @getfarray(float* %32)
	br label %b125
b124:
	br i1 1, label %b120, label %b123
b125:
	%34 = phi float [ 0x0, %b123 ],[ %53, %b129 ]
	%35 = phi float [ 0x0, %b123 ],[ %43, %b129 ]
	%36 = phi float [ 0x0, %b123 ],[ %41, %b129 ]
	%37 = phi i32 [ 0, %b123 ],[ %62, %b129 ]
	%38 = phi i32 [ 1, %b123 ],[ %61, %b129 ]
	%39 = icmp slt i32 %38, 1000000000
	%40 = icmp ne i1 %39, 0
	br i1 %40, label %b126, label %b130
b126:
	%41 = call float @getfloat()
	%42 = fmul float 0x400921fb60000000, %41
	%43 = fmul float %42, %41
	%44 = fptosi float %41 to i32
	br label %b127
b127:
	br label %b128
b128:
	%45 = sitofp i32 %44 to float
	%46 = fmul float 0x400921fb60000000, %45
	%47 = sitofp i32 %44 to float
	%48 = fmul float %46, %47
	%49 = mul i32 %44, %44
	%50 = sitofp i32 %49 to float
	%51 = fmul float %50, 0x400921fb60000000
	%52 = fadd float %48, %51
	%53 = fdiv float %52, 0x4000000000000000
	br label %b129
b129:
	%54 = getelementptr [10 x float], [10 x float]* %27, i32 0, i32 %37
	%55 = getelementptr [10 x float], [10 x float]* %27, i32 0, i32 %37
	%56 = load float, float* %55
	%57 = fadd float %56, %41
	store float %57, float* %54
	call void @putfloat(float %43)
	call void @putch(i32 32)
	%58 = fptosi float %53 to i32
	call void @putint(i32 %58)
	call void @putch(i32 10)
	%59 = sitofp i32 %38 to float
	%60 = fmul float %59, 0x4024000000000000
	%61 = fptosi float %60 to i32
	%62 = add i32 %37, 1
	br label %b125
b130:
	%63 = getelementptr [10 x float], [10 x float]* %27, i32 0, i32 0
	call void @putfarray(i32 %33, float* %63)
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

