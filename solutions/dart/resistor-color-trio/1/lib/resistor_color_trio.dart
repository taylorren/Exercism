import 'dart:math';

class ResistorColorTrio {
  static const Map<String, int> colorValues = {
    'black': 0,
    'brown': 1,
    'red': 2,
    'orange': 3,
    'yellow': 4,
    'green': 5,
    'blue': 6,
    'violet': 7,
    'grey': 8,
    'white': 9,
  };

  String label(List<String> colors) {
    int first = colorValues[colors[0]]!;
    int second = colorValues[colors[1]]!;
    int multiplier = colorValues[colors[2]]!;
    int ohms = (first * 10 + second) * pow(10, multiplier).toInt();

    if (ohms < 1000) {
      return '$ohms ohms';
    } else if (ohms < 1000000) {
      int kilo = ohms ~/ 1000;
      return '$kilo kiloohms';
    } else if (ohms < 1000000000) {
      int mega = ohms ~/ 1000000;
      return '$mega megaohms';
    } else {
      int giga = ohms ~/ 1000000000;
      return '$giga gigaohms';
    }
  }
}
