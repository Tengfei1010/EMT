//
// 素数 算法碰撞
//

#include <klee/klee.h>
#include <stdlib.h>

const int S = 20;

long long mult_mod(long long a, long long b, long long c) {
    a %= c;
    b %= c;
    long long ret = 0;
    while (b) {
        if (b & 1) {
            ret += a;
            ret %= c;
        }
        a <<= 1;
        if (a >= c)a %= c;
        b >>= 1;
    }
    return ret;
}

//计算  x^n %c
long long pow_mod(long long x, long long n, long long mod)
{
    if (n == 1)return x % mod;
    x %= mod;
    long long tmp = x;
    long long ret = 1;
    while (n) {
        if (n & 1) ret = mult_mod(ret, tmp, mod);
        tmp = mult_mod(tmp, tmp, mod);
        n >>= 1;
    }
    return ret;
}

//以a为基,n-1=x*2^t      a^(n-1)=1(mod n)  验证n是不是合数
//一定是合数返回true,不一定返回false
int check(long long a, long long n, long long x, long long t) {
    long long ret = pow_mod(a, x, n);
    long long last = ret;
    for (int i = 1; i <= t; i++) {
        ret = mult_mod(ret, ret, n);
        if (ret == 1 && last != 1 && last != n - 1) return 1;//合数
        last = ret;
    }
    if (ret != 1) return 1;
    return 0;
}

int Miller_Rabin(long long n) {
    if (n < 2)return 0;
    if (n == 2)return 0;
    if ((n & 1) == 0) return 0;

    long long x = n - 1;
    long long t = 0;
    while ((x & 1) == 0) {
        x >>= 1;
        t++;
    }
    for (int i = 0; i < S; i++) {
        long long a = rand() % (n - 1) + 1;
        if (check(a, n, x, t))
            return 0;
    }
    return 1;
}

int is_prime(long long n) {
    if (n > 1) {
        for (long long i = 2; i <= n / 2; ++i) {
            if (n % i == 0) {
                return 0;
            }
        }

    } else {
        return 0;
    }

    return 1;
}

void sh_t(long long n) {
    if (n > 1) {
        if (is_prime(n) && !Miller_Rabin(n)) {
            klee_assert(0);
        } else if (Miller_Rabin(n) && !is_prime(n)) {
            klee_assert(0);
        }
    }
}


int main () {

    long long a;
    klee_make_symbolic(&a, sizeof(a), "a");
    sh_t(a);
}
