class PascalsTriangle {
  List<List<int>> rows(int n) {
    if (n == 0) {
      return [];
    }
    if (n == 1) {
      return [[1]];
    }
    if (n == 2) {
      return [
        [1],
        [1, 1]
      ];
    }
    List<List<int>> result = [
      [1],
      [1, 1]
    ];
    for (int i = 2; i < n; i++) {
      List<int> row = [1];
      for (int j = 1; j < i; j++) {
        row.add(result[i - 1][j - 1] + result[i - 1][j]);
      }
      row.add(1);
      result.add(row);
    }
    return result;
  }
}
