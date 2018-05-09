//
// Created by tzt77 on 5/9/18.
//

// 越界检测
int umul_ok(int x, int y) {
    int p = x * y;
    return !x || p / x == y;

}

// 互质判断
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

// 欧拉函数
int phi(int n) {
    int result = 0;
    int k;
    for (k = 1; k <= n; k++)
        result += gcd_one(k, n) == 1;
    return result;
}

// a^n
int pow(int a, int n) {
    int s = 1;
    for (int i = 0; i < n; i++) {
        s *= a;
    }
    return s;
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