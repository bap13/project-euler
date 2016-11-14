def pe44():
    ps = set()
    i = 0
    while True:
        i += 1
        p = i*(3*i - 1) / 2
        ps.add(p)
        for n in ps:
            if p-n in ps and p-2*n in ps:
                return p-2*n

print pe44()
