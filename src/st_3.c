//
// int a > 0; +-1|a. +-a|a
//

#include <klee/klee.h>
#include <limits.h>
// #include <stdio.h>


int st_3(int a, int b) {
    if (a > 0) {
        if ((a + b) % (2 * b + a - b) != 0) {
            klee_assert(0);
        }
    }
    return 0;
}


int main() {
    int a, b;
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");
    st_3(a, b);
    return 0;
}
