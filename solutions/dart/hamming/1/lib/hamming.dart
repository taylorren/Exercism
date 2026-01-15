class Hamming {
  int distance(String a, String b) {
    if(a.length != b.length){
      throw ArgumentError("Strings must be of equal length");
    }

    int distance = 0;
    for (int i = 0; i < a.length; i++){
      if(a[i] != b[i]){
        distance++;
      }
    }
    return distance;
  }
}
