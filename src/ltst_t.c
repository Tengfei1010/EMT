//
// n =  4^a*(8b+7)
// n != x^2 + y^2 + z^2
//
//

#include <klee/klee.h>
#include <limits.h>
#include <stdio.h>

// a^n
int pow(int a, int n) {
    int s = 1;
    for (int i = 0; i < n; i++) {
        s *= a;
    }
    return s;
}

// 越界检测 *
int umul_ok(int x, int y) {
    int p = x * y;
    return !x || p / x == y;

}

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

// 越界检测 +
int add_ok(int a, int b) {
    if (a < (INT_MAX - b)) {
        return 1;
    }
    return 0;
}


int c_1(int x, int y, int z) {
    int s = 0;
    if (x > 0 && y > 0 && z > 0) {
        if (umul_ok(x, x) && umul_ok(y, y) && umul_ok(z, z)) {
            if (add_ok(x * x, y * y) && add_ok((x * x + y * y), z * z)) {
                s = x*x + y*y + z*z;
            }
        }
    }

    return s;
}

int c_2(int a, int b) {
    int n = 0;
    if (a > 0 && b > 0) {
         if (umul_ok_n(4, a) && add_ok(8 * b, 7) && umul_ok(pow(4, a), (8 * b + 7))) {
            n = pow(4, a) * (8 * b + 7);
         }
    }

    return n;
}



int ltst_t(int a, int b, int x, int y, int z) {
//    if (a >= 0 && umul_ok_n(4, a)) {
//        if (umul_ok(pow(4, a), (8 * b + 7))) {
//            if (add_ok(8*b, 7)) {
//                int n = pow(4, a) * (8 * b + 7);
//                if (n > 0) {
//                    if (umul_ok(x, x) && umul_ok(y, y) && umul_ok(z, z)) {
//                        if (add_ok(x * x, y * y) && add_ok((x * x + y * y), z * z)) {
//                            int s = x * x + y * y + z * z;
//                            if (s == n) {
//                                klee_assert(0);
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }

//    if (a >= 0 && umul_ok_n(4, a)) {
//        if (umul_ok(pow(4, a), (8 * b + 7))) {
//            if (add_ok(8*b, 7)) {
//                int n = pow(4, a) * (8 * b + 7);
//                if (n > 0) {
//                    if (umul_ok(x, x) && umul_ok(y, y) && umul_ok(z, z)) {
//                        if (add_ok(x * x, y * y) && add_ok((x * x + y * y), z * z)) {
//                            int s = x * x + y * y + z * z;
//                            if (s == n) {
//                                klee_assert(0);
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }

    int c1 = c_1(x, y, z);
    int c2 = c_2(a, b);
    if (c1 > 0 && c2 > 0 && c1 == c2) {
        klee_assert(0);
    }

    return 1;
}

int main() {
    int a, b, x, y, z;
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");
    klee_make_symbolic(&x, sizeof(x), "x");
    klee_make_symbolic(&y, sizeof(y), "y");
    klee_make_symbolic(&z, sizeof(z), "z");
    ltst_t(a, b, x, y, z);
    return 0;
}

