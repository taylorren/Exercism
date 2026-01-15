class DifferenceOfSquares {
  num squareOfSum(int n) {
    return (n * (n + 1) * (2 * n + 1)) / 6;
  }

  num sumOfSquares(int n) {
    return (n * (n + 1) * (2 * n + 1) * (2 * n + 2)) / 6;
  }

  num differenceOfSquares(int n) {
    return squareOfSum(n) - sumOfSquares(n);
  }
}
