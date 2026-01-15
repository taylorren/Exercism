class Allergies {
  //final int score;
  static const Map<int, String> _allergies = {
    1: 'eggs',
    2: 'peanuts',
    4: 'shellfish',
    8: 'strawberries',
    16: 'tomatoes',
    32: 'chocolate',
    64: 'pollen',
    128: 'cats',
  };

  Allergies();

  bool allergicTo(String item, int score) {
    return list(score).contains(item);
  }

  List<String> list(int score) {
    return _allergies.entries
        .where((entry) => score & entry.key != 0)
        .map((entry) => entry.value)
        .toList();
  }
}
