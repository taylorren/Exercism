class PhoneNumber {
  String clean(String number) {
    number = number
        .replaceAll(' ', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('.', '')
        .replaceAll('+', '')
        .replaceAll('-', '');

    if (number.length < 10)
      throw FormatException('must not be fewer than 10 digits');
    if (number.length == 11 && number[0] != '1')
      throw FormatException('11 digits must start with 1');
    if (number.length > 11)
      throw FormatException('must not be greater than 11 digits');

    if (number.length == 11) number = number.substring(1, number.length);

    if (RegExp(r'[a-zA-Z]').hasMatch(number))
      throw FormatException('letters not permitted'); // no letters
    if (RegExp(r'[@:!]').hasMatch(number))
      throw FormatException('punctuations not permitted'); // no punctuations

    if (number[0] == '0')
      throw FormatException('area code cannot start with zero');
    if (number[0] == '1')
      throw FormatException('area code cannot start with one');

    if (number[3] == '0')
      throw FormatException('exchange code cannot start with zero');
      if (number[3] == '1')
      throw FormatException('exchange code cannot start with one');
    return number;
  }
}
