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
@to = global [5005 x i32]zeroinitializer
@next = global [5005 x i32]zeroinitializer
@head = global [1005 x i32]zeroinitializer
@cnt = global i32 0
@que = global [1005 x i32]zeroinitializer
@h = global i32 0
@tail = global i32 0
@inq = global [1005 x i32]zeroinitializer
define i32 @main() {
b0:
	br label %b1
b1:
	%0 = call i32 @getch()
	%1 = move 0
	%2 = move %0
	br label %b2
b2:
	%3 = move %1
	%4 = move %2
	%5 = icmp slt i32 %4, 48
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b3, label %b5
b3:
	%7 = icmp eq i32 %4, 45
	%8 = icmp ne i1 %7, 0
	br i1 %8, label %b7, label %b4
b4:
	%9 = move %3
	br label %b8
b5:
	%10 = icmp sgt i32 %4, 57
	%11 = icmp ne i1 %10, 0
	br i1 %11, label %b3, label %b6
b6:
	%12 = move 0
	%13 = move %4
	br label %b9
b7:
	%9 = move 1
	br label %b8
b8:
	%14 = move %9
	%15 = call i32 @getch()
	%1 = move %14
	%2 = move %15
	br label %b2
b9:
	%16 = move %12
	%17 = move %13
	%18 = icmp sge i32 %17, 48
	%19 = icmp ne i1 %18, 0
	br i1 %19, label %b12, label %b11
b10:
	%20 = mul i32 %16, 10
	%21 = add i32 %20, %17
	%22 = sub i32 %21, 48
	%23 = call i32 @getch()
	%12 = move %22
	%13 = move %23
	br label %b9
b11:
	%24 = icmp ne i32 %3, 0
	br i1 %24, label %b13, label %b14
b12:
	%25 = icmp sle i32 %17, 57
	%26 = icmp ne i1 %25, 0
	br i1 %26, label %b10, label %b11
b13:
	%27 = sub i32 0, %16
	%28 = move %27
	br label %b15
b14:
	%28 = move %16
	br label %b15
b15:
	%29 = move %28
	br label %b16
b16:
	%30 = call i32 @getch()
	%31 = move 0
	%32 = move %30
	br label %b17
b17:
	%33 = move %31
	%34 = move %32
	%35 = icmp slt i32 %34, 48
	%36 = icmp ne i1 %35, 0
	br i1 %36, label %b18, label %b20
b18:
	%37 = icmp eq i32 %34, 45
	%38 = icmp ne i1 %37, 0
	br i1 %38, label %b22, label %b19
b19:
	%39 = move %33
	br label %b23
b20:
	%40 = icmp sgt i32 %34, 57
	%41 = icmp ne i1 %40, 0
	br i1 %41, label %b18, label %b21
b21:
	%42 = move 0
	%43 = move %34
	br label %b24
b22:
	%39 = move 1
	br label %b23
b23:
	%44 = move %39
	%45 = call i32 @getch()
	%31 = move %44
	%32 = move %45
	br label %b17
b24:
	%46 = move %42
	%47 = move %43
	%48 = icmp sge i32 %47, 48
	%49 = icmp ne i1 %48, 0
	br i1 %49, label %b27, label %b26
b25:
	%50 = mul i32 %46, 10
	%51 = add i32 %50, %47
	%52 = sub i32 %51, 48
	%53 = call i32 @getch()
	%42 = move %52
	%43 = move %53
	br label %b24
b26:
	%54 = icmp ne i32 %33, 0
	br i1 %54, label %b28, label %b29
b27:
	%55 = icmp sle i32 %47, 57
	%56 = icmp ne i1 %55, 0
	br i1 %56, label %b25, label %b26
b28:
	%57 = sub i32 0, %46
	%58 = move %57
	br label %b30
b29:
	%58 = move %46
	br label %b30
b30:
	%59 = move %58
	br label %b31
b31:
	%60 = move 0
	br label %b32
b32:
	%61 = move %60
	%62 = icmp slt i32 %61, 1005
	%63 = icmp ne i1 %62, 0
	br i1 %63, label %b33, label %b34
b33:
	%64 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %61
	store i32 -1, i32* %64
	%65 = add i32 %61, 1
	%60 = move %65
	br label %b32
b34:
	br label %b35
b35:
	%66 = move %59
	br label %b36
b36:
	%67 = move %66
	%68 = icmp ne i32 %67, 0
	br i1 %68, label %b37, label %b38
b37:
	%69 = call i32 @getch()
	%70 = move %69
	br label %b39
b38:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b39:
	%71 = move %70
	%72 = icmp ne i32 %71, 81
	%73 = icmp ne i1 %72, 0
	br i1 %73, label %b42, label %b41
b40:
	%74 = call i32 @getch()
	%70 = move %74
	br label %b39
b41:
	%75 = icmp eq i32 %71, 81
	%76 = icmp ne i1 %75, 0
	br i1 %76, label %b43, label %b100
b42:
	%77 = icmp ne i32 %71, 85
	%78 = icmp ne i1 %77, 0
	br i1 %78, label %b40, label %b41
b43:
	br label %b44
b44:
	%79 = call i32 @getch()
	%80 = move 0
	%81 = move %79
	br label %b45
b45:
	%82 = move %80
	%83 = move %81
	%84 = icmp slt i32 %83, 48
	%85 = icmp ne i1 %84, 0
	br i1 %85, label %b46, label %b48
b46:
	%86 = icmp eq i32 %83, 45
	%87 = icmp ne i1 %86, 0
	br i1 %87, label %b50, label %b47
b47:
	%88 = move %82
	br label %b51
b48:
	%89 = icmp sgt i32 %83, 57
	%90 = icmp ne i1 %89, 0
	br i1 %90, label %b46, label %b49
b49:
	%91 = move 0
	%92 = move %83
	br label %b52
b50:
	%88 = move 1
	br label %b51
b51:
	%93 = move %88
	%94 = call i32 @getch()
	%80 = move %93
	%81 = move %94
	br label %b45
b52:
	%95 = move %91
	%96 = move %92
	%97 = icmp sge i32 %96, 48
	%98 = icmp ne i1 %97, 0
	br i1 %98, label %b55, label %b54
b53:
	%99 = mul i32 %95, 10
	%100 = add i32 %99, %96
	%101 = sub i32 %100, 48
	%102 = call i32 @getch()
	%91 = move %101
	%92 = move %102
	br label %b52
b54:
	%103 = icmp ne i32 %82, 0
	br i1 %103, label %b56, label %b57
b55:
	%104 = icmp sle i32 %96, 57
	%105 = icmp ne i1 %104, 0
	br i1 %105, label %b53, label %b54
b56:
	%106 = sub i32 0, %95
	%107 = move %106
	br label %b58
b57:
	%107 = move %95
	br label %b58
b58:
	%108 = move %107
	br label %b59
b59:
	%109 = call i32 @getch()
	%110 = move 0
	%111 = move %109
	br label %b60
b60:
	%112 = move %110
	%113 = move %111
	%114 = icmp slt i32 %113, 48
	%115 = icmp ne i1 %114, 0
	br i1 %115, label %b61, label %b63
b61:
	%116 = icmp eq i32 %113, 45
	%117 = icmp ne i1 %116, 0
	br i1 %117, label %b65, label %b62
b62:
	%118 = move %112
	br label %b66
b63:
	%119 = icmp sgt i32 %113, 57
	%120 = icmp ne i1 %119, 0
	br i1 %120, label %b61, label %b64
b64:
	%121 = move 0
	%122 = move %113
	br label %b67
b65:
	%118 = move 1
	br label %b66
b66:
	%123 = move %118
	%124 = call i32 @getch()
	%110 = move %123
	%111 = move %124
	br label %b60
b67:
	%125 = move %121
	%126 = move %122
	%127 = icmp sge i32 %126, 48
	%128 = icmp ne i1 %127, 0
	br i1 %128, label %b70, label %b69
b68:
	%129 = mul i32 %125, 10
	%130 = add i32 %129, %126
	%131 = sub i32 %130, 48
	%132 = call i32 @getch()
	%121 = move %131
	%122 = move %132
	br label %b67
b69:
	%133 = icmp ne i32 %112, 0
	br i1 %133, label %b71, label %b72
b70:
	%134 = icmp sle i32 %126, 57
	%135 = icmp ne i1 %134, 0
	br i1 %135, label %b68, label %b69
b71:
	%136 = sub i32 0, %125
	%137 = move %136
	br label %b73
b72:
	%137 = move %125
	br label %b73
b73:
	%138 = move %137
	br label %b74
b74:
	br label %b75
b75:
	store i32 0, i32* @h
	store i32 0, i32* @tail
	br label %b76
b76:
	br label %b77
b77:
	%139 = getelementptr [1005 x i32], [1005 x i32]* @inq, i32 0, i32 %108
	store i32 1, i32* %139
	%140 = load i32, i32* @tail
	%141 = add i32 %140, 1
	store i32 %141, i32* @tail
	%142 = load i32, i32* @tail
	%143 = getelementptr [1005 x i32], [1005 x i32]* @que, i32 0, i32 %142
	store i32 %108, i32* %143
	br label %b78
b78:
	%144 = move 0
	br label %b79
b79:
	%145 = move %144
	%146 = load i32, i32* @h
	%147 = load i32, i32* @tail
	%148 = icmp slt i32 %146, %147
	%149 = icmp ne i1 %148, 0
	br i1 %149, label %b80, label %b84
b80:
	br label %b81
b81:
	%150 = load i32, i32* @h
	%151 = add i32 %150, 1
	store i32 %151, i32* @h
	%152 = load i32, i32* @h
	%153 = getelementptr [1005 x i32], [1005 x i32]* @que, i32 0, i32 %152
	%154 = load i32, i32* %153
	br label %b82
b82:
	%155 = icmp eq i32 %154, %138
	%156 = icmp ne i1 %155, 0
	br i1 %156, label %b85, label %b83
b83:
	%157 = move %145
	br label %b86
b84:
	%158 = move 0
	br label %b95
b85:
	%157 = move 1
	br label %b86
b86:
	%159 = move %157
	%160 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %154
	%161 = load i32, i32* %160
	%162 = move %161
	br label %b87
b87:
	%163 = move %162
	%164 = icmp ne i32 %163, -1
	%165 = icmp ne i1 %164, 0
	br i1 %165, label %b89, label %b88
b88:
	%144 = move %159
	br label %b79
b89:
	%166 = getelementptr [5005 x i32], [5005 x i32]* @to, i32 0, i32 %163
	%167 = load i32, i32* %166
	%168 = getelementptr [1005 x i32], [1005 x i32]* @inq, i32 0, i32 %167
	%169 = load i32, i32* %168
	%170 = zext i1 0 to i32
	%171 = icmp eq i32 %169, %170
	%172 = icmp ne i1 %171, 0
	br i1 %172, label %b90, label %b94
b90:
	%173 = getelementptr [5005 x i32], [5005 x i32]* @to, i32 0, i32 %163
	%174 = load i32, i32* %173
	br label %b91
b91:
	br label %b92
b92:
	%175 = getelementptr [1005 x i32], [1005 x i32]* @inq, i32 0, i32 %174
	store i32 1, i32* %175
	%176 = load i32, i32* @tail
	%177 = add i32 %176, 1
	store i32 %177, i32* @tail
	%178 = load i32, i32* @tail
	%179 = getelementptr [1005 x i32], [1005 x i32]* @que, i32 0, i32 %178
	store i32 %174, i32* %179
	br label %b93
b93:
	br label %b94
b94:
	%180 = getelementptr [5005 x i32], [5005 x i32]* @next, i32 0, i32 %163
	%181 = load i32, i32* %180
	%162 = move %181
	br label %b87
b95:
	%182 = move %158
	%183 = load i32, i32* @tail
	%184 = icmp sle i32 %182, %183
	%185 = icmp ne i1 %184, 0
	br i1 %185, label %b96, label %b97
b96:
	%186 = getelementptr [1005 x i32], [1005 x i32]* @que, i32 0, i32 %182
	%187 = load i32, i32* %186
	%188 = getelementptr [1005 x i32], [1005 x i32]* @inq, i32 0, i32 %187
	store i32 0, i32* %188
	%189 = add i32 %182, 1
	%158 = move %189
	br label %b95
b97:
	br label %b98
b98:
	call void @putint(i32 %145)
	call void @putch(i32 10)
	br label %b99
b99:
	%190 = sub i32 %67, 1
	%66 = move %190
	br label %b36
b100:
	br label %b101
b101:
	%191 = call i32 @getch()
	%192 = move 0
	%193 = move %191
	br label %b102
b102:
	%194 = move %192
	%195 = move %193
	%196 = icmp slt i32 %195, 48
	%197 = icmp ne i1 %196, 0
	br i1 %197, label %b103, label %b105
b103:
	%198 = icmp eq i32 %195, 45
	%199 = icmp ne i1 %198, 0
	br i1 %199, label %b107, label %b104
b104:
	%200 = move %194
	br label %b108
b105:
	%201 = icmp sgt i32 %195, 57
	%202 = icmp ne i1 %201, 0
	br i1 %202, label %b103, label %b106
b106:
	%203 = move 0
	%204 = move %195
	br label %b109
b107:
	%200 = move 1
	br label %b108
b108:
	%205 = move %200
	%206 = call i32 @getch()
	%192 = move %205
	%193 = move %206
	br label %b102
b109:
	%207 = move %203
	%208 = move %204
	%209 = icmp sge i32 %208, 48
	%210 = icmp ne i1 %209, 0
	br i1 %210, label %b112, label %b111
b110:
	%211 = mul i32 %207, 10
	%212 = add i32 %211, %208
	%213 = sub i32 %212, 48
	%214 = call i32 @getch()
	%203 = move %213
	%204 = move %214
	br label %b109
b111:
	%215 = icmp ne i32 %194, 0
	br i1 %215, label %b113, label %b114
b112:
	%216 = icmp sle i32 %208, 57
	%217 = icmp ne i1 %216, 0
	br i1 %217, label %b110, label %b111
b113:
	%218 = sub i32 0, %207
	%219 = move %218
	br label %b115
b114:
	%219 = move %207
	br label %b115
b115:
	%220 = move %219
	br label %b116
b116:
	%221 = call i32 @getch()
	%222 = move 0
	%223 = move %221
	br label %b117
b117:
	%224 = move %222
	%225 = move %223
	%226 = icmp slt i32 %225, 48
	%227 = icmp ne i1 %226, 0
	br i1 %227, label %b118, label %b120
b118:
	%228 = icmp eq i32 %225, 45
	%229 = icmp ne i1 %228, 0
	br i1 %229, label %b122, label %b119
b119:
	%230 = move %224
	br label %b123
b120:
	%231 = icmp sgt i32 %225, 57
	%232 = icmp ne i1 %231, 0
	br i1 %232, label %b118, label %b121
b121:
	%233 = move 0
	%234 = move %225
	br label %b124
b122:
	%230 = move 1
	br label %b123
b123:
	%235 = move %230
	%236 = call i32 @getch()
	%222 = move %235
	%223 = move %236
	br label %b117
b124:
	%237 = move %233
	%238 = move %234
	%239 = icmp sge i32 %238, 48
	%240 = icmp ne i1 %239, 0
	br i1 %240, label %b127, label %b126
b125:
	%241 = mul i32 %237, 10
	%242 = add i32 %241, %238
	%243 = sub i32 %242, 48
	%244 = call i32 @getch()
	%233 = move %243
	%234 = move %244
	br label %b124
b126:
	%245 = icmp ne i32 %224, 0
	br i1 %245, label %b128, label %b129
b127:
	%246 = icmp sle i32 %238, 57
	%247 = icmp ne i1 %246, 0
	br i1 %247, label %b125, label %b126
b128:
	%248 = sub i32 0, %237
	%249 = move %248
	br label %b130
b129:
	%249 = move %237
	br label %b130
b130:
	%250 = move %249
	br label %b131
b131:
	br label %b132
b132:
	%251 = load i32, i32* @cnt
	%252 = getelementptr [5005 x i32], [5005 x i32]* @to, i32 0, i32 %251
	store i32 %250, i32* %252
	%253 = load i32, i32* @cnt
	%254 = getelementptr [5005 x i32], [5005 x i32]* @next, i32 0, i32 %253
	%255 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %220
	%256 = load i32, i32* %255
	store i32 %256, i32* %254
	%257 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %220
	%258 = load i32, i32* @cnt
	store i32 %258, i32* %257
	%259 = load i32, i32* @cnt
	%260 = add i32 %259, 1
	store i32 %260, i32* @cnt
	%261 = load i32, i32* @cnt
	%262 = getelementptr [5005 x i32], [5005 x i32]* @to, i32 0, i32 %261
	store i32 %220, i32* %262
	%263 = load i32, i32* @cnt
	%264 = getelementptr [5005 x i32], [5005 x i32]* @next, i32 0, i32 %263
	%265 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %250
	%266 = load i32, i32* %265
	store i32 %266, i32* %264
	%267 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %250
	%268 = load i32, i32* @cnt
	store i32 %268, i32* %267
	%269 = load i32, i32* @cnt
	%270 = add i32 %269, 1
	store i32 %270, i32* @cnt
	br label %b133
b133:
	br label %b99
}

