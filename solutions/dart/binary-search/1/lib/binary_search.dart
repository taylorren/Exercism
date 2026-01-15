import 'package:binary_search/value_not_found_exception.dart';

class BinarySearch {
  List<int> num_list;
  BinarySearch(List<int> this.num_list);

  int find(int number) {
    int end = this.num_list.length - 1;
    int start = 0;
    while (start <= end) {
      int mid = (start + end) ~/ 2;

      if (num_list[mid] == number) {
        // Found it
        return mid;
      } else if (num_list[mid] < number) {
        start = mid + 1;
      } else {
        end = mid - 1;
      }
    }

    throw ValueNotFoundException('value not found');
  }
}
