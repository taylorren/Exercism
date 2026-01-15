class NthPrime {
  int prime(int n) {
    if (n < 1) {
      throw ArgumentError('There is no zeroth prime');
    }

    int limit = 125000; // Initial limit, might need adjustment based on n
    List<bool> sieve = List.filled(limit, true);
    List<int> primes = [];

    sieve[0] = false; // 0 is not a prime
    sieve[1] = false; // 1 is not a prime

    for (int i = 2; i < limit; i++) {
      if (sieve[i]) {
        primes.add(i);
        if (primes.length == n) {
          return i; // Found the nth prime
        }
        for (int j = i * i; j < limit; j += i) {
          sieve[j] = false;
        }
      }
    }

    // If the nth prime wasn't found within the initial limit, adjust the limit and try again.
    // This is a simplified approach; in a real scenario, you might need a more dynamic way to adjust the limit.
    throw Exception('Prime number calculation exceeded initial limit. Consider increasing the limit.');
  }
}
