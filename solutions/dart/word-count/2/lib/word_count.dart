class WordCount {
  Map<String, int> countWords(String str) {
    final reg = RegExp(r"[a-z]+'[a-z]+|[a-z]+|[0-9]+");
    var words = <String, int>{};

    for (final m in reg.allMatches(str.toLowerCase())) {
      words.update(m[0] ?? "", (value) => value + 1, ifAbsent: () => 1);
    }

    return words;
  }
}
