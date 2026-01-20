class FlowerField {
  final List<String> field;

  FlowerField(this.field);

  List<String> get annotated {
    if (field.isEmpty) return [];

    final rows = field.length;
    final cols = field[0].length;
    final result = List.generate(rows, (_) => List.filled(cols, ' '));

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (field[i][j] == '*') {
          result[i][j] = '*';
        } else {
          int count = 0;
          for (int di = -1; di <= 1; di++) {
            for (int dj = -1; dj <= 1; dj++) {
              if (di == 0 && dj == 0) continue;
              final ni = i + di;
              final nj = j + dj;
              if (ni >= 0 &&
                  ni < rows &&
                  nj >= 0 &&
                  nj < cols &&
                  field[ni][nj] == '*') {
                count++;
              }
            }
          }
          result[i][j] = count == 0 ? ' ' : count.toString();
        }
      }
    }

    return result.map((row) => row.join()).toList();
  }
}
