class Leap {
  bool leapYear(int year) {
    if (year % 4 != 0) {
      return false;
    } else if (year % 100 != 0) {
      return false;
    } else {
      return true;
    }
  }
}
