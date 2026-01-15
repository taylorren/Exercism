class HighScores {
  List<int> scores;

  HighScores(this.scores);

  int latest() {
    return this.scores[scores.length - 1];
  }

  int personalBest() {
    List<int> sorted = List.from(this.scores);
    sorted.sort();
    return sorted.last;
  }

  List<int> personalTopThree() {
    List<int> sorted = List.from(this.scores);
    sorted.sort();
    if (sorted.length <= 3)
      return sorted.reversed.toList();
    else {
      List<int> lastThree = sorted.sublist(sorted.length - 3);
      return lastThree.reversed.toList();
    }
  }
}
