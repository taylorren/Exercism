class Etl {
  Map<String, int> transform(Map<String, List<String>> legacy) {
    final Map<String, int> newFormat = {};

    legacy.forEach((score, letters) {
      for (var letter in letters) {
        newFormat[letter.toLowerCase()] = int.parse(score);
      }
    });

    return newFormat;
  }
}
