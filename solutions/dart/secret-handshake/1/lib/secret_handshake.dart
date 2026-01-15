class SecretHandshake {
  List<String> commands(int number) {

    List<String> results = [];

    if (number & 1 == 1) results.add('wink');
    if (number & 2 == 2) results.add('double blink');
    if (number & 4 == 4) results.add('close your eyes');
    if (number & 8 == 8) results.add('jump');

    if (number & 16 == 16) results = results.reversed.toList();

    return results;
  }
}
