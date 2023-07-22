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
	br label %b2
b2:
	%1 = phi i32 [ 0, %b1 ],[ %9, %b6 ]
	%2 = phi i32 [ %0, %b1 ],[ %10, %b6 ]
	%3 = icmp slt i32 %2, 48
	%4 = icmp ne i1 %3, 0
	br i1 %4, label %b3, label %b4
b3:
	%5 = icmp eq i32 %2, 45
	%6 = icmp ne i1 %5, 0
	br i1 %6, label %b5, label %b6
b4:
	%7 = icmp sgt i32 %2, 57
	%8 = icmp ne i1 %7, 0
	br i1 %8, label %b3, label %b7
b5:
	br label %b6
b6:
	%9 = phi i32 [ %1, %b3 ],[ 1, %b5 ]
	%10 = call i32 @getch()
	br label %b2
b7:
	%11 = phi i32 [ 0, %b4 ],[ %17, %b8 ]
	%12 = phi i32 [ %2, %b4 ],[ %18, %b8 ]
	%13 = icmp sge i32 %12, 48
	%14 = icmp ne i1 %13, 0
	br i1 %14, label %b10, label %b9
b8:
	%15 = mul i32 %11, 10
	%16 = add i32 %15, %12
	%17 = sub i32 %16, 48
	%18 = call i32 @getch()
	br label %b7
b9:
	%19 = icmp ne i32 %1, 0
	br i1 %19, label %b11, label %b12
b10:
	%20 = icmp sle i32 %12, 57
	%21 = icmp ne i1 %20, 0
	br i1 %21, label %b8, label %b9
b11:
	%22 = sub i32 0, %11
	br label %b13
b12:
	br label %b13
b13:
	%23 = phi i32 [ %22, %b11 ],[ %11, %b12 ]
	br label %b14
b14:
	%24 = call i32 @getch()
	br label %b15
b15:
	%25 = phi i32 [ 0, %b14 ],[ %33, %b19 ]
	%26 = phi i32 [ %24, %b14 ],[ %34, %b19 ]
	%27 = icmp slt i32 %26, 48
	%28 = icmp ne i1 %27, 0
	br i1 %28, label %b16, label %b17
b16:
	%29 = icmp eq i32 %26, 45
	%30 = icmp ne i1 %29, 0
	br i1 %30, label %b18, label %b19
b17:
	%31 = icmp sgt i32 %26, 57
	%32 = icmp ne i1 %31, 0
	br i1 %32, label %b16, label %b20
b18:
	br label %b19
b19:
	%33 = phi i32 [ %25, %b16 ],[ 1, %b18 ]
	%34 = call i32 @getch()
	br label %b15
b20:
	%35 = phi i32 [ 0, %b17 ],[ %41, %b21 ]
	%36 = phi i32 [ %26, %b17 ],[ %42, %b21 ]
	%37 = icmp sge i32 %36, 48
	%38 = icmp ne i1 %37, 0
	br i1 %38, label %b23, label %b22
b21:
	%39 = mul i32 %35, 10
	%40 = add i32 %39, %36
	%41 = sub i32 %40, 48
	%42 = call i32 @getch()
	br label %b20
b22:
	%43 = icmp ne i32 %25, 0
	br i1 %43, label %b24, label %b25
b23:
	%44 = icmp sle i32 %36, 57
	%45 = icmp ne i1 %44, 0
	br i1 %45, label %b21, label %b22
b24:
	%46 = sub i32 0, %35
	br label %b26
b25:
	br label %b26
b26:
	%47 = phi i32 [ %46, %b24 ],[ %35, %b25 ]
	br label %b27
b27:
	br label %b28
b28:
	%48 = phi i32 [ 0, %b27 ],[ %52, %b29 ]
	%49 = icmp slt i32 %48, 1005
	%50 = icmp ne i1 %49, 0
	br i1 %50, label %b29, label %b30
b29:
	%51 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %48
	store i32 -1, i32* %51
	%52 = add i32 %48, 1
	br label %b28
b30:
	br label %b31
b31:
	br label %b32
b32:
	%53 = phi i32 [ %47, %b31 ],[ %159, %b89 ]
	%54 = icmp ne i32 %53, 0
	br i1 %54, label %b33, label %b34
b33:
	%55 = call i32 @getch()
	br label %b35
b34:
	call void @putch(i32 10)
	call void @putint(i32 0)
	ret i32 0
b35:
	%56 = phi i32 [ %55, %b33 ],[ %59, %b36 ]
	%57 = icmp ne i32 %56, 81
	%58 = icmp ne i1 %57, 0
	br i1 %58, label %b38, label %b37
b36:
	%59 = call i32 @getch()
	br label %b35
b37:
	%60 = icmp eq i32 %56, 81
	%61 = icmp ne i1 %60, 0
	br i1 %61, label %b39, label %b90
b38:
	%62 = icmp ne i32 %56, 85
	%63 = icmp ne i1 %62, 0
	br i1 %63, label %b36, label %b37
b39:
	br label %b40
b40:
	%64 = call i32 @getch()
	br label %b41
b41:
	%65 = phi i32 [ 0, %b40 ],[ %73, %b45 ]
	%66 = phi i32 [ %64, %b40 ],[ %74, %b45 ]
	%67 = icmp slt i32 %66, 48
	%68 = icmp ne i1 %67, 0
	br i1 %68, label %b42, label %b43
b42:
	%69 = icmp eq i32 %66, 45
	%70 = icmp ne i1 %69, 0
	br i1 %70, label %b44, label %b45
b43:
	%71 = icmp sgt i32 %66, 57
	%72 = icmp ne i1 %71, 0
	br i1 %72, label %b42, label %b46
b44:
	br label %b45
b45:
	%73 = phi i32 [ %65, %b42 ],[ 1, %b44 ]
	%74 = call i32 @getch()
	br label %b41
b46:
	%75 = phi i32 [ 0, %b43 ],[ %81, %b47 ]
	%76 = phi i32 [ %66, %b43 ],[ %82, %b47 ]
	%77 = icmp sge i32 %76, 48
	%78 = icmp ne i1 %77, 0
	br i1 %78, label %b49, label %b48
b47:
	%79 = mul i32 %75, 10
	%80 = add i32 %79, %76
	%81 = sub i32 %80, 48
	%82 = call i32 @getch()
	br label %b46
b48:
	%83 = icmp ne i32 %65, 0
	br i1 %83, label %b50, label %b51
b49:
	%84 = icmp sle i32 %76, 57
	%85 = icmp ne i1 %84, 0
	br i1 %85, label %b47, label %b48
b50:
	%86 = sub i32 0, %75
	br label %b52
b51:
	br label %b52
b52:
	%87 = phi i32 [ %86, %b50 ],[ %75, %b51 ]
	br label %b53
b53:
	%88 = call i32 @getch()
	br label %b54
b54:
	%89 = phi i32 [ 0, %b53 ],[ %97, %b58 ]
	%90 = phi i32 [ %88, %b53 ],[ %98, %b58 ]
	%91 = icmp slt i32 %90, 48
	%92 = icmp ne i1 %91, 0
	br i1 %92, label %b55, label %b56
b55:
	%93 = icmp eq i32 %90, 45
	%94 = icmp ne i1 %93, 0
	br i1 %94, label %b57, label %b58
b56:
	%95 = icmp sgt i32 %90, 57
	%96 = icmp ne i1 %95, 0
	br i1 %96, label %b55, label %b59
b57:
	br label %b58
b58:
	%97 = phi i32 [ %89, %b55 ],[ 1, %b57 ]
	%98 = call i32 @getch()
	br label %b54
b59:
	%99 = phi i32 [ 0, %b56 ],[ %105, %b60 ]
	%100 = phi i32 [ %90, %b56 ],[ %106, %b60 ]
	%101 = icmp sge i32 %100, 48
	%102 = icmp ne i1 %101, 0
	br i1 %102, label %b62, label %b61
b60:
	%103 = mul i32 %99, 10
	%104 = add i32 %103, %100
	%105 = sub i32 %104, 48
	%106 = call i32 @getch()
	br label %b59
b61:
	%107 = icmp ne i32 %89, 0
	br i1 %107, label %b63, label %b64
b62:
	%108 = icmp sle i32 %100, 57
	%109 = icmp ne i1 %108, 0
	br i1 %109, label %b60, label %b61
b63:
	%110 = sub i32 0, %99
	br label %b65
b64:
	br label %b65
b65:
	%111 = phi i32 [ %110, %b63 ],[ %99, %b64 ]
	br label %b66
b66:
	br label %b67
b67:
	store i32 0, i32* @h
	store i32 0, i32* @tail
	br label %b68
b68:
	br label %b69
b69:
	%112 = getelementptr [1005 x i32], [1005 x i32]* @inq, i32 0, i32 %87
	store i32 1, i32* %112
	%113 = load i32, i32* @tail
	%114 = add i32 %113, 1
	store i32 %114, i32* @tail
	%115 = load i32, i32* @tail
	%116 = getelementptr [1005 x i32], [1005 x i32]* @que, i32 0, i32 %115
	store i32 %87, i32* %116
	br label %b70
b70:
	br label %b71
b71:
	%117 = phi i32 [ 0, %b70 ],[ %129, %b78 ]
	%118 = load i32, i32* @h
	%119 = load i32, i32* @tail
	%120 = icmp slt i32 %118, %119
	%121 = icmp ne i1 %120, 0
	br i1 %121, label %b72, label %b75
b72:
	br label %b73
b73:
	%122 = load i32, i32* @h
	%123 = add i32 %122, 1
	store i32 %123, i32* @h
	%124 = load i32, i32* @h
	%125 = getelementptr [1005 x i32], [1005 x i32]* @que, i32 0, i32 %124
	%126 = load i32, i32* %125
	br label %b74
b74:
	%127 = icmp eq i32 %126, %111
	%128 = icmp ne i1 %127, 0
	br i1 %128, label %b76, label %b77
b75:
	br label %b85
b76:
	br label %b77
b77:
	%129 = phi i32 [ %117, %b74 ],[ 1, %b76 ]
	%130 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %126
	%131 = load i32, i32* %130
	br label %b78
b78:
	%132 = phi i32 [ %131, %b77 ],[ %150, %b84 ]
	%133 = icmp ne i32 %132, -1
	%134 = icmp ne i1 %133, 0
	br i1 %134, label %b79, label %b71
b79:
	%135 = getelementptr [5005 x i32], [5005 x i32]* @to, i32 0, i32 %132
	%136 = load i32, i32* %135
	%137 = getelementptr [1005 x i32], [1005 x i32]* @inq, i32 0, i32 %136
	%138 = load i32, i32* %137
	%139 = zext i1 0 to i32
	%140 = icmp eq i32 %138, %139
	%141 = icmp ne i1 %140, 0
	br i1 %141, label %b80, label %b84
b80:
	%142 = getelementptr [5005 x i32], [5005 x i32]* @to, i32 0, i32 %132
	%143 = load i32, i32* %142
	br label %b81
b81:
	br label %b82
b82:
	%144 = getelementptr [1005 x i32], [1005 x i32]* @inq, i32 0, i32 %143
	store i32 1, i32* %144
	%145 = load i32, i32* @tail
	%146 = add i32 %145, 1
	store i32 %146, i32* @tail
	%147 = load i32, i32* @tail
	%148 = getelementptr [1005 x i32], [1005 x i32]* @que, i32 0, i32 %147
	store i32 %143, i32* %148
	br label %b83
b83:
	br label %b84
b84:
	%149 = getelementptr [5005 x i32], [5005 x i32]* @next, i32 0, i32 %132
	%150 = load i32, i32* %149
	br label %b78
b85:
	%151 = phi i32 [ 0, %b75 ],[ %158, %b86 ]
	%152 = load i32, i32* @tail
	%153 = icmp sle i32 %151, %152
	%154 = icmp ne i1 %153, 0
	br i1 %154, label %b86, label %b87
b86:
	%155 = getelementptr [1005 x i32], [1005 x i32]* @que, i32 0, i32 %151
	%156 = load i32, i32* %155
	%157 = getelementptr [1005 x i32], [1005 x i32]* @inq, i32 0, i32 %156
	store i32 0, i32* %157
	%158 = add i32 %151, 1
	br label %b85
b87:
	br label %b88
b88:
	call void @putint(i32 %117)
	call void @putch(i32 10)
	br label %b89
b89:
	%159 = sub i32 %53, 1
	br label %b32
b90:
	br label %b91
b91:
	%160 = call i32 @getch()
	br label %b92
b92:
	%161 = phi i32 [ 0, %b91 ],[ %169, %b96 ]
	%162 = phi i32 [ %160, %b91 ],[ %170, %b96 ]
	%163 = icmp slt i32 %162, 48
	%164 = icmp ne i1 %163, 0
	br i1 %164, label %b93, label %b94
b93:
	%165 = icmp eq i32 %162, 45
	%166 = icmp ne i1 %165, 0
	br i1 %166, label %b95, label %b96
b94:
	%167 = icmp sgt i32 %162, 57
	%168 = icmp ne i1 %167, 0
	br i1 %168, label %b93, label %b97
b95:
	br label %b96
b96:
	%169 = phi i32 [ %161, %b93 ],[ 1, %b95 ]
	%170 = call i32 @getch()
	br label %b92
b97:
	%171 = phi i32 [ 0, %b94 ],[ %177, %b98 ]
	%172 = phi i32 [ %162, %b94 ],[ %178, %b98 ]
	%173 = icmp sge i32 %172, 48
	%174 = icmp ne i1 %173, 0
	br i1 %174, label %b100, label %b99
b98:
	%175 = mul i32 %171, 10
	%176 = add i32 %175, %172
	%177 = sub i32 %176, 48
	%178 = call i32 @getch()
	br label %b97
b99:
	%179 = icmp ne i32 %161, 0
	br i1 %179, label %b101, label %b102
b100:
	%180 = icmp sle i32 %172, 57
	%181 = icmp ne i1 %180, 0
	br i1 %181, label %b98, label %b99
b101:
	%182 = sub i32 0, %171
	br label %b103
b102:
	br label %b103
b103:
	%183 = phi i32 [ %182, %b101 ],[ %171, %b102 ]
	br label %b104
b104:
	%184 = call i32 @getch()
	br label %b105
b105:
	%185 = phi i32 [ 0, %b104 ],[ %193, %b109 ]
	%186 = phi i32 [ %184, %b104 ],[ %194, %b109 ]
	%187 = icmp slt i32 %186, 48
	%188 = icmp ne i1 %187, 0
	br i1 %188, label %b106, label %b107
b106:
	%189 = icmp eq i32 %186, 45
	%190 = icmp ne i1 %189, 0
	br i1 %190, label %b108, label %b109
b107:
	%191 = icmp sgt i32 %186, 57
	%192 = icmp ne i1 %191, 0
	br i1 %192, label %b106, label %b110
b108:
	br label %b109
b109:
	%193 = phi i32 [ %185, %b106 ],[ 1, %b108 ]
	%194 = call i32 @getch()
	br label %b105
b110:
	%195 = phi i32 [ 0, %b107 ],[ %201, %b111 ]
	%196 = phi i32 [ %186, %b107 ],[ %202, %b111 ]
	%197 = icmp sge i32 %196, 48
	%198 = icmp ne i1 %197, 0
	br i1 %198, label %b113, label %b112
b111:
	%199 = mul i32 %195, 10
	%200 = add i32 %199, %196
	%201 = sub i32 %200, 48
	%202 = call i32 @getch()
	br label %b110
b112:
	%203 = icmp ne i32 %185, 0
	br i1 %203, label %b114, label %b115
b113:
	%204 = icmp sle i32 %196, 57
	%205 = icmp ne i1 %204, 0
	br i1 %205, label %b111, label %b112
b114:
	%206 = sub i32 0, %195
	br label %b116
b115:
	br label %b116
b116:
	%207 = phi i32 [ %206, %b114 ],[ %195, %b115 ]
	br label %b117
b117:
	br label %b118
b118:
	%208 = load i32, i32* @cnt
	%209 = getelementptr [5005 x i32], [5005 x i32]* @to, i32 0, i32 %208
	store i32 %207, i32* %209
	%210 = load i32, i32* @cnt
	%211 = getelementptr [5005 x i32], [5005 x i32]* @next, i32 0, i32 %210
	%212 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %183
	%213 = load i32, i32* %212
	store i32 %213, i32* %211
	%214 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %183
	%215 = load i32, i32* @cnt
	store i32 %215, i32* %214
	%216 = load i32, i32* @cnt
	%217 = add i32 %216, 1
	store i32 %217, i32* @cnt
	%218 = load i32, i32* @cnt
	%219 = getelementptr [5005 x i32], [5005 x i32]* @to, i32 0, i32 %218
	store i32 %183, i32* %219
	%220 = load i32, i32* @cnt
	%221 = getelementptr [5005 x i32], [5005 x i32]* @next, i32 0, i32 %220
	%222 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %207
	%223 = load i32, i32* %222
	store i32 %223, i32* %221
	%224 = getelementptr [1005 x i32], [1005 x i32]* @head, i32 0, i32 %207
	%225 = load i32, i32* @cnt
	store i32 %225, i32* %224
	%226 = load i32, i32* @cnt
	%227 = add i32 %226, 1
	store i32 %227, i32* @cnt
	br label %b119
b119:
	br label %b89
}

