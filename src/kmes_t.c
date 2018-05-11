//
// 卡迈克尔数的定义是对于合数n，如果对于所有正整数b，b和n互素，都有同余式b^(n-1)≡ 1 (mod n)成立，
// 则合数n为Carmichael数。561 is one carmichael number.
//

#include <klee/klee.h>

int N = 561;

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

int umul_ok(int x, int y) {
    int p = x * y;
    return !x || p / x == y;

}

void kmes_t(int a) {
    if (a > 0) {
        if (gcd_one(a, N)) {
            if (umul_ok(a, pow(a, N - 2))) {
                if (pow(a, N -1) % N != 1) {
                    klee_assert(0);
                }
            }
        }
    }
}

int main() {
    int a;
    klee_make_symbolic(&a, sizeof(a), "a");
    kmes_t(a);
    return 0;
}
