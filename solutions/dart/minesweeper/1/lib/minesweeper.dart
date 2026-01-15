class Minesweeper {
  List<String> layout;
  Minesweeper(List<String> this.layout);

  List<String> get annotated => this._annotated();

  List<String> _annotated() {
    List<String> annotation = <String>[];

    int rows = layout
        .length; // which should also be the cols as shown in the test case.

    if (rows == 0) {
      //No rows
      annotation = [];
      return annotation;
    }

    if (layout[0].length == 0) {
      //No cols.
      annotation = [''];
      return annotation;
    }

    for (var row = 0; row < rows; row++) {
      var thisrow = '';
      for (var col = 0; col < this.layout[0].length; col++) {
        if (layout[row][col] == '*')
          thisrow += '*';
        else
          thisrow += _checkNeighbor(row, col);
      }
      annotation.add(thisrow);
    }

    return annotation;
  }

  String _checkNeighbor(int row, int col) {
    var count = 0;
    var layout = this.layout;
    //Check NW
    try {
      if (layout[row - 1][col - 1] == '*') count++;
    } catch (e) {}

    //check N
    try {
      if (layout[row - 1][col] == '*') count++;
    } catch (e) {}

    //Check NE
    try {
      if (layout[row - 1][col + 1] == '*') count++;
    } catch (e) {}
    //Check W
    try {
      if (layout[row][col - 1] == '*') count++;
    } catch (e) {}
    //Check E
    try {
      if (layout[row][col + 1] == '*') count++;
    } catch (e) {}
    //Check SW
    try {
      if (layout[row+1][col -1] == '*') count++;
    } catch (e) {}
    //Check S
    try {
      if (layout[row+1][col] == '*') count++;
    } catch (e) {}
    //Check SE
    try {
      if (layout[row+1][col + 1] == '*') count++;
    } catch (e) {}

    return count == 0 ? ' ' : count.toString();
  }
}
