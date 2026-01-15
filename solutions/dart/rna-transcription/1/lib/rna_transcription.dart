class RnaTranscription {
  String toRna(String input) {
    if (input.isEmpty) {
      return '';
    }

    String result = '';
    for (var c in input.split('')) {
      if (c == 'G') {
        result += 'C';
      } else if (c == 'C') {
        result += 'G';
      } else if (c == 'T') {
        result += 'A';
      } else if (c == 'A') {
        result += 'U';
      }
    }
    return result;
  }
}
