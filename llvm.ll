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
@last_char = global i32 32
@num = global i32 0
@other = global i32 0
@cur_token = global i32 0
define i32 @main() {
b0:
	%0 = call i32 @getint()
	%1 = call i32 @getch()
	br label %b1
b1:
	br label %b2
b2:
	%2 = load i32, i32* @last_char
	br label %b3
b3:
	br label %b4
b4:
	%3 = icmp eq i32 %2, 32
	%4 = icmp ne i1 %3, 0
	br i1 %4, label %b5, label %b7
b5:
	br label %b8
b6:
	br label %b8
b7:
	%5 = icmp eq i32 %2, 10
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b5, label %b6
b8:
	%7 = phi i32 [ 1, %b5 ],[ 0, %b6 ]
	%8 = icmp ne i32 %7, 0
	br i1 %8, label %b9, label %b12
b9:
	br label %b10
b10:
	%9 = call i32 @getch()
	store i32 %9, i32* @last_char
	br label %b11
b11:
	br label %b2
b12:
	%10 = load i32, i32* @last_char
	br label %b13
b13:
	br label %b14
b14:
	%11 = icmp sge i32 %10, 48
	%12 = icmp ne i1 %11, 0
	br i1 %12, label %b17, label %b16
b15:
	br label %b18
b16:
	br label %b18
b17:
	%13 = icmp sle i32 %10, 57
	%14 = icmp ne i1 %13, 0
	br i1 %14, label %b15, label %b16
b18:
	%15 = phi i32 [ 1, %b15 ],[ 0, %b16 ]
	%16 = icmp ne i32 %15, 0
	br i1 %16, label %b19, label %b21
b19:
	%17 = load i32, i32* @last_char
	%18 = sub i32 %17, 48
	store i32 %18, i32* @num
	br label %b24
b20:
	br label %b35
b21:
	%19 = load i32, i32* @last_char
	store i32 %19, i32* @other
	br label %b22
b22:
	%20 = call i32 @getch()
	br label %b23
b23:
	store i32 1, i32* @cur_token
	br label %b20
b24:
	br label %b25
b25:
	%21 = call i32 @getch()
	store i32 %21, i32* @last_char
	%22 = load i32, i32* @last_char
	br label %b26
b26:
	br label %b27
b27:
	br label %b28
b28:
	%23 = icmp sge i32 %22, 48
	%24 = icmp ne i1 %23, 0
	br i1 %24, label %b31, label %b30
b29:
	br label %b32
b30:
	br label %b32
b31:
	%25 = icmp sle i32 %22, 57
	%26 = icmp ne i1 %25, 0
	br i1 %26, label %b29, label %b30
b32:
	%27 = phi i32 [ 1, %b29 ],[ 0, %b30 ]
	%28 = icmp ne i32 %27, 0
	br i1 %28, label %b33, label %b34
b33:
	%29 = load i32, i32* @num
	%30 = mul i32 %29, 10
	%31 = load i32, i32* @last_char
	%32 = add i32 %30, %31
	%33 = sub i32 %32, 48
	store i32 %33, i32* @num
	br label %b24
b34:
	store i32 0, i32* @cur_token
	br label %b20
b35:
	br label %b36
b36:
	%34 = phi i32 [ %0, %b35 ],[ %362, %b299 ]
	%35 = icmp ne i32 %34, 0
	br i1 %35, label %b37, label %b300
b37:
	br label %b38
b38:
	%36 = alloca [256 x i32]
	%37 = getelementptr [256 x i32], [256 x i32]* %36, i32 0, i32 0
	call void @memset(i32* %37, i32 0, i32 1024)
	%38 = alloca [256 x i32]
	%39 = getelementptr [256 x i32], [256 x i32]* %38, i32 0, i32 0
	call void @memset(i32* %39, i32 0, i32 1024)
	%40 = load i32, i32* @cur_token
	%41 = icmp ne i32 %40, 0
	%42 = icmp ne i1 %41, 0
	br i1 %42, label %b39, label %b42
b39:
	br label %b40
b40:
	call void @putch(i32 112)
	call void @putch(i32 97)
	call void @putch(i32 110)
	call void @putch(i32 105)
	call void @putch(i32 99)
	call void @putch(i32 33)
	call void @putch(i32 10)
	br label %b41
b41:
	br label %b299
b42:
	%43 = getelementptr [256 x i32], [256 x i32]* %36, i32 0, i32 0
	%44 = load i32, i32* @num
	br label %b43
b43:
	br label %b44
b44:
	%45 = getelementptr i32, i32* %43, i32 0
	%46 = getelementptr i32, i32* %43, i32 0
	%47 = load i32, i32* %46
	%48 = add i32 %47, 1
	store i32 %48, i32* %45
	%49 = getelementptr i32, i32* %43, i32 0
	%50 = load i32, i32* %49
	%51 = getelementptr i32, i32* %43, i32 %50
	store i32 %44, i32* %51
	br label %b45
b45:
	br label %b46
b46:
	br label %b47
b47:
	%52 = load i32, i32* @last_char
	br label %b48
b48:
	br label %b49
b49:
	%53 = icmp eq i32 %52, 32
	%54 = icmp ne i1 %53, 0
	br i1 %54, label %b50, label %b52
b50:
	br label %b53
b51:
	br label %b53
b52:
	%55 = icmp eq i32 %52, 10
	%56 = icmp ne i1 %55, 0
	br i1 %56, label %b50, label %b51
b53:
	%57 = phi i32 [ 1, %b50 ],[ 0, %b51 ]
	%58 = icmp ne i32 %57, 0
	br i1 %58, label %b54, label %b57
b54:
	br label %b55
b55:
	%59 = call i32 @getch()
	store i32 %59, i32* @last_char
	br label %b56
b56:
	br label %b47
b57:
	%60 = load i32, i32* @last_char
	br label %b58
b58:
	br label %b59
b59:
	%61 = icmp sge i32 %60, 48
	%62 = icmp ne i1 %61, 0
	br i1 %62, label %b62, label %b61
b60:
	br label %b63
b61:
	br label %b63
b62:
	%63 = icmp sle i32 %60, 57
	%64 = icmp ne i1 %63, 0
	br i1 %64, label %b60, label %b61
b63:
	%65 = phi i32 [ 1, %b60 ],[ 0, %b61 ]
	%66 = icmp ne i32 %65, 0
	br i1 %66, label %b64, label %b66
b64:
	%67 = load i32, i32* @last_char
	%68 = sub i32 %67, 48
	store i32 %68, i32* @num
	br label %b69
b65:
	br label %b80
b66:
	%69 = load i32, i32* @last_char
	store i32 %69, i32* @other
	br label %b67
b67:
	%70 = call i32 @getch()
	br label %b68
b68:
	store i32 1, i32* @cur_token
	br label %b65
b69:
	br label %b70
b70:
	%71 = call i32 @getch()
	store i32 %71, i32* @last_char
	%72 = load i32, i32* @last_char
	br label %b71
b71:
	br label %b72
b72:
	br label %b73
b73:
	%73 = icmp sge i32 %72, 48
	%74 = icmp ne i1 %73, 0
	br i1 %74, label %b76, label %b75
b74:
	br label %b77
b75:
	br label %b77
b76:
	%75 = icmp sle i32 %72, 57
	%76 = icmp ne i1 %75, 0
	br i1 %76, label %b74, label %b75
b77:
	%77 = phi i32 [ 1, %b74 ],[ 0, %b75 ]
	%78 = icmp ne i32 %77, 0
	br i1 %78, label %b78, label %b79
b78:
	%79 = load i32, i32* @num
	%80 = mul i32 %79, 10
	%81 = load i32, i32* @last_char
	%82 = add i32 %80, %81
	%83 = sub i32 %82, 48
	store i32 %83, i32* @num
	br label %b69
b79:
	store i32 0, i32* @cur_token
	br label %b65
b80:
	br label %b81
b81:
	%84 = load i32, i32* @cur_token
	%85 = icmp eq i32 %84, 1
	%86 = icmp ne i1 %85, 0
	br i1 %86, label %b82, label %b93
b82:
	%87 = load i32, i32* @other
	br label %b83
b83:
	br label %b84
b84:
	%88 = icmp eq i32 %87, 43
	%89 = icmp ne i1 %88, 0
	br i1 %89, label %b85, label %b87
b85:
	br label %b92
b86:
	%90 = icmp eq i32 %87, 42
	%91 = icmp ne i1 %90, 0
	br i1 %91, label %b88, label %b90
b87:
	%92 = icmp eq i32 %87, 45
	%93 = icmp ne i1 %92, 0
	br i1 %93, label %b85, label %b86
b88:
	br label %b92
b89:
	br label %b92
b90:
	%94 = icmp eq i32 %87, 47
	%95 = icmp ne i1 %94, 0
	br i1 %95, label %b88, label %b91
b91:
	%96 = icmp eq i32 %87, 37
	%97 = icmp ne i1 %96, 0
	br i1 %97, label %b88, label %b89
b92:
	%98 = phi i32 [ 10, %b85 ],[ 20, %b88 ],[ 0, %b89 ]
	%99 = icmp eq i32 %98, 0
	%100 = icmp ne i1 %99, 0
	br i1 %100, label %b93, label %b129
b93:
	br label %b94
b94:
	br label %b95
b95:
	%101 = load i32, i32* @last_char
	br label %b96
b96:
	br label %b97
b97:
	%102 = icmp eq i32 %101, 32
	%103 = icmp ne i1 %102, 0
	br i1 %103, label %b98, label %b100
b98:
	br label %b101
b99:
	br label %b101
b100:
	%104 = icmp eq i32 %101, 10
	%105 = icmp ne i1 %104, 0
	br i1 %105, label %b98, label %b99
b101:
	%106 = phi i32 [ 1, %b98 ],[ 0, %b99 ]
	%107 = icmp ne i32 %106, 0
	br i1 %107, label %b102, label %b105
b102:
	br label %b103
b103:
	%108 = call i32 @getch()
	store i32 %108, i32* @last_char
	br label %b104
b104:
	br label %b95
b105:
	%109 = load i32, i32* @last_char
	br label %b106
b106:
	br label %b107
b107:
	%110 = icmp sge i32 %109, 48
	%111 = icmp ne i1 %110, 0
	br i1 %111, label %b110, label %b109
b108:
	br label %b111
b109:
	br label %b111
b110:
	%112 = icmp sle i32 %109, 57
	%113 = icmp ne i1 %112, 0
	br i1 %113, label %b108, label %b109
b111:
	%114 = phi i32 [ 1, %b108 ],[ 0, %b109 ]
	%115 = icmp ne i32 %114, 0
	br i1 %115, label %b112, label %b114
b112:
	%116 = load i32, i32* @last_char
	%117 = sub i32 %116, 48
	store i32 %117, i32* @num
	br label %b117
b113:
	br label %b128
b114:
	%118 = load i32, i32* @last_char
	store i32 %118, i32* @other
	br label %b115
b115:
	%119 = call i32 @getch()
	br label %b116
b116:
	store i32 1, i32* @cur_token
	br label %b113
b117:
	br label %b118
b118:
	%120 = call i32 @getch()
	store i32 %120, i32* @last_char
	%121 = load i32, i32* @last_char
	br label %b119
b119:
	br label %b120
b120:
	br label %b121
b121:
	%122 = icmp sge i32 %121, 48
	%123 = icmp ne i1 %122, 0
	br i1 %123, label %b124, label %b123
b122:
	br label %b125
b123:
	br label %b125
b124:
	%124 = icmp sle i32 %121, 57
	%125 = icmp ne i1 %124, 0
	br i1 %125, label %b122, label %b123
b125:
	%126 = phi i32 [ 1, %b122 ],[ 0, %b123 ]
	%127 = icmp ne i32 %126, 0
	br i1 %127, label %b126, label %b127
b126:
	%128 = load i32, i32* @num
	%129 = mul i32 %128, 10
	%130 = load i32, i32* @last_char
	%131 = add i32 %129, %130
	%132 = sub i32 %131, 48
	store i32 %132, i32* @num
	br label %b117
b127:
	store i32 0, i32* @cur_token
	br label %b113
b128:
	br label %b265
b129:
	br label %b130
b130:
	br label %b131
b131:
	%133 = load i32, i32* @last_char
	br label %b132
b132:
	br label %b133
b133:
	%134 = icmp eq i32 %133, 32
	%135 = icmp ne i1 %134, 0
	br i1 %135, label %b134, label %b136
b134:
	br label %b137
b135:
	br label %b137
b136:
	%136 = icmp eq i32 %133, 10
	%137 = icmp ne i1 %136, 0
	br i1 %137, label %b134, label %b135
b137:
	%138 = phi i32 [ 1, %b134 ],[ 0, %b135 ]
	%139 = icmp ne i32 %138, 0
	br i1 %139, label %b138, label %b141
b138:
	br label %b139
b139:
	%140 = call i32 @getch()
	store i32 %140, i32* @last_char
	br label %b140
b140:
	br label %b131
b141:
	%141 = load i32, i32* @last_char
	br label %b142
b142:
	br label %b143
b143:
	%142 = icmp sge i32 %141, 48
	%143 = icmp ne i1 %142, 0
	br i1 %143, label %b146, label %b145
b144:
	br label %b147
b145:
	br label %b147
b146:
	%144 = icmp sle i32 %141, 57
	%145 = icmp ne i1 %144, 0
	br i1 %145, label %b144, label %b145
b147:
	%146 = phi i32 [ 1, %b144 ],[ 0, %b145 ]
	%147 = icmp ne i32 %146, 0
	br i1 %147, label %b148, label %b150
b148:
	%148 = load i32, i32* @last_char
	%149 = sub i32 %148, 48
	store i32 %149, i32* @num
	br label %b153
b149:
	br label %b164
b150:
	%150 = load i32, i32* @last_char
	store i32 %150, i32* @other
	br label %b151
b151:
	%151 = call i32 @getch()
	br label %b152
b152:
	store i32 1, i32* @cur_token
	br label %b149
b153:
	br label %b154
b154:
	%152 = call i32 @getch()
	store i32 %152, i32* @last_char
	%153 = load i32, i32* @last_char
	br label %b155
b155:
	br label %b156
b156:
	br label %b157
b157:
	%154 = icmp sge i32 %153, 48
	%155 = icmp ne i1 %154, 0
	br i1 %155, label %b160, label %b159
b158:
	br label %b161
b159:
	br label %b161
b160:
	%156 = icmp sle i32 %153, 57
	%157 = icmp ne i1 %156, 0
	br i1 %157, label %b158, label %b159
b161:
	%158 = phi i32 [ 1, %b158 ],[ 0, %b159 ]
	%159 = icmp ne i32 %158, 0
	br i1 %159, label %b162, label %b163
b162:
	%160 = load i32, i32* @num
	%161 = mul i32 %160, 10
	%162 = load i32, i32* @last_char
	%163 = add i32 %161, %162
	%164 = sub i32 %163, 48
	store i32 %164, i32* @num
	br label %b153
b163:
	store i32 0, i32* @cur_token
	br label %b149
b164:
	br label %b165
b165:
	%165 = getelementptr [256 x i32], [256 x i32]* %38, i32 0, i32 0
	br label %b166
b166:
	br label %b167
b167:
	%166 = getelementptr i32, i32* %165, i32 0
	%167 = load i32, i32* %166
	br label %b168
b168:
	%168 = icmp ne i32 %167, 0
	br i1 %168, label %b199, label %b195
b169:
	%169 = getelementptr [256 x i32], [256 x i32]* %38, i32 0, i32 0
	br label %b170
b170:
	br label %b171
b171:
	%170 = getelementptr i32, i32* %169, i32 0
	%171 = load i32, i32* %170
	%172 = getelementptr i32, i32* %169, i32 %171
	%173 = load i32, i32* %172
	%174 = getelementptr i32, i32* %169, i32 0
	%175 = getelementptr i32, i32* %169, i32 0
	%176 = load i32, i32* %175
	%177 = sub i32 %176, 1
	store i32 %177, i32* %174
	br label %b172
b172:
	%178 = getelementptr [256 x i32], [256 x i32]* %36, i32 0, i32 0
	br label %b173
b173:
	br label %b174
b174:
	%179 = getelementptr i32, i32* %178, i32 0
	%180 = load i32, i32* %179
	%181 = getelementptr i32, i32* %178, i32 %180
	%182 = load i32, i32* %181
	%183 = getelementptr i32, i32* %178, i32 0
	%184 = getelementptr i32, i32* %178, i32 0
	%185 = load i32, i32* %184
	%186 = sub i32 %185, 1
	store i32 %186, i32* %183
	br label %b175
b175:
	%187 = getelementptr [256 x i32], [256 x i32]* %36, i32 0, i32 0
	br label %b176
b176:
	br label %b177
b177:
	%188 = getelementptr i32, i32* %187, i32 0
	%189 = load i32, i32* %188
	%190 = getelementptr i32, i32* %187, i32 %189
	%191 = load i32, i32* %190
	%192 = getelementptr i32, i32* %187, i32 0
	%193 = getelementptr i32, i32* %187, i32 0
	%194 = load i32, i32* %193
	%195 = sub i32 %194, 1
	store i32 %195, i32* %192
	br label %b178
b178:
	%196 = getelementptr [256 x i32], [256 x i32]* %36, i32 0, i32 0
	br label %b179
b179:
	br label %b180
b180:
	%197 = icmp eq i32 %173, 43
	%198 = icmp ne i1 %197, 0
	br i1 %198, label %b181, label %b182
b181:
	%199 = add i32 %191, %182
	br label %b191
b182:
	%200 = icmp eq i32 %173, 45
	%201 = icmp ne i1 %200, 0
	br i1 %201, label %b183, label %b184
b183:
	%202 = sub i32 %191, %182
	br label %b191
b184:
	%203 = icmp eq i32 %173, 42
	%204 = icmp ne i1 %203, 0
	br i1 %204, label %b185, label %b186
b185:
	%205 = mul i32 %191, %182
	br label %b191
b186:
	%206 = icmp eq i32 %173, 47
	%207 = icmp ne i1 %206, 0
	br i1 %207, label %b187, label %b188
b187:
	%208 = sdiv i32 %191, %182
	br label %b191
b188:
	%209 = icmp eq i32 %173, 37
	%210 = icmp ne i1 %209, 0
	br i1 %210, label %b189, label %b190
b189:
	%211 = srem i32 %191, %182
	br label %b191
b190:
	br label %b191
b191:
	%212 = phi i32 [ %199, %b181 ],[ %202, %b183 ],[ %205, %b185 ],[ %208, %b187 ],[ %211, %b189 ],[ 0, %b190 ]
	br label %b192
b192:
	br label %b193
b193:
	%213 = getelementptr i32, i32* %196, i32 0
	%214 = getelementptr i32, i32* %196, i32 0
	%215 = load i32, i32* %214
	%216 = add i32 %215, 1
	store i32 %216, i32* %213
	%217 = getelementptr i32, i32* %196, i32 0
	%218 = load i32, i32* %217
	%219 = getelementptr i32, i32* %196, i32 %218
	store i32 %212, i32* %219
	br label %b194
b194:
	br label %b165
b195:
	%220 = getelementptr [256 x i32], [256 x i32]* %38, i32 0, i32 0
	br label %b196
b196:
	br label %b197
b197:
	%221 = getelementptr i32, i32* %220, i32 0
	%222 = getelementptr i32, i32* %220, i32 0
	%223 = load i32, i32* %222
	%224 = add i32 %223, 1
	store i32 %224, i32* %221
	%225 = getelementptr i32, i32* %220, i32 0
	%226 = load i32, i32* %225
	%227 = getelementptr i32, i32* %220, i32 %226
	store i32 %87, i32* %227
	br label %b198
b198:
	%228 = load i32, i32* @cur_token
	%229 = icmp ne i32 %228, 0
	%230 = icmp ne i1 %229, 0
	br i1 %230, label %b223, label %b226
b199:
	%231 = getelementptr [256 x i32], [256 x i32]* %38, i32 0, i32 0
	br label %b200
b200:
	br label %b201
b201:
	%232 = getelementptr i32, i32* %231, i32 0
	%233 = load i32, i32* %232
	%234 = getelementptr i32, i32* %231, i32 %233
	%235 = load i32, i32* %234
	br label %b202
b202:
	br label %b203
b203:
	br label %b204
b204:
	%236 = icmp eq i32 %235, 43
	%237 = icmp ne i1 %236, 0
	br i1 %237, label %b205, label %b207
b205:
	br label %b212
b206:
	%238 = icmp eq i32 %235, 42
	%239 = icmp ne i1 %238, 0
	br i1 %239, label %b208, label %b210
b207:
	%240 = icmp eq i32 %235, 45
	%241 = icmp ne i1 %240, 0
	br i1 %241, label %b205, label %b206
b208:
	br label %b212
b209:
	br label %b212
b210:
	%242 = icmp eq i32 %235, 47
	%243 = icmp ne i1 %242, 0
	br i1 %243, label %b208, label %b211
b211:
	%244 = icmp eq i32 %235, 37
	%245 = icmp ne i1 %244, 0
	br i1 %245, label %b208, label %b209
b212:
	%246 = phi i32 [ 10, %b205 ],[ 20, %b208 ],[ 0, %b209 ]
	br label %b213
b213:
	br label %b214
b214:
	%247 = icmp eq i32 %87, 43
	%248 = icmp ne i1 %247, 0
	br i1 %248, label %b215, label %b217
b215:
	br label %b222
b216:
	%249 = icmp eq i32 %87, 42
	%250 = icmp ne i1 %249, 0
	br i1 %250, label %b218, label %b220
b217:
	%251 = icmp eq i32 %87, 45
	%252 = icmp ne i1 %251, 0
	br i1 %252, label %b215, label %b216
b218:
	br label %b222
b219:
	br label %b222
b220:
	%253 = icmp eq i32 %87, 47
	%254 = icmp ne i1 %253, 0
	br i1 %254, label %b218, label %b221
b221:
	%255 = icmp eq i32 %87, 37
	%256 = icmp ne i1 %255, 0
	br i1 %256, label %b218, label %b219
b222:
	%257 = phi i32 [ 10, %b215 ],[ 20, %b218 ],[ 0, %b219 ]
	%258 = icmp sge i32 %246, %257
	%259 = icmp ne i1 %258, 0
	br i1 %259, label %b169, label %b195
b223:
	br label %b224
b224:
	call void @putch(i32 112)
	call void @putch(i32 97)
	call void @putch(i32 110)
	call void @putch(i32 105)
	call void @putch(i32 99)
	call void @putch(i32 33)
	call void @putch(i32 10)
	br label %b225
b225:
	br label %b299
b226:
	%260 = getelementptr [256 x i32], [256 x i32]* %36, i32 0, i32 0
	%261 = load i32, i32* @num
	br label %b227
b227:
	br label %b228
b228:
	%262 = getelementptr i32, i32* %260, i32 0
	%263 = getelementptr i32, i32* %260, i32 0
	%264 = load i32, i32* %263
	%265 = add i32 %264, 1
	store i32 %265, i32* %262
	%266 = getelementptr i32, i32* %260, i32 0
	%267 = load i32, i32* %266
	%268 = getelementptr i32, i32* %260, i32 %267
	store i32 %261, i32* %268
	br label %b229
b229:
	br label %b230
b230:
	br label %b231
b231:
	%269 = load i32, i32* @last_char
	br label %b232
b232:
	br label %b233
b233:
	%270 = icmp eq i32 %269, 32
	%271 = icmp ne i1 %270, 0
	br i1 %271, label %b234, label %b236
b234:
	br label %b237
b235:
	br label %b237
b236:
	%272 = icmp eq i32 %269, 10
	%273 = icmp ne i1 %272, 0
	br i1 %273, label %b234, label %b235
b237:
	%274 = phi i32 [ 1, %b234 ],[ 0, %b235 ]
	%275 = icmp ne i32 %274, 0
	br i1 %275, label %b238, label %b241
b238:
	br label %b239
b239:
	%276 = call i32 @getch()
	store i32 %276, i32* @last_char
	br label %b240
b240:
	br label %b231
b241:
	%277 = load i32, i32* @last_char
	br label %b242
b242:
	br label %b243
b243:
	%278 = icmp sge i32 %277, 48
	%279 = icmp ne i1 %278, 0
	br i1 %279, label %b246, label %b245
b244:
	br label %b247
b245:
	br label %b247
b246:
	%280 = icmp sle i32 %277, 57
	%281 = icmp ne i1 %280, 0
	br i1 %281, label %b244, label %b245
b247:
	%282 = phi i32 [ 1, %b244 ],[ 0, %b245 ]
	%283 = icmp ne i32 %282, 0
	br i1 %283, label %b248, label %b250
b248:
	%284 = load i32, i32* @last_char
	%285 = sub i32 %284, 48
	store i32 %285, i32* @num
	br label %b253
b249:
	br label %b264
b250:
	%286 = load i32, i32* @last_char
	store i32 %286, i32* @other
	br label %b251
b251:
	%287 = call i32 @getch()
	br label %b252
b252:
	store i32 1, i32* @cur_token
	br label %b249
b253:
	br label %b254
b254:
	%288 = call i32 @getch()
	store i32 %288, i32* @last_char
	%289 = load i32, i32* @last_char
	br label %b255
b255:
	br label %b256
b256:
	br label %b257
b257:
	%290 = icmp sge i32 %289, 48
	%291 = icmp ne i1 %290, 0
	br i1 %291, label %b260, label %b259
b258:
	br label %b261
b259:
	br label %b261
b260:
	%292 = icmp sle i32 %289, 57
	%293 = icmp ne i1 %292, 0
	br i1 %293, label %b258, label %b259
b261:
	%294 = phi i32 [ 1, %b258 ],[ 0, %b259 ]
	%295 = icmp ne i32 %294, 0
	br i1 %295, label %b262, label %b263
b262:
	%296 = load i32, i32* @num
	%297 = mul i32 %296, 10
	%298 = load i32, i32* @last_char
	%299 = add i32 %297, %298
	%300 = sub i32 %299, 48
	store i32 %300, i32* @num
	br label %b253
b263:
	store i32 0, i32* @cur_token
	br label %b249
b264:
	br label %b81
b265:
	%301 = getelementptr [256 x i32], [256 x i32]* %38, i32 0, i32 0
	br label %b266
b266:
	br label %b267
b267:
	%302 = getelementptr i32, i32* %301, i32 0
	%303 = load i32, i32* %302
	br label %b268
b268:
	%304 = icmp ne i32 %303, 0
	br i1 %304, label %b269, label %b295
b269:
	%305 = getelementptr [256 x i32], [256 x i32]* %38, i32 0, i32 0
	br label %b270
b270:
	br label %b271
b271:
	%306 = getelementptr i32, i32* %305, i32 0
	%307 = load i32, i32* %306
	%308 = getelementptr i32, i32* %305, i32 %307
	%309 = load i32, i32* %308
	%310 = getelementptr i32, i32* %305, i32 0
	%311 = getelementptr i32, i32* %305, i32 0
	%312 = load i32, i32* %311
	%313 = sub i32 %312, 1
	store i32 %313, i32* %310
	br label %b272
b272:
	%314 = getelementptr [256 x i32], [256 x i32]* %36, i32 0, i32 0
	br label %b273
b273:
	br label %b274
b274:
	%315 = getelementptr i32, i32* %314, i32 0
	%316 = load i32, i32* %315
	%317 = getelementptr i32, i32* %314, i32 %316
	%318 = load i32, i32* %317
	%319 = getelementptr i32, i32* %314, i32 0
	%320 = getelementptr i32, i32* %314, i32 0
	%321 = load i32, i32* %320
	%322 = sub i32 %321, 1
	store i32 %322, i32* %319
	br label %b275
b275:
	%323 = getelementptr [256 x i32], [256 x i32]* %36, i32 0, i32 0
	br label %b276
b276:
	br label %b277
b277:
	%324 = getelementptr i32, i32* %323, i32 0
	%325 = load i32, i32* %324
	%326 = getelementptr i32, i32* %323, i32 %325
	%327 = load i32, i32* %326
	%328 = getelementptr i32, i32* %323, i32 0
	%329 = getelementptr i32, i32* %323, i32 0
	%330 = load i32, i32* %329
	%331 = sub i32 %330, 1
	store i32 %331, i32* %328
	br label %b278
b278:
	%332 = getelementptr [256 x i32], [256 x i32]* %36, i32 0, i32 0
	br label %b279
b279:
	br label %b280
b280:
	%333 = icmp eq i32 %309, 43
	%334 = icmp ne i1 %333, 0
	br i1 %334, label %b281, label %b282
b281:
	%335 = add i32 %327, %318
	br label %b291
b282:
	%336 = icmp eq i32 %309, 45
	%337 = icmp ne i1 %336, 0
	br i1 %337, label %b283, label %b284
b283:
	%338 = sub i32 %327, %318
	br label %b291
b284:
	%339 = icmp eq i32 %309, 42
	%340 = icmp ne i1 %339, 0
	br i1 %340, label %b285, label %b286
b285:
	%341 = mul i32 %327, %318
	br label %b291
b286:
	%342 = icmp eq i32 %309, 47
	%343 = icmp ne i1 %342, 0
	br i1 %343, label %b287, label %b288
b287:
	%344 = sdiv i32 %327, %318
	br label %b291
b288:
	%345 = icmp eq i32 %309, 37
	%346 = icmp ne i1 %345, 0
	br i1 %346, label %b289, label %b290
b289:
	%347 = srem i32 %327, %318
	br label %b291
b290:
	br label %b291
b291:
	%348 = phi i32 [ %335, %b281 ],[ %338, %b283 ],[ %341, %b285 ],[ %344, %b287 ],[ %347, %b289 ],[ 0, %b290 ]
	br label %b292
b292:
	br label %b293
b293:
	%349 = getelementptr i32, i32* %332, i32 0
	%350 = getelementptr i32, i32* %332, i32 0
	%351 = load i32, i32* %350
	%352 = add i32 %351, 1
	store i32 %352, i32* %349
	%353 = getelementptr i32, i32* %332, i32 0
	%354 = load i32, i32* %353
	%355 = getelementptr i32, i32* %332, i32 %354
	store i32 %348, i32* %355
	br label %b294
b294:
	br label %b265
b295:
	%356 = getelementptr [256 x i32], [256 x i32]* %36, i32 0, i32 0
	br label %b296
b296:
	br label %b297
b297:
	%357 = getelementptr i32, i32* %356, i32 0
	%358 = load i32, i32* %357
	%359 = getelementptr i32, i32* %356, i32 %358
	%360 = load i32, i32* %359
	br label %b298
b298:
	br label %b299
b299:
	%361 = phi i32 [ -1, %b41 ],[ -1, %b225 ],[ %360, %b298 ]
	call void @putint(i32 %361)
	call void @putch(i32 10)
	%362 = sub i32 %34, 1
	br label %b36
b300:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
}

