//
// Kaplansky's theorem on quadratic forms
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

int is_prime(int a) {
    if (a > 1) {
        for (int i = 2; i <= a / 2; ++i) {
            if (a % i == 0) {
                return 0;
            }
        }
    } else {
        return 0;
    }
    return 1;
}

int s_1(int x, int y) {
    if (umul_ok(x, x) && umul_ok(y, y)) {

        if (umul_ok(32, y * y)) {
            if (add_ok(x*x, 32*y*y)) {
                return 1;
            }
        }
    }
    return 0;
}


int s_2(int x, int y) {
    if (umul_ok(x, x) && umul_ok(y, y)) {
        if (umul_ok(64, y * y)) {
            if (add_ok(x*x, 64*y*y)) {
                return 1;
            }
        }
    }
    return 0;
}

int kytoqf_t(int p, int x1, int y1, int x2, int y2) {
    if (is_prime(p) && (p % 16 == 9)) {
        if ((s_1(x1, y1) && s_2(x2, y2)) || (!s_1(x1, y1) && !s_2(x2, y2))) {
            klee_assert(0);
        }
    }
    return 1;
}

int main() {
    int p, x1, y1, x2, y2;
    klee_make_symbolic(&p, sizeof(p), "p");
    klee_make_symbolic(&x1, sizeof(x1), "x1");
    klee_make_symbolic(&y1, sizeof(y1), "y1");
    klee_make_symbolic(&x2, sizeof(x2), "x2");
    klee_make_symbolic(&y2, sizeof(y2), "y2");
    kytoqf_t(p, x1, y1, x2, y2);
    return 0;
}