class Sieve {
  int upper;
  Sieve(this.upper);

  List<int> get primes {
    List<bool> prime = List.filled(upper + 1, true);
    prime[0] = prime[1] = false;

    for (var i = 2; i * i <= upper; i++) {
      if (prime[i]) {
        for (var j = i * i; j <= upper; j += i) {
          prime[j] = false;
        }
      }
    }

    List<int> primes = [];
    for (var i = 2; i <= upper; i++) {
      if (prime[i]) primes.add(i);
    }
    return primes;
  }
}
