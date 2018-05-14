//
// Fermat's right triangle theorem
// x^4 - y^4 = z^2  has no integer solution.
//

#include <klee/klee.h>

int umul_ok(int x, int y) {
    int p = x * y;
    return !x || p / x == y;

}

int umul_ok_n(int x, int n) {

    int s = 1;
    for (int i = 1; i < n; i++) {
        s *= x;
        if (!umul_ok(s, x)) {
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



int fmrt_t(int x, int y, int z) {
    if (x > 0 && y > 0 && z > 0) {
        if (umul_ok_n(x, 4) && umul_ok_n(y, 4) && umul_ok_n(z, 2)) {
            if (pow(x, 4) - pow(y, 4) == pow(z, 2)) {
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
    klee_make_symbolic(&z, sizeof(z), "z");
    fmrt_t(x, y, z);
    return 0;
}

