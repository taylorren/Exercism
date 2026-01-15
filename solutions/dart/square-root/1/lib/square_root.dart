class SquareRoot {
  int squareRoot(int number) {
    if (number < 0) {
      throw ArgumentError('Cannot compute square root of a negative number');
    }
    if (number == 0) return 0;

    double guess = number.toDouble();
    double epsilon = 0.00001; // Precision level

    while ((guess * guess - number).abs() > epsilon) {
      guess = (guess + number / guess) / 2;
    }
    return guess.toInt(); // Return the integer part of the square root
  }
}
