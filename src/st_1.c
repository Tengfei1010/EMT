//
// a % b = 0, a % c=0 ---> a % (b+c) == 0
//

#include <klee/klee.h>
#include <limits.h>
// #include <stdio.h>

int st_1(int a, int b, int c) {
    if (a > 0 && b > 0 && c > 0) {
        if ((b % a == 0) && (c % a == 0)) {
            if (c < (INT_MAX - b) && (b + c) != 0) {
                if ((b + c) % a != 0) {
                    klee_assert(0);
                }
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
    st_1(a, b, c);
    return 0;
}
