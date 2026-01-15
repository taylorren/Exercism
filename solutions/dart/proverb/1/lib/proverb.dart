class Proverb {
  String recite(List<String> pieces) {
    if (pieces.isEmpty) {
      return "";
    }

    final StringBuffer proverb = StringBuffer();
    for (int i = 0; i < pieces.length - 1; i++) {
      proverb.writeln("For want of a ${pieces[i]} the ${pieces[i + 1]} was lost.");
    }
    proverb.write("And all for the want of a ${pieces[0]}.");
    
    return proverb.toString();
  }
}
