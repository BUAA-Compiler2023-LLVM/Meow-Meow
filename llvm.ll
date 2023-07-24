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
	%0 = fsub float 0x3fb4000000000000, 0xc0e01d0000000000
	br label %b3
b3:
	br label %b4
b4:
	%1 = sitofp i32 0 to float
	%2 = fcmp olt float %0, %1
	%3 = icmp ne i1 %2, 0
	br i1 %3, label %b5, label %b6
b5:
	%4 = sitofp i32 0 to float
	%5 = fsub float %4, %0
	br label %b7
b6:
	br label %b7
b7:
	%6 = phi float [ %5, %b5 ],[ %0, %b6 ]
	%7 = fcmp olt float %6, 0x3eb0c6f7a0000000
	%8 = icmp ne i1 %7, 0
	br i1 %8, label %b8, label %b9
b8:
	%9 = fptosi float 1.0 to i32
	br label %b10
b9:
	br label %b10
b10:
	%10 = phi i32 [ %9, %b8 ],[ 0, %b9 ]
	br label %b11
b11:
	br label %b12
b12:
	%11 = icmp ne i32 %10, 0
	br i1 %11, label %b13, label %b17
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
	%12 = fsub float 0x4057c21fc0000000, 0x4041475ce0000000
	br label %b23
b23:
	br label %b24
b24:
	%13 = sitofp i32 0 to float
	%14 = fcmp olt float %12, %13
	%15 = icmp ne i1 %14, 0
	br i1 %15, label %b25, label %b26
b25:
	%16 = sitofp i32 0 to float
	%17 = fsub float %16, %12
	br label %b27
b26:
	br label %b27
b27:
	%18 = phi float [ %17, %b25 ],[ %12, %b26 ]
	%19 = fcmp olt float %18, 0x3eb0c6f7a0000000
	%20 = icmp ne i1 %19, 0
	br i1 %20, label %b28, label %b29
b28:
	%21 = fptosi float 1.0 to i32
	br label %b30
b29:
	br label %b30
b30:
	%22 = phi i32 [ %21, %b28 ],[ 0, %b29 ]
	br label %b31
b31:
	br label %b32
b32:
	%23 = icmp ne i32 %22, 0
	br i1 %23, label %b33, label %b37
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
	%24 = fsub float 0x4041475ce0000000, 0x4041475ce0000000
	br label %b43
b43:
	br label %b44
b44:
	%25 = sitofp i32 0 to float
	%26 = fcmp olt float %24, %25
	%27 = icmp ne i1 %26, 0
	br i1 %27, label %b45, label %b46
b45:
	%28 = sitofp i32 0 to float
	%29 = fsub float %28, %24
	br label %b47
b46:
	br label %b47
b47:
	%30 = phi float [ %29, %b45 ],[ %24, %b46 ]
	%31 = fcmp olt float %30, 0x3eb0c6f7a0000000
	%32 = icmp ne i1 %31, 0
	br i1 %32, label %b48, label %b49
b48:
	%33 = fptosi float 1.0 to i32
	br label %b50
b49:
	br label %b50
b50:
	%34 = phi i32 [ %33, %b48 ],[ 0, %b49 ]
	br label %b51
b51:
	br label %b52
b52:
	%35 = zext i1 0 to i32
	%36 = icmp eq i32 %34, %35
	%37 = icmp ne i1 %36, 0
	br i1 %37, label %b53, label %b57
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
	%38 = fptosi float 5.5 to i32
	br label %b61
b61:
	br label %b62
b62:
	%39 = sitofp i32 %38 to float
	%40 = fmul float 0x400921fb60000000, %39
	%41 = sitofp i32 %38 to float
	%42 = fmul float %40, %41
	%43 = mul i32 %38, %38
	%44 = sitofp i32 %43 to float
	%45 = fmul float %44, 0x400921fb60000000
	%46 = fadd float %42, %45
	%47 = sitofp i32 2 to float
	%48 = fdiv float %46, %47
	br label %b63
b63:
	br label %b64
b64:
	br label %b65
b65:
	%49 = sitofp i32 5 to float
	%50 = fmul float 0x400921fb60000000, %49
	%51 = sitofp i32 5 to float
	%52 = fmul float %50, %51
	%53 = mul i32 5, 5
	%54 = sitofp i32 %53 to float
	%55 = fmul float %54, 0x400921fb60000000
	%56 = fadd float %52, %55
	%57 = sitofp i32 2 to float
	%58 = fdiv float %56, %57
	br label %b66
b66:
	br label %b67
b67:
	br label %b68
b68:
	%59 = fsub float %48, %58
	br label %b69
b69:
	br label %b70
b70:
	%60 = sitofp i32 0 to float
	%61 = fcmp olt float %59, %60
	%62 = icmp ne i1 %61, 0
	br i1 %62, label %b71, label %b72
b71:
	%63 = sitofp i32 0 to float
	%64 = fsub float %63, %59
	br label %b73
b72:
	br label %b73
b73:
	%65 = phi float [ %64, %b71 ],[ %59, %b72 ]
	%66 = fcmp olt float %65, 0x3eb0c6f7a0000000
	%67 = icmp ne i1 %66, 0
	br i1 %67, label %b74, label %b75
b74:
	%68 = fptosi float 1.0 to i32
	br label %b76
b75:
	br label %b76
b76:
	%69 = phi i32 [ %68, %b74 ],[ 0, %b75 ]
	br label %b77
b77:
	br label %b78
b78:
	%70 = zext i1 0 to i32
	%71 = icmp eq i32 %69, %70
	%72 = icmp ne i1 %71, 0
	br i1 %72, label %b79, label %b83
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
	%73 = fsub float 0x406d200000000000, 0x40affe0000000000
	br label %b89
b89:
	br label %b90
b90:
	%74 = sitofp i32 0 to float
	%75 = fcmp olt float %73, %74
	%76 = icmp ne i1 %75, 0
	br i1 %76, label %b91, label %b92
b91:
	%77 = sitofp i32 0 to float
	%78 = fsub float %77, %73
	br label %b93
b92:
	br label %b93
b93:
	%79 = phi float [ %78, %b91 ],[ %73, %b92 ]
	%80 = fcmp olt float %79, 0x3eb0c6f7a0000000
	%81 = icmp ne i1 %80, 0
	br i1 %81, label %b94, label %b95
b94:
	%82 = fptosi float 1.0 to i32
	br label %b96
b95:
	br label %b96
b96:
	%83 = phi i32 [ %82, %b94 ],[ 0, %b95 ]
	br label %b97
b97:
	br label %b98
b98:
	%84 = icmp ne i32 %83, 0
	br i1 %84, label %b99, label %b103
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
	%85 = zext i1 0 to i32
	%86 = sitofp i32 %85 to float
	%87 = fcmp one float 0x3ff8000000000000, %86
	br i1 %87, label %b107, label %b110
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
	%88 = zext i1 0 to i32
	%89 = sitofp i32 %88 to float
	%90 = fcmp oeq float 0x400a666660000000, %89
	%91 = icmp eq i1 %90, 0
	%92 = icmp ne i1 %91, 0
	br i1 %92, label %b111, label %b114
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
	%93 = zext i1 0 to i32
	%94 = sitofp i32 %93 to float
	%95 = fcmp one float 0x0, %94
	br i1 %95, label %b119, label %b118
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
	%96 = icmp ne i32 0, 0
	br i1 %96, label %b120, label %b124
b119:
	%97 = icmp ne i32 3, 0
	br i1 %97, label %b115, label %b118
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
	%98 = alloca [10 x float]
	%99 = getelementptr [10 x float], [10 x float]* %98, i32 0, i32 0
	%100 = bitcast float* %99 to i32*
	call void @memset(i32* %100, i32 0, i32 40)
	%101 = getelementptr [10 x float], [10 x float]* %98, i32 0, i32 0
	store float 1.0, float* %101
	%102 = getelementptr [10 x float], [10 x float]* %98, i32 0, i32 1
	%103 = sitofp i32 2 to float
	store float %103, float* %102
	%104 = getelementptr [10 x float], [10 x float]* %98, i32 0, i32 0
	%105 = call i32 @getfarray(float* %104)
	br label %b125
b124:
	%106 = zext i1 0 to i32
	%107 = sitofp i32 %106 to float
	%108 = fcmp one float 0x3fd3333340000000, %107
	br i1 %108, label %b120, label %b123
b125:
	%109 = phi i32 [ 0, %b123 ],[ %135, %b129 ]
	%110 = phi i32 [ 1, %b123 ],[ %134, %b129 ]
	%111 = icmp slt i32 %110, 1000000000
	%112 = icmp ne i1 %111, 0
	br i1 %112, label %b126, label %b130
b126:
	%113 = call float @getfloat()
	%114 = fmul float 0x400921fb60000000, %113
	%115 = fmul float %114, %113
	%116 = fptosi float %113 to i32
	br label %b127
b127:
	br label %b128
b128:
	%117 = sitofp i32 %116 to float
	%118 = fmul float 0x400921fb60000000, %117
	%119 = sitofp i32 %116 to float
	%120 = fmul float %118, %119
	%121 = mul i32 %116, %116
	%122 = sitofp i32 %121 to float
	%123 = fmul float %122, 0x400921fb60000000
	%124 = fadd float %120, %123
	%125 = sitofp i32 2 to float
	%126 = fdiv float %124, %125
	br label %b129
b129:
	%127 = getelementptr [10 x float], [10 x float]* %98, i32 0, i32 %109
	%128 = getelementptr [10 x float], [10 x float]* %98, i32 0, i32 %109
	%129 = load float, float* %128
	%130 = fadd float %129, %113
	store float %130, float* %127
	call void @putfloat(float %115)
	call void @putch(i32 32)
	%131 = fptosi float %126 to i32
	call void @putint(i32 %131)
	call void @putch(i32 10)
	%132 = sitofp i32 %110 to float
	%133 = fmul float %132, 0x4024000000000000
	%134 = fptosi float %133 to i32
	%135 = add i32 %109, 1
	br label %b125
b130:
	%136 = getelementptr [10 x float], [10 x float]* %98, i32 0, i32 0
	call void @putfarray(i32 %105, float* %136)
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

