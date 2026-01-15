class Queen {
  final int row;
  final int col;

  Queen(this.row, this.col) {
    // Validate the position of the queen
    assert(row >= 0, 'row not positive');
    assert(row <= 7, 'row not on board');
    assert(col >= 0, 'column not positive');
    assert(col <= 7, 'column not on board');
  }

  bool canAttack(Queen other) {
    // Check if the other piece is in the same row, column, or either diagonal
    return row == other.row ||
        col == other.col ||
        (row - other.row).abs() ==
            (col - other.col).abs() || // Diagonal check (positive slope)
        (row + col) ==
            (other.row + other.col); // Diagonal check (negative slope)
  }
}
