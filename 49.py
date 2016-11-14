from math import log10

primes = {2, 3}
n = 5
f = 1

while log10(n) < 4:
    if all(n % p for p in primes):
        primes.add(n)

    n += 3 - f
    f = -f

gen = (p for p in primes if log10(p) > 3 and p != 1487)

for p in gen:
    a = p + 3330
    b = p + 6660
    if (a in primes) and (b in primes):
        if sorted(str(p)) == sorted(str(a)) == sorted(str(b)):
            print str(p) + str(a) + str(b)
