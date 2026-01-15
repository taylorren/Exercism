// define the Classification enum
enum Classification {
  perfect,
  abundant,
  deficient,
}

class PerfectNumbers {
  Classification classify(int number) {
    if (number <= 0) {
      throw ArgumentError('Number must be a positive integer');
    }

    int sumOfDivisors = _sumOfDivisors(number);

    if (sumOfDivisors == number) {
      return Classification.perfect;
    } else if (sumOfDivisors > number) {
      return Classification.abundant;
    } else {
      return Classification.deficient;
    }
  }

  int _sumOfDivisors(int number) {
    int sum = 0;
    for (int i = 1; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        sum += i;
      }
    }
    return sum;
  }
}
