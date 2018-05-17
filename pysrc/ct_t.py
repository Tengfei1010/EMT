#!/usr/bin/python
# -*- coding: utf-8 -*-

from z3 import *

x = Int('x')
y = Int('y')
m = Int('m')
s = Solver()
s.add(x > 0, y > 0, m > 0)
s.add((x - y) % m == 0)
s.add((x % m) != (y % m))
print(s.check())
print(s.model())
