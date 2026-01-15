class Bob {
  String response(String text) {
    if (text.toUpperCase() == text) {
      //All capital letters
      if (text.endsWith('?')) {
        // And a question
        return 'Calm down, I know what I\'m doing!';
      }
      return 'Whoa, chill out!';
    }

    if (text.endsWith('?')) {
      return 'Sure.';
    }

    return 'Whatever.';
  } // Put your code here
}
