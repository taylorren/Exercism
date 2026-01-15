class Diamond {
  List<String> rows(String char) {
    if (char.isEmpty) return [];

    List<String> result = [];
    int n = char.codeUnitAt(0) - 'A'.codeUnitAt(0) + 1;

    for (int i = 0; i < n; i++) {
      String spaces = ' ' * (n - i - 1);
      String letters = String.fromCharCode('A'.codeUnitAt(0) + i);
      if (i == 0) {
        result.add(
            '$spaces$letters$spaces'); // Add trailing space for the beginning and end letter
      } else {
        result.add(
            '$spaces$letters${' ' * (2 * i - 1)}$letters$spaces'); // Add trailing space for the beginning and end letter
      }
    }

    for (int i = n - 2; i >= 0; i--) {
      String spaces = ' ' * (n - i - 1);
      String letters = String.fromCharCode('A'.codeUnitAt(0) + i);
      if (i == 0) {
        result.add(
            '$spaces$letters$spaces'); // Add trailing space for the beginning and end letter
      } else {
        result.add(
            '$spaces$letters${' ' * (2 * i - 1)}$letters$spaces'); // Add trailing space for the beginning and end letter
      }
    }

    return result;
  }
}
