; ModuleID = '/home/kevin/Develop/EMT/test/ct.c.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str1 = private unnamed_addr constant [33 x i8] c"/home/kevin/Develop/EMT/src/ct.c\00", align 1
@__PRETTY_FUNCTION__.get_sign = private unnamed_addr constant [23 x i8] c"int get_sign(int, int)\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str4 = private unnamed_addr constant [12 x i8] c"klee_choose\00", align 1
@.str15 = private unnamed_addr constant [62 x i8] c"/home/kevin/Klee/klee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str12 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str26 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str37 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str6 = private unnamed_addr constant [53 x i8] c"/home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @get_sign(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %a, i32* %2, align 4
  store i32 %b, i32* %3, align 4
  %4 = load i32* %2, align 4, !dbg !134
  %5 = icmp sgt i32 %4, 0, !dbg !134
  %6 = load i32* %3, align 4, !dbg !134
  %7 = icmp sgt i32 %6, 0, !dbg !134
  %or.cond = and i1 %5, %7, !dbg !134
  br i1 %or.cond, label %8, label %23, !dbg !134

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4, !dbg !136
  %10 = load i32* %3, align 4, !dbg !136
  %11 = sub nsw i32 %9, %10, !dbg !136
  %int_cast_to_i64 = zext i32 12 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !136
  %12 = srem i32 %11, 12, !dbg !136
  %13 = icmp eq i32 %12, 0, !dbg !136
  br i1 %13, label %14, label %23, !dbg !136

; <label>:14                                      ; preds = %8
  %15 = load i32* %2, align 4, !dbg !139
  %int_cast_to_i641 = zext i32 12 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !139
  %16 = srem i32 %15, 12, !dbg !139
  %17 = load i32* %3, align 4, !dbg !139
  %int_cast_to_i642 = zext i32 12 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i642), !dbg !139
  %18 = srem i32 %17, 12, !dbg !139
  %19 = icmp ne i32 %16, %18, !dbg !139
  br i1 %19, label %20, label %22, !dbg !139

; <label>:20                                      ; preds = %14
  %21 = call i32 (i8*, i8*, i32, i8*, ...)* bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8]* @.str1, i32 0, i32 0), i32 19, i8* getele
  br label %22, !dbg !142

; <label>:22                                      ; preds = %20, %14
  store i32 0, i32* %1, !dbg !143
  br label %24, !dbg !143

; <label>:23                                      ; preds = %8, %0
  store i32 1, i32* %1, !dbg !144
  br label %24, !dbg !144

; <label>:24                                      ; preds = %23, %22
  %25 = load i32* %1, !dbg !145
  ret i32 %25, !dbg !145
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: noreturn
declare i32 @__assert_fail(...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast i32* %a to i8*, !dbg !146
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !146
  %3 = bitcast i32* %b to i8*, !dbg !147
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)), !dbg !147
  %4 = load i32* %a, align 4, !dbg !148
  %5 = load i32* %b, align 4, !dbg !148
  %6 = call i32 @get_sign(i32 %4, i32 %5), !dbg !148
  ret i32 0, !dbg !149
}

declare void @klee_make_symbolic(i8*, i64, i8*) #3

; Function Attrs: nounwind uwtable
define i64 @klee_choose(i64 %n) #4 {
  %x = alloca i64, align 8
  %1 = bitcast i64* %x to i8*, !dbg !150
  call void @klee_make_symbolic(i8* %1, i64 8, i8* getelementptr inbounds ([12 x i8]* @.str4, i64 0, i64 0)) #7, !dbg !150
  %2 = load i64* %x, align 8, !dbg !151, !tbaa !153
  %3 = icmp ult i64 %2, %n, !dbg !151
  br i1 %3, label %5, label %4, !dbg !151

; <label>:4                                       ; preds = %0
  call void @klee_silent_exit(i32 0) #8, !dbg !157
  unreachable, !dbg !157

; <label>:5                                       ; preds = %0
  ret i64 %2, !dbg !158
}

; Function Attrs: noreturn
declare void @klee_silent_exit(i32) #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #4 {
  %1 = icmp eq i64 %z, 0, !dbg !159
  br i1 %1, label %2, label %3, !dbg !159

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([62 x i8]* @.str15, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str12, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str26, i64 0, i64 0)) #8, !dbg !161
  unreachable, !dbg !161

; <label>:3                                       ; preds = %0
  ret void, !dbg !162
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #5

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !163
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #7, !dbg !163
  %2 = load i32* %x, align 4, !dbg !164, !tbaa !165
  ret i32 %2, !dbg !164
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #4 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !167
  br i1 %1, label %3, label %2, !dbg !167

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str37, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #8, !dbg !169
  unreachable, !dbg !169

; <label>:3                                       ; preds = %0
  ret void, !dbg !171
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !172
  br i1 %1, label %3, label %2, !dbg !172

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([53 x i8]* @.str6, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #8, !dbg !174
  unreachable, !dbg !174

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !175
  %5 = icmp eq i32 %4, %end, !dbg !175
  br i1 %5, label %21, label %6, !dbg !175

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !177
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #7, !dbg !177
  %8 = icmp eq i32 %start, 0, !dbg !179
  %9 = load i32* %x, align 4, !dbg !181, !tbaa !165
  br i1 %8, label %10, label %13, !dbg !179

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !181
  %12 = zext i1 %11 to i64, !dbg !181
  call void @klee_assume(i64 %12) #7, !dbg !181
  br label %19, !dbg !183

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !184
  %15 = zext i1 %14 to i64, !dbg !184
  call void @klee_assume(i64 %15) #7, !dbg !184
  %16 = load i32* %x, align 4, !dbg !186, !tbaa !165
  %17 = icmp slt i32 %16, %end, !dbg !186
  %18 = zext i1 %17 to i64, !dbg !186
  call void @klee_assume(i64 %18) #7, !dbg !186
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !187, !tbaa !165
  br label %21, !dbg !187

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !188
}

declare void @klee_assume(i64) #6

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !189
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !189

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep4 = getelementptr i8* %srcaddr, i64 %2
  %scevgep = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep, %srcaddr
  %bound0 = icmp uge i8* %scevgep4, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end6 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep103 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !190
  %wide.load = load <16 x i8>* %3, align 1, !dbg !190
  %next.gep.sum279 = or i64 %index, 16, !dbg !190
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !190
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !190
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !190
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !190
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !190
  %next.gep103.sum296 = or i64 %index, 16, !dbg !190
  %7 = getelementptr i8* %destaddr, i64 %next.gep103.sum296, !dbg !190
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !190
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !190
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !191

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val5 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end6, %vector.body ]
  %resume.val7 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val5, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val7, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !189
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !190
  %12 = load i8* %src.03, align 1, !dbg !190, !tbaa !194
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !190
  store i8 %12, i8* %dest.02, align 1, !dbg !190, !tbaa !194
  %14 = icmp eq i64 %10, 0, !dbg !189
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !189, !llvm.loop !195

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !196
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #4 {
  %1 = icmp eq i8* %src, %dst, !dbg !197
  br i1 %1, label %.loopexit, label %2, !dbg !197

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !199
  br i1 %3, label %.preheader, label %18, !dbg !199

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !201
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !201

.lr.ph.preheader:                                 ; preds = %.preheader
  %n.vec = and i64 %count, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %5 = add i64 %count, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep11 = getelementptr i8* %src, i64 %5
  %scevgep = getelementptr i8* %dst, i64 %5
  %bound1 = icmp uge i8* %scevgep, %src
  %bound0 = icmp uge i8* %scevgep11, %dst
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %src, i64 %n.vec
  %ptr.ind.end13 = getelementptr i8* %dst, i64 %n.vec
  %rev.ind.end = sub i64 %count, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %src, i64 %index
  %next.gep110 = getelementptr i8* %dst, i64 %index
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !201
  %wide.load = load <16 x i8>* %6, align 1, !dbg !201
  %next.gep.sum586 = or i64 %index, 16, !dbg !201
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !201
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !201
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !201
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !201
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !201
  %next.gep110.sum603 = or i64 %index, 16, !dbg !201
  %10 = getelementptr i8* %dst, i64 %next.gep110.sum603, !dbg !201
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !201
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !201
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !203

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %src, %.lr.ph.preheader ], [ %src, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val12 = phi i8* [ %dst, %.lr.ph.preheader ], [ %dst, %vector.memcheck ], [ %ptr.ind.end13, %vector.body ]
  %resume.val14 = phi i64 [ %count, %.lr.ph.preheader ], [ %count, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %count
  br i1 %cmp.n, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %b.04 = phi i8* [ %14, %.lr.ph ], [ %resume.val, %middle.block ]
  %a.03 = phi i8* [ %16, %.lr.ph ], [ %resume.val12, %middle.block ]
  %.02 = phi i64 [ %13, %.lr.ph ], [ %resume.val14, %middle.block ]
  %13 = add i64 %.02, -1, !dbg !201
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !201
  %15 = load i8* %b.04, align 1, !dbg !201, !tbaa !194
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !201
  store i8 %15, i8* %a.03, align 1, !dbg !201, !tbaa !194
  %17 = icmp eq i64 %13, 0, !dbg !201
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !201, !llvm.loop !204

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !205
  %20 = icmp eq i64 %count, 0, !dbg !207
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !207

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !208
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !205
  %n.vec215 = and i64 %count, -32
  %cmp.zero217 = icmp eq i64 %n.vec215, 0
  %23 = add i64 %count, -1
  br i1 %cmp.zero217, label %middle.block210, label %vector.memcheck224

vector.memcheck224:                               ; preds = %.lr.ph9
  %scevgep219 = getelementptr i8* %src, i64 %23
  %scevgep218 = getelementptr i8* %dst, i64 %23
  %bound1221 = icmp ule i8* %scevgep219, %dst
  %bound0220 = icmp ule i8* %scevgep218, %src
  %memcheck.conflict223 = and i1 %bound0220, %bound1221
  %.sum = sub i64 %19, %n.vec215
  %rev.ptr.ind.end = getelementptr i8* %src, i64 %.sum
  %.sum439 = sub i64 %19, %n.vec215
  %rev.ptr.ind.end229 = getelementptr i8* %dst, i64 %.sum439
  %rev.ind.end231 = sub i64 %count, %n.vec215
  br i1 %memcheck.conflict223, label %middle.block210, label %vector.body209

vector.body209:                                   ; preds = %vector.body209, %vector.memcheck224
  %index212 = phi i64 [ %index.next234, %vector.body209 ], [ 0, %vector.memcheck224 ]
  %.sum440 = sub i64 %19, %index212
  %.sum472 = sub i64 %19, %index212
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !207
  %24 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !207
  %25 = bitcast i8* %24 to <16 x i8>*, !dbg !207
  %wide.load434 = load <16 x i8>* %25, align 1, !dbg !207
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !207
  %.sum505 = add i64 %.sum440, -31, !dbg !207
  %26 = getelementptr i8* %src, i64 %.sum505, !dbg !207
  %27 = bitcast i8* %26 to <16 x i8>*, !dbg !207
  %wide.load435 = load <16 x i8>* %27, align 1, !dbg !207
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !207
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !207
  %next.gep333.sum = add i64 %.sum472, -15, !dbg !207
  %28 = getelementptr i8* %dst, i64 %next.gep333.sum, !dbg !207
  %29 = bitcast i8* %28 to <16 x i8>*, !dbg !207
  store <16 x i8> %reverse437, <16 x i8>* %29, align 1, !dbg !207
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !207
  %.sum507 = add i64 %.sum472, -31, !dbg !207
  %30 = getelementptr i8* %dst, i64 %.sum507, !dbg !207
  %31 = bitcast i8* %30 to <16 x i8>*, !dbg !207
  store <16 x i8> %reverse438, <16 x i8>* %31, align 1, !dbg !207
  %index.next234 = add i64 %index212, 32
  %32 = icmp eq i64 %index.next234, %n.vec215
  br i1 %32, label %middle.block210, label %vector.body209, !llvm.loop !209

middle.block210:                                  ; preds = %vector.body209, %vector.memcheck224, %.lr.ph9
  %resume.val225 = phi i8* [ %21, %.lr.ph9 ], [ %21, %vector.memcheck224 ], [ %rev.ptr.ind.end, %vector.body209 ]
  %resume.val227 = phi i8* [ %22, %.lr.ph9 ], [ %22, %vector.memcheck224 ], [ %rev.ptr.ind.end229, %vector.body209 ]
  %resume.val230 = phi i64 [ %count, %.lr.ph9 ], [ %count, %vector.memcheck224 ], [ %rev.ind.end231, %vector.body209 ]
  %new.indc.resume.val232 = phi i64 [ 0, %.lr.ph9 ], [ 0, %vector.memcheck224 ], [ %n.vec215, %vector.body209 ]
  %cmp.n233 = icmp eq i64 %new.indc.resume.val232, %count
  br i1 %cmp.n233, label %.loopexit, label %scalar.ph211

scalar.ph211:                                     ; preds = %scalar.ph211, %middle.block210
  %b.18 = phi i8* [ %34, %scalar.ph211 ], [ %resume.val225, %middle.block210 ]
  %a.17 = phi i8* [ %36, %scalar.ph211 ], [ %resume.val227, %middle.block210 ]
  %.16 = phi i64 [ %33, %scalar.ph211 ], [ %resume.val230, %middle.block210 ]
  %33 = add i64 %.16, -1, !dbg !207
  %34 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !207
  %35 = load i8* %b.18, align 1, !dbg !207, !tbaa !194
  %36 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !207
  store i8 %35, i8* %a.17, align 1, !dbg !207, !tbaa !194
  %37 = icmp eq i64 %33, 0, !dbg !207
  br i1 %37, label %.loopexit, label %scalar.ph211, !dbg !207, !llvm.loop !210

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !211
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !212
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !212

.lr.ph.preheader:                                 ; preds = %0
  %n.vec = and i64 %len, -32
  %cmp.zero = icmp eq i64 %n.vec, 0
  %2 = add i64 %len, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %.lr.ph.preheader
  %scevgep5 = getelementptr i8* %srcaddr, i64 %2
  %scevgep4 = getelementptr i8* %destaddr, i64 %2
  %bound1 = icmp uge i8* %scevgep4, %srcaddr
  %bound0 = icmp uge i8* %scevgep5, %destaddr
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8* %srcaddr, i64 %n.vec
  %ptr.ind.end7 = getelementptr i8* %destaddr, i64 %n.vec
  %rev.ind.end = sub i64 %len, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %next.gep = getelementptr i8* %srcaddr, i64 %index
  %next.gep104 = getelementptr i8* %destaddr, i64 %index
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !213
  %wide.load = load <16 x i8>* %3, align 1, !dbg !213
  %next.gep.sum280 = or i64 %index, 16, !dbg !213
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !213
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !213
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !213
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !213
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !213
  %next.gep104.sum297 = or i64 %index, 16, !dbg !213
  %7 = getelementptr i8* %destaddr, i64 %next.gep104.sum297, !dbg !213
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !213
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !213
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !214

middle.block:                                     ; preds = %vector.body, %vector.memcheck, %.lr.ph.preheader
  %resume.val = phi i8* [ %srcaddr, %.lr.ph.preheader ], [ %srcaddr, %vector.memcheck ], [ %ptr.ind.end, %vector.body ]
  %resume.val6 = phi i8* [ %destaddr, %.lr.ph.preheader ], [ %destaddr, %vector.memcheck ], [ %ptr.ind.end7, %vector.body ]
  %resume.val8 = phi i64 [ %len, %.lr.ph.preheader ], [ %len, %vector.memcheck ], [ %rev.ind.end, %vector.body ]
  %new.indc.resume.val = phi i64 [ 0, %.lr.ph.preheader ], [ 0, %vector.memcheck ], [ %n.vec, %vector.body ]
  %cmp.n = icmp eq i64 %new.indc.resume.val, %len
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %middle.block
  %src.03 = phi i8* [ %11, %.lr.ph ], [ %resume.val, %middle.block ]
  %dest.02 = phi i8* [ %13, %.lr.ph ], [ %resume.val6, %middle.block ]
  %.01 = phi i64 [ %10, %.lr.ph ], [ %resume.val8, %middle.block ]
  %10 = add i64 %.01, -1, !dbg !212
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !213
  %12 = load i8* %src.03, align 1, !dbg !213, !tbaa !194
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !213
  store i8 %12, i8* %dest.02, align 1, !dbg !213, !tbaa !194
  %14 = icmp eq i64 %10, 0, !dbg !212
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !212, !llvm.loop !215

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !212

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !216
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #4 {
  %1 = icmp eq i64 %count, 0, !dbg !217
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !217

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !218
  br label %3, !dbg !217

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !217
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !218
  store volatile i8 %2, i8* %a.02, align 1, !dbg !218, !tbaa !194
  %6 = icmp eq i64 %4, 0, !dbg !217
  br i1 %6, label %._crit_edge, label %3, !dbg !217

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !219
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float
attributes #1 = { nounwind readnone }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false
attributes #3 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nobuiltin nounwind }
attributes #8 = { nobuiltin noreturn nounwind }

!llvm.dbg.cu = !{!0, !12, !24, !34, !47, !58, !70, !88, !102, !116}
!llvm.module.flags = !{!131, !132}
!llvm.ident = !{!133, !133, !133, !133, !133, !133, !133, !133, !133, !133}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG
!1 = metadata !{metadata !"/home/kevin/Develop/EMT/src/ct.c", metadata !"/home/kevin/Develop/EMT"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"get_sign", metadata !"get_sign", metadata !"", i32 14, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @get_sign, null, null, metadata !2, i32 14} ; [
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/ct.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 27, metadata !10, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 27} ; [ DW_TAG_subprogram ] 
!10 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !11, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!11 = metadata !{metadata !8}
!12 = metadata !{i32 786449, metadata !13, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !14, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!13 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/klee_choose.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!14 = metadata !{metadata !15}
!15 = metadata !{i32 786478, metadata !13, metadata !16, metadata !"klee_choose", metadata !"klee_choose", metadata !"", i32 12, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i64)* @klee_choose, null, null, metadata !21, i32
!16 = metadata !{i32 786473, metadata !13}        ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_choose.c]
!17 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !19}
!19 = metadata !{i32 786454, metadata !13, null, metadata !"uintptr_t", i32 123, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [uintptr_t] [line 123, size 0, align 0, offset 0] [from long unsigned int]
!20 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!21 = metadata !{metadata !22, metadata !23}
!22 = metadata !{i32 786689, metadata !15, metadata !"n", metadata !16, i32 16777228, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 12]
!23 = metadata !{i32 786688, metadata !15, metadata !"x", metadata !16, i32 13, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 13]
!24 = metadata !{i32 786449, metadata !25, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !26, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!25 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 786478, metadata !25, metadata !28, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null
!28 = metadata !{i32 786473, metadata !25}        ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_div_zero_check.c]
!29 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!30 = metadata !{null, metadata !31}
!31 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!32 = metadata !{metadata !33}
!33 = metadata !{i32 786689, metadata !27, metadata !"z", metadata !28, i32 16777228, metadata !31, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!34 = metadata !{i32 786449, metadata !35, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !36, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!35 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/klee_int.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 786478, metadata !35, metadata !38, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !39, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !44, i32 13} ; [ 
!38 = metadata !{i32 786473, metadata !35}        ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_int.c]
!39 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{metadata !8, metadata !41}
!41 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!42 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!43 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!44 = metadata !{metadata !45, metadata !46}
!45 = metadata !{i32 786689, metadata !37, metadata !"name", metadata !38, i32 16777229, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!46 = metadata !{i32 786688, metadata !37, metadata !"x", metadata !38, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!47 = metadata !{i32 786449, metadata !48, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !49, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!48 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!49 = metadata !{metadata !50}
!50 = metadata !{i32 786478, metadata !48, metadata !51, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !52, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!51 = metadata !{i32 786473, metadata !48}        ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_overshift_check.c]
!52 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !53, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = metadata !{null, metadata !54, metadata !54}
!54 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!55 = metadata !{metadata !56, metadata !57}
!56 = metadata !{i32 786689, metadata !50, metadata !"bitWidth", metadata !51, i32 16777236, metadata !54, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!57 = metadata !{i32 786689, metadata !50, metadata !"shift", metadata !51, i32 33554452, metadata !54, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!58 = metadata !{i32 786449, metadata !59, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !60, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!59 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!60 = metadata !{metadata !61}
!61 = metadata !{i32 786478, metadata !59, metadata !62, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !63, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!62 = metadata !{i32 786473, metadata !59}        ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!63 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !64, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!64 = metadata !{metadata !8, metadata !8, metadata !8, metadata !41}
!65 = metadata !{metadata !66, metadata !67, metadata !68, metadata !69}
!66 = metadata !{i32 786689, metadata !61, metadata !"start", metadata !62, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!67 = metadata !{i32 786689, metadata !61, metadata !"end", metadata !62, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!68 = metadata !{i32 786689, metadata !61, metadata !"name", metadata !62, i32 50331661, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!69 = metadata !{i32 786688, metadata !61, metadata !"x", metadata !62, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!70 = metadata !{i32 786449, metadata !71, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !72, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!71 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/memcpy.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!72 = metadata !{metadata !73}
!73 = metadata !{i32 786478, metadata !71, metadata !74, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !75, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !81, i32 12} 
!74 = metadata !{i32 786473, metadata !71}        ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memcpy.c]
!75 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !76, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = metadata !{metadata !77, metadata !77, metadata !78, metadata !80}
!77 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!78 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !79} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!79 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!80 = metadata !{i32 786454, metadata !71, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!81 = metadata !{metadata !82, metadata !83, metadata !84, metadata !85, metadata !87}
!82 = metadata !{i32 786689, metadata !73, metadata !"destaddr", metadata !74, i32 16777228, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!83 = metadata !{i32 786689, metadata !73, metadata !"srcaddr", metadata !74, i32 33554444, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!84 = metadata !{i32 786689, metadata !73, metadata !"len", metadata !74, i32 50331660, metadata !80, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!85 = metadata !{i32 786688, metadata !73, metadata !"dest", metadata !74, i32 13, metadata !86, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!86 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !43} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!87 = metadata !{i32 786688, metadata !73, metadata !"src", metadata !74, i32 14, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!88 = metadata !{i32 786449, metadata !89, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !90, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!89 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/memmove.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!90 = metadata !{metadata !91}
!91 = metadata !{i32 786478, metadata !89, metadata !92, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !93, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !96, i32 1
!92 = metadata !{i32 786473, metadata !89}        ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memmove.c]
!93 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !94, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!94 = metadata !{metadata !77, metadata !77, metadata !78, metadata !95}
!95 = metadata !{i32 786454, metadata !89, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!96 = metadata !{metadata !97, metadata !98, metadata !99, metadata !100, metadata !101}
!97 = metadata !{i32 786689, metadata !91, metadata !"dst", metadata !92, i32 16777228, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!98 = metadata !{i32 786689, metadata !91, metadata !"src", metadata !92, i32 33554444, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!99 = metadata !{i32 786689, metadata !91, metadata !"count", metadata !92, i32 50331660, metadata !95, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!100 = metadata !{i32 786688, metadata !91, metadata !"a", metadata !92, i32 13, metadata !86, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!101 = metadata !{i32 786688, metadata !91, metadata !"b", metadata !92, i32 14, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!102 = metadata !{i32 786449, metadata !103, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !104, metadata !2, metadata !2, metadata !""} ; [ DW
!103 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/mempcpy.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!104 = metadata !{metadata !105}
!105 = metadata !{i32 786478, metadata !103, metadata !106, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !107, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !110, 
!106 = metadata !{i32 786473, metadata !103}      ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/mempcpy.c]
!107 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!108 = metadata !{metadata !77, metadata !77, metadata !78, metadata !109}
!109 = metadata !{i32 786454, metadata !103, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!110 = metadata !{metadata !111, metadata !112, metadata !113, metadata !114, metadata !115}
!111 = metadata !{i32 786689, metadata !105, metadata !"destaddr", metadata !106, i32 16777227, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!112 = metadata !{i32 786689, metadata !105, metadata !"srcaddr", metadata !106, i32 33554443, metadata !78, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!113 = metadata !{i32 786689, metadata !105, metadata !"len", metadata !106, i32 50331659, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!114 = metadata !{i32 786688, metadata !105, metadata !"dest", metadata !106, i32 12, metadata !86, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!115 = metadata !{i32 786688, metadata !105, metadata !"src", metadata !106, i32 13, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!116 = metadata !{i32 786449, metadata !117, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !118, metadata !2, metadata !2, metadata !""} ; [ DW
!117 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/memset.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!118 = metadata !{metadata !119}
!119 = metadata !{i32 786478, metadata !117, metadata !120, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !121, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !124, i32
!120 = metadata !{i32 786473, metadata !117}      ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memset.c]
!121 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !122, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!122 = metadata !{metadata !77, metadata !77, metadata !8, metadata !123}
!123 = metadata !{i32 786454, metadata !117, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!124 = metadata !{metadata !125, metadata !126, metadata !127, metadata !128}
!125 = metadata !{i32 786689, metadata !119, metadata !"dst", metadata !120, i32 16777227, metadata !77, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!126 = metadata !{i32 786689, metadata !119, metadata !"s", metadata !120, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!127 = metadata !{i32 786689, metadata !119, metadata !"count", metadata !120, i32 50331659, metadata !123, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!128 = metadata !{i32 786688, metadata !119, metadata !"a", metadata !120, i32 12, metadata !129, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!129 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !130} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!130 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !43} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!131 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!132 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!133 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!134 = metadata !{i32 16, i32 0, metadata !135, null}
!135 = metadata !{i32 786443, metadata !1, metadata !4, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/ct.c]
!136 = metadata !{i32 17, i32 0, metadata !137, null}
!137 = metadata !{i32 786443, metadata !1, metadata !138, i32 17, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/ct.c]
!138 = metadata !{i32 786443, metadata !1, metadata !135, i32 16, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/ct.c]
!139 = metadata !{i32 18, i32 0, metadata !140, null}
!140 = metadata !{i32 786443, metadata !1, metadata !141, i32 18, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/ct.c]
!141 = metadata !{i32 786443, metadata !1, metadata !137, i32 17, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/ct.c]
!142 = metadata !{i32 19, i32 0, metadata !140, null}
!143 = metadata !{i32 20, i32 0, metadata !141, null}
!144 = metadata !{i32 24, i32 0, metadata !4, null}
!145 = metadata !{i32 25, i32 0, metadata !4, null}
!146 = metadata !{i32 29, i32 0, metadata !9, null}
!147 = metadata !{i32 30, i32 0, metadata !9, null}
!148 = metadata !{i32 31, i32 0, metadata !9, null}
!149 = metadata !{i32 32, i32 0, metadata !9, null}
!150 = metadata !{i32 14, i32 0, metadata !15, null}
!151 = metadata !{i32 17, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !13, metadata !15, i32 17, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_choose.c]
!153 = metadata !{metadata !154, metadata !154, i64 0}
!154 = metadata !{metadata !"long", metadata !155, i64 0}
!155 = metadata !{metadata !"omnipotent char", metadata !156, i64 0}
!156 = metadata !{metadata !"Simple C/C++ TBAA"}
!157 = metadata !{i32 18, i32 0, metadata !152, null}
!158 = metadata !{i32 19, i32 0, metadata !15, null}
!159 = metadata !{i32 13, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !25, metadata !27, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_div_zero_check.c]
!161 = metadata !{i32 14, i32 0, metadata !160, null}
!162 = metadata !{i32 15, i32 0, metadata !27, null}
!163 = metadata !{i32 15, i32 0, metadata !37, null}
!164 = metadata !{i32 16, i32 0, metadata !37, null}
!165 = metadata !{metadata !166, metadata !166, i64 0}
!166 = metadata !{metadata !"int", metadata !155, i64 0}
!167 = metadata !{i32 21, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !48, metadata !50, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_overshift_check.c]
!169 = metadata !{i32 27, i32 0, metadata !170, null}
!170 = metadata !{i32 786443, metadata !48, metadata !168, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_overshift_check.c]
!171 = metadata !{i32 29, i32 0, metadata !50, null}
!172 = metadata !{i32 16, i32 0, metadata !173, null}
!173 = metadata !{i32 786443, metadata !59, metadata !61, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!174 = metadata !{i32 17, i32 0, metadata !173, null}
!175 = metadata !{i32 19, i32 0, metadata !176, null}
!176 = metadata !{i32 786443, metadata !59, metadata !61, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!177 = metadata !{i32 22, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !59, metadata !176, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!179 = metadata !{i32 25, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !59, metadata !178, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!181 = metadata !{i32 26, i32 0, metadata !182, null}
!182 = metadata !{i32 786443, metadata !59, metadata !180, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!183 = metadata !{i32 27, i32 0, metadata !182, null}
!184 = metadata !{i32 28, i32 0, metadata !185, null}
!185 = metadata !{i32 786443, metadata !59, metadata !180, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!186 = metadata !{i32 29, i32 0, metadata !185, null}
!187 = metadata !{i32 32, i32 0, metadata !178, null}
!188 = metadata !{i32 34, i32 0, metadata !61, null}
!189 = metadata !{i32 16, i32 0, metadata !73, null}
!190 = metadata !{i32 17, i32 0, metadata !73, null}
!191 = metadata !{metadata !191, metadata !192, metadata !193}
!192 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!193 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!194 = metadata !{metadata !155, metadata !155, i64 0}
!195 = metadata !{metadata !195, metadata !192, metadata !193}
!196 = metadata !{i32 18, i32 0, metadata !73, null}
!197 = metadata !{i32 16, i32 0, metadata !198, null}
!198 = metadata !{i32 786443, metadata !89, metadata !91, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memmove.c]
!199 = metadata !{i32 19, i32 0, metadata !200, null}
!200 = metadata !{i32 786443, metadata !89, metadata !91, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memmove.c]
!201 = metadata !{i32 20, i32 0, metadata !202, null}
!202 = metadata !{i32 786443, metadata !89, metadata !200, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memmove.c]
!203 = metadata !{metadata !203, metadata !192, metadata !193}
!204 = metadata !{metadata !204, metadata !192, metadata !193}
!205 = metadata !{i32 22, i32 0, metadata !206, null}
!206 = metadata !{i32 786443, metadata !89, metadata !200, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memmove.c]
!207 = metadata !{i32 24, i32 0, metadata !206, null}
!208 = metadata !{i32 23, i32 0, metadata !206, null}
!209 = metadata !{metadata !209, metadata !192, metadata !193}
!210 = metadata !{metadata !210, metadata !192, metadata !193}
!211 = metadata !{i32 28, i32 0, metadata !91, null}
!212 = metadata !{i32 15, i32 0, metadata !105, null}
!213 = metadata !{i32 16, i32 0, metadata !105, null}
!214 = metadata !{metadata !214, metadata !192, metadata !193}
!215 = metadata !{metadata !215, metadata !192, metadata !193}
!216 = metadata !{i32 17, i32 0, metadata !105, null}
!217 = metadata !{i32 13, i32 0, metadata !119, null}
!218 = metadata !{i32 14, i32 0, metadata !119, null}
!219 = metadata !{i32 15, i32 0, metadata !119, null}
