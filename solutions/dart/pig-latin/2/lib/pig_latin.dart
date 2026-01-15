String translate(String phrase) {
  // Split the phrase into words.
  final words = phrase.split(' ');

  // Translate each word in the phrase.
  final translatedWords = words.map((word) {
    // Rule 1: Word begins with a vowel sound or "xr" and "yt".
    if (RegExp(r'^(a|e|i|o|u|xr|yt)').hasMatch(word)) {
      return word + 'ay';
    }
    // Rule 3: Word starts with a consonant sound followed by "qu".
    else if (RegExp(r'^([^aeiou]*qu)(.*)').hasMatch(word)) {
      final match = RegExp(r'^([^aeiou]*qu)(.*)').firstMatch(word)!;
      return '${match.group(2)}${match.group(1)}ay';
    }
    // Rule 4: Handling "y" as a vowel after a consonant cluster or as the second letter in a two-letter word.
    else if (RegExp(r'^([^aeiouy]+)(y.*)').hasMatch(word) || (word.length == 2 && word.startsWith('y'))) {
      final match = RegExp(r'^([^aeiouy]*)(y.*)').firstMatch(word)!;
      return '${match.group(2)}${match.group(1)}ay';
    }
    // Rule 2: Word begins with a consonant sound.
    else {
      final match = RegExp(r'^([^aeiou]+)(.*)').firstMatch(word)!;
      return '${match.group(2)}${match.group(1)}ay';
    }
  });

  // Join the translated words back into a phrase.
  return translatedWords.join(' ');
}
