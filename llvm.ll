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
@k = global i32 0
define float @params_f40(float %0, float %1, float %2, float %3, float %4, float %5, float %6, float %7, float %8, float %9, float %10, float %11, float %12, float %13, float %14, float %15, float %16, float %17, float %18, float %19, float %20, float %21, float %22, float %23, float %24, float %25, float %26, float %27, float %28, float %29, float %30, float %31, float %32, float %33, float %34, float %35, float %36, float %37, float %38, float %39) {
b0:
	%40 = alloca float
	store float %0, float* %40
	%41 = alloca float
	store float %1, float* %41
	%42 = alloca float
	store float %2, float* %42
	%43 = alloca float
	store float %3, float* %43
	%44 = alloca float
	store float %4, float* %44
	%45 = alloca float
	store float %5, float* %45
	%46 = alloca float
	store float %6, float* %46
	%47 = alloca float
	store float %7, float* %47
	%48 = alloca float
	store float %8, float* %48
	%49 = alloca float
	store float %9, float* %49
	%50 = alloca float
	store float %10, float* %50
	%51 = alloca float
	store float %11, float* %51
	%52 = alloca float
	store float %12, float* %52
	%53 = alloca float
	store float %13, float* %53
	%54 = alloca float
	store float %14, float* %54
	%55 = alloca float
	store float %15, float* %55
	%56 = alloca float
	store float %16, float* %56
	%57 = alloca float
	store float %17, float* %57
	%58 = alloca float
	store float %18, float* %58
	%59 = alloca float
	store float %19, float* %59
	%60 = alloca float
	store float %20, float* %60
	%61 = alloca float
	store float %21, float* %61
	%62 = alloca float
	store float %22, float* %62
	%63 = alloca float
	store float %23, float* %63
	%64 = alloca float
	store float %24, float* %64
	%65 = alloca float
	store float %25, float* %65
	%66 = alloca float
	store float %26, float* %66
	%67 = alloca float
	store float %27, float* %67
	%68 = alloca float
	store float %28, float* %68
	%69 = alloca float
	store float %29, float* %69
	%70 = alloca float
	store float %30, float* %70
	%71 = alloca float
	store float %31, float* %71
	%72 = alloca float
	store float %32, float* %72
	%73 = alloca float
	store float %33, float* %73
	%74 = alloca float
	store float %34, float* %74
	%75 = alloca float
	store float %35, float* %75
	%76 = alloca float
	store float %36, float* %76
	%77 = alloca float
	store float %37, float* %77
	%78 = alloca float
	store float %38, float* %78
	%79 = alloca float
	store float %39, float* %79
	br label %b1
b1:
	%80 = load float, float* %79
	%81 = sitofp i32 0 to float
	%82 = fcmp one float %80, %81
	%83 = icmp ne i1 %82, 0
	br i1 %83, label %b2, label %b4
b2:
	%84 = load float, float* %40
	%85 = load float, float* %41
	%86 = fadd float %84, %85
	%87 = load float, float* %42
	%88 = fadd float %86, %87
	%89 = load float, float* %43
	%90 = fadd float %88, %89
	%91 = load float, float* %44
	%92 = load float, float* %45
	%93 = fadd float %91, %92
	%94 = load float, float* %46
	%95 = fadd float %93, %94
	%96 = load float, float* %47
	%97 = fadd float %95, %96
	%98 = load float, float* %48
	%99 = load float, float* %49
	%100 = fadd float %98, %99
	%101 = load float, float* %50
	%102 = fadd float %100, %101
	%103 = load float, float* %51
	%104 = fadd float %102, %103
	%105 = load float, float* %52
	%106 = load float, float* %53
	%107 = fadd float %105, %106
	%108 = load float, float* %54
	%109 = fadd float %107, %108
	%110 = load float, float* %55
	%111 = fadd float %109, %110
	%112 = load float, float* %56
	%113 = load float, float* %57
	%114 = fadd float %112, %113
	%115 = load float, float* %58
	%116 = fadd float %114, %115
	%117 = load float, float* %59
	%118 = fadd float %116, %117
	%119 = load float, float* %60
	%120 = load float, float* %61
	%121 = fadd float %119, %120
	%122 = load float, float* %62
	%123 = fadd float %121, %122
	%124 = load float, float* %63
	%125 = fadd float %123, %124
	%126 = load float, float* %64
	%127 = load float, float* %65
	%128 = fadd float %126, %127
	%129 = load float, float* %66
	%130 = fadd float %128, %129
	%131 = load float, float* %67
	%132 = fadd float %130, %131
	%133 = load float, float* %68
	%134 = load float, float* %69
	%135 = fadd float %133, %134
	%136 = load float, float* %70
	%137 = fadd float %135, %136
	%138 = load float, float* %71
	%139 = fadd float %137, %138
	%140 = load float, float* %72
	%141 = load float, float* %73
	%142 = fadd float %140, %141
	%143 = load float, float* %74
	%144 = fadd float %142, %143
	%145 = load float, float* %75
	%146 = fadd float %144, %145
	%147 = load float, float* %76
	%148 = load float, float* %77
	%149 = fadd float %147, %148
	%150 = load float, float* %78
	%151 = fadd float %149, %150
	%152 = load float, float* %79
	%153 = fadd float %151, %152
	%154 = alloca [10 x float]
	%155 = getelementptr [10 x float], [10 x float]* %154, i32 0, i32 0
	store float %90, float* %155
	%156 = getelementptr [10 x float], [10 x float]* %154, i32 0, i32 1
	store float %97, float* %156
	%157 = getelementptr [10 x float], [10 x float]* %154, i32 0, i32 2
	store float %104, float* %157
	%158 = getelementptr [10 x float], [10 x float]* %154, i32 0, i32 3
	store float %111, float* %158
	%159 = getelementptr [10 x float], [10 x float]* %154, i32 0, i32 4
	store float %118, float* %159
	%160 = getelementptr [10 x float], [10 x float]* %154, i32 0, i32 5
	store float %125, float* %160
	%161 = getelementptr [10 x float], [10 x float]* %154, i32 0, i32 6
	store float %132, float* %161
	%162 = getelementptr [10 x float], [10 x float]* %154, i32 0, i32 7
	store float %139, float* %162
	%163 = getelementptr [10 x float], [10 x float]* %154, i32 0, i32 8
	store float %146, float* %163
	%164 = getelementptr [10 x float], [10 x float]* %154, i32 0, i32 9
	store float %153, float* %164
	%165 = getelementptr [10 x float], [10 x float]* %154, i32 0, i32 0
	call void @putfarray(i32 10, float* %165)
	%166 = load i32, i32* @k
	%167 = getelementptr [10 x float], [10 x float]* %154, i32 0, i32 %166
	%168 = load float, float* %167
	ret float %168
b3:
	ret i32 0
b4:
	%169 = load float, float* %41
	%170 = load float, float* %42
	%171 = load float, float* %43
	%172 = load float, float* %44
	%173 = load float, float* %45
	%174 = load float, float* %46
	%175 = load float, float* %47
	%176 = load float, float* %48
	%177 = load float, float* %49
	%178 = load float, float* %50
	%179 = load float, float* %51
	%180 = load float, float* %52
	%181 = load float, float* %53
	%182 = load float, float* %54
	%183 = load float, float* %55
	%184 = load float, float* %56
	%185 = load float, float* %57
	%186 = load float, float* %58
	%187 = load float, float* %59
	%188 = load float, float* %60
	%189 = load float, float* %61
	%190 = load float, float* %62
	%191 = load float, float* %63
	%192 = load float, float* %64
	%193 = load float, float* %65
	%194 = load float, float* %66
	%195 = load float, float* %67
	%196 = load float, float* %68
	%197 = load float, float* %69
	%198 = load float, float* %70
	%199 = load float, float* %71
	%200 = load float, float* %72
	%201 = load float, float* %73
	%202 = load float, float* %74
	%203 = load float, float* %75
	%204 = load float, float* %76
	%205 = load float, float* %77
	%206 = load float, float* %78
	%207 = load float, float* %79
	%208 = load float, float* %40
	%209 = load float, float* %41
	%210 = fadd float %208, %209
	%211 = load float, float* %42
	%212 = fadd float %210, %211
	%213 = call float @params_f40(float %169, float %170, float %171, float %172, float %173, float %174, float %175, float %176, float %177, float %178, float %179, float %180, float %181, float %182, float %183, float %184, float %185, float %186, float %187, float %188, float %189, float %190, float %191, float %192, float %193, float %194, float %195, float %196, float %197, float %198, float %199, float %200, float %201, float %202, float %203, float %204, float %205, float %206, float %207, float %212)
	ret float %213
}

define float @params_f40_i24(i32 %0, i32 %1, i32 %2, float %3, i32 %4, i32 %5, i32 %6, float %7, float %8, float %9, i32 %10, float %11, float %12, i32 %13, float %14, i32 %15, float %16, float %17, float %18, float %19, float %20, float %21, i32 %22, float %23, i32 %24, i32 %25, float %26, float %27, float %28, float %29, float %30, i32 %31, float %32, i32 %33, float %34, float %35, float %36, float %37, i32 %38, i32 %39, float %40, float %41, float %42, i32 %43, float %44, i32 %45, i32 %46, float %47, float %48, float %49, float %50, i32 %51, i32 %52, i32 %53, float %54, float %55, float %56, float %57, float %58, float %59, i32 %60, float %61, i32 %62, float %63) {
b0:
	%64 = alloca i32
	store i32 %0, i32* %64
	%65 = alloca i32
	store i32 %1, i32* %65
	%66 = alloca i32
	store i32 %2, i32* %66
	%67 = alloca float
	store float %3, float* %67
	%68 = alloca i32
	store i32 %4, i32* %68
	%69 = alloca i32
	store i32 %5, i32* %69
	%70 = alloca i32
	store i32 %6, i32* %70
	%71 = alloca float
	store float %7, float* %71
	%72 = alloca float
	store float %8, float* %72
	%73 = alloca float
	store float %9, float* %73
	%74 = alloca i32
	store i32 %10, i32* %74
	%75 = alloca float
	store float %11, float* %75
	%76 = alloca float
	store float %12, float* %76
	%77 = alloca i32
	store i32 %13, i32* %77
	%78 = alloca float
	store float %14, float* %78
	%79 = alloca i32
	store i32 %15, i32* %79
	%80 = alloca float
	store float %16, float* %80
	%81 = alloca float
	store float %17, float* %81
	%82 = alloca float
	store float %18, float* %82
	%83 = alloca float
	store float %19, float* %83
	%84 = alloca float
	store float %20, float* %84
	%85 = alloca float
	store float %21, float* %85
	%86 = alloca i32
	store i32 %22, i32* %86
	%87 = alloca float
	store float %23, float* %87
	%88 = alloca i32
	store i32 %24, i32* %88
	%89 = alloca i32
	store i32 %25, i32* %89
	%90 = alloca float
	store float %26, float* %90
	%91 = alloca float
	store float %27, float* %91
	%92 = alloca float
	store float %28, float* %92
	%93 = alloca float
	store float %29, float* %93
	%94 = alloca float
	store float %30, float* %94
	%95 = alloca i32
	store i32 %31, i32* %95
	%96 = alloca float
	store float %32, float* %96
	%97 = alloca i32
	store i32 %33, i32* %97
	%98 = alloca float
	store float %34, float* %98
	%99 = alloca float
	store float %35, float* %99
	%100 = alloca float
	store float %36, float* %100
	%101 = alloca float
	store float %37, float* %101
	%102 = alloca i32
	store i32 %38, i32* %102
	%103 = alloca i32
	store i32 %39, i32* %103
	%104 = alloca float
	store float %40, float* %104
	%105 = alloca float
	store float %41, float* %105
	%106 = alloca float
	store float %42, float* %106
	%107 = alloca i32
	store i32 %43, i32* %107
	%108 = alloca float
	store float %44, float* %108
	%109 = alloca i32
	store i32 %45, i32* %109
	%110 = alloca i32
	store i32 %46, i32* %110
	%111 = alloca float
	store float %47, float* %111
	%112 = alloca float
	store float %48, float* %112
	%113 = alloca float
	store float %49, float* %113
	%114 = alloca float
	store float %50, float* %114
	%115 = alloca i32
	store i32 %51, i32* %115
	%116 = alloca i32
	store i32 %52, i32* %116
	%117 = alloca i32
	store i32 %53, i32* %117
	%118 = alloca float
	store float %54, float* %118
	%119 = alloca float
	store float %55, float* %119
	%120 = alloca float
	store float %56, float* %120
	%121 = alloca float
	store float %57, float* %121
	%122 = alloca float
	store float %58, float* %122
	%123 = alloca float
	store float %59, float* %123
	%124 = alloca i32
	store i32 %60, i32* %124
	%125 = alloca float
	store float %61, float* %125
	%126 = alloca i32
	store i32 %62, i32* %126
	%127 = alloca float
	store float %63, float* %127
	br label %b1
b1:
	%128 = load i32, i32* %64
	%129 = icmp ne i32 %128, 0
	%130 = icmp ne i1 %129, 0
	br i1 %130, label %b2, label %b4
b2:
	%131 = load float, float* %106
	%132 = load float, float* %82
	%133 = fadd float %131, %132
	%134 = load float, float* %125
	%135 = fadd float %133, %134
	%136 = load float, float* %75
	%137 = fadd float %135, %136
	%138 = load float, float* %67
	%139 = load float, float* %100
	%140 = fadd float %138, %139
	%141 = load float, float* %85
	%142 = fadd float %140, %141
	%143 = load float, float* %73
	%144 = fadd float %142, %143
	%145 = load float, float* %71
	%146 = load float, float* %93
	%147 = fadd float %145, %146
	%148 = load float, float* %105
	%149 = fadd float %147, %148
	%150 = load float, float* %83
	%151 = fadd float %149, %150
	%152 = load float, float* %81
	%153 = load float, float* %113
	%154 = fadd float %152, %153
	%155 = load float, float* %104
	%156 = fadd float %154, %155
	%157 = load float, float* %72
	%158 = fadd float %156, %157
	%159 = load float, float* %99
	%160 = load float, float* %123
	%161 = fadd float %159, %160
	%162 = load float, float* %118
	%163 = fadd float %161, %162
	%164 = load float, float* %119
	%165 = fadd float %163, %164
	%166 = load float, float* %90
	%167 = load float, float* %98
	%168 = fadd float %166, %167
	%169 = load float, float* %120
	%170 = fadd float %168, %169
	%171 = load float, float* %92
	%172 = fadd float %170, %171
	%173 = load float, float* %112
	%174 = load float, float* %94
	%175 = fadd float %173, %174
	%176 = load float, float* %121
	%177 = fadd float %175, %176
	%178 = load float, float* %111
	%179 = fadd float %177, %178
	%180 = load float, float* %76
	%181 = load float, float* %114
	%182 = fadd float %180, %181
	%183 = load float, float* %80
	%184 = fadd float %182, %183
	%185 = load float, float* %108
	%186 = fadd float %184, %185
	%187 = load float, float* %87
	%188 = load float, float* %91
	%189 = fadd float %187, %188
	%190 = load float, float* %101
	%191 = fadd float %189, %190
	%192 = load float, float* %127
	%193 = fadd float %191, %192
	%194 = load float, float* %122
	%195 = load float, float* %78
	%196 = fadd float %194, %195
	%197 = load float, float* %84
	%198 = fadd float %196, %197
	%199 = load float, float* %96
	%200 = fadd float %198, %199
	%201 = alloca [10 x float]
	%202 = getelementptr [10 x float], [10 x float]* %201, i32 0, i32 0
	store float %137, float* %202
	%203 = getelementptr [10 x float], [10 x float]* %201, i32 0, i32 1
	store float %144, float* %203
	%204 = getelementptr [10 x float], [10 x float]* %201, i32 0, i32 2
	store float %151, float* %204
	%205 = getelementptr [10 x float], [10 x float]* %201, i32 0, i32 3
	store float %158, float* %205
	%206 = getelementptr [10 x float], [10 x float]* %201, i32 0, i32 4
	store float %165, float* %206
	%207 = getelementptr [10 x float], [10 x float]* %201, i32 0, i32 5
	store float %172, float* %207
	%208 = getelementptr [10 x float], [10 x float]* %201, i32 0, i32 6
	store float %179, float* %208
	%209 = getelementptr [10 x float], [10 x float]* %201, i32 0, i32 7
	store float %186, float* %209
	%210 = getelementptr [10 x float], [10 x float]* %201, i32 0, i32 8
	store float %193, float* %210
	%211 = getelementptr [10 x float], [10 x float]* %201, i32 0, i32 9
	store float %200, float* %211
	%212 = load i32, i32* %77
	%213 = load i32, i32* %68
	%214 = add i32 %212, %213
	%215 = load i32, i32* %65
	%216 = add i32 %214, %215
	%217 = load i32, i32* %115
	%218 = load i32, i32* %69
	%219 = add i32 %217, %218
	%220 = load i32, i32* %70
	%221 = add i32 %219, %220
	%222 = load i32, i32* %66
	%223 = load i32, i32* %86
	%224 = add i32 %222, %223
	%225 = load i32, i32* %95
	%226 = add i32 %224, %225
	%227 = load i32, i32* %103
	%228 = load i32, i32* %88
	%229 = add i32 %227, %228
	%230 = load i32, i32* %109
	%231 = add i32 %229, %230
	%232 = load i32, i32* %107
	%233 = load i32, i32* %89
	%234 = add i32 %232, %233
	%235 = load i32, i32* %126
	%236 = add i32 %234, %235
	%237 = load i32, i32* %124
	%238 = load i32, i32* %110
	%239 = add i32 %237, %238
	%240 = load i32, i32* %97
	%241 = add i32 %239, %240
	%242 = load i32, i32* %102
	%243 = load i32, i32* %79
	%244 = add i32 %242, %243
	%245 = load i32, i32* %117
	%246 = add i32 %244, %245
	%247 = load i32, i32* %116
	%248 = load i32, i32* %74
	%249 = add i32 %247, %248
	%250 = load i32, i32* %64
	%251 = add i32 %249, %250
	%252 = alloca [8 x i32]
	%253 = getelementptr [8 x i32], [8 x i32]* %252, i32 0, i32 0
	store i32 %216, i32* %253
	%254 = getelementptr [8 x i32], [8 x i32]* %252, i32 0, i32 1
	store i32 %221, i32* %254
	%255 = getelementptr [8 x i32], [8 x i32]* %252, i32 0, i32 2
	store i32 %226, i32* %255
	%256 = getelementptr [8 x i32], [8 x i32]* %252, i32 0, i32 3
	store i32 %231, i32* %256
	%257 = getelementptr [8 x i32], [8 x i32]* %252, i32 0, i32 4
	store i32 %236, i32* %257
	%258 = getelementptr [8 x i32], [8 x i32]* %252, i32 0, i32 5
	store i32 %241, i32* %258
	%259 = getelementptr [8 x i32], [8 x i32]* %252, i32 0, i32 6
	store i32 %246, i32* %259
	%260 = getelementptr [8 x i32], [8 x i32]* %252, i32 0, i32 7
	store i32 %251, i32* %260
	%261 = getelementptr [10 x float], [10 x float]* %201, i32 0, i32 0
	call void @putfarray(i32 10, float* %261)
	%262 = getelementptr [8 x i32], [8 x i32]* %252, i32 0, i32 0
	call void @putarray(i32 8, i32* %262)
	%263 = alloca i32
	store i32 0, i32* %263
	br label %b5
b3:
	ret i32 0
b4:
	%264 = load i32, i32* %68
	%265 = load i32, i32* %65
	%266 = load i32, i32* %66
	%267 = load float, float* %67
	%268 = load i32, i32* %68
	%269 = load i32, i32* %69
	%270 = load i32, i32* %70
	%271 = load float, float* %71
	%272 = load float, float* %72
	%273 = load float, float* %73
	%274 = load i32, i32* %74
	%275 = load float, float* %75
	%276 = load float, float* %76
	%277 = load i32, i32* %77
	%278 = load float, float* %78
	%279 = load i32, i32* %79
	%280 = load float, float* %80
	%281 = load float, float* %81
	%282 = load float, float* %82
	%283 = load float, float* %83
	%284 = load float, float* %84
	%285 = load float, float* %85
	%286 = load i32, i32* %86
	%287 = load float, float* %87
	%288 = load i32, i32* %88
	%289 = load i32, i32* %89
	%290 = load float, float* %90
	%291 = load float, float* %91
	%292 = load float, float* %92
	%293 = load float, float* %93
	%294 = load float, float* %94
	%295 = load i32, i32* %95
	%296 = load float, float* %96
	%297 = load i32, i32* %97
	%298 = load float, float* %98
	%299 = load float, float* %99
	%300 = load float, float* %100
	%301 = load float, float* %101
	%302 = load i32, i32* %102
	%303 = load i32, i32* %103
	%304 = load float, float* %104
	%305 = load float, float* %105
	%306 = load float, float* %106
	%307 = load i32, i32* %107
	%308 = load float, float* %108
	%309 = load i32, i32* %109
	%310 = load i32, i32* %110
	%311 = load float, float* %111
	%312 = load float, float* %112
	%313 = load float, float* %113
	%314 = load float, float* %114
	%315 = load i32, i32* %115
	%316 = load i32, i32* %116
	%317 = load i32, i32* %117
	%318 = load float, float* %118
	%319 = load float, float* %119
	%320 = load float, float* %120
	%321 = load float, float* %121
	%322 = load float, float* %122
	%323 = load float, float* %123
	%324 = load i32, i32* %124
	%325 = load float, float* %125
	%326 = load i32, i32* %126
	%327 = load float, float* %127
	%328 = call float @params_f40_i24(i32 %264, i32 %265, i32 %266, float %267, i32 %268, i32 %269, i32 %270, float %271, float %272, float %273, i32 %274, float %275, float %276, i32 %277, float %278, i32 %279, float %280, float %281, float %282, float %283, float %284, float %285, i32 %286, float %287, i32 %288, i32 %289, float %290, float %291, float %292, float %293, float %294, i32 %295, float %296, i32 %297, float %298, float %299, float %300, float %301, i32 %302, i32 %303, float %304, float %305, float %306, i32 %307, float %308, i32 %309, i32 %310, float %311, float %312, float %313, float %314, i32 %315, i32 %316, i32 %317, float %318, float %319, float %320, float %321, float %322, float %323, i32 %324, float %325, i32 %326, float %327)
	ret float %328
b5:
	%329 = load i32, i32* %263
	%330 = icmp slt i32 %329, 8
	%331 = icmp ne i1 %330, 0
	br i1 %331, label %b6, label %b7
b6:
	%332 = load i32, i32* %263
	%333 = getelementptr [8 x i32], [8 x i32]* %252, i32 0, i32 %332
	%334 = load i32, i32* %263
	%335 = getelementptr [8 x i32], [8 x i32]* %252, i32 0, i32 %334
	%336 = load i32, i32* %335
	%337 = load i32, i32* %263
	%338 = getelementptr [10 x float], [10 x float]* %201, i32 0, i32 %337
	%339 = load float, float* %338
	%340 = sitofp i32 %336 to float
	%341 = fsub float %340, %339
	%342 = fptosi float %341 to i32
	store i32 %342, i32* %333
	%343 = load i32, i32* %263
	%344 = add i32 %343, 1
	store i32 %344, i32* %263
	br label %b5
b7:
	%345 = load i32, i32* @k
	%346 = getelementptr [8 x i32], [8 x i32]* %252, i32 0, i32 %345
	%347 = load i32, i32* %346
	%348 = sitofp i32 %347 to float
	ret float %348
}

define float @params_fa40(float* %0, float* %1, float* %2, float* %3, float* %4, float* %5, float* %6, float* %7, float* %8, float* %9, float* %10, float* %11, float* %12, float* %13, float* %14, float* %15, float* %16, float* %17, float* %18, float* %19, float* %20, float* %21, float* %22, float* %23, float* %24, float* %25, float* %26, float* %27, float* %28, float* %29, float* %30, float* %31, float* %32, float* %33, float* %34, float* %35, float* %36, float* %37, float* %38, float* %39) {
b0:
	%40 = alloca float*
	store float* %0, float** %40
	%41 = alloca float*
	store float* %1, float** %41
	%42 = alloca float*
	store float* %2, float** %42
	%43 = alloca float*
	store float* %3, float** %43
	%44 = alloca float*
	store float* %4, float** %44
	%45 = alloca float*
	store float* %5, float** %45
	%46 = alloca float*
	store float* %6, float** %46
	%47 = alloca float*
	store float* %7, float** %47
	%48 = alloca float*
	store float* %8, float** %48
	%49 = alloca float*
	store float* %9, float** %49
	%50 = alloca float*
	store float* %10, float** %50
	%51 = alloca float*
	store float* %11, float** %51
	%52 = alloca float*
	store float* %12, float** %52
	%53 = alloca float*
	store float* %13, float** %53
	%54 = alloca float*
	store float* %14, float** %54
	%55 = alloca float*
	store float* %15, float** %55
	%56 = alloca float*
	store float* %16, float** %56
	%57 = alloca float*
	store float* %17, float** %57
	%58 = alloca float*
	store float* %18, float** %58
	%59 = alloca float*
	store float* %19, float** %59
	%60 = alloca float*
	store float* %20, float** %60
	%61 = alloca float*
	store float* %21, float** %61
	%62 = alloca float*
	store float* %22, float** %62
	%63 = alloca float*
	store float* %23, float** %63
	%64 = alloca float*
	store float* %24, float** %64
	%65 = alloca float*
	store float* %25, float** %65
	%66 = alloca float*
	store float* %26, float** %66
	%67 = alloca float*
	store float* %27, float** %67
	%68 = alloca float*
	store float* %28, float** %68
	%69 = alloca float*
	store float* %29, float** %69
	%70 = alloca float*
	store float* %30, float** %70
	%71 = alloca float*
	store float* %31, float** %71
	%72 = alloca float*
	store float* %32, float** %72
	%73 = alloca float*
	store float* %33, float** %73
	%74 = alloca float*
	store float* %34, float** %74
	%75 = alloca float*
	store float* %35, float** %75
	%76 = alloca float*
	store float* %36, float** %76
	%77 = alloca float*
	store float* %37, float** %77
	%78 = alloca float*
	store float* %38, float** %78
	%79 = alloca float*
	store float* %39, float** %79
	br label %b1
b1:
	%80 = load float*, float** %40
	%81 = load i32, i32* @k
	%82 = getelementptr float, float* %80, i32 %81
	%83 = load float, float* %82
	%84 = load float*, float** %41
	%85 = load i32, i32* @k
	%86 = getelementptr float, float* %84, i32 %85
	%87 = load float, float* %86
	%88 = fadd float %83, %87
	%89 = load float*, float** %42
	%90 = load i32, i32* @k
	%91 = getelementptr float, float* %89, i32 %90
	%92 = load float, float* %91
	%93 = fadd float %88, %92
	%94 = load float*, float** %43
	%95 = load i32, i32* @k
	%96 = getelementptr float, float* %94, i32 %95
	%97 = load float, float* %96
	%98 = fadd float %93, %97
	%99 = load float*, float** %44
	%100 = load i32, i32* @k
	%101 = getelementptr float, float* %99, i32 %100
	%102 = load float, float* %101
	%103 = load float*, float** %45
	%104 = load i32, i32* @k
	%105 = getelementptr float, float* %103, i32 %104
	%106 = load float, float* %105
	%107 = fadd float %102, %106
	%108 = load float*, float** %46
	%109 = load i32, i32* @k
	%110 = getelementptr float, float* %108, i32 %109
	%111 = load float, float* %110
	%112 = fadd float %107, %111
	%113 = load float*, float** %47
	%114 = load i32, i32* @k
	%115 = getelementptr float, float* %113, i32 %114
	%116 = load float, float* %115
	%117 = fadd float %112, %116
	%118 = load float*, float** %48
	%119 = load i32, i32* @k
	%120 = getelementptr float, float* %118, i32 %119
	%121 = load float, float* %120
	%122 = load float*, float** %49
	%123 = load i32, i32* @k
	%124 = getelementptr float, float* %122, i32 %123
	%125 = load float, float* %124
	%126 = fadd float %121, %125
	%127 = load float*, float** %50
	%128 = load i32, i32* @k
	%129 = getelementptr float, float* %127, i32 %128
	%130 = load float, float* %129
	%131 = fadd float %126, %130
	%132 = load float*, float** %51
	%133 = load i32, i32* @k
	%134 = getelementptr float, float* %132, i32 %133
	%135 = load float, float* %134
	%136 = fadd float %131, %135
	%137 = load float*, float** %52
	%138 = load i32, i32* @k
	%139 = getelementptr float, float* %137, i32 %138
	%140 = load float, float* %139
	%141 = load float*, float** %53
	%142 = load i32, i32* @k
	%143 = getelementptr float, float* %141, i32 %142
	%144 = load float, float* %143
	%145 = fadd float %140, %144
	%146 = load float*, float** %54
	%147 = load i32, i32* @k
	%148 = getelementptr float, float* %146, i32 %147
	%149 = load float, float* %148
	%150 = fadd float %145, %149
	%151 = load float*, float** %55
	%152 = load i32, i32* @k
	%153 = getelementptr float, float* %151, i32 %152
	%154 = load float, float* %153
	%155 = fadd float %150, %154
	%156 = load float*, float** %56
	%157 = load i32, i32* @k
	%158 = getelementptr float, float* %156, i32 %157
	%159 = load float, float* %158
	%160 = load float*, float** %57
	%161 = load i32, i32* @k
	%162 = getelementptr float, float* %160, i32 %161
	%163 = load float, float* %162
	%164 = fadd float %159, %163
	%165 = load float*, float** %58
	%166 = load i32, i32* @k
	%167 = getelementptr float, float* %165, i32 %166
	%168 = load float, float* %167
	%169 = fadd float %164, %168
	%170 = load float*, float** %59
	%171 = load i32, i32* @k
	%172 = getelementptr float, float* %170, i32 %171
	%173 = load float, float* %172
	%174 = fadd float %169, %173
	%175 = load float*, float** %60
	%176 = load i32, i32* @k
	%177 = getelementptr float, float* %175, i32 %176
	%178 = load float, float* %177
	%179 = load float*, float** %61
	%180 = load i32, i32* @k
	%181 = getelementptr float, float* %179, i32 %180
	%182 = load float, float* %181
	%183 = fadd float %178, %182
	%184 = load float*, float** %62
	%185 = load i32, i32* @k
	%186 = getelementptr float, float* %184, i32 %185
	%187 = load float, float* %186
	%188 = fadd float %183, %187
	%189 = load float*, float** %63
	%190 = load i32, i32* @k
	%191 = getelementptr float, float* %189, i32 %190
	%192 = load float, float* %191
	%193 = fadd float %188, %192
	%194 = load float*, float** %64
	%195 = load i32, i32* @k
	%196 = getelementptr float, float* %194, i32 %195
	%197 = load float, float* %196
	%198 = load float*, float** %65
	%199 = load i32, i32* @k
	%200 = getelementptr float, float* %198, i32 %199
	%201 = load float, float* %200
	%202 = fadd float %197, %201
	%203 = load float*, float** %66
	%204 = load i32, i32* @k
	%205 = getelementptr float, float* %203, i32 %204
	%206 = load float, float* %205
	%207 = fadd float %202, %206
	%208 = load float*, float** %67
	%209 = load i32, i32* @k
	%210 = getelementptr float, float* %208, i32 %209
	%211 = load float, float* %210
	%212 = fadd float %207, %211
	%213 = load float*, float** %68
	%214 = load i32, i32* @k
	%215 = getelementptr float, float* %213, i32 %214
	%216 = load float, float* %215
	%217 = load float*, float** %69
	%218 = load i32, i32* @k
	%219 = getelementptr float, float* %217, i32 %218
	%220 = load float, float* %219
	%221 = fadd float %216, %220
	%222 = load float*, float** %70
	%223 = load i32, i32* @k
	%224 = getelementptr float, float* %222, i32 %223
	%225 = load float, float* %224
	%226 = fadd float %221, %225
	%227 = load float*, float** %71
	%228 = load i32, i32* @k
	%229 = getelementptr float, float* %227, i32 %228
	%230 = load float, float* %229
	%231 = fadd float %226, %230
	%232 = load float*, float** %72
	%233 = load i32, i32* @k
	%234 = getelementptr float, float* %232, i32 %233
	%235 = load float, float* %234
	%236 = load float*, float** %73
	%237 = load i32, i32* @k
	%238 = getelementptr float, float* %236, i32 %237
	%239 = load float, float* %238
	%240 = fadd float %235, %239
	%241 = load float*, float** %74
	%242 = load i32, i32* @k
	%243 = getelementptr float, float* %241, i32 %242
	%244 = load float, float* %243
	%245 = fadd float %240, %244
	%246 = load float*, float** %75
	%247 = load i32, i32* @k
	%248 = getelementptr float, float* %246, i32 %247
	%249 = load float, float* %248
	%250 = fadd float %245, %249
	%251 = load float*, float** %76
	%252 = load i32, i32* @k
	%253 = getelementptr float, float* %251, i32 %252
	%254 = load float, float* %253
	%255 = load float*, float** %77
	%256 = load i32, i32* @k
	%257 = getelementptr float, float* %255, i32 %256
	%258 = load float, float* %257
	%259 = fadd float %254, %258
	%260 = load float*, float** %78
	%261 = load i32, i32* @k
	%262 = getelementptr float, float* %260, i32 %261
	%263 = load float, float* %262
	%264 = fadd float %259, %263
	%265 = load float*, float** %79
	%266 = load i32, i32* @k
	%267 = getelementptr float, float* %265, i32 %266
	%268 = load float, float* %267
	%269 = fadd float %264, %268
	%270 = alloca [10 x float]
	%271 = getelementptr [10 x float], [10 x float]* %270, i32 0, i32 0
	store float %98, float* %271
	%272 = getelementptr [10 x float], [10 x float]* %270, i32 0, i32 1
	store float %117, float* %272
	%273 = getelementptr [10 x float], [10 x float]* %270, i32 0, i32 2
	store float %136, float* %273
	%274 = getelementptr [10 x float], [10 x float]* %270, i32 0, i32 3
	store float %155, float* %274
	%275 = getelementptr [10 x float], [10 x float]* %270, i32 0, i32 4
	store float %174, float* %275
	%276 = getelementptr [10 x float], [10 x float]* %270, i32 0, i32 5
	store float %193, float* %276
	%277 = getelementptr [10 x float], [10 x float]* %270, i32 0, i32 6
	store float %212, float* %277
	%278 = getelementptr [10 x float], [10 x float]* %270, i32 0, i32 7
	store float %231, float* %278
	%279 = getelementptr [10 x float], [10 x float]* %270, i32 0, i32 8
	store float %250, float* %279
	%280 = getelementptr [10 x float], [10 x float]* %270, i32 0, i32 9
	store float %269, float* %280
	%281 = load float*, float** %79
	%282 = load i32, i32* @k
	%283 = getelementptr float, float* %281, i32 %282
	%284 = load float, float* %283
	%285 = sitofp i32 0 to float
	%286 = fcmp one float %284, %285
	%287 = zext i1 %286 to i32
	%288 = icmp ne i32 %287, 0
	%289 = zext i1 %288 to i32
	%290 = sitofp i32 %289 to float
	%291 = fcmp one float %290, 0x0
	%292 = zext i1 %291 to i32
	%293 = sitofp i32 %292 to float
	%294 = fcmp one float %293, 0x0
	%295 = icmp ne i1 %294, 0
	br i1 %295, label %b2, label %b4
b2:
	%296 = getelementptr [10 x float], [10 x float]* %270, i32 0, i32 0
	call void @putfarray(i32 10, float* %296)
	%297 = load i32, i32* @k
	%298 = getelementptr [10 x float], [10 x float]* %270, i32 0, i32 %297
	%299 = load float, float* %298
	ret float %299
b3:
	ret i32 0
b4:
	%300 = load float*, float** %41
	%301 = load float*, float** %42
	%302 = load float*, float** %43
	%303 = load float*, float** %44
	%304 = load float*, float** %45
	%305 = load float*, float** %46
	%306 = load float*, float** %47
	%307 = load float*, float** %48
	%308 = load float*, float** %49
	%309 = load float*, float** %50
	%310 = load float*, float** %51
	%311 = load float*, float** %52
	%312 = load float*, float** %53
	%313 = load float*, float** %54
	%314 = load float*, float** %55
	%315 = load float*, float** %56
	%316 = load float*, float** %57
	%317 = load float*, float** %58
	%318 = load float*, float** %59
	%319 = load float*, float** %60
	%320 = load float*, float** %61
	%321 = load float*, float** %62
	%322 = load float*, float** %63
	%323 = load float*, float** %64
	%324 = load float*, float** %65
	%325 = load float*, float** %66
	%326 = load float*, float** %67
	%327 = load float*, float** %68
	%328 = load float*, float** %69
	%329 = load float*, float** %70
	%330 = load float*, float** %71
	%331 = load float*, float** %72
	%332 = load float*, float** %73
	%333 = load float*, float** %74
	%334 = load float*, float** %75
	%335 = load float*, float** %76
	%336 = load float*, float** %77
	%337 = load float*, float** %78
	%338 = load float*, float** %79
	%339 = getelementptr [10 x float], [10 x float]* %270, i32 0, i32 0
	%340 = call float @params_fa40(float* %300, float* %301, float* %302, float* %303, float* %304, float* %305, float* %306, float* %307, float* %308, float* %309, float* %310, float* %311, float* %312, float* %313, float* %314, float* %315, float* %316, float* %317, float* %318, float* %319, float* %320, float* %321, float* %322, float* %323, float* %324, float* %325, float* %326, float* %327, float* %328, float* %329, float* %330, float* %331, float* %332, float* %333, float* %334, float* %335, float* %336, float* %337, float* %338, float* %339)
	ret float %340
}

define i32 @params_mix(float %0, i32* %1, i32 %2, float* %3, float %4, i32 %5, float %6, float %7, float* %8, i32* %9, i32 %10, i32 %11, float* %12, i32* %13, i32* %14, i32 %15, float* %16, float* %17, float %18, float %19, float %20, float* %21, i32 %22, float %23, float %24, float %25, i32* %26, float* %27, i32* %28, i32* %29, float* %30, float %31, float %32, i32* %33, i32 %34, float* %35, float* %36, float %37, float %38, i32* %39, i32* %40, i32 %41, i32 %42, float %43, float %44, i32* %45, i32 %46, float* %47, i32 %48, i32* %49, i32* %50, float %51, float %52, float* %53, i32 %54, i32* %55, float* %56, float %57, i32 %58, float %59, float* %60, float* %61, float %62, i32 %63) {
b0:
	%64 = alloca float
	store float %0, float* %64
	%65 = alloca i32*
	store i32* %1, i32** %65
	%66 = alloca i32
	store i32 %2, i32* %66
	%67 = alloca float*
	store float* %3, float** %67
	%68 = alloca float
	store float %4, float* %68
	%69 = alloca i32
	store i32 %5, i32* %69
	%70 = alloca float
	store float %6, float* %70
	%71 = alloca float
	store float %7, float* %71
	%72 = alloca float*
	store float* %8, float** %72
	%73 = alloca i32*
	store i32* %9, i32** %73
	%74 = alloca i32
	store i32 %10, i32* %74
	%75 = alloca i32
	store i32 %11, i32* %75
	%76 = alloca float*
	store float* %12, float** %76
	%77 = alloca i32*
	store i32* %13, i32** %77
	%78 = alloca i32*
	store i32* %14, i32** %78
	%79 = alloca i32
	store i32 %15, i32* %79
	%80 = alloca float*
	store float* %16, float** %80
	%81 = alloca float*
	store float* %17, float** %81
	%82 = alloca float
	store float %18, float* %82
	%83 = alloca float
	store float %19, float* %83
	%84 = alloca float
	store float %20, float* %84
	%85 = alloca float*
	store float* %21, float** %85
	%86 = alloca i32
	store i32 %22, i32* %86
	%87 = alloca float
	store float %23, float* %87
	%88 = alloca float
	store float %24, float* %88
	%89 = alloca float
	store float %25, float* %89
	%90 = alloca i32*
	store i32* %26, i32** %90
	%91 = alloca float*
	store float* %27, float** %91
	%92 = alloca i32*
	store i32* %28, i32** %92
	%93 = alloca i32*
	store i32* %29, i32** %93
	%94 = alloca float*
	store float* %30, float** %94
	%95 = alloca float
	store float %31, float* %95
	%96 = alloca float
	store float %32, float* %96
	%97 = alloca i32*
	store i32* %33, i32** %97
	%98 = alloca i32
	store i32 %34, i32* %98
	%99 = alloca float*
	store float* %35, float** %99
	%100 = alloca float*
	store float* %36, float** %100
	%101 = alloca float
	store float %37, float* %101
	%102 = alloca float
	store float %38, float* %102
	%103 = alloca i32*
	store i32* %39, i32** %103
	%104 = alloca i32*
	store i32* %40, i32** %104
	%105 = alloca i32
	store i32 %41, i32* %105
	%106 = alloca i32
	store i32 %42, i32* %106
	%107 = alloca float
	store float %43, float* %107
	%108 = alloca float
	store float %44, float* %108
	%109 = alloca i32*
	store i32* %45, i32** %109
	%110 = alloca i32
	store i32 %46, i32* %110
	%111 = alloca float*
	store float* %47, float** %111
	%112 = alloca i32
	store i32 %48, i32* %112
	%113 = alloca i32*
	store i32* %49, i32** %113
	%114 = alloca i32*
	store i32* %50, i32** %114
	%115 = alloca float
	store float %51, float* %115
	%116 = alloca float
	store float %52, float* %116
	%117 = alloca float*
	store float* %53, float** %117
	%118 = alloca i32
	store i32 %54, i32* %118
	%119 = alloca i32*
	store i32* %55, i32** %119
	%120 = alloca float*
	store float* %56, float** %120
	%121 = alloca float
	store float %57, float* %121
	%122 = alloca i32
	store i32 %58, i32* %122
	%123 = alloca float
	store float %59, float* %123
	%124 = alloca float*
	store float* %60, float** %124
	%125 = alloca float*
	store float* %61, float** %125
	%126 = alloca float
	store float %62, float* %126
	%127 = alloca i32
	store i32 %63, i32* %127
	br label %b1
b1:
	%128 = load float, float* %64
	%129 = load float*, float** %67
	%130 = load i32, i32* @k
	%131 = getelementptr float, float* %129, i32 %130
	%132 = load float, float* %131
	%133 = fadd float %128, %132
	%134 = load float, float* %68
	%135 = fadd float %133, %134
	%136 = load float, float* %70
	%137 = fadd float %135, %136
	%138 = load float, float* %71
	%139 = load float*, float** %72
	%140 = load i32, i32* @k
	%141 = getelementptr float, float* %139, i32 %140
	%142 = load float, float* %141
	%143 = fadd float %138, %142
	%144 = load float*, float** %76
	%145 = load i32, i32* @k
	%146 = getelementptr float, float* %144, i32 %145
	%147 = load float, float* %146
	%148 = fadd float %143, %147
	%149 = load float*, float** %80
	%150 = load i32, i32* @k
	%151 = getelementptr float, float* %149, i32 %150
	%152 = load float, float* %151
	%153 = fadd float %148, %152
	%154 = load float*, float** %81
	%155 = load i32, i32* @k
	%156 = getelementptr float, float* %154, i32 %155
	%157 = load float, float* %156
	%158 = load float, float* %82
	%159 = fadd float %157, %158
	%160 = load float, float* %83
	%161 = fadd float %159, %160
	%162 = load float, float* %84
	%163 = fadd float %161, %162
	%164 = load float*, float** %85
	%165 = load i32, i32* @k
	%166 = getelementptr float, float* %164, i32 %165
	%167 = load float, float* %166
	%168 = load float, float* %87
	%169 = fadd float %167, %168
	%170 = load float, float* %88
	%171 = fadd float %169, %170
	%172 = load float, float* %89
	%173 = fadd float %171, %172
	%174 = load float*, float** %91
	%175 = load i32, i32* @k
	%176 = getelementptr float, float* %174, i32 %175
	%177 = load float, float* %176
	%178 = load float*, float** %94
	%179 = load i32, i32* @k
	%180 = getelementptr float, float* %178, i32 %179
	%181 = load float, float* %180
	%182 = fadd float %177, %181
	%183 = load float, float* %95
	%184 = fadd float %182, %183
	%185 = load float, float* %96
	%186 = fadd float %184, %185
	%187 = load float*, float** %99
	%188 = load i32, i32* @k
	%189 = getelementptr float, float* %187, i32 %188
	%190 = load float, float* %189
	%191 = load float*, float** %100
	%192 = load i32, i32* @k
	%193 = getelementptr float, float* %191, i32 %192
	%194 = load float, float* %193
	%195 = fadd float %190, %194
	%196 = load float, float* %101
	%197 = fadd float %195, %196
	%198 = load float, float* %102
	%199 = fadd float %197, %198
	%200 = load float, float* %107
	%201 = load float, float* %108
	%202 = fadd float %200, %201
	%203 = load float*, float** %111
	%204 = load i32, i32* @k
	%205 = getelementptr float, float* %203, i32 %204
	%206 = load float, float* %205
	%207 = fadd float %202, %206
	%208 = load float, float* %115
	%209 = fadd float %207, %208
	%210 = load float, float* %116
	%211 = load float*, float** %117
	%212 = load i32, i32* @k
	%213 = getelementptr float, float* %211, i32 %212
	%214 = load float, float* %213
	%215 = fadd float %210, %214
	%216 = load float*, float** %120
	%217 = load i32, i32* @k
	%218 = getelementptr float, float* %216, i32 %217
	%219 = load float, float* %218
	%220 = fadd float %215, %219
	%221 = load float, float* %121
	%222 = fadd float %220, %221
	%223 = load float, float* %123
	%224 = load float*, float** %124
	%225 = load i32, i32* @k
	%226 = getelementptr float, float* %224, i32 %225
	%227 = load float, float* %226
	%228 = fadd float %223, %227
	%229 = load float*, float** %125
	%230 = load i32, i32* @k
	%231 = getelementptr float, float* %229, i32 %230
	%232 = load float, float* %231
	%233 = fadd float %228, %232
	%234 = load float, float* %126
	%235 = fadd float %233, %234
	%236 = alloca [10 x float]
	%237 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 0
	store float %137, float* %237
	%238 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 1
	store float %153, float* %238
	%239 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 2
	store float %163, float* %239
	%240 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 3
	store float %173, float* %240
	%241 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 4
	store float %186, float* %241
	%242 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 5
	store float %199, float* %242
	%243 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 6
	store float %209, float* %243
	%244 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 7
	store float %222, float* %244
	%245 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 8
	store float %235, float* %245
	%246 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 9
	store float 0.0, float* %246
	%247 = load i32*, i32** %65
	%248 = load i32, i32* @k
	%249 = getelementptr i32, i32* %247, i32 %248
	%250 = load i32, i32* %249
	%251 = load i32, i32* %66
	%252 = add i32 %250, %251
	%253 = load i32, i32* %69
	%254 = add i32 %252, %253
	%255 = load i32*, i32** %73
	%256 = load i32, i32* @k
	%257 = getelementptr i32, i32* %255, i32 %256
	%258 = load i32, i32* %257
	%259 = load i32, i32* %74
	%260 = add i32 %258, %259
	%261 = load i32, i32* %75
	%262 = add i32 %260, %261
	%263 = load i32*, i32** %77
	%264 = load i32, i32* @k
	%265 = getelementptr i32, i32* %263, i32 %264
	%266 = load i32, i32* %265
	%267 = load i32*, i32** %78
	%268 = load i32, i32* @k
	%269 = getelementptr i32, i32* %267, i32 %268
	%270 = load i32, i32* %269
	%271 = add i32 %266, %270
	%272 = load i32, i32* %79
	%273 = add i32 %271, %272
	%274 = load i32, i32* %86
	%275 = load i32*, i32** %90
	%276 = load i32, i32* @k
	%277 = getelementptr i32, i32* %275, i32 %276
	%278 = load i32, i32* %277
	%279 = add i32 %274, %278
	%280 = load i32*, i32** %92
	%281 = load i32, i32* @k
	%282 = getelementptr i32, i32* %280, i32 %281
	%283 = load i32, i32* %282
	%284 = add i32 %279, %283
	%285 = load i32*, i32** %93
	%286 = load i32, i32* @k
	%287 = getelementptr i32, i32* %285, i32 %286
	%288 = load i32, i32* %287
	%289 = load i32*, i32** %97
	%290 = load i32, i32* @k
	%291 = getelementptr i32, i32* %289, i32 %290
	%292 = load i32, i32* %291
	%293 = add i32 %288, %292
	%294 = load i32, i32* %98
	%295 = add i32 %293, %294
	%296 = load i32*, i32** %103
	%297 = load i32, i32* @k
	%298 = getelementptr i32, i32* %296, i32 %297
	%299 = load i32, i32* %298
	%300 = load i32*, i32** %104
	%301 = load i32, i32* @k
	%302 = getelementptr i32, i32* %300, i32 %301
	%303 = load i32, i32* %302
	%304 = add i32 %299, %303
	%305 = load i32, i32* %105
	%306 = add i32 %304, %305
	%307 = load i32, i32* %106
	%308 = load i32*, i32** %109
	%309 = load i32, i32* @k
	%310 = getelementptr i32, i32* %308, i32 %309
	%311 = load i32, i32* %310
	%312 = add i32 %307, %311
	%313 = load i32, i32* %110
	%314 = add i32 %312, %313
	%315 = load i32, i32* %112
	%316 = load i32*, i32** %113
	%317 = load i32, i32* @k
	%318 = getelementptr i32, i32* %316, i32 %317
	%319 = load i32, i32* %318
	%320 = add i32 %315, %319
	%321 = load i32*, i32** %114
	%322 = load i32, i32* @k
	%323 = getelementptr i32, i32* %321, i32 %322
	%324 = load i32, i32* %323
	%325 = add i32 %320, %324
	%326 = load i32, i32* %118
	%327 = load i32*, i32** %119
	%328 = load i32, i32* @k
	%329 = getelementptr i32, i32* %327, i32 %328
	%330 = load i32, i32* %329
	%331 = add i32 %326, %330
	%332 = load i32, i32* %122
	%333 = add i32 %331, %332
	%334 = load i32, i32* %127
	%335 = add i32 %333, %334
	%336 = alloca [10 x i32]
	%337 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 0
	store i32 %254, i32* %337
	%338 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 1
	store i32 %262, i32* %338
	%339 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 2
	store i32 %273, i32* %339
	%340 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 3
	store i32 %284, i32* %340
	%341 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 4
	store i32 %295, i32* %341
	%342 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 5
	store i32 %306, i32* %342
	%343 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 6
	store i32 %314, i32* %343
	%344 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 7
	store i32 %325, i32* %344
	%345 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 8
	store i32 %335, i32* %345
	%346 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 9
	store i32 0, i32* %346
	%347 = load i32, i32* %127
	%348 = icmp ne i32 %347, 0
	%349 = icmp ne i1 %348, 0
	br i1 %349, label %b2, label %b4
b2:
	%350 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 0
	call void @putfarray(i32 10, float* %350)
	%351 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 0
	call void @putarray(i32 10, i32* %351)
	%352 = alloca i32
	store i32 0, i32* %352
	br label %b5
b3:
	ret i32 0
b4:
	%353 = load float, float* %64
	%354 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 0
	%355 = load i32, i32* %66
	%356 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 0
	%357 = load float, float* %68
	%358 = load i32, i32* %69
	%359 = load float, float* %70
	%360 = load float, float* %71
	%361 = load float*, float** %72
	%362 = load i32*, i32** %73
	%363 = load i32, i32* %74
	%364 = load i32, i32* %75
	%365 = load float*, float** %76
	%366 = load i32*, i32** %77
	%367 = load i32*, i32** %78
	%368 = load i32, i32* %79
	%369 = load float*, float** %80
	%370 = load float*, float** %81
	%371 = load float, float* %82
	%372 = load float, float* %83
	%373 = load float, float* %84
	%374 = load float*, float** %85
	%375 = load i32, i32* %86
	%376 = load float, float* %87
	%377 = load float, float* %88
	%378 = load float, float* %89
	%379 = load i32*, i32** %90
	%380 = load float*, float** %91
	%381 = load i32*, i32** %92
	%382 = load i32*, i32** %93
	%383 = load float*, float** %94
	%384 = load float, float* %95
	%385 = load float, float* %96
	%386 = load i32*, i32** %97
	%387 = load i32, i32* %98
	%388 = load float*, float** %99
	%389 = load float*, float** %100
	%390 = load float, float* %101
	%391 = load float, float* %102
	%392 = load i32*, i32** %103
	%393 = load i32*, i32** %104
	%394 = load i32, i32* %105
	%395 = load i32, i32* %106
	%396 = load float, float* %107
	%397 = load float, float* %108
	%398 = load i32*, i32** %109
	%399 = load i32, i32* %110
	%400 = load float*, float** %111
	%401 = load i32, i32* %112
	%402 = load i32*, i32** %113
	%403 = load i32*, i32** %114
	%404 = load float, float* %115
	%405 = load float, float* %116
	%406 = load float*, float** %117
	%407 = load i32, i32* %118
	%408 = load i32*, i32** %119
	%409 = load float*, float** %120
	%410 = load float, float* %121
	%411 = load i32, i32* %122
	%412 = load float, float* %123
	%413 = load float*, float** %124
	%414 = load float*, float** %125
	%415 = load i32, i32* %127
	%416 = load float, float* %126
	%417 = sitofp i32 %415 to float
	%418 = fptosi float %416 to i32
	%419 = call i32 @params_mix(float %353, i32* %354, i32 %355, float* %356, float %357, i32 %358, float %359, float %360, float* %361, i32* %362, i32 %363, i32 %364, float* %365, i32* %366, i32* %367, i32 %368, float* %369, float* %370, float %371, float %372, float %373, float* %374, i32 %375, float %376, float %377, float %378, i32* %379, float* %380, i32* %381, i32* %382, float* %383, float %384, float %385, i32* %386, i32 %387, float* %388, float* %389, float %390, float %391, i32* %392, i32* %393, i32 %394, i32 %395, float %396, float %397, i32* %398, i32 %399, float* %400, i32 %401, i32* %402, i32* %403, float %404, float %405, float* %406, i32 %407, i32* %408, float* %409, float %410, i32 %411, float %412, float* %413, float* %414, float %417, i32 %418)
	ret i32 %419
b5:
	%420 = load i32, i32* %352
	%421 = icmp slt i32 %420, 10
	%422 = icmp ne i1 %421, 0
	br i1 %422, label %b6, label %b7
b6:
	%423 = load i32, i32* %352
	%424 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 %423
	%425 = load i32, i32* %352
	%426 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 %425
	%427 = load i32, i32* %426
	%428 = load i32, i32* %352
	%429 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 %428
	%430 = load float, float* %429
	%431 = sitofp i32 %427 to float
	%432 = fsub float %431, %430
	%433 = fptosi float %432 to i32
	store i32 %433, i32* %424
	%434 = load i32, i32* %352
	%435 = add i32 %434, 1
	store i32 %435, i32* %352
	br label %b5
b7:
	%436 = load i32, i32* @k
	%437 = getelementptr [10 x i32], [10 x i32]* %336, i32 0, i32 %436
	%438 = load i32, i32* %437
	%439 = getelementptr [10 x float], [10 x float]* %236, i32 0, i32 8
	%440 = load float, float* %439
	%441 = sitofp i32 %438 to float
	%442 = fmul float %441, %440
	%443 = fptosi float %442 to i32
	ret i32 %443
}

define i32 @main() {
b0:
	%0 = alloca [40 x [3 x float]]
	%1 = alloca [24 x [3 x i32]]
	%2 = alloca i32
	%3 = call i32 @getint()
	store i32 %3, i32* @k
	store i32 0, i32* %2
	br label %b1
b1:
	%4 = load i32, i32* %2
	%5 = icmp slt i32 %4, 40
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b2, label %b3
b2:
	%7 = load i32, i32* %2
	%8 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 %7
	%9 = getelementptr [3 x float], [3 x float]* %8, i32 0, i32 0
	%10 = call i32 @getfarray(float* %9)
	%11 = load i32, i32* %2
	%12 = add i32 %11, 1
	store i32 %12, i32* %2
	br label %b1
b3:
	store i32 0, i32* %2
	br label %b4
b4:
	%13 = load i32, i32* %2
	%14 = icmp slt i32 %13, 24
	%15 = icmp ne i1 %14, 0
	br i1 %15, label %b5, label %b6
b5:
	%16 = load i32, i32* %2
	%17 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 %16
	%18 = getelementptr [3 x i32], [3 x i32]* %17, i32 0, i32 0
	%19 = call i32 @getarray(i32* %18)
	%20 = load i32, i32* %2
	%21 = add i32 %20, 1
	store i32 %21, i32* %2
	br label %b4
b6:
	%22 = alloca float
	%23 = load i32, i32* @k
	%24 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 0, i32 %23
	%25 = load float, float* %24
	%26 = load i32, i32* @k
	%27 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 1, i32 %26
	%28 = load float, float* %27
	%29 = load i32, i32* @k
	%30 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 2, i32 %29
	%31 = load float, float* %30
	%32 = load i32, i32* @k
	%33 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 3, i32 %32
	%34 = load float, float* %33
	%35 = load i32, i32* @k
	%36 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 4, i32 %35
	%37 = load float, float* %36
	%38 = load i32, i32* @k
	%39 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 5, i32 %38
	%40 = load float, float* %39
	%41 = load i32, i32* @k
	%42 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 6, i32 %41
	%43 = load float, float* %42
	%44 = load i32, i32* @k
	%45 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 7, i32 %44
	%46 = load float, float* %45
	%47 = load i32, i32* @k
	%48 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 8, i32 %47
	%49 = load float, float* %48
	%50 = load i32, i32* @k
	%51 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 9, i32 %50
	%52 = load float, float* %51
	%53 = load i32, i32* @k
	%54 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 10, i32 %53
	%55 = load float, float* %54
	%56 = load i32, i32* @k
	%57 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 11, i32 %56
	%58 = load float, float* %57
	%59 = load i32, i32* @k
	%60 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 12, i32 %59
	%61 = load float, float* %60
	%62 = load i32, i32* @k
	%63 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 13, i32 %62
	%64 = load float, float* %63
	%65 = load i32, i32* @k
	%66 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 14, i32 %65
	%67 = load float, float* %66
	%68 = load i32, i32* @k
	%69 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 15, i32 %68
	%70 = load float, float* %69
	%71 = load i32, i32* @k
	%72 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 16, i32 %71
	%73 = load float, float* %72
	%74 = load i32, i32* @k
	%75 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 17, i32 %74
	%76 = load float, float* %75
	%77 = load i32, i32* @k
	%78 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 18, i32 %77
	%79 = load float, float* %78
	%80 = load i32, i32* @k
	%81 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 19, i32 %80
	%82 = load float, float* %81
	%83 = load i32, i32* @k
	%84 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 20, i32 %83
	%85 = load float, float* %84
	%86 = load i32, i32* @k
	%87 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 21, i32 %86
	%88 = load float, float* %87
	%89 = load i32, i32* @k
	%90 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 22, i32 %89
	%91 = load float, float* %90
	%92 = load i32, i32* @k
	%93 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 23, i32 %92
	%94 = load float, float* %93
	%95 = load i32, i32* @k
	%96 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 24, i32 %95
	%97 = load float, float* %96
	%98 = load i32, i32* @k
	%99 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 25, i32 %98
	%100 = load float, float* %99
	%101 = load i32, i32* @k
	%102 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 26, i32 %101
	%103 = load float, float* %102
	%104 = load i32, i32* @k
	%105 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 27, i32 %104
	%106 = load float, float* %105
	%107 = load i32, i32* @k
	%108 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 28, i32 %107
	%109 = load float, float* %108
	%110 = load i32, i32* @k
	%111 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 29, i32 %110
	%112 = load float, float* %111
	%113 = load i32, i32* @k
	%114 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 30, i32 %113
	%115 = load float, float* %114
	%116 = load i32, i32* @k
	%117 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 31, i32 %116
	%118 = load float, float* %117
	%119 = load i32, i32* @k
	%120 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 32, i32 %119
	%121 = load float, float* %120
	%122 = load i32, i32* @k
	%123 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 33, i32 %122
	%124 = load float, float* %123
	%125 = load i32, i32* @k
	%126 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 34, i32 %125
	%127 = load float, float* %126
	%128 = load i32, i32* @k
	%129 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 35, i32 %128
	%130 = load float, float* %129
	%131 = load i32, i32* @k
	%132 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 36, i32 %131
	%133 = load float, float* %132
	%134 = load i32, i32* @k
	%135 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 37, i32 %134
	%136 = load float, float* %135
	%137 = load i32, i32* @k
	%138 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 38, i32 %137
	%139 = load float, float* %138
	%140 = load i32, i32* @k
	%141 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 39, i32 %140
	%142 = load float, float* %141
	%143 = call float @params_f40(float %25, float %28, float %31, float %34, float %37, float %40, float %43, float %46, float %49, float %52, float %55, float %58, float %61, float %64, float %67, float %70, float %73, float %76, float %79, float %82, float %85, float %88, float %91, float %94, float %97, float %100, float %103, float %106, float %109, float %112, float %115, float %118, float %121, float %124, float %127, float %130, float %133, float %136, float %139, float %142)
	store float %143, float* %22
	%144 = alloca float
	%145 = load i32, i32* @k
	%146 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 23, i32 %145
	%147 = load i32, i32* %146
	%148 = load i32, i32* @k
	%149 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 2, i32 %148
	%150 = load i32, i32* %149
	%151 = load i32, i32* @k
	%152 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 6, i32 %151
	%153 = load i32, i32* %152
	%154 = load i32, i32* @k
	%155 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 4, i32 %154
	%156 = load float, float* %155
	%157 = load i32, i32* @k
	%158 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 1, i32 %157
	%159 = load i32, i32* %158
	%160 = load i32, i32* @k
	%161 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 4, i32 %160
	%162 = load i32, i32* %161
	%163 = load i32, i32* @k
	%164 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 5, i32 %163
	%165 = load i32, i32* %164
	%166 = load i32, i32* @k
	%167 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 8, i32 %166
	%168 = load float, float* %167
	%169 = load i32, i32* @k
	%170 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 15, i32 %169
	%171 = load float, float* %170
	%172 = load i32, i32* @k
	%173 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 7, i32 %172
	%174 = load float, float* %173
	%175 = load i32, i32* @k
	%176 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 22, i32 %175
	%177 = load i32, i32* %176
	%178 = load i32, i32* @k
	%179 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 3, i32 %178
	%180 = load float, float* %179
	%181 = load i32, i32* @k
	%182 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 28, i32 %181
	%183 = load float, float* %182
	%184 = load i32, i32* @k
	%185 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 0, i32 %184
	%186 = load i32, i32* %185
	%187 = load i32, i32* @k
	%188 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 37, i32 %187
	%189 = load float, float* %188
	%190 = load i32, i32* @k
	%191 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 19, i32 %190
	%192 = load i32, i32* %191
	%193 = load i32, i32* @k
	%194 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 30, i32 %193
	%195 = load float, float* %194
	%196 = load i32, i32* @k
	%197 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 12, i32 %196
	%198 = load float, float* %197
	%199 = load i32, i32* @k
	%200 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 1, i32 %199
	%201 = load float, float* %200
	%202 = load i32, i32* @k
	%203 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 11, i32 %202
	%204 = load float, float* %203
	%205 = load i32, i32* @k
	%206 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 38, i32 %205
	%207 = load float, float* %206
	%208 = load i32, i32* @k
	%209 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 6, i32 %208
	%210 = load float, float* %209
	%211 = load i32, i32* @k
	%212 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 7, i32 %211
	%213 = load i32, i32* %212
	%214 = load i32, i32* @k
	%215 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 32, i32 %214
	%216 = load float, float* %215
	%217 = load i32, i32* @k
	%218 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 10, i32 %217
	%219 = load i32, i32* %218
	%220 = load i32, i32* @k
	%221 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 13, i32 %220
	%222 = load i32, i32* %221
	%223 = load i32, i32* @k
	%224 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 20, i32 %223
	%225 = load float, float* %224
	%226 = load i32, i32* @k
	%227 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 33, i32 %226
	%228 = load float, float* %227
	%229 = load i32, i32* @k
	%230 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 23, i32 %229
	%231 = load float, float* %230
	%232 = load i32, i32* @k
	%233 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 9, i32 %232
	%234 = load float, float* %233
	%235 = load i32, i32* @k
	%236 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 25, i32 %235
	%237 = load float, float* %236
	%238 = load i32, i32* @k
	%239 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 8, i32 %238
	%240 = load i32, i32* %239
	%241 = load i32, i32* @k
	%242 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 39, i32 %241
	%243 = load float, float* %242
	%244 = load i32, i32* @k
	%245 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 17, i32 %244
	%246 = load i32, i32* %245
	%247 = load i32, i32* @k
	%248 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 21, i32 %247
	%249 = load float, float* %248
	%250 = load i32, i32* @k
	%251 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 16, i32 %250
	%252 = load float, float* %251
	%253 = load i32, i32* @k
	%254 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 5, i32 %253
	%255 = load float, float* %254
	%256 = load i32, i32* @k
	%257 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 34, i32 %256
	%258 = load float, float* %257
	%259 = load i32, i32* @k
	%260 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 18, i32 %259
	%261 = load i32, i32* %260
	%262 = load i32, i32* @k
	%263 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 9, i32 %262
	%264 = load i32, i32* %263
	%265 = load i32, i32* @k
	%266 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 14, i32 %265
	%267 = load float, float* %266
	%268 = load i32, i32* @k
	%269 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 10, i32 %268
	%270 = load float, float* %269
	%271 = load i32, i32* @k
	%272 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 0, i32 %271
	%273 = load float, float* %272
	%274 = load i32, i32* @k
	%275 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 12, i32 %274
	%276 = load i32, i32* %275
	%277 = load i32, i32* @k
	%278 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 31, i32 %277
	%279 = load float, float* %278
	%280 = load i32, i32* @k
	%281 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 11, i32 %280
	%282 = load i32, i32* %281
	%283 = load i32, i32* @k
	%284 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 16, i32 %283
	%285 = load i32, i32* %284
	%286 = load i32, i32* @k
	%287 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 27, i32 %286
	%288 = load float, float* %287
	%289 = load i32, i32* @k
	%290 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 24, i32 %289
	%291 = load float, float* %290
	%292 = load i32, i32* @k
	%293 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 13, i32 %292
	%294 = load float, float* %293
	%295 = load i32, i32* @k
	%296 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 29, i32 %295
	%297 = load float, float* %296
	%298 = load i32, i32* @k
	%299 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 3, i32 %298
	%300 = load i32, i32* %299
	%301 = load i32, i32* @k
	%302 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 21, i32 %301
	%303 = load i32, i32* %302
	%304 = load i32, i32* @k
	%305 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 20, i32 %304
	%306 = load i32, i32* %305
	%307 = load i32, i32* @k
	%308 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 18, i32 %307
	%309 = load float, float* %308
	%310 = load i32, i32* @k
	%311 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 19, i32 %310
	%312 = load float, float* %311
	%313 = load i32, i32* @k
	%314 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 22, i32 %313
	%315 = load float, float* %314
	%316 = load i32, i32* @k
	%317 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 26, i32 %316
	%318 = load float, float* %317
	%319 = load i32, i32* @k
	%320 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 36, i32 %319
	%321 = load float, float* %320
	%322 = load i32, i32* @k
	%323 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 17, i32 %322
	%324 = load float, float* %323
	%325 = load i32, i32* @k
	%326 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 15, i32 %325
	%327 = load i32, i32* %326
	%328 = load i32, i32* @k
	%329 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 2, i32 %328
	%330 = load float, float* %329
	%331 = load i32, i32* @k
	%332 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 14, i32 %331
	%333 = load i32, i32* %332
	%334 = load i32, i32* @k
	%335 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 35, i32 %334
	%336 = load float, float* %335
	%337 = call float @params_f40_i24(i32 %147, i32 %150, i32 %153, float %156, i32 %159, i32 %162, i32 %165, float %168, float %171, float %174, i32 %177, float %180, float %183, i32 %186, float %189, i32 %192, float %195, float %198, float %201, float %204, float %207, float %210, i32 %213, float %216, i32 %219, i32 %222, float %225, float %228, float %231, float %234, float %237, i32 %240, float %243, i32 %246, float %249, float %252, float %255, float %258, i32 %261, i32 %264, float %267, float %270, float %273, i32 %276, float %279, i32 %282, i32 %285, float %288, float %291, float %294, float %297, i32 %300, i32 %303, i32 %306, float %309, float %312, float %315, float %318, float %321, float %324, i32 %327, float %330, i32 %333, float %336)
	store float %337, float* %144
	%338 = alloca float
	%339 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 0
	%340 = getelementptr [3 x float], [3 x float]* %339, i32 0, i32 0
	%341 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 1
	%342 = getelementptr [3 x float], [3 x float]* %341, i32 0, i32 0
	%343 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 2
	%344 = getelementptr [3 x float], [3 x float]* %343, i32 0, i32 0
	%345 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 3
	%346 = getelementptr [3 x float], [3 x float]* %345, i32 0, i32 0
	%347 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 4
	%348 = getelementptr [3 x float], [3 x float]* %347, i32 0, i32 0
	%349 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 5
	%350 = getelementptr [3 x float], [3 x float]* %349, i32 0, i32 0
	%351 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 6
	%352 = getelementptr [3 x float], [3 x float]* %351, i32 0, i32 0
	%353 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 7
	%354 = getelementptr [3 x float], [3 x float]* %353, i32 0, i32 0
	%355 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 8
	%356 = getelementptr [3 x float], [3 x float]* %355, i32 0, i32 0
	%357 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 9
	%358 = getelementptr [3 x float], [3 x float]* %357, i32 0, i32 0
	%359 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 10
	%360 = getelementptr [3 x float], [3 x float]* %359, i32 0, i32 0
	%361 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 11
	%362 = getelementptr [3 x float], [3 x float]* %361, i32 0, i32 0
	%363 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 12
	%364 = getelementptr [3 x float], [3 x float]* %363, i32 0, i32 0
	%365 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 13
	%366 = getelementptr [3 x float], [3 x float]* %365, i32 0, i32 0
	%367 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 14
	%368 = getelementptr [3 x float], [3 x float]* %367, i32 0, i32 0
	%369 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 15
	%370 = getelementptr [3 x float], [3 x float]* %369, i32 0, i32 0
	%371 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 16
	%372 = getelementptr [3 x float], [3 x float]* %371, i32 0, i32 0
	%373 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 17
	%374 = getelementptr [3 x float], [3 x float]* %373, i32 0, i32 0
	%375 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 18
	%376 = getelementptr [3 x float], [3 x float]* %375, i32 0, i32 0
	%377 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 19
	%378 = getelementptr [3 x float], [3 x float]* %377, i32 0, i32 0
	%379 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 20
	%380 = getelementptr [3 x float], [3 x float]* %379, i32 0, i32 0
	%381 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 21
	%382 = getelementptr [3 x float], [3 x float]* %381, i32 0, i32 0
	%383 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 22
	%384 = getelementptr [3 x float], [3 x float]* %383, i32 0, i32 0
	%385 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 23
	%386 = getelementptr [3 x float], [3 x float]* %385, i32 0, i32 0
	%387 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 24
	%388 = getelementptr [3 x float], [3 x float]* %387, i32 0, i32 0
	%389 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 25
	%390 = getelementptr [3 x float], [3 x float]* %389, i32 0, i32 0
	%391 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 26
	%392 = getelementptr [3 x float], [3 x float]* %391, i32 0, i32 0
	%393 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 27
	%394 = getelementptr [3 x float], [3 x float]* %393, i32 0, i32 0
	%395 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 28
	%396 = getelementptr [3 x float], [3 x float]* %395, i32 0, i32 0
	%397 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 29
	%398 = getelementptr [3 x float], [3 x float]* %397, i32 0, i32 0
	%399 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 30
	%400 = getelementptr [3 x float], [3 x float]* %399, i32 0, i32 0
	%401 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 31
	%402 = getelementptr [3 x float], [3 x float]* %401, i32 0, i32 0
	%403 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 32
	%404 = getelementptr [3 x float], [3 x float]* %403, i32 0, i32 0
	%405 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 33
	%406 = getelementptr [3 x float], [3 x float]* %405, i32 0, i32 0
	%407 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 34
	%408 = getelementptr [3 x float], [3 x float]* %407, i32 0, i32 0
	%409 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 35
	%410 = getelementptr [3 x float], [3 x float]* %409, i32 0, i32 0
	%411 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 36
	%412 = getelementptr [3 x float], [3 x float]* %411, i32 0, i32 0
	%413 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 37
	%414 = getelementptr [3 x float], [3 x float]* %413, i32 0, i32 0
	%415 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 38
	%416 = getelementptr [3 x float], [3 x float]* %415, i32 0, i32 0
	%417 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 39
	%418 = getelementptr [3 x float], [3 x float]* %417, i32 0, i32 0
	%419 = call float @params_fa40(float* %340, float* %342, float* %344, float* %346, float* %348, float* %350, float* %352, float* %354, float* %356, float* %358, float* %360, float* %362, float* %364, float* %366, float* %368, float* %370, float* %372, float* %374, float* %376, float* %378, float* %380, float* %382, float* %384, float* %386, float* %388, float* %390, float* %392, float* %394, float* %396, float* %398, float* %400, float* %402, float* %404, float* %406, float* %408, float* %410, float* %412, float* %414, float* %416, float* %418)
	store float %419, float* %338
	%420 = alloca i32
	%421 = load i32, i32* @k
	%422 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 0, i32 %421
	%423 = load float, float* %422
	%424 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 0
	%425 = getelementptr [3 x i32], [3 x i32]* %424, i32 0, i32 0
	%426 = load i32, i32* @k
	%427 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 1, i32 %426
	%428 = load i32, i32* %427
	%429 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 1
	%430 = getelementptr [3 x float], [3 x float]* %429, i32 0, i32 0
	%431 = load i32, i32* @k
	%432 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 2, i32 %431
	%433 = load float, float* %432
	%434 = load i32, i32* @k
	%435 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 2, i32 %434
	%436 = load i32, i32* %435
	%437 = load i32, i32* @k
	%438 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 3, i32 %437
	%439 = load float, float* %438
	%440 = load i32, i32* @k
	%441 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 4, i32 %440
	%442 = load float, float* %441
	%443 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 5
	%444 = getelementptr [3 x float], [3 x float]* %443, i32 0, i32 0
	%445 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 3
	%446 = getelementptr [3 x i32], [3 x i32]* %445, i32 0, i32 0
	%447 = load i32, i32* @k
	%448 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 4, i32 %447
	%449 = load i32, i32* %448
	%450 = load i32, i32* @k
	%451 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 5, i32 %450
	%452 = load i32, i32* %451
	%453 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 6
	%454 = getelementptr [3 x float], [3 x float]* %453, i32 0, i32 0
	%455 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 6
	%456 = getelementptr [3 x i32], [3 x i32]* %455, i32 0, i32 0
	%457 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 7
	%458 = getelementptr [3 x i32], [3 x i32]* %457, i32 0, i32 0
	%459 = load i32, i32* @k
	%460 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 8, i32 %459
	%461 = load i32, i32* %460
	%462 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 7
	%463 = getelementptr [3 x float], [3 x float]* %462, i32 0, i32 0
	%464 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 8
	%465 = getelementptr [3 x float], [3 x float]* %464, i32 0, i32 0
	%466 = load i32, i32* @k
	%467 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 9, i32 %466
	%468 = load float, float* %467
	%469 = load i32, i32* @k
	%470 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 10, i32 %469
	%471 = load float, float* %470
	%472 = load i32, i32* @k
	%473 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 11, i32 %472
	%474 = load float, float* %473
	%475 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 12
	%476 = getelementptr [3 x float], [3 x float]* %475, i32 0, i32 0
	%477 = load i32, i32* @k
	%478 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 9, i32 %477
	%479 = load i32, i32* %478
	%480 = load i32, i32* @k
	%481 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 13, i32 %480
	%482 = load float, float* %481
	%483 = load i32, i32* @k
	%484 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 14, i32 %483
	%485 = load float, float* %484
	%486 = load i32, i32* @k
	%487 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 15, i32 %486
	%488 = load float, float* %487
	%489 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 10
	%490 = getelementptr [3 x i32], [3 x i32]* %489, i32 0, i32 0
	%491 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 16
	%492 = getelementptr [3 x float], [3 x float]* %491, i32 0, i32 0
	%493 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 11
	%494 = getelementptr [3 x i32], [3 x i32]* %493, i32 0, i32 0
	%495 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 12
	%496 = getelementptr [3 x i32], [3 x i32]* %495, i32 0, i32 0
	%497 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 17
	%498 = getelementptr [3 x float], [3 x float]* %497, i32 0, i32 0
	%499 = load i32, i32* @k
	%500 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 18, i32 %499
	%501 = load float, float* %500
	%502 = load i32, i32* @k
	%503 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 19, i32 %502
	%504 = load float, float* %503
	%505 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 13
	%506 = getelementptr [3 x i32], [3 x i32]* %505, i32 0, i32 0
	%507 = load i32, i32* @k
	%508 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 14, i32 %507
	%509 = load i32, i32* %508
	%510 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 20
	%511 = getelementptr [3 x float], [3 x float]* %510, i32 0, i32 0
	%512 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 21
	%513 = getelementptr [3 x float], [3 x float]* %512, i32 0, i32 0
	%514 = load i32, i32* @k
	%515 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 22, i32 %514
	%516 = load float, float* %515
	%517 = load i32, i32* @k
	%518 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 23, i32 %517
	%519 = load float, float* %518
	%520 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 15
	%521 = getelementptr [3 x i32], [3 x i32]* %520, i32 0, i32 0
	%522 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 16
	%523 = getelementptr [3 x i32], [3 x i32]* %522, i32 0, i32 0
	%524 = load i32, i32* @k
	%525 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 17, i32 %524
	%526 = load i32, i32* %525
	%527 = load i32, i32* @k
	%528 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 18, i32 %527
	%529 = load i32, i32* %528
	%530 = load i32, i32* @k
	%531 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 24, i32 %530
	%532 = load float, float* %531
	%533 = load i32, i32* @k
	%534 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 25, i32 %533
	%535 = load float, float* %534
	%536 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 19
	%537 = getelementptr [3 x i32], [3 x i32]* %536, i32 0, i32 0
	%538 = load i32, i32* @k
	%539 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 20, i32 %538
	%540 = load i32, i32* %539
	%541 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 26
	%542 = getelementptr [3 x float], [3 x float]* %541, i32 0, i32 0
	%543 = load i32, i32* @k
	%544 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 21, i32 %543
	%545 = load i32, i32* %544
	%546 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 22
	%547 = getelementptr [3 x i32], [3 x i32]* %546, i32 0, i32 0
	%548 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 23
	%549 = getelementptr [3 x i32], [3 x i32]* %548, i32 0, i32 0
	%550 = load i32, i32* @k
	%551 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 27, i32 %550
	%552 = load float, float* %551
	%553 = load i32, i32* @k
	%554 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 28, i32 %553
	%555 = load float, float* %554
	%556 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 29
	%557 = getelementptr [3 x float], [3 x float]* %556, i32 0, i32 0
	%558 = load i32, i32* @k
	%559 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 0, i32 %558
	%560 = load i32, i32* %559
	%561 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 1
	%562 = getelementptr [3 x i32], [3 x i32]* %561, i32 0, i32 0
	%563 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 30
	%564 = getelementptr [3 x float], [3 x float]* %563, i32 0, i32 0
	%565 = load i32, i32* @k
	%566 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 31, i32 %565
	%567 = load float, float* %566
	%568 = load i32, i32* @k
	%569 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 2, i32 %568
	%570 = load i32, i32* %569
	%571 = load i32, i32* @k
	%572 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 32, i32 %571
	%573 = load float, float* %572
	%574 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 33
	%575 = getelementptr [3 x float], [3 x float]* %574, i32 0, i32 0
	%576 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 34
	%577 = getelementptr [3 x float], [3 x float]* %576, i32 0, i32 0
	%578 = load i32, i32* @k
	%579 = getelementptr [40 x [3 x float]], [40 x [3 x float]]* %0, i32 0, i32 35, i32 %578
	%580 = load float, float* %579
	%581 = load i32, i32* @k
	%582 = getelementptr [24 x [3 x i32]], [24 x [3 x i32]]* %1, i32 0, i32 3, i32 %581
	%583 = load i32, i32* %582
	%584 = call i32 @params_mix(float %423, i32* %425, i32 %428, float* %430, float %433, i32 %436, float %439, float %442, float* %444, i32* %446, i32 %449, i32 %452, float* %454, i32* %456, i32* %458, i32 %461, float* %463, float* %465, float %468, float %471, float %474, float* %476, i32 %479, float %482, float %485, float %488, i32* %490, float* %492, i32* %494, i32* %496, float* %498, float %501, float %504, i32* %506, i32 %509, float* %511, float* %513, float %516, float %519, i32* %521, i32* %523, i32 %526, i32 %529, float %532, float %535, i32* %537, i32 %540, float* %542, i32 %545, i32* %547, i32* %549, float %552, float %555, float* %557, i32 %560, i32* %562, float* %564, float %567, i32 %570, float %573, float* %575, float* %577, float %580, i32 %583)
	store i32 %584, i32* %420
	%585 = load float, float* %22
	call void @putfloat(float %585)
	call void @putch(i32 10)
	%586 = load float, float* %144
	call void @putfloat(float %586)
	call void @putch(i32 10)
	%587 = load float, float* %338
	call void @putfloat(float %587)
	call void @putch(i32 10)
	%588 = load i32, i32* %420
	call void @putint(i32 %588)
	call void @putch(i32 10)
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

