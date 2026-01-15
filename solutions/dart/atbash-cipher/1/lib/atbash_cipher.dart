import 'dart:core';

class AtbashCipher {
  String encode(String input) {
    int len = input.length;
    String res = '';

    input = input.toLowerCase();

    for (int i = 0; i < len; i++) {
      String c = input[i]; // Extract character at position i
      if (c.compareTo('a') >= 0 && c.compareTo('z') <= 0) {
        // Convert lowercase letters
        res += String.fromCharCode(
            'z'.codeUnitAt(0) - (c.codeUnitAt(0) - 'a'.codeUnitAt(0)));
      } else if (c.compareTo('0') >= 0 && c.compareTo('9') <= 0) {
        res += c;
      }
    }
    String finalResult = '';
    for (int i = 0; i < res.length; i++) {
      finalResult += res[i];
      if ((i + 1) % 5 == 0 && (i + 1) < res.length) {
        finalResult += ' ';
      }
    }

    return finalResult.trim();
  }

  String decode(String input) {
    String res = '';

    // Convert the entire input to lowercase
    input = input.toLowerCase();

    for (int i = 0; i < input.length; i++) {
      String c = input[i]; // Extract character at position i
      if (c.compareTo('a') >= 0 && c.compareTo('z') <= 0) {
        // Convert lowercase letters back
        res += String.fromCharCode('z'.codeUnitAt(0) - (c.codeUnitAt(0) - 'a'.codeUnitAt(0)));
      } else if (c.compareTo('0') >= 0 && c.compareTo('9') <= 0) {
        // Copy numbers verbatim
        res += c;
      }
      // Skip punctuation and non-alphabetic characters, including spaces
    }

    return res; // Return the decoded string without spaces
  }
}
