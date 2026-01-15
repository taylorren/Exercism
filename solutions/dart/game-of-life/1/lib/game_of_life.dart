class GameOfLife {
  late List<List<int>> _grid;

  GameOfLife(List<List<int>> initial) {
    // Deep copy the input to avoid external mutation
    _grid = initial.map((row) => List<int>.from(row)).toList();
  }

  List<List<int>> matrix() {
    return _grid.map((row) => List<int>.from(row)).toList();
  }

  void tick() {
    if (_grid.isEmpty) return;
    final int rows = _grid.length;
    final int cols = _grid[0].length;
    if (cols == 0) return;

    final next = List<List<int>>.generate(
      rows,
      (_) => List<int>.filled(cols, 0),
    );

    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < cols; c++) {
        var liveNeighbors = 0;
        for (var dr = -1; dr <= 1; dr++) {
          for (var dc = -1; dc <= 1; dc++) {
            if (dr == 0 && dc == 0) continue;
            final nr = r + dr;
            final nc = c + dc;
            if (nr >= 0 && nr < rows && nc >= 0 && nc < cols) {
              liveNeighbors += _grid[nr][nc];
            }
          }
        }

        if (_grid[r][c] == 1) {
          next[r][c] = (liveNeighbors == 2 || liveNeighbors == 3) ? 1 : 0;
        } else {
          next[r][c] = (liveNeighbors == 3) ? 1 : 0;
        }
      }
    }

    _grid = next;
  }
}
