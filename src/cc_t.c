//
// Catalan's conjecture
//

#include <klee/klee.h>

int umul_ok(int x, int y) {
    int p = x * y;
    return !x || p / x == y;

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
            if (umul_ok(x, pow(x, a-1)) && umul_ok(y , pow(y, b -1))) {
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