extension ListOps on List {
  void append<T>(List<T> other) {
    if (!other.isEmpty) this.addAll(other);
  }

  List<T> concat<T>() {
    return this.expand((element) => element).toList() as List<T>;
  }

  List<T> filter<T>(bool Function(T elem) predicate) {
    return this.whereType<T>().where(predicate).toList();
  }

  int count() {
    return this.length; // Add your implemenation here.
  }

  List<T> myMap<T>(T Function(T elem) fn) {
    final List<T> arr = [];
    for (final each in this) {
      arr.add(fn(each));
    }
    return arr;
  }

  U foldl<T, U>(U initial, U Function(U acc, T elem) fn) {
    U result = initial;
    for (var elem in this) {
      result = fn(result, elem);
    }
    return result;
  }

  U foldr<T, U>(U initial, U Function(T elem, U acc) fn) {
    U result = initial;
    for (var i = this.length - 1; i >= 0; i--) {
      result = fn(this[i], result);
    }
    return result;
  }

  List<T> reverse<T>() {
    return this.reversed.toList() as List<T>;
  }
}
