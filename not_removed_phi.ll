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
define float @my_sin_impl(float x) {
block9:
	br label %block10
block10:
	br label %block45
block45:
	br label %block46
block46:
	%222 = sitofp i32 0 to float
	%223 = fcmp ogt float x, %222
	%224 = icmp ne i1 %223, 0
	br i1 %224, label %block47, label %block48
block47:
	br label %block49
block48:
	%225 = sitofp i32 0 to float
	%226 = fsub float %225, x
	br label %block49
block49:
	%227 = phi float [ x, %block47 ],[ %226, %block48 ]
	%40 = fcmp ole float %227, 0x3eb0c6f7a0000000
	%41 = icmp ne i1 %40, 0
	br i1 %41, label %block11, label %block12
block11:
	ret float x
block12:
	%44 = fdiv float x, 0x4008000000000000
	%45 = call float @my_sin_impl(float %44)
	br label %block53
block53:
	br label %block54
block54:
	%237 = sitofp i32 3 to float
	%238 = fmul float %237, %45
	%239 = sitofp i32 4 to float
	%240 = fmul float %239, %45
	%241 = fmul float %240, %45
	%242 = fmul float %241, %45
	%243 = fsub float %238, %242
	br label %block55
block55:
	ret float %243
}

define float @my_sin(float x) {
block13:
	br label %block14
block14:
	%49 = call float @my_sin_impl(float x)
	ret float %49
}

define float @my_cos(float x) {
block15:
	br label %block16
block16:
	%52 = fadd float x, 0x3ff921fb60000000
	%53 = call float @my_sin(float %52)
	ret float %53
}

define float @circle_sdf(float x, float y, float cx, float cy, float r) {
block17:
	br label %block18
block18:
	%62 = fsub float x, cx
	%66 = fsub float y, cy
	%69 = fmul float %62, %62
	%72 = fmul float %66, %66
	%73 = fadd float %69, %72
	br label %block50
block50:
	br label %block51
block51:
	%228 = sitofp i32 8 to float
	%229 = fdiv float %73, %228
	%230 = fadd float %229, 0x3fe0000000000000
	%231 = sitofp i32 2 to float
	%232 = fmul float %231, %73
	%233 = sitofp i32 4 to float
	%234 = fadd float %233, %73
	%235 = fdiv float %232, %234
	%236 = fadd float %230, %235
	br label %block52
block52:
	%76 = fsub float %236, r
	ret float %76
}

define void @scene(float x, float y, float* ret) {
block19:
	%79 = alloca float*
	store float* ret, float** %79
	br label %block20
block20:
	%83 = call float @circle_sdf(float x, float y, float 0x3fd99999a0000000, float 0x3fd99999a0000000, float 0x3fb99999a0000000)
	%87 = call float @circle_sdf(float x, float y, float 0x3fe3333340000000, float 0x3fe3333340000000, float 0x3fa99999a0000000)
	%90 = fcmp olt float %83, %87
	%91 = icmp ne i1 %90, 0
	br i1 %91, label %block21, label %block23
block21:
	%92 = load float*, float** %79
	%93 = getelementptr float, float* %92, i32 0
	store float %83, float* %93
	%95 = load float*, float** %79
	%96 = getelementptr float, float* %95, i32 1
	store float 3.0, float* %96
	br label %block22
block22:
	ret void
block23:
	%97 = load float*, float** %79
	%98 = getelementptr float, float* %97, i32 0
	store float %87, float* %98
	%100 = load float*, float** %79
	%101 = getelementptr float, float* %100, i32 1
	store float 0.0, float* %101
	br label %block22
}

define float @trace(float ox, float oy, float dx, float dy) {
block24:
	br label %block25
block25:
	br label %block26
block26:
	%208 = phi i32 [ 0, %block25 ],[ %141, %block31 ]
	%207 = phi float [ 0x0, %block25 ],[ %139, %block31 ]
	%109 = icmp slt i32 %208, 10
	%110 = icmp ne i1 %109, 0
	br i1 %110, label %block29, label %block28
block27:
	%114 = alloca [2 x float]
	%115 = getelementptr [2 x float], [2 x float]* %114, i32 0, i32 0
	%116 = bitcast float* %115 to i32*
	call void @memset(i32* %116, i32 0, i32 0)
	%121 = fmul float dx, %207
	%122 = fadd float ox, %121
	%126 = fmul float dy, %207
	%127 = fadd float oy, %126
	%128 = getelementptr [2 x float], [2 x float]* %114, i32 0, i32 0
	call void @scene(float %122, float %127, float* %128)
	%130 = getelementptr [2 x float], [2 x float]* %114, i32 0, i32 0
	%131 = load float, float* %130
	%132 = fcmp olt float %131, 0x3eb0c6f7a0000000
	%133 = icmp ne i1 %132, 0
	br i1 %133, label %block30, label %block31
block28:
	ret float 0.0
block29:
	%112 = fcmp olt float %207, 0x4000000000000000
	%113 = icmp ne i1 %112, 0
	br i1 %113, label %block27, label %block28
block30:
	%134 = getelementptr [2 x float], [2 x float]* %114, i32 0, i32 1
	%135 = load float, float* %134
	ret float %135
block31:
	%137 = getelementptr [2 x float], [2 x float]* %114, i32 0, i32 0
	%138 = load float, float* %137
	%139 = fadd float %207, %138
	%141 = add i32 %208, 1
	br label %block26
}

define float @sample(float x, float y) {
block32:
	br label %block33
block33:
	br label %block34
block34:
	%210 = phi i32 [ 0, %block33 ],[ %171, %block35 ]
	%209 = phi float [ 0x0, %block33 ],[ %169, %block35 ]
	%147 = icmp slt i32 %210, 24
	%148 = icmp ne i1 %147, 0
	br i1 %148, label %block35, label %block36
block35:
	%150 = sitofp i32 10 to float
	%154 = sitofp i32 100000006 to float
	%155 = fdiv float %150, %154
	%156 = sitofp i32 %210 to float
	%157 = fadd float %156, %155
	%158 = fmul float 0x401921fb60000000, %157
	%159 = sitofp i32 24 to float
	%160 = fdiv float %158, %159
	%165 = call float @my_cos(float %160)
	%167 = call float @my_sin(float %160)
	%168 = call float @trace(float x, float y, float %165, float %167)
	%169 = fadd float %209, %168
	%171 = add i32 %210, 1
	br label %block34
block36:
	%173 = sitofp i32 24 to float
	%174 = fdiv float %209, %173
	ret float %174
}

define void @write_pgm() {
block37:
	br label %block38
block38:
	%213 = phi i32 [ 0, %block37 ],[ %203, %block43 ]
	%177 = icmp slt i32 %213, 192
	%178 = icmp ne i1 %177, 0
	br i1 %178, label %block39, label %block40
block39:
	br label %block41
block40:
	ret void
block41:
	%215 = phi i32 [ 0, %block39 ],[ %200, %block42 ]
	%181 = icmp slt i32 %215, 192
	%182 = icmp ne i1 %181, 0
	br i1 %182, label %block42, label %block43
block42:
	%185 = sitofp i32 %215 to float
	%188 = sitofp i32 %213 to float
	%191 = sitofp i32 192 to float
	%192 = fdiv float %185, %191
	%194 = sitofp i32 192 to float
	%195 = fdiv float %188, %194
	%196 = call float @sample(float %192, float %195)
	%200 = add i32 %215, 1
	br label %block41
block43:
	call void @putch(i32 10)
	%203 = add i32 %213, 1
	br label %block38
}

define i32 @main() {
block44:
	call void @write_pgm()
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

