class Isogram {
  bool isIsogram(String word) {
    if (word == '') {
      return true;
    }

    final occurence = List.filled(26, false);
    
    for (var c in word.split('')) {
      if (c == '-'||c==' ') continue;

      int index = c.toLowerCase().codeUnitAt(0) - 'a'.codeUnitAt(0);
      if (occurence[index] == true) {
        return false;
      } else {
        occurence[index] = true;
      }
    }

    return true;
  }
}
