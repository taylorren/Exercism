import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(String number) {
    int power = number.length;
    num sum = 0;

    for (var i = 0; i < power; i++) {
      var tmp = pow(int.parse(number[i]), power);
      sum += tmp;
    }

    return sum == int.parse(number); // Put your code here
  }
}
