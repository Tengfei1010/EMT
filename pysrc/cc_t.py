#!/usr/bin/python
# -*- coding: utf-8 -*-

from z3 import *

x = Int('x')
y = Int('y')
a = Int('a')
b = Int('b')
s = Solver()

s.add(x > 3, y > 2)
s.add(a > 1, b > 1)

# s_x = 1
# for i in range(0, a):
#     s_x *= x
# s_y = 1
# for i in range(0, b):
#     s_y *= b

s.add((x**a - y**b) == 1)
print(s.check())
print(s.model())

# x = Int('x')
# y = Int('y')
# print(simplify(x + y + 2*x + 3))
# print(simplify(x < y + x + 2))
# print(simplify(And(x + 1 >= 3, x**2 + x**2 + y**2 + 2 >= 5)))
