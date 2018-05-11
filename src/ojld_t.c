//
// if a and b 最大公约数 is 1, a and b is gcd_one
//
#include <klee/klee.h>


int get_largest_common_divisor(int a, int b) {

    while (a != b)
        if (a > b) a = a - b;
        else b = b - a;

    return a;

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


int ojld_t(int a, int b) {

    if(a > 0 && b > 0) {
        int lcd = get_largest_common_divisor(a, b);
        if (lcd == 1) {
            if (!gcd_one(a, b)) {
                klee_assert(0);
            }
        }
    }
}

int main () {

    int a, b, c;
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");
    ojld_t(a, b);
}
