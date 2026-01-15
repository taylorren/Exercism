class RunLengthEncoder {
  String encode(String input) {
    if (input == '') {
      return '';
    }
    String result = "";
    int count = 1;
    String prevChar = input[0];
    for (int i = 1; i < input.length; i++) {
      String char = input[i];
      if (char == prevChar) {
        count++;
      } else {
        if (count == 1) {
          result += prevChar;
        } else {
          result += count.toString();
          result += prevChar;
        }

        count = 1;
        prevChar = char;
      }
    }
    if (count == 1) {
      result += prevChar;
    } else {
      result += count.toString();
      result += prevChar;
    }
    return result;
  }

  String decode(String input) {
    if (input == '') {
      return '';
    }

    String res = '';
    String digits = '';
    if (is_digit(input[0])) {
      digits += input[0];
    } else {
      res += input[0];
    }

    for (int i = 1; i < input.length; i++) {
      if (is_digit(input[i])) {
        digits += input[i];
      } else {
        if (digits == "") {
          res += input[i];
        } else {
          res += input[i] * int.parse(digits);
        }
        digits = '';
      }
    }
    return res;
  }
}

bool is_digit(String c) {
  return c.codeUnitAt(0) ^ 0x30 <= 9;
}
