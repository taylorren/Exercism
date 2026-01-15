class Pangram {
  bool isPangram(String str) {
    List<bool> appears = List.filled(26, false);

    for (var c in str.toLowerCase().split('')) {
      var index = c.codeUnitAt(0) - 'a'.codeUnitAt(0);
      if (index < 0 || index > 26) continue;

      appears[index] = true;
    }

    return appears.every((c) => c == true);
  }
}
