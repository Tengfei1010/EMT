#include <klee/klee.h>
#include <stdio.h>
#include <limits.h>

/*

Fermat Theorem

Fermat's Theorem, also known as Fermat's Last Theorem, was proposed by 
French mathematician Pie De Femmer in the 17th century.
It is asserted that when the integer n > 2, the equations for x, y, z x^n + y^n = z^n 
do not have positive integer solutions.
German Fevsk had announced that 100,000 marks were used as bonus prizes.
Within 100 years after his death, the first person to prove the theorem attracted
many people to try and submit their "proofs."
After being proposed, he experienced many people guessing and dialectizing.
After more than three hundred years of history, he was thoroughly proved by
the British mathematician Andrew Wiles in 1995.

*/

int umul_ok(unsigned int x, unsigned int y)  
{  
    unsigned int p = x * y;  
    return !x || p/x==y;  
  
} 

int test_ft(unsigned int x, unsigned int y, unsigned int z) {
   
  if (x > 0 &&  y > 0 && z > 0) {
    unsigned int s_x = x * x;
    unsigned int s_y = y * y;
    unsigned int s_z = z * z;

    unsigned int t_x = x * x * x;
    unsigned int t_y = y * y * y;
    unsigned int t_z = z * z * z;

    int con_1 = umul_ok(x, x) && umul_ok(y, y) && umul_ok(z, z);
    int con_2 = umul_ok(x, s_x) && umul_ok(y, s_y) && umul_ok(z, s_z);

    // Here, we
    if (con_1 && con_2) {
    // if ((t_x > 0) && (t_y > 0) && (t_z > 0)) {

        if (t_x < (INT_MAX - t_y)) {

          if ((t_x + t_y) == t_z) {

              klee_assert(0);
              // printf("%d\n", t_z);
              return 0;
        }
      }
    }
  } 
  
  return 1;
}

int main() {
  unsigned int x, y, z;
  // int x=132717763, y=41204308, z=27820675;
  klee_make_symbolic(&x, sizeof(y), "x");
  klee_make_symbolic(&y, sizeof(y), "y");
  klee_make_symbolic(&z, sizeof(z), "z");
  test_ft(x, y, z);
  return 0;
}