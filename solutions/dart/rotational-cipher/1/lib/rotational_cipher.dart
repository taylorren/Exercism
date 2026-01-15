class RotationalCipher {
  String rotate({required String text, required int shiftKey}) {
    // Normalize the shiftKey to be within the range of 0-25
    shiftKey = shiftKey % 26;
    StringBuffer result = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      String char = text[i];

      // Check if the character is a lowercase letter
      if (char.codeUnitAt(0) >= 'a'.codeUnitAt(0) && char.codeUnitAt(0) <= 'z'.codeUnitAt(0)) {
        int newCharCode = ((char.codeUnitAt(0) - 'a'.codeUnitAt(0) + shiftKey) % 26) + 'a'.codeUnitAt(0);
        result.writeCharCode(newCharCode);
      }
      // Check if the character is an uppercase letter
      else if (char.codeUnitAt(0) >= 'A'.codeUnitAt(0) && char.codeUnitAt(0) <= 'Z'.codeUnitAt(0)) {
        int newCharCode = ((char.codeUnitAt(0) - 'A'.codeUnitAt(0) + shiftKey) % 26) + 'A'.codeUnitAt(0);
        result.writeCharCode(newCharCode);
      }
      // If it's not a letter, keep it unchanged
      else {
        result.write(char);
      }
    }

    return result.toString();
  }
}
