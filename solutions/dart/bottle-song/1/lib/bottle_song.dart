class BottleSong {
  static const Map<int, String> _numberWords = {
    0: 'no',
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
    10: 'ten',
  };

  String _bottleWord(int n) => n == 1 ? 'bottle' : 'bottles';

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  List<String> recite(int start, int verses) {
    List<String> result = [];
    for (int i = 0; i < verses; i++) {
      int current = start - i;
      String currentWord = _capitalize(_numberWords[current]!);
      String nextWord = _numberWords[current - 1]!;
      String bottle = _bottleWord(current);
      String nextBottle = _bottleWord(current - 1);
      result.add('$currentWord green $bottle hanging on the wall,');
      result.add('$currentWord green $bottle hanging on the wall,');
      result.add('And if one green bottle should accidentally fall,');
      result
          .add("There'll be $nextWord green $nextBottle hanging on the wall.");
      if (i < verses - 1) {
        result.add('');
      }
    }
    return result;
  }
}
