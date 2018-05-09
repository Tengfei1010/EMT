//
// Euler's totient theorem
// 在数论中，欧拉定理,（也称费马-欧拉定理）是一个关于同余的性质。欧拉定理表明，若n,a为正整数，且n,a互质, a ^(q(n)) == 1(mod n)
//

#include <klee/klee.h>
// #include <stdio.h>

int umul_ok(int x, int y) {
    int p = x * y;
    return !x || p / x == y;

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


int phi(int n) {
    int result = 0;
    int k;
    for (k = 1; k <= n; k++)
        result += gcd_one(k, n) == 1;
    return result;
}

int pow(int a, int n) {
    int s = 1;
    for (int i = 0; i < n; i++) {
        s *= a;
    }
    return s;
}


int fm_ol(int a, int n) {
    int f_n = phi(n);
    if (a > 0 && n > 0) {
        if (umul_ok(a, pow(a, f_n - 1))) {
            if (pow(a, f_n) % n != 1) {
                klee_assert(0);
            }
        }
    }
    return 0;
}

int main() {
    int a, n;
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&n, sizeof(n), "n");
    fm_ol(a, n);
    return 0;
}

