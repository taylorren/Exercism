class WordCount {
  Map<String, int> countWords(String str) {
    final reg = RegExp(r"\W+");
    final res = str.split(reg).fold(<String, int>{}, (map, word) {
      map[word] = (map[word] ?? 0) + 1;
      return map;
    });
  
    return res;
  }
}
