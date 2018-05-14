; ModuleID = '/home/kevin/Develop/EMT/test/kytoqf_t_2.c.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str1 = private unnamed_addr constant [41 x i8] c"/home/kevin/Develop/EMT/src/kytoqf_t_2.c\00", align 1
@__PRETTY_FUNCTION__.kytoqf_t = private unnamed_addr constant [38 x i8] c"int kytoqf_t(int, int, int, int, int)\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"p\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"y1\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"y2\00", align 1
@.str7 = private unnamed_addr constant [12 x i8] c"klee_choose\00", align 1
@.str18 = private unnamed_addr constant [62 x i8] c"/home/kevin/Klee/klee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str12 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str29 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str310 = private unnamed_addr constant [8 x i8] c"IGNORED\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"overshift error\00", align 1
@.str25 = private unnamed_addr constant [14 x i8] c"overshift.err\00", align 1
@.str611 = private unnamed_addr constant [53 x i8] c"/home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c\00", align 1
@.str17 = private unnamed_addr constant [14 x i8] c"invalid range\00", align 1
@.str28 = private unnamed_addr constant [5 x i8] c"user\00", align 1

; Function Attrs: nounwind uwtable
define i32 @umul_ok(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %p = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32* %1, align 4, !dbg !143
  %4 = load i32* %2, align 4, !dbg !143
  %5 = mul nsw i32 %3, %4, !dbg !143
  store i32 %5, i32* %p, align 4, !dbg !143
  %6 = load i32* %1, align 4, !dbg !144
  %7 = icmp ne i32 %6, 0, !dbg !144
  br i1 %7, label %8, label %14, !dbg !144

; <label>:8                                       ; preds = %0
  %9 = load i32* %p, align 4, !dbg !144
  %10 = load i32* %1, align 4, !dbg !144
  %int_cast_to_i64 = zext i32 %10 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !144
  %11 = sdiv i32 %9, %10, !dbg !144
  %12 = load i32* %2, align 4, !dbg !144
  %13 = icmp eq i32 %11, %12, !dbg !144
  br label %14, !dbg !144

; <label>:14                                      ; preds = %8, %0
  %15 = phi i1 [ true, %0 ], [ %13, %8 ]
  %16 = zext i1 %15 to i32, !dbg !144
  ret i32 %16, !dbg !144
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata) #1

; Function Attrs: nounwind uwtable
define i32 @add_ok(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %a, i32* %2, align 4
  store i32 %b, i32* %3, align 4
  %4 = load i32* %2, align 4, !dbg !145
  %5 = load i32* %3, align 4, !dbg !145
  %6 = sub nsw i32 2147483647, %5, !dbg !145
  %7 = icmp slt i32 %4, %6, !dbg !145
  br i1 %7, label %8, label %9, !dbg !145

; <label>:8                                       ; preds = %0
  store i32 1, i32* %1, !dbg !147
  br label %10, !dbg !147

; <label>:9                                       ; preds = %0
  store i32 0, i32* %1, !dbg !149
  br label %10, !dbg !149

; <label>:10                                      ; preds = %9, %8
  %11 = load i32* %1, !dbg !150
  ret i32 %11, !dbg !150
}

; Function Attrs: nounwind uwtable
define i32 @is_prime(i32 %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %a, i32* %2, align 4
  %3 = load i32* %2, align 4, !dbg !151
  %4 = icmp sgt i32 %3, 1, !dbg !151
  br i1 %4, label %5, label %20, !dbg !151

; <label>:5                                       ; preds = %0
  store i32 2, i32* %i, align 4, !dbg !153
  br label %6, !dbg !153

; <label>:6                                       ; preds = %17, %5
  %7 = load i32* %i, align 4, !dbg !153
  %8 = load i32* %2, align 4, !dbg !153
  %int_cast_to_i64 = zext i32 2 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !153
  %9 = sdiv i32 %8, 2, !dbg !153
  %10 = icmp sle i32 %7, %9, !dbg !153
  br i1 %10, label %11, label %21, !dbg !153

; <label>:11                                      ; preds = %6
  %12 = load i32* %2, align 4, !dbg !156
  %13 = load i32* %i, align 4, !dbg !156
  %int_cast_to_i641 = zext i32 %13 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i641), !dbg !156
  %14 = srem i32 %12, %13, !dbg !156
  %15 = icmp eq i32 %14, 0, !dbg !156
  br i1 %15, label %16, label %17, !dbg !156

; <label>:16                                      ; preds = %11
  store i32 0, i32* %1, !dbg !159
  br label %22, !dbg !159

; <label>:17                                      ; preds = %11
  %18 = load i32* %i, align 4, !dbg !153
  %19 = add nsw i32 %18, 1, !dbg !153
  store i32 %19, i32* %i, align 4, !dbg !153
  br label %6, !dbg !153

; <label>:20                                      ; preds = %0
  store i32 0, i32* %1, !dbg !161
  br label %22, !dbg !161

; <label>:21                                      ; preds = %6
  store i32 1, i32* %1, !dbg !163
  br label %22, !dbg !163

; <label>:22                                      ; preds = %21, %20, %16
  %23 = load i32* %1, !dbg !164
  ret i32 %23, !dbg !164
}

; Function Attrs: nounwind uwtable
define i32 @s_1(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %x, i32* %2, align 4
  store i32 %y, i32* %3, align 4
  %4 = load i32* %2, align 4, !dbg !165
  %5 = load i32* %2, align 4, !dbg !165
  %6 = call i32 @umul_ok(i32 %4, i32 %5), !dbg !165
  %7 = icmp ne i32 %6, 0, !dbg !165
  br i1 %7, label %8, label %30, !dbg !165

; <label>:8                                       ; preds = %0
  %9 = load i32* %3, align 4, !dbg !165
  %10 = load i32* %3, align 4, !dbg !165
  %11 = call i32 @umul_ok(i32 %9, i32 %10), !dbg !165
  %12 = icmp ne i32 %11, 0, !dbg !165
  br i1 %12, label %13, label %30, !dbg !165

; <label>:13                                      ; preds = %8
  %14 = load i32* %3, align 4, !dbg !167
  %15 = load i32* %3, align 4, !dbg !167
  %16 = mul nsw i32 %14, %15, !dbg !167
  %17 = call i32 @umul_ok(i32 32, i32 %16), !dbg !167
  %18 = icmp ne i32 %17, 0, !dbg !167
  br i1 %18, label %19, label %30, !dbg !167

; <label>:19                                      ; preds = %13
  %20 = load i32* %2, align 4, !dbg !170
  %21 = load i32* %2, align 4, !dbg !170
  %22 = mul nsw i32 %20, %21, !dbg !170
  %23 = load i32* %3, align 4, !dbg !170
  %24 = mul nsw i32 32, %23, !dbg !170
  %25 = load i32* %3, align 4, !dbg !170
  %26 = mul nsw i32 %24, %25, !dbg !170
  %27 = call i32 @add_ok(i32 %22, i32 %26), !dbg !170
  %28 = icmp ne i32 %27, 0, !dbg !170
  br i1 %28, label %29, label %30, !dbg !170

; <label>:29                                      ; preds = %19
  store i32 1, i32* %1, !dbg !173
  br label %31, !dbg !173

; <label>:30                                      ; preds = %13, %19, %8, %0
  store i32 0, i32* %1, !dbg !175
  br label %31, !dbg !175

; <label>:31                                      ; preds = %30, %29
  %32 = load i32* %1, !dbg !176
  ret i32 %32, !dbg !176
}

; Function Attrs: nounwind uwtable
define i32 @s_2(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %x, i32* %2, align 4
  store i32 %y, i32* %3, align 4
  %4 = load i32* %2, align 4, !dbg !177
  %5 = load i32* %2, align 4, !dbg !177
  %6 = call i32 @umul_ok(i32 %4, i32 %5), !dbg !177
  %7 = icmp ne i32 %6, 0, !dbg !177
  br i1 %7, label %8, label %30, !dbg !177

; <label>:8                                       ; preds = %0
  %9 = load i32* %3, align 4, !dbg !177
  %10 = load i32* %3, align 4, !dbg !177
  %11 = call i32 @umul_ok(i32 %9, i32 %10), !dbg !177
  %12 = icmp ne i32 %11, 0, !dbg !177
  br i1 %12, label %13, label %30, !dbg !177

; <label>:13                                      ; preds = %8
  %14 = load i32* %3, align 4, !dbg !179
  %15 = load i32* %3, align 4, !dbg !179
  %16 = mul nsw i32 %14, %15, !dbg !179
  %17 = call i32 @umul_ok(i32 64, i32 %16), !dbg !179
  %18 = icmp ne i32 %17, 0, !dbg !179
  br i1 %18, label %19, label %30, !dbg !179

; <label>:19                                      ; preds = %13
  %20 = load i32* %2, align 4, !dbg !182
  %21 = load i32* %2, align 4, !dbg !182
  %22 = mul nsw i32 %20, %21, !dbg !182
  %23 = load i32* %3, align 4, !dbg !182
  %24 = mul nsw i32 64, %23, !dbg !182
  %25 = load i32* %3, align 4, !dbg !182
  %26 = mul nsw i32 %24, %25, !dbg !182
  %27 = call i32 @add_ok(i32 %22, i32 %26), !dbg !182
  %28 = icmp ne i32 %27, 0, !dbg !182
  br i1 %28, label %29, label %30, !dbg !182

; <label>:29                                      ; preds = %19
  store i32 1, i32* %1, !dbg !185
  br label %31, !dbg !185

; <label>:30                                      ; preds = %13, %19, %8, %0
  store i32 0, i32* %1, !dbg !187
  br label %31, !dbg !187

; <label>:31                                      ; preds = %30, %29
  %32 = load i32* %1, !dbg !188
  ret i32 %32, !dbg !188
}

; Function Attrs: nounwind uwtable
define i32 @kytoqf_t(i32 %p, i32 %x1, i32 %y1, i32 %x2, i32 %y2) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %p, i32* %1, align 4
  store i32 %x1, i32* %2, align 4
  store i32 %y1, i32* %3, align 4
  store i32 %x2, i32* %4, align 4
  store i32 %y2, i32* %5, align 4
  %6 = load i32* %1, align 4, !dbg !189
  %7 = call i32 @is_prime(i32 %6), !dbg !189
  %8 = icmp ne i32 %7, 0, !dbg !189
  br i1 %8, label %9, label %35, !dbg !189

; <label>:9                                       ; preds = %0
  %10 = load i32* %1, align 4, !dbg !189
  %int_cast_to_i64 = zext i32 16 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64), !dbg !189
  %11 = srem i32 %10, 16, !dbg !189
  %12 = icmp eq i32 %11, 9, !dbg !189
  br i1 %12, label %13, label %35, !dbg !189

; <label>:13                                      ; preds = %9
  %14 = load i32* %2, align 4, !dbg !191
  %15 = load i32* %3, align 4, !dbg !191
  %16 = call i32 @s_1(i32 %14, i32 %15), !dbg !191
  %17 = icmp ne i32 %16, 0, !dbg !191
  br i1 %17, label %18, label %23, !dbg !191

; <label>:18                                      ; preds = %13
  %19 = load i32* %4, align 4, !dbg !191
  %20 = load i32* %5, align 4, !dbg !191
  %21 = call i32 @s_2(i32 %19, i32 %20), !dbg !191
  %22 = icmp ne i32 %21, 0, !dbg !191
  br i1 %22, label %33, label %23, !dbg !191

; <label>:23                                      ; preds = %18, %13
  %24 = load i32* %2, align 4, !dbg !191
  %25 = load i32* %3, align 4, !dbg !191
  %26 = call i32 @s_1(i32 %24, i32 %25), !dbg !191
  %27 = icmp ne i32 %26, 0, !dbg !191
  br i1 %27, label %35, label %28, !dbg !191

; <label>:28                                      ; preds = %23
  %29 = load i32* %4, align 4, !dbg !191
  %30 = load i32* %5, align 4, !dbg !191
  %31 = call i32 @s_2(i32 %29, i32 %30), !dbg !191
  %32 = icmp ne i32 %31, 0, !dbg !191
  br i1 %32, label %35, label %33, !dbg !191

; <label>:33                                      ; preds = %28, %18
  %34 = call i32 (i8*, i8*, i32, i8*, ...)* bitcast (i32 (...)* @__assert_fail to i32 (i8*, i8*, i32, i8*, ...)*)(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8]* @.str1, i32 0, i32 0), i32 60, i8* getele
  br label %35, !dbg !196

; <label>:35                                      ; preds = %23, %28, %33, %9, %0
  ret i32 1, !dbg !197
}

; Function Attrs: noreturn
declare i32 @__assert_fail(...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca i32, align 4
  %x1 = alloca i32, align 4
  %y1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %y2 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast i32* %p to i8*, !dbg !198
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)), !dbg !198
  %3 = bitcast i32* %x1 to i8*, !dbg !199
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0)), !dbg !199
  %4 = bitcast i32* %y1 to i8*, !dbg !200
  call void @klee_make_symbolic(i8* %4, i64 4, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0)), !dbg !200
  %5 = bitcast i32* %x2 to i8*, !dbg !201
  call void @klee_make_symbolic(i8* %5, i64 4, i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0)), !dbg !201
  %6 = bitcast i32* %y2 to i8*, !dbg !202
  call void @klee_make_symbolic(i8* %6, i64 4, i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0)), !dbg !202
  %7 = load i32* %p, align 4, !dbg !203
  %8 = load i32* %x1, align 4, !dbg !203
  %9 = load i32* %y1, align 4, !dbg !203
  %10 = load i32* %x2, align 4, !dbg !203
  %11 = load i32* %y2, align 4, !dbg !203
  %12 = call i32 @kytoqf_t(i32 %7, i32 %8, i32 %9, i32 %10, i32 %11), !dbg !203
  ret i32 0, !dbg !204
}

declare void @klee_make_symbolic(i8*, i64, i8*) #3

; Function Attrs: nounwind uwtable
define i64 @klee_choose(i64 %n) #4 {
  %x = alloca i64, align 8
  %1 = bitcast i64* %x to i8*, !dbg !205
  call void @klee_make_symbolic(i8* %1, i64 8, i8* getelementptr inbounds ([12 x i8]* @.str7, i64 0, i64 0)) #7, !dbg !205
  %2 = load i64* %x, align 8, !dbg !206, !tbaa !208
  %3 = icmp ult i64 %2, %n, !dbg !206
  br i1 %3, label %5, label %4, !dbg !206

; <label>:4                                       ; preds = %0
  call void @klee_silent_exit(i32 0) #8, !dbg !212
  unreachable, !dbg !212

; <label>:5                                       ; preds = %0
  ret i64 %2, !dbg !213
}

; Function Attrs: noreturn
declare void @klee_silent_exit(i32) #5

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata) #1

; Function Attrs: nounwind uwtable
define void @klee_div_zero_check(i64 %z) #4 {
  %1 = icmp eq i64 %z, 0, !dbg !214
  br i1 %1, label %2, label %3, !dbg !214

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([62 x i8]* @.str18, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str12, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str29, i64 0, i64 0)) #8, !dbg !216
  unreachable, !dbg !216

; <label>:3                                       ; preds = %0
  ret void, !dbg !217
}

; Function Attrs: noreturn
declare void @klee_report_error(i8*, i32, i8*, i8*) #5

; Function Attrs: nounwind uwtable
define i32 @klee_int(i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = bitcast i32* %x to i8*, !dbg !218
  call void @klee_make_symbolic(i8* %1, i64 4, i8* %name) #7, !dbg !218
  %2 = load i32* %x, align 4, !dbg !219, !tbaa !220
  ret i32 %2, !dbg !219
}

; Function Attrs: nounwind uwtable
define void @klee_overshift_check(i64 %bitWidth, i64 %shift) #4 {
  %1 = icmp ult i64 %shift, %bitWidth, !dbg !222
  br i1 %1, label %3, label %2, !dbg !222

; <label>:2                                       ; preds = %0
  tail call void @klee_report_error(i8* getelementptr inbounds ([8 x i8]* @.str310, i64 0, i64 0), i32 0, i8* getelementptr inbounds ([16 x i8]* @.str14, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8]* @.str25, i64 0, i64 0)) #8, !dbg !224
  unreachable, !dbg !224

; <label>:3                                       ; preds = %0
  ret void, !dbg !226
}

; Function Attrs: nounwind uwtable
define i32 @klee_range(i32 %start, i32 %end, i8* %name) #4 {
  %x = alloca i32, align 4
  %1 = icmp slt i32 %start, %end, !dbg !227
  br i1 %1, label %3, label %2, !dbg !227

; <label>:2                                       ; preds = %0
  call void @klee_report_error(i8* getelementptr inbounds ([53 x i8]* @.str611, i64 0, i64 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str17, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str28, i64 0, i64 0)) #8, !dbg !229
  unreachable, !dbg !229

; <label>:3                                       ; preds = %0
  %4 = add nsw i32 %start, 1, !dbg !230
  %5 = icmp eq i32 %4, %end, !dbg !230
  br i1 %5, label %21, label %6, !dbg !230

; <label>:6                                       ; preds = %3
  %7 = bitcast i32* %x to i8*, !dbg !232
  call void @klee_make_symbolic(i8* %7, i64 4, i8* %name) #7, !dbg !232
  %8 = icmp eq i32 %start, 0, !dbg !234
  %9 = load i32* %x, align 4, !dbg !236, !tbaa !220
  br i1 %8, label %10, label %13, !dbg !234

; <label>:10                                      ; preds = %6
  %11 = icmp ult i32 %9, %end, !dbg !236
  %12 = zext i1 %11 to i64, !dbg !236
  call void @klee_assume(i64 %12) #7, !dbg !236
  br label %19, !dbg !238

; <label>:13                                      ; preds = %6
  %14 = icmp sge i32 %9, %start, !dbg !239
  %15 = zext i1 %14 to i64, !dbg !239
  call void @klee_assume(i64 %15) #7, !dbg !239
  %16 = load i32* %x, align 4, !dbg !241, !tbaa !220
  %17 = icmp slt i32 %16, %end, !dbg !241
  %18 = zext i1 %17 to i64, !dbg !241
  call void @klee_assume(i64 %18) #7, !dbg !241
  br label %19

; <label>:19                                      ; preds = %13, %10
  %20 = load i32* %x, align 4, !dbg !242, !tbaa !220
  br label %21, !dbg !242

; <label>:21                                      ; preds = %19, %3
  %.0 = phi i32 [ %20, %19 ], [ %start, %3 ]
  ret i32 %.0, !dbg !243
}

declare void @klee_assume(i64) #6

; Function Attrs: nounwind uwtable
define weak i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !244
  br i1 %1, label %._crit_edge, label %.lr.ph.preheader, !dbg !244

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !245
  %wide.load = load <16 x i8>* %3, align 1, !dbg !245
  %next.gep.sum279 = or i64 %index, 16, !dbg !245
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum279, !dbg !245
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !245
  %wide.load200 = load <16 x i8>* %5, align 1, !dbg !245
  %6 = bitcast i8* %next.gep103 to <16 x i8>*, !dbg !245
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !245
  %next.gep103.sum296 = or i64 %index, 16, !dbg !245
  %7 = getelementptr i8* %destaddr, i64 %next.gep103.sum296, !dbg !245
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !245
  store <16 x i8> %wide.load200, <16 x i8>* %8, align 1, !dbg !245
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !246

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
  %10 = add i64 %.01, -1, !dbg !244
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !245
  %12 = load i8* %src.03, align 1, !dbg !245, !tbaa !249
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !245
  store i8 %12, i8* %dest.02, align 1, !dbg !245, !tbaa !249
  %14 = icmp eq i64 %10, 0, !dbg !244
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !244, !llvm.loop !250

._crit_edge:                                      ; preds = %.lr.ph, %middle.block, %0
  ret i8* %destaddr, !dbg !251
}

; Function Attrs: nounwind uwtable
define weak i8* @memmove(i8* %dst, i8* %src, i64 %count) #4 {
  %1 = icmp eq i8* %src, %dst, !dbg !252
  br i1 %1, label %.loopexit, label %2, !dbg !252

; <label>:2                                       ; preds = %0
  %3 = icmp ugt i8* %src, %dst, !dbg !254
  br i1 %3, label %.preheader, label %18, !dbg !254

.preheader:                                       ; preds = %2
  %4 = icmp eq i64 %count, 0, !dbg !256
  br i1 %4, label %.loopexit, label %.lr.ph.preheader, !dbg !256

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
  %6 = bitcast i8* %next.gep to <16 x i8>*, !dbg !256
  %wide.load = load <16 x i8>* %6, align 1, !dbg !256
  %next.gep.sum586 = or i64 %index, 16, !dbg !256
  %7 = getelementptr i8* %src, i64 %next.gep.sum586, !dbg !256
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !256
  %wide.load207 = load <16 x i8>* %8, align 1, !dbg !256
  %9 = bitcast i8* %next.gep110 to <16 x i8>*, !dbg !256
  store <16 x i8> %wide.load, <16 x i8>* %9, align 1, !dbg !256
  %next.gep110.sum603 = or i64 %index, 16, !dbg !256
  %10 = getelementptr i8* %dst, i64 %next.gep110.sum603, !dbg !256
  %11 = bitcast i8* %10 to <16 x i8>*, !dbg !256
  store <16 x i8> %wide.load207, <16 x i8>* %11, align 1, !dbg !256
  %index.next = add i64 %index, 32
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !258

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
  %13 = add i64 %.02, -1, !dbg !256
  %14 = getelementptr inbounds i8* %b.04, i64 1, !dbg !256
  %15 = load i8* %b.04, align 1, !dbg !256, !tbaa !249
  %16 = getelementptr inbounds i8* %a.03, i64 1, !dbg !256
  store i8 %15, i8* %a.03, align 1, !dbg !256, !tbaa !249
  %17 = icmp eq i64 %13, 0, !dbg !256
  br i1 %17, label %.loopexit, label %.lr.ph, !dbg !256, !llvm.loop !259

; <label>:18                                      ; preds = %2
  %19 = add i64 %count, -1, !dbg !260
  %20 = icmp eq i64 %count, 0, !dbg !262
  br i1 %20, label %.loopexit, label %.lr.ph9, !dbg !262

.lr.ph9:                                          ; preds = %18
  %21 = getelementptr inbounds i8* %src, i64 %19, !dbg !263
  %22 = getelementptr inbounds i8* %dst, i64 %19, !dbg !260
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
  %next.gep236.sum = add i64 %.sum440, -15, !dbg !262
  %24 = getelementptr i8* %src, i64 %next.gep236.sum, !dbg !262
  %25 = bitcast i8* %24 to <16 x i8>*, !dbg !262
  %wide.load434 = load <16 x i8>* %25, align 1, !dbg !262
  %reverse = shufflevector <16 x i8> %wide.load434, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !262
  %.sum505 = add i64 %.sum440, -31, !dbg !262
  %26 = getelementptr i8* %src, i64 %.sum505, !dbg !262
  %27 = bitcast i8* %26 to <16 x i8>*, !dbg !262
  %wide.load435 = load <16 x i8>* %27, align 1, !dbg !262
  %reverse436 = shufflevector <16 x i8> %wide.load435, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !262
  %reverse437 = shufflevector <16 x i8> %reverse, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !262
  %next.gep333.sum = add i64 %.sum472, -15, !dbg !262
  %28 = getelementptr i8* %dst, i64 %next.gep333.sum, !dbg !262
  %29 = bitcast i8* %28 to <16 x i8>*, !dbg !262
  store <16 x i8> %reverse437, <16 x i8>* %29, align 1, !dbg !262
  %reverse438 = shufflevector <16 x i8> %reverse436, <16 x i8> undef, <16 x i32> <i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>, !dbg !262
  %.sum507 = add i64 %.sum472, -31, !dbg !262
  %30 = getelementptr i8* %dst, i64 %.sum507, !dbg !262
  %31 = bitcast i8* %30 to <16 x i8>*, !dbg !262
  store <16 x i8> %reverse438, <16 x i8>* %31, align 1, !dbg !262
  %index.next234 = add i64 %index212, 32
  %32 = icmp eq i64 %index.next234, %n.vec215
  br i1 %32, label %middle.block210, label %vector.body209, !llvm.loop !264

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
  %33 = add i64 %.16, -1, !dbg !262
  %34 = getelementptr inbounds i8* %b.18, i64 -1, !dbg !262
  %35 = load i8* %b.18, align 1, !dbg !262, !tbaa !249
  %36 = getelementptr inbounds i8* %a.17, i64 -1, !dbg !262
  store i8 %35, i8* %a.17, align 1, !dbg !262, !tbaa !249
  %37 = icmp eq i64 %33, 0, !dbg !262
  br i1 %37, label %.loopexit, label %scalar.ph211, !dbg !262, !llvm.loop !265

.loopexit:                                        ; preds = %scalar.ph211, %middle.block210, %18, %.lr.ph, %middle.block, %.preheader, %0
  ret i8* %dst, !dbg !266
}

; Function Attrs: nounwind uwtable
define weak i8* @mempcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #4 {
  %1 = icmp eq i64 %len, 0, !dbg !267
  br i1 %1, label %15, label %.lr.ph.preheader, !dbg !267

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
  %3 = bitcast i8* %next.gep to <16 x i8>*, !dbg !268
  %wide.load = load <16 x i8>* %3, align 1, !dbg !268
  %next.gep.sum280 = or i64 %index, 16, !dbg !268
  %4 = getelementptr i8* %srcaddr, i64 %next.gep.sum280, !dbg !268
  %5 = bitcast i8* %4 to <16 x i8>*, !dbg !268
  %wide.load201 = load <16 x i8>* %5, align 1, !dbg !268
  %6 = bitcast i8* %next.gep104 to <16 x i8>*, !dbg !268
  store <16 x i8> %wide.load, <16 x i8>* %6, align 1, !dbg !268
  %next.gep104.sum297 = or i64 %index, 16, !dbg !268
  %7 = getelementptr i8* %destaddr, i64 %next.gep104.sum297, !dbg !268
  %8 = bitcast i8* %7 to <16 x i8>*, !dbg !268
  store <16 x i8> %wide.load201, <16 x i8>* %8, align 1, !dbg !268
  %index.next = add i64 %index, 32
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !269

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
  %10 = add i64 %.01, -1, !dbg !267
  %11 = getelementptr inbounds i8* %src.03, i64 1, !dbg !268
  %12 = load i8* %src.03, align 1, !dbg !268, !tbaa !249
  %13 = getelementptr inbounds i8* %dest.02, i64 1, !dbg !268
  store i8 %12, i8* %dest.02, align 1, !dbg !268, !tbaa !249
  %14 = icmp eq i64 %10, 0, !dbg !267
  br i1 %14, label %._crit_edge, label %.lr.ph, !dbg !267, !llvm.loop !270

._crit_edge:                                      ; preds = %.lr.ph, %middle.block
  %scevgep = getelementptr i8* %destaddr, i64 %len
  br label %15, !dbg !267

; <label>:15                                      ; preds = %._crit_edge, %0
  %dest.0.lcssa = phi i8* [ %scevgep, %._crit_edge ], [ %destaddr, %0 ]
  ret i8* %dest.0.lcssa, !dbg !271
}

; Function Attrs: nounwind uwtable
define weak i8* @memset(i8* %dst, i32 %s, i64 %count) #4 {
  %1 = icmp eq i64 %count, 0, !dbg !272
  br i1 %1, label %._crit_edge, label %.lr.ph, !dbg !272

.lr.ph:                                           ; preds = %0
  %2 = trunc i32 %s to i8, !dbg !273
  br label %3, !dbg !272

; <label>:3                                       ; preds = %3, %.lr.ph
  %a.02 = phi i8* [ %dst, %.lr.ph ], [ %5, %3 ]
  %.01 = phi i64 [ %count, %.lr.ph ], [ %4, %3 ]
  %4 = add i64 %.01, -1, !dbg !272
  %5 = getelementptr inbounds i8* %a.02, i64 1, !dbg !273
  store volatile i8 %2, i8* %a.02, align 1, !dbg !273, !tbaa !249
  %6 = icmp eq i64 %4, 0, !dbg !272
  br i1 %6, label %._crit_edge, label %3, !dbg !272

._crit_edge:                                      ; preds = %3, %0
  ret i8* %dst, !dbg !274
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

!llvm.dbg.cu = !{!0, !21, !33, !43, !56, !67, !79, !97, !111, !125}
!llvm.module.flags = !{!140, !141}
!llvm.ident = !{!142, !142, !142, !142, !142, !142, !142, !142, !142, !142}

!0 = metadata !{i32 786449, metadata !1, i32 12, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 false, metadata !"", i32 0, metadata !2, metadata !2, metadata !3, metadata !2, metadata !2, metadata !""} ; [ DW_TAG
!1 = metadata !{metadata !"/home/kevin/Develop/EMT/src/kytoqf_t_2.c", metadata !"/home/kevin/Develop/EMT"}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4, metadata !9, metadata !10, metadata !13, metadata !14, metadata !15, metadata !18}
!4 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"umul_ok", metadata !"umul_ok", metadata !"", i32 8, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @umul_ok, null, null, metadata !2, i32 8} ; [ DW_T
!5 = metadata !{i32 786473, metadata !1}          ; [ DW_TAG_file_type ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!6 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !7, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!7 = metadata !{metadata !8, metadata !8, metadata !8}
!8 = metadata !{i32 786468, null, null, metadata !"int", i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!9 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"add_ok", metadata !"add_ok", metadata !"", i32 13, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @add_ok, null, null, metadata !2, i32 13} ; [ DW_TA
!10 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"is_prime", metadata !"is_prime", metadata !"", i32 20, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32)* @is_prime, null, null, metadata !2, i32 20} ; [ DW
!11 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!12 = metadata !{metadata !8, metadata !8}
!13 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"s_1", metadata !"s_1", metadata !"", i32 33, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @s_1, null, null, metadata !2, i32 33} ; [ DW_TAG_subpro
!14 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"s_2", metadata !"s_2", metadata !"", i32 46, metadata !6, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32)* @s_2, null, null, metadata !2, i32 46} ; [ DW_TAG_subpro
!15 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"kytoqf_t", metadata !"kytoqf_t", metadata !"", i32 57, metadata !16, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i32, i32, i32, i32)* @kytoqf_t, null, null, metadat
!16 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !17, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!17 = metadata !{metadata !8, metadata !8, metadata !8, metadata !8, metadata !8, metadata !8}
!18 = metadata !{i32 786478, metadata !1, metadata !5, metadata !"main", metadata !"main", metadata !"", i32 66, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i32 0, i1 false, i32 ()* @main, null, null, metadata !2, i32 66} ; [ DW_TAG_subprogram ]
!19 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!20 = metadata !{metadata !8}
!21 = metadata !{i32 786449, metadata !22, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !23, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!22 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/klee_choose.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 786478, metadata !22, metadata !25, metadata !"klee_choose", metadata !"klee_choose", metadata !"", i32 12, metadata !26, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i64)* @klee_choose, null, null, metadata !30, i32
!25 = metadata !{i32 786473, metadata !22}        ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_choose.c]
!26 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !27, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!27 = metadata !{metadata !28, metadata !28}
!28 = metadata !{i32 786454, metadata !22, null, metadata !"uintptr_t", i32 123, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [uintptr_t] [line 123, size 0, align 0, offset 0] [from long unsigned int]
!29 = metadata !{i32 786468, null, null, metadata !"long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!30 = metadata !{metadata !31, metadata !32}
!31 = metadata !{i32 786689, metadata !24, metadata !"n", metadata !25, i32 16777228, metadata !28, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 12]
!32 = metadata !{i32 786688, metadata !24, metadata !"x", metadata !25, i32 13, metadata !28, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 13]
!33 = metadata !{i32 786449, metadata !34, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !35, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!34 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!35 = metadata !{metadata !36}
!36 = metadata !{i32 786478, metadata !34, metadata !37, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", i32 12, metadata !38, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_check, null
!37 = metadata !{i32 786473, metadata !34}        ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_div_zero_check.c]
!38 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !39, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!39 = metadata !{null, metadata !40}
!40 = metadata !{i32 786468, null, null, metadata !"long long int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!41 = metadata !{metadata !42}
!42 = metadata !{i32 786689, metadata !36, metadata !"z", metadata !37, i32 16777228, metadata !40, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!43 = metadata !{i32 786449, metadata !44, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !45, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!44 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/klee_int.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!45 = metadata !{metadata !46}
!46 = metadata !{i32 786478, metadata !44, metadata !47, metadata !"klee_int", metadata !"klee_int", metadata !"", i32 13, metadata !48, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @klee_int, null, null, metadata !53, i32 13} ; [ 
!47 = metadata !{i32 786473, metadata !44}        ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_int.c]
!48 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{metadata !8, metadata !50}
!50 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!51 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!52 = metadata !{i32 786468, null, null, metadata !"char", i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!53 = metadata !{metadata !54, metadata !55}
!54 = metadata !{i32 786689, metadata !46, metadata !"name", metadata !47, i32 16777229, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!55 = metadata !{i32 786688, metadata !46, metadata !"x", metadata !47, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!56 = metadata !{i32 786449, metadata !57, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !58, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!57 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/klee_overshift_check.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!58 = metadata !{metadata !59}
!59 = metadata !{i32 786478, metadata !57, metadata !60, metadata !"klee_overshift_check", metadata !"klee_overshift_check", metadata !"", i32 20, metadata !61, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64, i64)* @klee_overshift_che
!60 = metadata !{i32 786473, metadata !57}        ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_overshift_check.c]
!61 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !62, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!62 = metadata !{null, metadata !63, metadata !63}
!63 = metadata !{i32 786468, null, null, metadata !"long long unsigned int", i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!64 = metadata !{metadata !65, metadata !66}
!65 = metadata !{i32 786689, metadata !59, metadata !"bitWidth", metadata !60, i32 16777236, metadata !63, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bitWidth] [line 20]
!66 = metadata !{i32 786689, metadata !59, metadata !"shift", metadata !60, i32 33554452, metadata !63, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [shift] [line 20]
!67 = metadata !{i32 786449, metadata !68, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !69, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!68 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!69 = metadata !{metadata !70}
!70 = metadata !{i32 786478, metadata !68, metadata !71, metadata !"klee_range", metadata !"klee_range", metadata !"", i32 13, metadata !72, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i32, i8*)* @klee_range, null, null, metadata !
!71 = metadata !{i32 786473, metadata !68}        ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!72 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !73, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!73 = metadata !{metadata !8, metadata !8, metadata !8, metadata !50}
!74 = metadata !{metadata !75, metadata !76, metadata !77, metadata !78}
!75 = metadata !{i32 786689, metadata !70, metadata !"start", metadata !71, i32 16777229, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [start] [line 13]
!76 = metadata !{i32 786689, metadata !70, metadata !"end", metadata !71, i32 33554445, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [end] [line 13]
!77 = metadata !{i32 786689, metadata !70, metadata !"name", metadata !71, i32 50331661, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [name] [line 13]
!78 = metadata !{i32 786688, metadata !70, metadata !"x", metadata !71, i32 14, metadata !8, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 14]
!79 = metadata !{i32 786449, metadata !80, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !81, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!80 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/memcpy.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!81 = metadata !{metadata !82}
!82 = metadata !{i32 786478, metadata !80, metadata !83, metadata !"memcpy", metadata !"memcpy", metadata !"", i32 12, metadata !84, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !90, i32 12} 
!83 = metadata !{i32 786473, metadata !80}        ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memcpy.c]
!84 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !85, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!85 = metadata !{metadata !86, metadata !86, metadata !87, metadata !89}
!86 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!87 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !88} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!88 = metadata !{i32 786470, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!89 = metadata !{i32 786454, metadata !80, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!90 = metadata !{metadata !91, metadata !92, metadata !93, metadata !94, metadata !96}
!91 = metadata !{i32 786689, metadata !82, metadata !"destaddr", metadata !83, i32 16777228, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!92 = metadata !{i32 786689, metadata !82, metadata !"srcaddr", metadata !83, i32 33554444, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!93 = metadata !{i32 786689, metadata !82, metadata !"len", metadata !83, i32 50331660, metadata !89, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!94 = metadata !{i32 786688, metadata !82, metadata !"dest", metadata !83, i32 13, metadata !95, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!95 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !52} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!96 = metadata !{i32 786688, metadata !82, metadata !"src", metadata !83, i32 14, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!97 = metadata !{i32 786449, metadata !98, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !99, metadata !2, metadata !2, metadata !""} ; [ DW_TA
!98 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/memmove.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!99 = metadata !{metadata !100}
!100 = metadata !{i32 786478, metadata !98, metadata !101, metadata !"memmove", metadata !"memmove", metadata !"", i32 12, metadata !102, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memmove, null, null, metadata !105, i
!101 = metadata !{i32 786473, metadata !98}       ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memmove.c]
!102 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !103, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!103 = metadata !{metadata !86, metadata !86, metadata !87, metadata !104}
!104 = metadata !{i32 786454, metadata !98, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!105 = metadata !{metadata !106, metadata !107, metadata !108, metadata !109, metadata !110}
!106 = metadata !{i32 786689, metadata !100, metadata !"dst", metadata !101, i32 16777228, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!107 = metadata !{i32 786689, metadata !100, metadata !"src", metadata !101, i32 33554444, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!108 = metadata !{i32 786689, metadata !100, metadata !"count", metadata !101, i32 50331660, metadata !104, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!109 = metadata !{i32 786688, metadata !100, metadata !"a", metadata !101, i32 13, metadata !95, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!110 = metadata !{i32 786688, metadata !100, metadata !"b", metadata !101, i32 14, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 14]
!111 = metadata !{i32 786449, metadata !112, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !113, metadata !2, metadata !2, metadata !""} ; [ DW
!112 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/mempcpy.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!113 = metadata !{metadata !114}
!114 = metadata !{i32 786478, metadata !112, metadata !115, metadata !"mempcpy", metadata !"mempcpy", metadata !"", i32 11, metadata !116, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @mempcpy, null, null, metadata !119, 
!115 = metadata !{i32 786473, metadata !112}      ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/mempcpy.c]
!116 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !117, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!117 = metadata !{metadata !86, metadata !86, metadata !87, metadata !118}
!118 = metadata !{i32 786454, metadata !112, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!119 = metadata !{metadata !120, metadata !121, metadata !122, metadata !123, metadata !124}
!120 = metadata !{i32 786689, metadata !114, metadata !"destaddr", metadata !115, i32 16777227, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 11]
!121 = metadata !{i32 786689, metadata !114, metadata !"srcaddr", metadata !115, i32 33554443, metadata !87, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 11]
!122 = metadata !{i32 786689, metadata !114, metadata !"len", metadata !115, i32 50331659, metadata !118, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 11]
!123 = metadata !{i32 786688, metadata !114, metadata !"dest", metadata !115, i32 12, metadata !95, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 12]
!124 = metadata !{i32 786688, metadata !114, metadata !"src", metadata !115, i32 13, metadata !50, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 13]
!125 = metadata !{i32 786449, metadata !126, i32 1, metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)", i1 true, metadata !"", i32 0, metadata !2, metadata !2, metadata !127, metadata !2, metadata !2, metadata !""} ; [ DW
!126 = metadata !{metadata !"/home/kevin/Klee/klee/runtime/Intrinsic/memset.c", metadata !"/home/kevin/Klee/klee/build/runtime/Intrinsic"}
!127 = metadata !{metadata !128}
!128 = metadata !{i32 786478, metadata !126, metadata !129, metadata !"memset", metadata !"memset", metadata !"", i32 11, metadata !130, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !133, i32
!129 = metadata !{i32 786473, metadata !126}      ; [ DW_TAG_file_type ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memset.c]
!130 = metadata !{i32 786453, i32 0, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !131, i32 0, null, null, null} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!131 = metadata !{metadata !86, metadata !86, metadata !8, metadata !132}
!132 = metadata !{i32 786454, metadata !126, null, metadata !"size_t", i32 42, i64 0, i64 0, i64 0, i32 0, metadata !29} ; [ DW_TAG_typedef ] [size_t] [line 42, size 0, align 0, offset 0] [from long unsigned int]
!133 = metadata !{metadata !134, metadata !135, metadata !136, metadata !137}
!134 = metadata !{i32 786689, metadata !128, metadata !"dst", metadata !129, i32 16777227, metadata !86, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 11]
!135 = metadata !{i32 786689, metadata !128, metadata !"s", metadata !129, i32 33554443, metadata !8, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 11]
!136 = metadata !{i32 786689, metadata !128, metadata !"count", metadata !129, i32 50331659, metadata !132, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 11]
!137 = metadata !{i32 786688, metadata !128, metadata !"a", metadata !129, i32 12, metadata !138, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 12]
!138 = metadata !{i32 786447, null, null, metadata !"", i32 0, i64 64, i64 64, i64 0, i32 0, metadata !139} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!139 = metadata !{i32 786485, null, null, metadata !"", i32 0, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!140 = metadata !{i32 2, metadata !"Dwarf Version", i32 4}
!141 = metadata !{i32 1, metadata !"Debug Info Version", i32 1}
!142 = metadata !{metadata !"Ubuntu clang version 3.4.2- (branches/release_34) (based on LLVM 3.4.2)"}
!143 = metadata !{i32 9, i32 0, metadata !4, null}
!144 = metadata !{i32 10, i32 0, metadata !4, null}
!145 = metadata !{i32 14, i32 0, metadata !146, null}
!146 = metadata !{i32 786443, metadata !1, metadata !9, i32 14, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!147 = metadata !{i32 15, i32 0, metadata !148, null}
!148 = metadata !{i32 786443, metadata !1, metadata !146, i32 14, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!149 = metadata !{i32 17, i32 0, metadata !9, null}
!150 = metadata !{i32 18, i32 0, metadata !9, null}
!151 = metadata !{i32 21, i32 0, metadata !152, null}
!152 = metadata !{i32 786443, metadata !1, metadata !10, i32 21, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!153 = metadata !{i32 22, i32 0, metadata !154, null}
!154 = metadata !{i32 786443, metadata !1, metadata !155, i32 22, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!155 = metadata !{i32 786443, metadata !1, metadata !152, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!156 = metadata !{i32 23, i32 0, metadata !157, null}
!157 = metadata !{i32 786443, metadata !1, metadata !158, i32 23, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!158 = metadata !{i32 786443, metadata !1, metadata !154, i32 22, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!159 = metadata !{i32 24, i32 0, metadata !160, null}
!160 = metadata !{i32 786443, metadata !1, metadata !157, i32 23, i32 0, i32 7} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!161 = metadata !{i32 28, i32 0, metadata !162, null}
!162 = metadata !{i32 786443, metadata !1, metadata !152, i32 27, i32 0, i32 8} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!163 = metadata !{i32 30, i32 0, metadata !10, null}
!164 = metadata !{i32 31, i32 0, metadata !10, null}
!165 = metadata !{i32 34, i32 0, metadata !166, null}
!166 = metadata !{i32 786443, metadata !1, metadata !13, i32 34, i32 0, i32 9} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!167 = metadata !{i32 36, i32 0, metadata !168, null}
!168 = metadata !{i32 786443, metadata !1, metadata !169, i32 36, i32 0, i32 11} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!169 = metadata !{i32 786443, metadata !1, metadata !166, i32 34, i32 0, i32 10} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!170 = metadata !{i32 37, i32 0, metadata !171, null}
!171 = metadata !{i32 786443, metadata !1, metadata !172, i32 37, i32 0, i32 13} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!172 = metadata !{i32 786443, metadata !1, metadata !168, i32 36, i32 0, i32 12} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!173 = metadata !{i32 38, i32 0, metadata !174, null}
!174 = metadata !{i32 786443, metadata !1, metadata !171, i32 37, i32 0, i32 14} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!175 = metadata !{i32 42, i32 0, metadata !13, null}
!176 = metadata !{i32 43, i32 0, metadata !13, null}
!177 = metadata !{i32 47, i32 0, metadata !178, null}
!178 = metadata !{i32 786443, metadata !1, metadata !14, i32 47, i32 0, i32 15} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!179 = metadata !{i32 48, i32 0, metadata !180, null}
!180 = metadata !{i32 786443, metadata !1, metadata !181, i32 48, i32 0, i32 17} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!181 = metadata !{i32 786443, metadata !1, metadata !178, i32 47, i32 0, i32 16} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!182 = metadata !{i32 49, i32 0, metadata !183, null}
!183 = metadata !{i32 786443, metadata !1, metadata !184, i32 49, i32 0, i32 19} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!184 = metadata !{i32 786443, metadata !1, metadata !180, i32 48, i32 0, i32 18} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!185 = metadata !{i32 50, i32 0, metadata !186, null}
!186 = metadata !{i32 786443, metadata !1, metadata !183, i32 49, i32 0, i32 20} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!187 = metadata !{i32 54, i32 0, metadata !14, null}
!188 = metadata !{i32 55, i32 0, metadata !14, null}
!189 = metadata !{i32 58, i32 0, metadata !190, null} ; [ DW_TAG_imported_module ]
!190 = metadata !{i32 786443, metadata !1, metadata !15, i32 58, i32 0, i32 21} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!191 = metadata !{i32 59, i32 0, metadata !192, null}
!192 = metadata !{i32 786443, metadata !1, metadata !193, i32 59, i32 0, i32 23} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!193 = metadata !{i32 786443, metadata !1, metadata !190, i32 58, i32 0, i32 22} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!194 = metadata !{i32 60, i32 0, metadata !195, null}
!195 = metadata !{i32 786443, metadata !1, metadata !192, i32 59, i32 0, i32 24} ; [ DW_TAG_lexical_block ] [/home/kevin/Develop/EMT//home/kevin/Develop/EMT/src/kytoqf_t_2.c]
!196 = metadata !{i32 61, i32 0, metadata !195, null}
!197 = metadata !{i32 63, i32 0, metadata !15, null}
!198 = metadata !{i32 68, i32 0, metadata !18, null}
!199 = metadata !{i32 69, i32 0, metadata !18, null}
!200 = metadata !{i32 70, i32 0, metadata !18, null}
!201 = metadata !{i32 71, i32 0, metadata !18, null}
!202 = metadata !{i32 72, i32 0, metadata !18, null}
!203 = metadata !{i32 73, i32 0, metadata !18, null}
!204 = metadata !{i32 74, i32 0, metadata !18, null}
!205 = metadata !{i32 14, i32 0, metadata !24, null}
!206 = metadata !{i32 17, i32 0, metadata !207, null}
!207 = metadata !{i32 786443, metadata !22, metadata !24, i32 17, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_choose.c]
!208 = metadata !{metadata !209, metadata !209, i64 0}
!209 = metadata !{metadata !"long", metadata !210, i64 0}
!210 = metadata !{metadata !"omnipotent char", metadata !211, i64 0}
!211 = metadata !{metadata !"Simple C/C++ TBAA"}
!212 = metadata !{i32 18, i32 0, metadata !207, null}
!213 = metadata !{i32 19, i32 0, metadata !24, null}
!214 = metadata !{i32 13, i32 0, metadata !215, null}
!215 = metadata !{i32 786443, metadata !34, metadata !36, i32 13, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_div_zero_check.c]
!216 = metadata !{i32 14, i32 0, metadata !215, null}
!217 = metadata !{i32 15, i32 0, metadata !36, null}
!218 = metadata !{i32 15, i32 0, metadata !46, null}
!219 = metadata !{i32 16, i32 0, metadata !46, null}
!220 = metadata !{metadata !221, metadata !221, i64 0}
!221 = metadata !{metadata !"int", metadata !210, i64 0}
!222 = metadata !{i32 21, i32 0, metadata !223, null}
!223 = metadata !{i32 786443, metadata !57, metadata !59, i32 21, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_overshift_check.c]
!224 = metadata !{i32 27, i32 0, metadata !225, null}
!225 = metadata !{i32 786443, metadata !57, metadata !223, i32 21, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_overshift_check.c]
!226 = metadata !{i32 29, i32 0, metadata !59, null}
!227 = metadata !{i32 16, i32 0, metadata !228, null}
!228 = metadata !{i32 786443, metadata !68, metadata !70, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!229 = metadata !{i32 17, i32 0, metadata !228, null}
!230 = metadata !{i32 19, i32 0, metadata !231, null}
!231 = metadata !{i32 786443, metadata !68, metadata !70, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!232 = metadata !{i32 22, i32 0, metadata !233, null}
!233 = metadata !{i32 786443, metadata !68, metadata !231, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!234 = metadata !{i32 25, i32 0, metadata !235, null}
!235 = metadata !{i32 786443, metadata !68, metadata !233, i32 25, i32 0, i32 4} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!236 = metadata !{i32 26, i32 0, metadata !237, null}
!237 = metadata !{i32 786443, metadata !68, metadata !235, i32 25, i32 0, i32 5} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!238 = metadata !{i32 27, i32 0, metadata !237, null}
!239 = metadata !{i32 28, i32 0, metadata !240, null}
!240 = metadata !{i32 786443, metadata !68, metadata !235, i32 27, i32 0, i32 6} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/klee_range.c]
!241 = metadata !{i32 29, i32 0, metadata !240, null}
!242 = metadata !{i32 32, i32 0, metadata !233, null}
!243 = metadata !{i32 34, i32 0, metadata !70, null}
!244 = metadata !{i32 16, i32 0, metadata !82, null}
!245 = metadata !{i32 17, i32 0, metadata !82, null}
!246 = metadata !{metadata !246, metadata !247, metadata !248}
!247 = metadata !{metadata !"llvm.vectorizer.width", i32 1}
!248 = metadata !{metadata !"llvm.vectorizer.unroll", i32 1}
!249 = metadata !{metadata !210, metadata !210, i64 0}
!250 = metadata !{metadata !250, metadata !247, metadata !248}
!251 = metadata !{i32 18, i32 0, metadata !82, null}
!252 = metadata !{i32 16, i32 0, metadata !253, null}
!253 = metadata !{i32 786443, metadata !98, metadata !100, i32 16, i32 0, i32 0} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memmove.c]
!254 = metadata !{i32 19, i32 0, metadata !255, null}
!255 = metadata !{i32 786443, metadata !98, metadata !100, i32 19, i32 0, i32 1} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memmove.c]
!256 = metadata !{i32 20, i32 0, metadata !257, null}
!257 = metadata !{i32 786443, metadata !98, metadata !255, i32 19, i32 0, i32 2} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memmove.c]
!258 = metadata !{metadata !258, metadata !247, metadata !248}
!259 = metadata !{metadata !259, metadata !247, metadata !248}
!260 = metadata !{i32 22, i32 0, metadata !261, null}
!261 = metadata !{i32 786443, metadata !98, metadata !255, i32 21, i32 0, i32 3} ; [ DW_TAG_lexical_block ] [/home/kevin/Klee/klee/build/runtime/Intrinsic//home/kevin/Klee/klee/runtime/Intrinsic/memmove.c]
!262 = metadata !{i32 24, i32 0, metadata !261, null}
!263 = metadata !{i32 23, i32 0, metadata !261, null}
!264 = metadata !{metadata !264, metadata !247, metadata !248}
!265 = metadata !{metadata !265, metadata !247, metadata !248}
!266 = metadata !{i32 28, i32 0, metadata !100, null}
!267 = metadata !{i32 15, i32 0, metadata !114, null}
!268 = metadata !{i32 16, i32 0, metadata !114, null}
!269 = metadata !{metadata !269, metadata !247, metadata !248}
!270 = metadata !{metadata !270, metadata !247, metadata !248}
!271 = metadata !{i32 17, i32 0, metadata !114, null}
!272 = metadata !{i32 13, i32 0, metadata !128, null}
!273 = metadata !{i32 14, i32 0, metadata !128, null}
!274 = metadata !{i32 15, i32 0, metadata !128, null}
