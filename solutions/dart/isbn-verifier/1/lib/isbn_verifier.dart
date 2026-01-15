bool isValid(String isbn) {
  isbn = isbn.replaceAll('-', ''); // Remove dashes
  if (isbn.length != 10) return false; // ISBN must be 10 characters long

  int sum = 0;
  for (int i = 0; i < 9; i++) { // Loop through the first 9 characters
    int digit = isbn.codeUnitAt(i) - '0'.codeUnitAt(0); // Convert char to int
    if (digit < 0 || digit > 9) return false; // Invalid character
    sum += digit * (10 - i); // Weighted sum of digits
    print('$i: $digit');
  }

  // Check the last digit
  if (isbn[9] == 'X') {
    sum += 10; // X represents 10
  } else {
    int digit = isbn.codeUnitAt(9) - '0'.codeUnitAt(0); // Convert char to int
    if (digit < 0 || digit > 9) return false; // Invalid character
    sum += digit;
  }

  return sum % 11 == 0; // Valid if sum is divisible by 11


}// Put your code here
