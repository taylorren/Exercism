def prime(number):
    if number<1:
        raise ValueError('there is no zeroth prime')

    limit=125_000
    sieve=[True]*limit
    primes=[]

    for i in range(2,limit):
        if sieve[i]:
            primes.append(i)
            if len(primes)==number:
                return i

            for j in range(i*i, limit, i):
                sieve[j]=False
