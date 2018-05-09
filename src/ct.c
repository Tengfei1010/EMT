#include <klee/klee.h>
// #include <stdio.h>

/*

Congruence theorem

Given a positive integer m, if the two integers a and 
b satisfy the ab can be divisible by m, that is (ab) / m to get an integer,
then the integer a and b are modulo m congruent, denoted as a ≡ b ( Mod m). 
The modulo m congruence is an equivalence relation of integers.
*/

int get_sign(int a, int b) {
   
  if (a > 0 && b > 0) {
    if ((a - b) % 12 == 0) {
    if ((a % 12) != (b % 12))
       klee_assert(0);
     return 0;
    }
  }
  
  return 1;
}

int main() {
  int a, b;
  klee_make_symbolic(&a, sizeof(a), "a");
  klee_make_symbolic(&b, sizeof(b), "b");
  get_sign(a, b);
  return 0;
}