class Luhn {
  bool valid(String input) {
    // Remove all spaces from the input
    String sanitizedInput = input.replaceAll(' ', '');

    // Check if the input is valid based on length and non-digit characters
    if (sanitizedInput.length <= 1 || sanitizedInput.contains(RegExp(r'\D'))) {
      return false;
    }

    // Reverse the input and convert it to a list of integers
    List<int> digits = sanitizedInput.split('').reversed.map(int.parse).toList();

    // Apply the Luhn algorithm
    int sum = 0;
    for (int i = 0; i < digits.length; i++) {
      int digit = digits[i];
      // Double every second digit, starting from the right
      if (i % 2 != 0) {
        digit *= 2;
        // If doubling the number results in a number greater than 9, subtract 9 from it
        if (digit > 9) {
          digit -= 9;
        }
      }
      sum += digit;
    }

    // If the sum is divisible by 10, the number is valid
    return sum % 10 == 0;
  }
}