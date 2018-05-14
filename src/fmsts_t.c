//
// Fermat's theorem on sums of two squares
// p = x^2 + y^2 ==> p % 4 = 1
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

int is_obb_prime(int a) {
    if (a > 1) {
        if (a % 2 == 0) {
            return 0;
        }

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

int fmsts_t(int x, int y) {
    if (umul_ok(x, x) && umul_ok(y, y)) {
        int t_1 = x * x;
        int t_2 = y * y;
        if (add_ok(t_1, t_2) && is_obb_prime(t_1 + t_2)) {
            int sum = t_1 + t_2;
            if (sum % 4 != 1) {
                klee_assert(0);
            }
        }
    }
    return 1;
}

int main() {
    int x, y, z;
    klee_make_symbolic(&x, sizeof(x), "x");
    klee_make_symbolic(&y, sizeof(y), "y");
    fmsts_t(x, y);
    return 0;
}
