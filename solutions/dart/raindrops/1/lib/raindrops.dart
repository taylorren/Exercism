class Raindrops {
  String convert(num a) {
    String result = "";
    if (a % 3 == 0) {
      result += "Pling";
    }
    if (a % 5 == 0) {
      result += "Plang";
    }
    if (a % 7 == 0) {
      result += "Plong";
    }
    if (result == "") {
      result = a.toString();
    }
    return result;
  }
   
}
