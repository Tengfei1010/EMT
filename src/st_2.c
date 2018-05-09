//
// a % b = 0, a % c=0 ---> a % (bc) == 0
//

#include <klee/klee.h>
#include <limits.h>
// #include <stdio.h>


int umul_ok(int x, int y) {
    int p = x * y;
    return !x || p / x == y;

}

int st_2(int a, int b, int c) {
    if (b != 0 && c != 0) {
        if (umul_ok(b, c)) {
            if (a % (b * c) != 0) {
                klee_assert(0);
            }
        }
    }
    return 0;
}


int main() {
    int a, b, c;
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");
    klee_make_symbolic(&c, sizeof(c), "c");
    st_2(a, b, c);
    return 0;
}
