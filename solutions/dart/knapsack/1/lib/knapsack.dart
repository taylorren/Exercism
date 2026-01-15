typedef Item = ({int weight, int value});

class Knapsack {
  int maxWeight;
  int itemIndex = 0;
  late int length;
  Knapsack({required this.maxWeight});

  int maxValue(List<Item> items) {
    length = items.length;
    if (this.maxWeight == 0 || itemIndex == length) {
      return 0;
    }
    if (items[itemIndex].weight > maxWeight) {
      items.removeAt(itemIndex);
      itemIndex++;
      return maxValue(items);
    } else {
      maxWeight -= items[itemIndex].weight;
      return max(items[itemIndex].value + maxValue(items), 
        maxValue(items));
    }
  }
}
