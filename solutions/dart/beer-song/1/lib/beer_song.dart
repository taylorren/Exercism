class BeerSong {
  List<String> recite(int qty, int loop) {
    List<String> result = [];
    if (loop == 1) {
      result = _recite(qty);
    } else {
      for (var i = 1; i <= loop; i++) {
        var temp = _recite(qty);
        for (var str in temp) {
          result.add(str);
        }
        qty--;
        result.add('');
      }

      result = result.sublist(0, result.length - 1);
    }

    return result;
  } // Put your code here

  List<String> _recite(int qty) {
    List<String> res = [];
    if (qty == 0) {
      res.add('No more bottles of beer on the wall, no more bottles of beer.');
      res.add(
          'Go to the store and buy some more, 99 bottles of beer on the wall.');
    } else if (qty == 1) {
      res.add('1 bottle of beer on the wall, 1 bottle of beer.');
      res.add(
          'Take it down and pass it around, no more bottles of beer on the wall.');
    } else {
      res.add('$qty bottles of beer on the wall, $qty bottles of beer.');
      res.add(
          'Take one down and pass it around, ${qty - 1} bottle${qty == 2 ? '' : 's'} of beer on the wall.');
    }

    return res;
  }
}
