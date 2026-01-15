class LargestSeriesProduct {
  int largestProduct(String str, int span) {
    if (span < 0) {
      throw ArgumentError('span must not be negative');
    }
    if (span == 0) {
      return 1;
    }
    if (str == '' && span > 0) {
      throw ArgumentError('span must be smaller than string length');
    }
    if (span > str.length) {
      throw ArgumentError('span must be smaller than string length');
    }

    int product = -1;
    for (int index = 0; index <= str.length - span; index++) {
      String slice = str.substring(index, index + span);
      var tmp = slice_product(slice);
      if (tmp > product) {
        product = tmp;
      }
    }

    return product;
  }
}

int slice_product(String slice) {
  int len = slice.length;
  int p = 1;
  for (int i = 0; i < len; i++) {
    String unit = slice[i];
    if (unit.codeUnitAt(0) ^ 0x30 <= 9) { // is `unit` a digit?
      p *= int.parse(unit);
    } else {
      throw ArgumentError('digits input must only contain digits');
    }
  }
  return p;
}
