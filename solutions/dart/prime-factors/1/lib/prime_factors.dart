class PrimeFactors {
  List<int> factors(int number) {
    var factors = <int>[];
    var candidate = 2;

    while (candidate * candidate <= number) {
      if (number % candidate == 0) {
        factors.add(candidate);
        number ~/= candidate;
      } else {
        candidate++;
      }
    }

    if (number > 1) {
      factors.add(number);
    }

    return factors;
  }
}
