//
// Primes ≡ 1 (mod 3)
//

#include <klee/klee.h>

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

int cr_t(int a) {
    if (is_prime(a)) {
        if (a % 3 != 1) {
            klee_assert(0);
        }
    }
}

int main() {
    int a;
    klee_make_symbolic(&a, sizeof(a), "a");
    cr_t(a);
    return 0;
}
