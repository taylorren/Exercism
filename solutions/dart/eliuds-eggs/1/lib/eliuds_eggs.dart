class EggCounter {
  int count(int display) {
    int res = 0;
    int bit = 1;
    while (bit <= display) {
      if (bit & display != 0) {
        res++;
      }
      bit *= 2;
    }
    return res;
  }
}
