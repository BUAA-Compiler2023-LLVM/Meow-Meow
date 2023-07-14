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
	%0 = phi i32 [ 0, %b0 ],[ %18, %b6 ]
	%1 = phi i32 [ 0, %b0 ],[ %19, %b6 ]
	%2 = phi i32 [ 0, %b0 ],[ %20, %b6 ]
	%3 = phi i32 [ 0, %b0 ],[ %21, %b6 ]
	%4 = phi i32 [ 0, %b0 ],[ %22, %b6 ]
	%5 = phi i32 [ 0, %b0 ],[ %23, %b6 ]
	%6 = phi i32 [ 0, %b0 ],[ %24, %b6 ]
	%7 = phi i32 [ 0, %b0 ],[ %25, %b6 ]
	%8 = phi i32 [ 0, %b0 ],[ %26, %b6 ]
	%9 = phi i32 [ 0, %b0 ],[ %27, %b6 ]
	%10 = phi i32 [ 0, %b0 ],[ %28, %b6 ]
	%11 = phi i32 [ 0, %b0 ],[ %29, %b6 ]
	%12 = phi i32 [ 0, %b0 ],[ %30, %b6 ]
	%13 = phi i32 [ 0, %b0 ],[ %31, %b6 ]
	%14 = phi i32 [ 0, %b0 ],[ %35, %b6 ]
	%15 = phi i32 [ 0, %b0 ],[ %32, %b6 ]
	%16 = icmp slt i32 %14, 3
	%17 = icmp ne i1 %16, 0
	br i1 %17, label %b2, label %b3
b2:
	br label %b4
b3:
	call void @putint(i32 %15)
	ret i32 %15
b4:
	%18 = phi i32 [ %0, %b2 ],[ %36, %b9 ]
	%19 = phi i32 [ %1, %b2 ],[ %37, %b9 ]
	%20 = phi i32 [ %2, %b2 ],[ %38, %b9 ]
	%21 = phi i32 [ %3, %b2 ],[ %39, %b9 ]
	%22 = phi i32 [ %4, %b2 ],[ %40, %b9 ]
	%23 = phi i32 [ %5, %b2 ],[ %41, %b9 ]
	%24 = phi i32 [ %6, %b2 ],[ %42, %b9 ]
	%25 = phi i32 [ %7, %b2 ],[ %43, %b9 ]
	%26 = phi i32 [ %8, %b2 ],[ %44, %b9 ]
	%27 = phi i32 [ %9, %b2 ],[ %45, %b9 ]
	%28 = phi i32 [ %10, %b2 ],[ %46, %b9 ]
	%29 = phi i32 [ %11, %b2 ],[ %47, %b9 ]
	%30 = phi i32 [ %12, %b2 ],[ %48, %b9 ]
	%31 = phi i32 [ 0, %b2 ],[ %52, %b9 ]
	%32 = phi i32 [ %15, %b2 ],[ %49, %b9 ]
	%33 = icmp slt i32 %31, 4
	%34 = icmp ne i1 %33, 0
	br i1 %34, label %b5, label %b6
b5:
	br label %b7
b6:
	%35 = add i32 %14, 1
	br label %b1
b7:
	%36 = phi i32 [ %18, %b5 ],[ %53, %b12 ]
	%37 = phi i32 [ %19, %b5 ],[ %54, %b12 ]
	%38 = phi i32 [ %20, %b5 ],[ %55, %b12 ]
	%39 = phi i32 [ %21, %b5 ],[ %56, %b12 ]
	%40 = phi i32 [ %22, %b5 ],[ %57, %b12 ]
	%41 = phi i32 [ %23, %b5 ],[ %58, %b12 ]
	%42 = phi i32 [ %24, %b5 ],[ %59, %b12 ]
	%43 = phi i32 [ %25, %b5 ],[ %60, %b12 ]
	%44 = phi i32 [ %26, %b5 ],[ %61, %b12 ]
	%45 = phi i32 [ %27, %b5 ],[ %62, %b12 ]
	%46 = phi i32 [ %28, %b5 ],[ %63, %b12 ]
	%47 = phi i32 [ %29, %b5 ],[ %64, %b12 ]
	%48 = phi i32 [ 0, %b5 ],[ %68, %b12 ]
	%49 = phi i32 [ %32, %b5 ],[ %65, %b12 ]
	%50 = icmp slt i32 %48, 5
	%51 = icmp ne i1 %50, 0
	br i1 %51, label %b8, label %b9
b8:
	br label %b10
b9:
	%52 = add i32 %31, 1
	br label %b4
b10:
	%53 = phi i32 [ %36, %b8 ],[ %69, %b15 ]
	%54 = phi i32 [ %37, %b8 ],[ %70, %b15 ]
	%55 = phi i32 [ %38, %b8 ],[ %71, %b15 ]
	%56 = phi i32 [ %39, %b8 ],[ %72, %b15 ]
	%57 = phi i32 [ %40, %b8 ],[ %73, %b15 ]
	%58 = phi i32 [ %41, %b8 ],[ %74, %b15 ]
	%59 = phi i32 [ %42, %b8 ],[ %75, %b15 ]
	%60 = phi i32 [ %43, %b8 ],[ %76, %b15 ]
	%61 = phi i32 [ %44, %b8 ],[ %77, %b15 ]
	%62 = phi i32 [ %45, %b8 ],[ %78, %b15 ]
	%63 = phi i32 [ %46, %b8 ],[ %79, %b15 ]
	%64 = phi i32 [ 0, %b8 ],[ %83, %b15 ]
	%65 = phi i32 [ %49, %b8 ],[ %80, %b15 ]
	%66 = icmp slt i32 %64, 3
	%67 = icmp ne i1 %66, 0
	br i1 %67, label %b11, label %b12
b11:
	br label %b13
b12:
	%68 = add i32 %48, 1
	br label %b7
b13:
	%69 = phi i32 [ %53, %b11 ],[ %84, %b18 ]
	%70 = phi i32 [ %54, %b11 ],[ %85, %b18 ]
	%71 = phi i32 [ %55, %b11 ],[ %86, %b18 ]
	%72 = phi i32 [ %56, %b11 ],[ %87, %b18 ]
	%73 = phi i32 [ %57, %b11 ],[ %88, %b18 ]
	%74 = phi i32 [ %58, %b11 ],[ %89, %b18 ]
	%75 = phi i32 [ %59, %b11 ],[ %90, %b18 ]
	%76 = phi i32 [ %60, %b11 ],[ %91, %b18 ]
	%77 = phi i32 [ %61, %b11 ],[ %92, %b18 ]
	%78 = phi i32 [ %62, %b11 ],[ %93, %b18 ]
	%79 = phi i32 [ 0, %b11 ],[ %97, %b18 ]
	%80 = phi i32 [ %65, %b11 ],[ %94, %b18 ]
	%81 = icmp slt i32 %79, 5
	%82 = icmp ne i1 %81, 0
	br i1 %82, label %b14, label %b15
b14:
	br label %b16
b15:
	%83 = add i32 %64, 1
	br label %b10
b16:
	%84 = phi i32 [ %69, %b14 ],[ %98, %b21 ]
	%85 = phi i32 [ %70, %b14 ],[ %99, %b21 ]
	%86 = phi i32 [ %71, %b14 ],[ %100, %b21 ]
	%87 = phi i32 [ %72, %b14 ],[ %101, %b21 ]
	%88 = phi i32 [ %73, %b14 ],[ %102, %b21 ]
	%89 = phi i32 [ %74, %b14 ],[ %103, %b21 ]
	%90 = phi i32 [ %75, %b14 ],[ %104, %b21 ]
	%91 = phi i32 [ %76, %b14 ],[ %105, %b21 ]
	%92 = phi i32 [ %77, %b14 ],[ %106, %b21 ]
	%93 = phi i32 [ 0, %b14 ],[ %110, %b21 ]
	%94 = phi i32 [ %80, %b14 ],[ %107, %b21 ]
	%95 = icmp slt i32 %93, 4
	%96 = icmp ne i1 %95, 0
	br i1 %96, label %b17, label %b18
b17:
	br label %b19
b18:
	%97 = add i32 %79, 1
	br label %b13
b19:
	%98 = phi i32 [ %84, %b17 ],[ %111, %b24 ]
	%99 = phi i32 [ %85, %b17 ],[ %112, %b24 ]
	%100 = phi i32 [ %86, %b17 ],[ %113, %b24 ]
	%101 = phi i32 [ %87, %b17 ],[ %114, %b24 ]
	%102 = phi i32 [ %88, %b17 ],[ %115, %b24 ]
	%103 = phi i32 [ %89, %b17 ],[ %116, %b24 ]
	%104 = phi i32 [ %90, %b17 ],[ %117, %b24 ]
	%105 = phi i32 [ %91, %b17 ],[ %118, %b24 ]
	%106 = phi i32 [ 0, %b17 ],[ %122, %b24 ]
	%107 = phi i32 [ %94, %b17 ],[ %119, %b24 ]
	%108 = icmp slt i32 %106, 6
	%109 = icmp ne i1 %108, 0
	br i1 %109, label %b20, label %b21
b20:
	br label %b22
b21:
	%110 = add i32 %93, 1
	br label %b16
b22:
	%111 = phi i32 [ %98, %b20 ],[ %123, %b27 ]
	%112 = phi i32 [ %99, %b20 ],[ %124, %b27 ]
	%113 = phi i32 [ %100, %b20 ],[ %125, %b27 ]
	%114 = phi i32 [ %101, %b20 ],[ %126, %b27 ]
	%115 = phi i32 [ %102, %b20 ],[ %127, %b27 ]
	%116 = phi i32 [ %103, %b20 ],[ %128, %b27 ]
	%117 = phi i32 [ %104, %b20 ],[ %129, %b27 ]
	%118 = phi i32 [ 0, %b20 ],[ %133, %b27 ]
	%119 = phi i32 [ %107, %b20 ],[ %130, %b27 ]
	%120 = icmp slt i32 %118, 5
	%121 = icmp ne i1 %120, 0
	br i1 %121, label %b23, label %b24
b23:
	br label %b25
b24:
	%122 = add i32 %106, 1
	br label %b19
b25:
	%123 = phi i32 [ %111, %b23 ],[ %134, %b30 ]
	%124 = phi i32 [ %112, %b23 ],[ %135, %b30 ]
	%125 = phi i32 [ %113, %b23 ],[ %136, %b30 ]
	%126 = phi i32 [ %114, %b23 ],[ %137, %b30 ]
	%127 = phi i32 [ %115, %b23 ],[ %138, %b30 ]
	%128 = phi i32 [ %116, %b23 ],[ %139, %b30 ]
	%129 = phi i32 [ 0, %b23 ],[ %143, %b30 ]
	%130 = phi i32 [ %119, %b23 ],[ %140, %b30 ]
	%131 = icmp slt i32 %129, 5
	%132 = icmp ne i1 %131, 0
	br i1 %132, label %b26, label %b27
b26:
	br label %b28
b27:
	%133 = add i32 %118, 1
	br label %b22
b28:
	%134 = phi i32 [ %123, %b26 ],[ %144, %b33 ]
	%135 = phi i32 [ %124, %b26 ],[ %145, %b33 ]
	%136 = phi i32 [ %125, %b26 ],[ %146, %b33 ]
	%137 = phi i32 [ %126, %b26 ],[ %147, %b33 ]
	%138 = phi i32 [ %127, %b26 ],[ %148, %b33 ]
	%139 = phi i32 [ 0, %b26 ],[ %152, %b33 ]
	%140 = phi i32 [ %130, %b26 ],[ %149, %b33 ]
	%141 = icmp slt i32 %139, 3
	%142 = icmp ne i1 %141, 0
	br i1 %142, label %b29, label %b30
b29:
	br label %b31
b30:
	%143 = add i32 %129, 1
	br label %b25
b31:
	%144 = phi i32 [ %134, %b29 ],[ %153, %b36 ]
	%145 = phi i32 [ %135, %b29 ],[ %154, %b36 ]
	%146 = phi i32 [ %136, %b29 ],[ %155, %b36 ]
	%147 = phi i32 [ %137, %b29 ],[ %156, %b36 ]
	%148 = phi i32 [ 0, %b29 ],[ %160, %b36 ]
	%149 = phi i32 [ %140, %b29 ],[ %157, %b36 ]
	%150 = icmp slt i32 %148, 6
	%151 = icmp ne i1 %150, 0
	br i1 %151, label %b32, label %b33
b32:
	br label %b34
b33:
	%152 = add i32 %139, 1
	br label %b28
b34:
	%153 = phi i32 [ %144, %b32 ],[ %161, %b39 ]
	%154 = phi i32 [ %145, %b32 ],[ %162, %b39 ]
	%155 = phi i32 [ %146, %b32 ],[ %163, %b39 ]
	%156 = phi i32 [ 0, %b32 ],[ %167, %b39 ]
	%157 = phi i32 [ %149, %b32 ],[ %164, %b39 ]
	%158 = icmp slt i32 %156, 7
	%159 = icmp ne i1 %158, 0
	br i1 %159, label %b35, label %b36
b35:
	br label %b37
b36:
	%160 = add i32 %148, 2
	br label %b31
b37:
	%161 = phi i32 [ %153, %b35 ],[ %168, %b42 ]
	%162 = phi i32 [ %154, %b35 ],[ %169, %b42 ]
	%163 = phi i32 [ 0, %b35 ],[ %173, %b42 ]
	%164 = phi i32 [ %157, %b35 ],[ %170, %b42 ]
	%165 = icmp slt i32 %163, 5
	%166 = icmp ne i1 %165, 0
	br i1 %166, label %b38, label %b39
b38:
	br label %b40
b39:
	%167 = add i32 %156, 2
	br label %b34
b40:
	%168 = phi i32 [ %161, %b38 ],[ %174, %b45 ]
	%169 = phi i32 [ 0, %b38 ],[ %181, %b45 ]
	%170 = phi i32 [ %164, %b38 ],[ %175, %b45 ]
	%171 = icmp slt i32 %169, 3
	%172 = icmp ne i1 %171, 0
	br i1 %172, label %b41, label %b42
b41:
	br label %b43
b42:
	%173 = add i32 %163, 2
	br label %b37
b43:
	%174 = phi i32 [ 0, %b41 ],[ %180, %b44 ]
	%175 = phi i32 [ %170, %b41 ],[ %179, %b44 ]
	%176 = icmp slt i32 %174, 6
	%177 = icmp ne i1 %176, 0
	br i1 %177, label %b44, label %b45
b44:
	%178 = add i32 %175, 3
	%179 = srem i32 %178, 999
	%180 = add i32 %174, 3
	br label %b43
b45:
	%181 = add i32 %169, 1
	br label %b40
}

