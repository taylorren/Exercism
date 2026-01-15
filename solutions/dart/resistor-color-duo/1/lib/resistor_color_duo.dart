class ResistorColorDuo {
  Map<String, int> colors = {
    "black": 0,
    "brown": 1,
    "red": 2,
    "orange": 3,
    "yellow": 4,
    "green": 5,
    "blue": 6,
    "violet": 7,
    "grey": 8,
    "white": 9,
  };

  int value(List<String> colors) {
    int firstColor = this.colors[colors[0]]!;
    int secondColor = this.colors[colors[1]]!;
    return int.parse('$firstColor$secondColor');
  }
}
