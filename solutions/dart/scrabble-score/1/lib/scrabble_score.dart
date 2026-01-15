int score(String word) {
  int result = 0;
  for (int i = 0; i < word.length; i++) {
    var c = word[i].toUpperCase();
    if ('AEIOULNRST'.contains(c))
      result ++;
    else if ('DG'.contains(c))
      result += 2;
    else if ('BCMP'.contains(c))
      result += 3;
    else if ('FHVWY'.contains(c))
      result += 4;
    else if ('K'.contains(c))
      result += 5;
    else if ('JX'.contains(c))
      result += 8;
    else if ('QZ'.contains(c))
      result += 10;
  }
  return result;
}
