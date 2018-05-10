//
// a是不能被质数p整除的正整数，则有a^(p-1) ≡ 1 (mod p)
//

#include <klee/klee.h>
// #include <stdio.h>

int umul_ok(int x, int y)
{
    int p = x * y;
    return !x || p/x==y;

}

int gcd_one(int a, int b) {

    int temp = 0;

    while (b != 0) {
        temp = b;
        b = a % b;
        a = temp;
    }
    if (a == 1) return 1;
    else return 0;
}

// a^n
int pow(int a, int n) {
    int s = 1;
    for (int i = 0; i < n; i++) {
        s *= a;
    }
    return s;
}

int fm_st(int a, int n) {
    if (a > 0 && n > 0) {
        if (umul_ok(a, pow(a, n-2))) {
            if (pow(a, n-1) % n != 1) {
                klee_assert(0);
            }
        }
    }

}


int main() {
    int a, n;
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&n, sizeof(n), "n");
    fm_st(a, n);
    return 0;
}