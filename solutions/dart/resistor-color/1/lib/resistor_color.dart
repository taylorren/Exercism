class ResistorColor {
  // List of resistor colors in order
  static const List<String> _colorList = [
    'black', 'brown', 'red', 'orange', 'yellow', 
    'green', 'blue', 'violet', 'grey', 'white'
  ];

  // Returns the color code for a given color
  int colorCode(String color) {
    return _colorList.indexOf(color);
  }

  // Getter for the list of colors
  List<String> get colors => _colorList;
}
