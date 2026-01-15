import 'dart:math';

typedef Item = ({int weight, int value});

class Knapsack {
  int maxWeight;
  int itemIndex = 0;
  late int length;
  Knapsack({required this.maxWeight});

  int maxValue(List<Item> items) {
    if (items.isEmpty || items.every((e) => e.weight > maxWeight)) {
      return 0;
    }

    List<List<int>> dp = initDpTable(items.length + 1, maxWeight + 1);

    return _compute(dp, items);
  }

  List<List<int>> initDpTable(int rows, int cols) {
    return List.generate(rows, (i) => List.filled(cols, 0));
  }

  int _compute(List<List<int>> dp, List<Item> items) {
    for (int i = 1; i <= items.length; i++) {
      for (int j = 1; j <= this.maxWeight; j++) {
        if (items[i - 1].weight <= j) {
          dp[i][j] = max(dp[i - 1][j],
              dp[i - 1][j - items[i - 1].weight] + items[i - 1].value);
        } else {
          dp[i][j] = dp[i - 1][j];
        }
      }
    }
    return dp[items.length][this.maxWeight];
  }
}

// Inspired by this: https://exercism.org/tracks/dart/exercises/knapsack/solutions/jealwe
