# Elliptical Curves

# python -m pip install py_ecc
from py_ecc.bn128 import G1, multiply, add, eq, neg

print(G1)
# (1, 2)

print(add(G1, G1))
# (1368015179489954701390400359078579693043519447331113978918064868415326638035, 9918110051302171585080402603319702774565515993150576347155970296011118125764)

print(multiply(G1, 2))
#(1368015179489954701390400359078579693043519447331113978918064868415326638035, 9918110051302171585080402603319702774565515993150576347155970296011118125764)

# 10G + 11G = 21G
assert eq(add(multiply(G1, 10), multiply(G, 11)), multiply(G1, 21))

# To generate the plot 

import matplotlib.pyplot as plt
from py_ecc.bn128 import G1, multiply, neg
import math
import numpy as np
xs = []
ys = []
for i in range(1,1000):
    xs.append(i)
    ys.append(int(multiply(G1, i)[1]))
    xs.append(i)
    ys.append(int(neg(multiply(G1, i))[1]))
plt.scatter(xs, ys, marker='.')

# Addition

from py_ecc.bn128 import G1, multiply, add, eq

# 5 = 2 + 3
assert eq(multiply(G1, 5), add(multiply(G1, 2), multiply(G1, 3)));



from py_ecc.bn128 import curve_order, field_modulus, G1, multiply, eq

x = 5 # chosen randomly
# This passes
assert eq(multiply(G1, x), multiply(G1, x + curve_order))

# This fails
assert eq(multiply(G1, x), multiply(G1, x + field_modulus))

# Basic Zero Knowledge proof with ECs:
#Claim: “I know two values x and y such that x + y = 15”
#Proof: I multiply x by G1 and y by G1 and give those to you as A and B.
#Verifier: You multiply 15 by G1 and check that A + B == 15G1.

from py_ecc.bn128 import G1, multiply, add

# Prover
secret_x = 5
secret_y = 10

x = multiply(G1, 5)
y = multiply(G1, 10)

proof = (x, y, 15)

# verifier
if multiply(G1, proof[2]) == add(proof[0], proof[1]):
    print("statement is true")
else:
    print("statement is false")
