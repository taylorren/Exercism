const RIGHT = 0;
const DOWN = 1;
const LEFT = 2;
const UP = 3;

class SpiralMatrix {
  final int size;
  late List<int> _seq;

  SpiralMatrix(this.size) {
    this._seq = List.filled(size * size, 0);
  }

  List<List<int>> toList() {
    if (size == 0) {
      return [];
    }
    if (size == 1) {
      return [
        [1]
      ];
    }

    int MAX_ROW = size - 1;
    int MAX_COL = size - 1;
    int MIN_ROW = 0;
    int MIN_COL = 0;

    int direction = RIGHT; //Start: to move RIGHT
    int row = 0;
    int col = 0;

    for (int index = 1; index <= size * size; index++) {
      _seq[row * size + col] = index;
      
      switch (direction) {
        case RIGHT:
          col++;
          if (col > MAX_COL) {
            direction = DOWN;
            col--;
            row++;
            MIN_ROW++;
          }
          break;
        case DOWN:
          row++;
          if (row > MAX_ROW) {
            direction = LEFT;
            row--;
            col--;
            MAX_COL--;
          }
          break;
        case LEFT:
          col--;
          if (col < MIN_COL) {
            direction = UP;
            col++;
            row--;
            MAX_ROW--;
          }
          break;
        case UP:
          row--;
          if (row < MIN_ROW) {
            direction = RIGHT;
            row++;
            col++;
            MIN_COL++;
          }
          break;
        default:
          break;
      }
    }

    List<List<int>> result = split(_seq, size);
    return result;
  } // Your code goes here.
}

List<List<int>> split(List<int> seq, int size) {
  List<List<int>> res = [];
  for (int i = 0; i < size; i++) {
    List<int> tmp = [];
    for (int j = 0; j < size; j++) {
      tmp.add(seq[i * size + j]);
    }
    res.add(tmp);
  }
  return res;
}
