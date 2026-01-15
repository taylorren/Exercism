class MatchingBrackets {
  bool isPaired(String str) {
    var stack = [];
    var pairs = {'}': '{', ')': '(', ']': '['};

    for (var c in str.runes) {
      var symbol = String.fromCharCode(c);
      if (pairs.containsValue(symbol)) {
        stack.add(symbol);
      } else if (pairs.containsKey(symbol)) {
        if (stack.isEmpty || stack.removeLast() != pairs[symbol]) {
          return false;
        }
      }
    }

    return stack.isEmpty;
  }
}
