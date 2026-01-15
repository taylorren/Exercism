String translate(String phrase) {
  final vowelPattern = RegExp(r'^(xr|yt|[aeiou])');
  final consonantPattern = RegExp(r'^([^aeiou]?qu|[^aeiou]+)([aeiouy].*)$');
  final words = phrase.split(' ');

  return words.map((word) {
    if (vowelPattern.hasMatch(word)) {
      return word + 'ay';
    } else if (consonantPattern.hasMatch(word)) {
      final match = consonantPattern.firstMatch(word);
      return '${match?.group(2)}${match?.group(1)}ay';
    }
    return word; // Fallback for unmatched patterns, though all cases should be covered.
  }).join(' ');
}
