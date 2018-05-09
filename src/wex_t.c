//
// 在初等数论中，威尔逊定理给出了判定一个自然数是否为素数的充分必要条件。即：当且仅当p为素数时：
//
//(p-1)! == -1 (mod p)
//

#include <klee/klee.h>
// #include <stdio.h>

// 越界检测
int umul_ok(int x, int y) {
    int p = x * y;
    return !x || p / x == y;

}

int is_prime(int a) {
    if (a > 1) {
        for (int i = 2; i <= a / 2; ++i) {
            // condition for nonprime number
            if (n % i == 0) {
                return 0;
            }
        }
    } else {
        return 0;
    }

    return 1;
}

int factorial(int n) {
    int i;
    int s = 1;
    for (i = 1; i < n; i++) {
        s *= i;
    }
    return s;

}

int factorial_ok(int n) {
    int i;
    int s = 1;
    for (i = 1; i < n; i++) {
        if (!umul_ok(s, i)) {
            return 0;
        }
    }

    return 1;
}

int wex_t(int p) {
    if (p > 0 && is_prime(p)) {
        if (factorial_ok(p)) {
            if (factorial(p) % p != -1) {
                klee_assert(0);
            }
        }
    }
    return 0;
}

int main() {
    int p;
    klee_make_symbolic(&p, sizeof(p), "p");
    wex_t(p);
    return 0;
}