class Meetup {
  Meetup();

  String meetup({int? year, int? month, String? week, String? dayofweek}) {
    int day;
    switch (week) {
      case 'first':
        day = findDay(year!, month!, dayofweek!, 1, 7);
      case 'second':
        day = findDay(year!, month!, dayofweek!, 8, 14);
      case 'third':
        day = findDay(year!, month!, dayofweek!, 15, 21);
      case 'fourth':
        day = findDay(year!, month!, dayofweek!, 22, 28);
      case 'teenth':
        day = findDay(year!, month!, dayofweek!, 13, 19);
      case 'last':
        var last = getLastDayOfMonth(year!, month!);
        day = findDay(year, month, dayofweek!, last - 6, last);
      default:
        day = 0;
    }
    var result = format(year!, month!, day);
    return result;
  }
}

int getLastDayOfMonth(int year, int month) {
  if (month == 1 ||
      month == 3 ||
      month == 5 ||
      month == 7 ||
      month == 8 ||
      month == 10 ||
      month == 12) {
    return 31;
  } else if (month == 4 || month == 6 || month == 9 || month == 11) {
    return 30;
  } else {
    //Feburary
    if (leapYear(year)) {
      return 29;
    } else {
      return 28;
    }
  }
}

String format(int y, int m, int d) {
  String s = '';
  s += y.toString() + '-';
  if (m <= 9) {
    s += '0';
  }
  s += m.toString() + '-';
  if (d <= 9) {
    s += '0';
  }
  s += d.toString();

  return s;
}

bool leapYear(int year) {
  if (year % 4 != 0) {
    return false;
  } else if (year % 100 != 0) {
    return true;
  } else if (year % 400 != 0) {
    return false;
  } else
    return true;
}

int findDay(int year, int month, String dayofweek, int start, int end) {
  final dayOfWeekNames = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];

  int result = 0;
  for (var d = start; d <= end; d++) {
    DateTime ymd = DateTime(year, month, d);
    if (dayOfWeekNames[ymd.weekday % 7] == dayofweek) {
      result = d;
      break;
    }
  }
  return result;
}
