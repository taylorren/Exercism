class Triangle {
  bool equilateral(double a, double b, double c) {
    return (a == b && b == c && (a * b * c != 0));
  }

  bool isosceles(double a, double b, double c) {
    if (a + b > c && b + c > a && c + a > b) {
      if (a == b || b == c || c == a)
        return true;
      else
        return false;
    }
    return false;
  }

  bool scalene(double a, double b, double c) {
    if (a + b > c && b + c > a && c + a > b) {
      if (a != b && b != c && c != a)
        return true;
      else
        return false;
    }
    return false;
  }
}
