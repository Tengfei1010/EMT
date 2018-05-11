//
// 带余除法 对于 a， b 两个整数，其中 b 0，则存在唯一 q， r 使得：
//a = bq+r， 0 ≤ r< | b|． r 称为 a 被 b 除得到的余数．显然当 r = 0 时， b a．
//

#include <klee/klee.h>
#include <limits.h>

int umul_ok(int x, int y) {
    int p = x * y;
    return !x || p / x == y;

}

int add_ok(int a, int b) {
    if (a < (INT_MAX - b)) {
        return 1;
    }
    return 0;
}

int get_q_r(int a, int b, int q, int r) {
    return a == b * q + r;
}

void dycf_t(int a, int b, int q1, int r1, int q2, int r2) {
    if (a > 0 && b > 0) {
        if (umul_ok(b, q1) && add_ok(b*q1, r1)) {
            if (umul_ok(b, q2) && add_ok(b*q2, r2)) {
                if (get_q_r(a, b, q1, r1) && get_q_r(a, b, q2, r2)) {
                    if (q2 != q1 && r1 != r2) {
                        klee_assert(0);
                    }
                }
            }
        }
    }
}

int main() {
    int a, b, q1, r1, q2, r2;
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");
    klee_make_symbolic(&q1, sizeof(q1), "q1");
    klee_make_symbolic(&r1, sizeof(r1), "r1");
    klee_make_symbolic(&q2, sizeof(q2), "q2");
    klee_make_symbolic(&r2, sizeof(r2), "r2");
    dycf_t(a, b, q1, r1, q2, r2);
    return 0;
}