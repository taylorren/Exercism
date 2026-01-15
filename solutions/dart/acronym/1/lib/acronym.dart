class Acronym {
  String abbreviate(String word) {
    var result = '';
    if (word.isEmpty) return '';
    word = word.replaceAll('-', ' ');
    word = word.replaceAll('_', ' ');

    var words = word.split(' ');
    for (var w in words) {
      if (w == '') continue;
      result += w[0].toUpperCase();
    }

    return result;
  }
}
