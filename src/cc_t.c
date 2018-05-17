//
// Catalan's conjecture
//

#include <klee/klee.h>

int umul_ok(int x, int y) {
    int p = x * y;
    return !x || p / x == y;

}

// a ^ n is ok
int umul_ok_n(int a, int n) {
    int s = a;
    for (int i = 1; i < n; i++) {
        if (umul_ok(s, a)) {
            s *= a;
        } else {
            return 0;
        }
    }
    return 1;
}

// a^n
int pow(int a, int n) {
    int s = 1;
    for (int i = 0; i < n; i++) {
        s *= a;
    }
    return s;
}

int cc_t(int x, int y, int a, int b) {
    if (x > 3 || y > 2 ) {
        if (a > 1 && b > 1) {
            if (umul_ok_n(x, a) && umul_ok_n(y , b)) {
                if (pow(x, a) - pow(y, b) == 1) {
                    klee_assert(0);
                }
            }
        }
    }
}

int main() {
    int a, b, x, y;
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");
    klee_make_symbolic(&x, sizeof(x), "x");
    klee_make_symbolic(&y, sizeof(y), "y");
    cc_t(x, y, a, b);
    return 0;
}