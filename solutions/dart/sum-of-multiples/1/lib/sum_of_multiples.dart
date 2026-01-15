class SumOfMultiples {
  int sum(List<int> magics, int level) {
    int sum =0;
    Set<int> unique=Set();

    for (int m in magics) {
      int multiple = m;
      while(multiple<level){
        if(!unique.contains(multiple  )){
          unique.add(multiple);
          sum+=multiple;
        }
        multiple+=m;
      }
    }
    return sum;
  }
  // Put your code here
}
