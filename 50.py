primes = set()

n = 5
f = 1

while True:
    sum = 0
    if any(n % p for p in primes):
        primes.add(n)
        sum += n

