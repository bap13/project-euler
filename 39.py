import math
from collections import Counter

perimeters = Counter()

for a in range(1, 500):
    for b in range(1, 500):
        c = math.sqrt(a**2 + b**2)
        p = a + b + c
        if c % 1 != 0 or p > 1000:
            continue
        perimeters[p] += 1

print(perimeters.most_common(1))

