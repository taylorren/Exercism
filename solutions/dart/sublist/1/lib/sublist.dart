// Implement the Classification enum.

enum Classification { equal, sublist, superlist, unequal }

class Sublist {
  Classification sublist(List<int> listOne, List<int> listTwo) {
    if (listOne.isEmpty && listTwo.isEmpty) {
      return Classification.equal;
    }
    if (listOne.isEmpty) {
      return Classification.sublist;
    }
    if (listTwo.isEmpty) {
      return Classification.superlist;
    }

    if (listOne.toString() == listTwo.toString()) {
      return Classification.equal;
    }
    // Check for sublist relationships first
    if (containsSublist(listOne, listTwo)) {
      return Classification.superlist;
    }
    if (containsSublist(listTwo, listOne)) {
      return Classification.sublist;
    }

    // Finally check for unequal if no sublist relationship is found
    return Classification.unequal;
  }

  bool containsSublist(List<int> larger, List<int> smaller) {
    for (int i = 0; i <= larger.length - smaller.length; i++) {
      if (larger.sublist(i, i + smaller.length).toString() ==
          smaller.toString()) {
        return true;
      }
    }
    return false;
  }
}
