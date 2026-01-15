extension ConvertToRomanNumerals on int {
  String toRoman() {
    final romanNumerals = {
      1000: 'M',
      900: 'CM',
      500: 'D',
      400: 'CD',
      100: 'C',
      90: 'XC',
      50: 'L',
      40: 'XL',
      10: 'X',
      9: 'IX',
      5: 'V',
      4: 'IV',
      1: 'I',
    };

    int value = this;
    String result = '';

    for (var numeral in romanNumerals.keys) {
      while (value >= numeral) {
        result += romanNumerals[numeral]!;
        value -= numeral;
      }
    }

    return result;
    // Put your code here
  }
}
