import 'dart:math';

class AllYourBase {
  List<int> rebase(int from, List<int> number, int to) {
    if (from <= 1 || to <= 1) {
      throw ArgumentError();
    }
    if (number.length == 0) {
      return [0];
    } // Empty List

    int len = number.length;
    int exp = len - 1;
    int sum = 0;

    //Convert to 10, nontheless
    for (var i = 0; i < len; i++) {
      var tmp = pow(from, exp) as int;
      exp--;
      if (number[i] < 0 || number[i] >= from) {
        throw ArgumentError();
      }
      tmp *= number[i];
      sum += tmp;
    }

    //Convert to final base
    if (sum == 0) {
      return [0];
    }

    List<int> res = [];
    while (sum > 0) {
      var q = sum ~/ to;
      var r = sum % to;
      res.add(r.toInt());
      sum = q;
    }

    return res.reversed.toList();
  }
}
